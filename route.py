'''### info:
    ROUTES - ENRUTAMIENTO DE PETICIONES DEL CINE LCU
    
    Define todas las rutas (URLs) de la aplicación y las conecta
    con las funciones del controller correspondientes.
    
    Dependencias:
      pip install Flask
      pip install Werkzeug
'''

import os
from flask import Flask, render_template, request, redirect, session, flash, url_for
from controller import *
from werkzeug.utils import secure_filename


def route(app):
    
    ##########################################################################
    # + + + HOME Y CARTELERA + + + + + + + + + + + + + + + + + + + + + + + +
    ##########################################################################
    
    @app.route("/")
    @app.route("/home")
    @app.route("/cartelera")
    def cartelera():
        '''### Información:
            Carga la página principal (cartelera de películas)
        '''
        param = {}
        return cartelera_pagina(param)
    
    
    @app.route("/pelicula/<int:id_pelicula>")
    def pelicula(id_pelicula):
        '''### Información:
            Carga la página de detalle de una película específica
            Recibe 'id_pelicula' como parámetro en la URL
        '''
        param = {}
        return pelicula_pagina(param, id_pelicula)
    
    
    @app.route("/buscar", methods=["GET", "POST"])
    def buscar():
        '''### Información:
            Procesa la búsqueda de películas con filtros
        '''
        param = {}
        return buscar_peliculas(param, request)
    
    
    ##########################################################################
    # + + + AUTENTICACIÓN + + + + + + + + + + + + + + + + + + + + + + + + + +
    ##########################################################################
    
    @app.route("/login")
    def login():
        '''### Información:
            Carga la página de login
        '''
        param = {}
        return login_pagina(param)
    
    
    @app.route("/signin", methods=["POST"])
    def signin():
        '''### Información:
            Procesa el formulario de login
            Recibe email y contraseña por POST
        '''
        param = {}
        return ingresoUsuarioValido(param, request)
    
    
    @app.route("/register")
    @app.route("/regist")
    def register():
        '''### Información:
            Carga la página de registro
        '''
        param = {}
        return registro_pagina(param)
    
    
    @app.route("/signup", methods=["POST"])
    def signup():
        '''### Información:
            Procesa el formulario de registro
            Recibe todos los datos del nuevo usuario por POST
        '''
        param = {}
        return registrarUsuario(param, request)
    
    
    @app.route("/logout")
    def logout():
        '''### Información:
            Cierra la sesión del usuario y redirige a cartelera
        '''
        cerrarSesion()
        return redirect('/cartelera')
    
    
    ##########################################################################
    # + + + PERFIL DE USUARIO + + + + + + + + + + + + + + + + + + + + + + + +
    ##########################################################################
    
    @app.route("/usuario")
    def usuario():
        '''### Información:
            Carga la página de perfil del usuario
            Requiere sesión activa
        '''
        param = {}
        return usuario_pagina(param)
    
    
    @app.route("/actualizar_usuario", methods=["POST"])
    def actualizar_usuario_route():
        '''### Información:
            Procesa la actualización de datos del usuario
            Recibe los datos actualizados por POST
        '''
        param = {}
        return actualizar_usuario(param, request)
    
    
    @app.route("/historial")
    def historial():
        '''### Información:
            Carga la página de historial de compras del usuario
            Requiere sesión activa
        '''
        param = {}
        return historial_pagina(param)
    
    
    ##########################################################################
    # + + + PROCESO DE COMPRA + + + + + + + + + + + + + + + + + + + + + + + +
    ##########################################################################
    
    @app.route("/dyh/<int:id_pelicula>")
    def dyh(id_pelicula):
        '''### Información:
            Carga la página de selección de día, horario y entradas
            Recibe 'id_pelicula' como parámetro en la URL
        '''
        param = {}
        return dyh_pagina(param, id_pelicula)
    
    
    @app.route("/procesar_dyh", methods=["POST"])
    def procesar_dyh_route():
        '''### Información:
            Procesa la selección de día, horario y cantidad de entradas
            Recibe los datos del formulario por POST
            Redirige a la página de butacas
        '''
        param = {}
        return procesar_dyh(param, request)
    
    
    @app.route("/butacas")
    def butacas():
        '''### Información:
            Carga la página de selección de butacas
            Requiere sesión activa y función seleccionada
        '''
        param = {}
        return butacas_pagina(param)
    
    
    @app.route("/procesar_butacas", methods=["POST"])
    def procesar_butacas_route():
        '''### Información:
            Procesa la selección de butacas
            Recibe las butacas seleccionadas por POST
            Redirige a candy o resumen
        '''
        param = {}
        return procesar_butacas(param, request)
    
    
    @app.route("/candy")
    def candy():
        '''### Información:
            Carga la página de candy/snacks
        '''
        param = {}
        return candy_pagina(param)
    
    
    @app.route("/agregar_candy", methods=["POST"])
    def agregar_candy_route():
        '''### Información:
            Agrega productos de candy al carrito
            Recibe los productos seleccionados por POST
        '''
        param = {}
        return agregar_candy(param, request)
    
    @app.route('/limpiar_carrito', methods=['POST'])
    def limpiar_carrito_route():
        param = {}
        return limpiar_carrito()
    
    @app.route("/resumen")
    def resumen():
        '''### Información:
            Carga la página de resumen de compra
            Muestra todos los detalles antes de confirmar
            Requiere sesión activa
        '''
        param = {}
        return resumen_pagina(param)
    
    
    @app.route("/comprar", methods=["POST"])
    def comprar():
        '''### Información:
            Procesa la compra final
            Crea el ticket, registra butacas y guarda en historial
            Requiere sesión activa
        '''
        param = {}
        return procesar_compra(param, request)
    
    
    ##########################################################################
    # + + + ERROR 404 + + + + + + + + + + + + + + + + + + + + + + + + + + + +
    ##########################################################################
    
    @app.route('/<name>')
    def noEncontrada(name):
        '''### Información:
            Captura cualquier ruta no definida
            Muestra mensaje de página no encontrada
        '''
        return paginaNoEncontrada(name)