'''### info:
    CONTROLLER - LÓGICA DE NEGOCIO DEL CINE LCU
    
    Gestiona:
    - Sesiones de usuario
    - Procesamiento de formularios
    - Preparación de datos para las vistas
    - Lógica de negocio (cartelera, reservas, candy, etc.)
'''

from flask import request, session, redirect, render_template, flash, url_for, jsonify
from datetime import datetime
from model import *
from werkzeug.utils import secure_filename
import os
from uuid import uuid4
from appConfig import config

##########################################################################
# + + + MANEJO DE REQUEST + + + + + + + + + + + + + + + + + + + + + + + +
##########################################################################

def getRequest(diResult):
    '''### Información:
        Lee una solicitud 'request' (POST o GET) y carga los datos en un diccionario
        Recibe 'diResult' un diccionario donde se cargarán los datos
    '''
    if request.method == 'POST':
        for name in request.form.to_dict().keys():
            li = request.form.getlist(name)
            if len(li) > 1:
                diResult[name] = request.form.getlist(name)
            elif len(li) == 1:
                diResult[name] = li[0]
            else:
                diResult[name] = ""
    elif request.method == 'GET':
        for name in request.args.to_dict().keys():
            li = request.args.getlist(name)
            if len(li) > 1:
                diResult[name] = request.args.getlist(name)
            elif len(li) == 1:
                diResult[name] = li[0]
            else:
                diResult[name] = ""


##########################################################################
# + + + MANEJO DE SESIÓN + + + + + + + + + + + + + + + + + + + + + + + +
##########################################################################

def cargarSesion(dicUsuario):
    '''### Información:
        Carga los datos del usuario en la sesión incluyendo avatar
        Recibe 'dicUsuario' un diccionario con los datos del usuario
    '''
    session['id_usuario'] = dicUsuario['id']
    session['nombres'] = dicUsuario['nombres']
    session['apellidos'] = dicUsuario['apellidos']
    session['username'] = dicUsuario['username']  # email
    session['telefono'] = dicUsuario.get('telefono', '')
    session['avatar'] = dicUsuario.get('avatar', '')  # ✅ Avatar
    session['rol'] = dicUsuario.get('rol', 'cliente')


def haySesion():
    '''### Información:
        Verifica si existe una sesión activa
        Retorna True si hay sesión, False caso contrario
    '''
    return 'id_usuario' in session and session.get('id_usuario') is not None


def cerrarSesion():
    '''### Información:
        Cierra la sesión actual limpiando todos los datos
    '''
    session.clear()


def crearSesion(request):
    '''### Información:
        Intenta crear una sesión con los datos del formulario de login
        Recibe 'request' con email y contraseña
        Retorna True si se crea la sesión, False caso contrario
    '''
    mirequest = {}
    getRequest(mirequest)
    
    email = mirequest.get('email', '')
    password = mirequest.get('cont', '')  # El campo se llama 'cont' en tu HTML
    
    result = {}
    if obtenerUsuarioXEmailPass(result, email, password):
        cargarSesion(result)
        return True
    
    return False


##########################################################################
# + + + CARTELERA Y PELÍCULAS + + + + + + + + + + + + + + + + + + + + + +
##########################################################################

def cartelera_pagina(param):
    '''### Información:
        Carga la página de cartelera con todas las películas
        Recibe 'param' diccionario de parámetros
        Retorna el template renderizado
    '''
    # Obtener todas las películas
    param['peliculas'] = obtenerTodasLasPeliculas()
    
    # Verificar si hay sesión para mostrar opciones de usuario
    param['sesion_activa'] = haySesion()
    if haySesion():
        param['usuario'] = {
            'nombres': session.get('nombres'),
            'apellidos': session.get('apellidos')
        }
    
    return render_template('front/cartelera.html', param=param)


def pelicula_pagina(param, id_pelicula):
    '''### Información:
        Carga la página de detalle de una película
        Recibe 'param' diccionario de parámetros
        Recibe 'id_pelicula' el ID de la película a mostrar
        Retorna el template renderizado
    '''
    # Obtener datos de la película
    pelicula = obtenerPeliculaXId(id_pelicula)
    
    if not pelicula:
        return redirect('/cartelera')
    
    param['pelicula'] = pelicula
    param['sesion_activa'] = haySesion()
    
    # Guardar en sesión el ID de la película seleccionada
    if haySesion():
        session['pelicula_seleccionada'] = id_pelicula
    
    return render_template('front/peli.html', param=param)


def buscar_peliculas(param, request):
    '''### Información:
        Busca películas según criterios de búsqueda
        Recibe 'param' diccionario de parámetros
        Recibe 'request' con los parámetros de búsqueda
        Retorna el template de cartelera con resultados filtrados
    '''
    mirequest = {}
    getRequest(mirequest)
    
    nombre = mirequest.get('nombre', '')
    genero = mirequest.get('genero', '')
    clasificacion = mirequest.get('clasificacion', '')
    
    param['peliculas'] = buscarPeliculas(nombre, genero, clasificacion)
    param['sesion_activa'] = haySesion()
    
    return render_template('front/cartelera.html', param=param)


##########################################################################
# + + + DÍA Y HORARIO + + + + + + + + + + + + + + + + + + + + + + + + + +
##########################################################################


def dyh_pagina(param, id_pelicula):
    '''### Información:
        Carga la página de selección de día y horario
        Recibe 'param' diccionario de parámetros
        Recibe 'id_pelicula' el ID de la película
        Retorna el template renderizado
    '''
    # Obtener datos de la película
    pelicula = obtenerPeliculaXId(id_pelicula)
    
    if not pelicula:
        return redirect('/cartelera')
    
    param['pelicula'] = pelicula
    
    # Obtener TODAS las funciones disponibles para esta película
    funciones = obtenerFuncionesXPelicula(id_pelicula)
    
    if funciones:
        param['funciones'] = funciones
        
        # Orden correcto de días de la semana
        orden_dias = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo']
        
        # Extraer días únicos de las funciones
        dias_disponibles = list(set([f['dia'] for f in funciones]))
        
        # Ordenar según orden_dias
        dias = [dia for dia in orden_dias if dia in dias_disponibles]
        
        # Extraer formatos únicos
        formatos = sorted(list(set([f['formato'] for f in funciones])))
        
        param['dias_disponibles'] = dias
        param['formatos_disponibles'] = formatos
    else:
        param['funciones'] = []
        param['dias_disponibles'] = []
        param['formatos_disponibles'] = []
    
    param['sesion_activa'] = haySesion()
    
    return render_template('front/dyh.html', param=param)

def procesar_dyh(param, request):
    '''### Información:
        Procesa la selección de día, horario y cantidad de entradas
        Guarda la selección en la sesión y redirige a butacas
        Recibe 'param' diccionario de parámetros
        Recibe 'request' con los datos del formulario
    '''
    if not haySesion():
        return redirect('/login')
    
    mirequest = {}
    getRequest(mirequest)
    
    # Guardar en sesión
    session['dia'] = mirequest.get('dia')
    session['formato'] = mirequest.get('formato')
    session['hora'] = mirequest.get('hora')
    session['cantidad_entradas'] = int(mirequest.get('entradas', 0))
    
    # Buscar la función que coincide con los criterios
    id_pelicula = session.get('pelicula_seleccionada')
    funciones = obtenerFuncionesXPelicula(id_pelicula)
    
    # Protección: si no hay funciones, devolver lista vacía
    if not funciones:
        funciones = []
    
    funcion_seleccionada = None
    for funcion in funciones:
        if (funcion['dia'] == mirequest.get('dia') and 
            funcion['horario'] == mirequest.get('hora') and
            funcion['formato'] == mirequest.get('formato')):
            funcion_seleccionada = funcion
            break
    
    if funcion_seleccionada:
        session['id_funcion'] = funcion_seleccionada['id']
        return redirect('/butacas')
    else:
        # Mostrar mensaje de error más específico
        if not funciones:
            flash('Esta película no tiene funciones disponibles en este momento', 'error')
        else:
            flash('No se encontró una función con el día, horario y formato seleccionados', 'error')
        return redirect(f'/dyh/{id_pelicula}')

##########################################################################
# + + + BUTACAS + + + + + + + + + + + + + + + + + + + + + + + + + + + + +
##########################################################################

def butacas_pagina(param):
    '''### Información:
        Carga la página de selección de butacas
    '''
    if not haySesion():
        return redirect('/login')
    
    if 'id_funcion' not in session:
        return redirect('/cartelera')
    
    id_funcion = session.get('id_funcion')
    id_pelicula = session.get('pelicula_seleccionada')
    
    # 🔍 DIAGNÓSTICO: Ver qué función se está consultando
    print(f"\n🎬 Consultando butacas para id_funcion: {id_funcion}\n")
    
    param['pelicula'] = obtenerPeliculaXId(id_pelicula)
    param['funcion'] = obtenerFuncionXId(id_funcion)
    param['cantidad_entradas'] = session.get('cantidad_entradas', 1)
    
    # Obtener butacas ocupadas
    butacas_ocupadas = obtenerButacasOcupadas(id_funcion)
    param['butacas_ocupadas'] = butacas_ocupadas
    
    # 🔍 DIAGNÓSTICO: Ver resultado
    print(f"📊 Butacas ocupadas encontradas: {butacas_ocupadas}\n")
    
    param['sesion_activa'] = haySesion()
    
    return render_template('front/butacas.html', param=param)


def procesar_butacas(param, request):
    '''### Información:
        Procesa la selección de butacas
    '''
    if not haySesion():
        return redirect('/login')
    
    mirequest = {}
    getRequest(mirequest)
    
    butacas_raw = mirequest.get('butacas', '')
    
    if isinstance(butacas_raw, str):
        if ',' in butacas_raw:
            butacas = [b.strip() for b in butacas_raw.split(',') if b.strip()]
        elif butacas_raw.strip():
            butacas = [butacas_raw.strip()]
        else:
            butacas = []
    elif isinstance(butacas_raw, list):
        butacas = butacas_raw
    else:
        butacas = []
    
    session['butacas_seleccionadas'] = butacas
    
    return redirect('/candy')

##########################################################################
# + + + CANDY + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +
##########################################################################

def candy_pagina(param):
    '''### Información:
        Carga la página de candy/snacks
        Recibe 'param' diccionario de parámetros
        Retorna el template renderizado
    '''
    param['productos'] = obtenerTodosLosProductosCandy()
    param['sesion_activa'] = haySesion()
    
    return render_template('front/candy.html', param=param)


def agregar_candy(param, request):
    '''### Información:
        Agrega productos de candy al carrito en sesión
        Recibe 'param' diccionario de parámetros
        Recibe 'request' con el producto_id
        Retorna JSON con success o error
    '''
    if not haySesion():
        return jsonify({'success': False, 'error': 'Debe iniciar sesión'})
    
    mirequest = {}
    getRequest(mirequest)
    
    producto_id = mirequest.get('producto_id')
    
    if not producto_id:
        return jsonify({'success': False, 'error': 'ID de producto no proporcionado'})
    
    # Obtener datos del producto desde la BD
    producto = obtenerProductoCandyXId(int(producto_id))
    
    if not producto:
        return jsonify({'success': False, 'error': 'Producto no encontrado'})
    
    # Inicializar carrito de candy si no existe
    if 'carrito_candy' not in session:
        session['carrito_candy'] = []
    
    # Agregar producto al carrito
    item_carrito = {
        'id': producto['id'],
        'nombre': producto['nombre'],
        'tipo': producto['tipo'],
        'tamaño': producto['tamaño'],
        'precio': int(producto['precio'])
    }
    
    carrito = session.get('carrito_candy', [])
    carrito.append(item_carrito)
    session['carrito_candy'] = carrito
    
    return jsonify({
        'success': True, 
        'mensaje': 'Producto agregado al carrito',
        'total_items': len(carrito)
    })

def limpiar_carrito():
    '''Limpia el carrito de candy'''
    if not haySesion():
        return jsonify({'success': False, 'error': 'Debe iniciar sesión'})
    
    session['carrito_candy'] = []
    
    return jsonify({
        'success': True, 
        'mensaje': 'Carrito limpiado exitosamente'
    })

##########################################################################
# + + + RESUMEN Y COMPRA + + + + + + + + + + + + + + + + + + + + + + + +
##########################################################################

def resumen_pagina(param):
    '''### Información:
        Carga la página de resumen de compra
        Recibe 'param' diccionario de parámetros
        Retorna el template renderizado
    '''
    if not haySesion():
        return redirect('/login')
    
    # Obtener datos de la sesión
    id_pelicula = session.get('pelicula_seleccionada')
    id_funcion = session.get('id_funcion')
    cantidad_entradas = session.get('cantidad_entradas', 0)
    butacas = session.get('butacas_seleccionadas', [])
    carrito_candy = session.get('carrito_candy', [])
    
    param['pelicula'] = obtenerPeliculaXId(id_pelicula)
    param['funcion'] = obtenerFuncionXId(id_funcion)
    param['cantidad_entradas'] = cantidad_entradas
    param['butacas'] = butacas
    param['candy'] = carrito_candy
    
    # Calcular total
    formato = session.get('formato', '2D')
    id_formato = 1 if formato == '2D' else 2
    precio_entrada = obtenerPrecioFormato(id_formato)
    
    total_entradas = precio_entrada * cantidad_entradas
    total_candy = sum([float(item.get('precio', 0)) for item in carrito_candy])
    
    param['total_entradas'] = total_entradas
    param['total_candy'] = total_candy
    param['total'] = total_entradas + total_candy
    param['sesion_activa'] = haySesion()
    
    return render_template('front/resumen.html', param=param)


def procesar_compra(param, request):
    '''### Información:
        Procesa la compra final
    '''
    if not haySesion():
        return redirect('/login')
    
    try:
        id_usuario = session.get('id_usuario')
        id_funcion = session.get('id_funcion')
        cantidad_entradas = session.get('cantidad_entradas')
        butacas = session.get('butacas_seleccionadas', [])
        formato = session.get('formato', '2D')
        carrito_candy = session.get('carrito_candy', [])
        
        if not id_usuario or not id_funcion or not cantidad_entradas:
            flash('Faltan datos para procesar la compra', 'error')
            return redirect('/resumen')
        
        id_formato = 1 if formato == '2D' else 2
        
        id_ticket = crearTicket(cantidad_entradas, id_funcion, id_formato)
        
        if not id_ticket:
            flash('Error al crear el ticket', 'error')
            return redirect('/resumen')
        
        if butacas:
            agregarButacas(id_ticket, butacas)
        
        precio_entrada = obtenerPrecioFormato(id_formato)
        total_entradas = precio_entrada * cantidad_entradas
        
        total_candy = 0
        if carrito_candy:
            items_validos = [item for item in carrito_candy 
                           if item.get('precio') and item.get('precio') != 0]
            if items_validos:
                total_candy = sum([int(item.get('precio', 0)) for item in items_validos])
        
        total = total_entradas + total_candy
        
        id_resumen = crearResumenCompra(
            id_usuario=id_usuario,
            id_ticket=id_ticket,
            id_candy=None,
            cantidad_candy=len(carrito_candy),
            total=total,
            pagado=1
        )
        
        if not id_resumen:
            flash('Error al crear el resumen de compra', 'error')
            return redirect('/resumen')
        
        if carrito_candy:
            agregarCandyACompra(id_resumen, carrito_candy)
        
        agregarAlHistorial(id_usuario, id_resumen)
        
        session.pop('pelicula_seleccionada', None)
        session.pop('id_funcion', None)
        session.pop('dia', None)
        session.pop('formato', None)
        session.pop('hora', None)
        session.pop('cantidad_entradas', None)
        session.pop('butacas_seleccionadas', None)
        session.pop('carrito_candy', None)
        
        flash('¡Compra realizada con éxito!', 'success')
        return redirect('/historial')
            
    except Exception as e:
        flash(f'Error al procesar la compra: {str(e)}', 'error')
        return redirect('/resumen')


##########################################################################
# + + + USUARIO + + + + + + + + + + + + + + + + + + + + + + + + + + + + +
##########################################################################

def login_pagina(param):
    '''### Información:
        Carga la página de login
        Recibe 'param' diccionario de parámetros
        Retorna el template renderizado
    '''
    return render_template('front/login.html', param=param)


def registro_pagina(param):
    '''### Información:
        Carga la página de registro
        Recibe 'param' diccionario de parámetros
        Retorna el template renderizado
    '''
    return render_template('front/regist.html', param=param)


def ingresoUsuarioValido(param, request):
    '''### Información:
        Procesa el login del usuario
        Recibe 'param' diccionario de parámetros
        Recibe 'request' con email y contraseña
        Retorna cartelera si login exitoso, sino regresa a login
    '''
    if crearSesion(request):
        return redirect('/cartelera')
    else:
        param['error_msg_login'] = "Error: Usuario y/o contraseña inválidos"
        return login_pagina(param)


def registrarUsuario(param, request):
    '''### Información:
        Procesa el registro de un nuevo usuario
        Recibe 'param' diccionario de parámetros
        Recibe 'request' con los datos del formulario
        Retorna cartelera si registro exitoso e inicia sesión automáticamente
    '''
    mirequest = {}
    getRequest(mirequest)
    
    # Validar que todos los campos estén presentes
    if (mirequest.get('nombres') and 
        mirequest.get('apellidos') and 
        mirequest.get('email') and 
        mirequest.get('cont') and
        mirequest.get('fecha') and
        mirequest.get('telefono')):
        
        # Preparar datos para insertar
        datos_usuario = {
            'nombres': mirequest.get('nombres'),
            'apellidos': mirequest.get('apellidos'),
            'nacimiento': mirequest.get('fecha'),
            'email': mirequest.get('email'),
            'telefono': mirequest.get('pref', '+54') + mirequest.get('telefono'),
            'password': mirequest.get('cont')
        }
        
        if crearUsuario(datos_usuario):
            # ✨ NUEVO: Iniciar sesión automáticamente después del registro
            # Obtener datos del usuario recién creado
            usuario = {}
            email = mirequest.get('email')
            password = mirequest.get('cont')
            
            if obtenerUsuarioXEmailPass(usuario, email, password):
                # Crear sesión con los datos del usuario
                cargarSesion(usuario)
                
                # Redirigir a cartelera
                return redirect('/cartelera')
            else:
                # Si por alguna razón no se pudo obtener el usuario
                # (no debería pasar, pero por seguridad)
                param['succes_msg_login'] = "Se ha creado el usuario con éxito. Por favor inicie sesión."
                return login_pagina(param)
        else:
            param['error_msg_register'] = "Error: No se ha podido crear el usuario (email ya existe)"
            return registro_pagina(param)
    else:
        param['error_msg_register'] = "Error: Complete todos los campos"
        return registro_pagina(param)


def usuario_pagina(param):
    '''Carga la página de perfil de usuario'''
    if not haySesion():
        return redirect('/login')
    
    # Obtener datos del usuario desde la BD
    query = """
        SELECT id, nombres, apellidos, nacimiento, email, telefono, avatar
        FROM usuario
        WHERE email = %s
    """
    resultado = selectDB(BASE, query, (session.get('username'),), dictionary=True)
    
    if resultado:
        param['usuario'] = resultado[0]
    else:
        # Si no se encuentra, usar datos de la sesión
        param['usuario'] = {
            'nombres': session.get('nombres'),
            'apellidos': session.get('apellidos'),
            'email': session.get('username'),
            'telefono': session.get('telefono'),
            'avatar': session.get('avatar', '')
        }
    
    param['sesion_activa'] = True
    
    return render_template('front/usuario.html', param=param)


def actualizar_usuario(param, request):
    '''### Información:
        Actualiza los datos del usuario incluyendo avatar
    '''
    if not haySesion():
        return redirect('/login')
    
    mirequest = {}
    getRequest(mirequest)
    
    # Datos básicos
    datos_actualizados = {
        'nombres': mirequest.get('nombres'),
        'apellidos': mirequest.get('apellidos'),
        'telefono': mirequest.get('telefono'),
        'password': mirequest.get('cont', '')
    }
    
    # ✨ NUEVO: Manejo de avatar
    avatar_filename = None
    if 'avatar' in request.files:
        file = request.files['avatar']
        
        if file and file.filename != '':
            # Validar extensión
            allowed_extensions = {'png', 'jpg', 'jpeg', 'gif', 'webp'}
            filename = secure_filename(file.filename)
            file_ext = filename.rsplit('.', 1)[1].lower() if '.' in filename else ''
            
            if file_ext in allowed_extensions:
                # Crear nombre único: username_timestamp.ext
                import time
                username = session.get('username')
                avatar_filename = f"{username}_{int(time.time())}.{file_ext}"
                
                # Crear directorio si no existe
                avatar_dir = os.path.join('static', 'img', 'avatars')
                os.makedirs(avatar_dir, exist_ok=True)
                
                # Guardar archivo
                avatar_path = os.path.join(avatar_dir, avatar_filename)
                file.save(avatar_path)
                
                # Agregar avatar a datos
                datos_actualizados['avatar'] = avatar_filename
    
    # Actualizar en BD
    if actualizarUsuario(datos_actualizados, session.get('username')):
        # Actualizar sesión
        session['nombres'] = datos_actualizados['nombres']
        session['apellidos'] = datos_actualizados['apellidos']
        session['telefono'] = datos_actualizados['telefono']
        
        # ✅ Actualizar avatar en sesión
        if avatar_filename:
            session['avatar'] = avatar_filename
        
        flash('Usuario actualizado con éxito', 'success')
    else:
        flash('Error al actualizar usuario', 'error')
    
    return redirect('/usuario')


def historial_pagina(param):
    '''### Información:
        Carga la página de historial de compras
        Recibe 'param' diccionario de parámetros
        Retorna el template renderizado o redirige a login
    '''
    if not haySesion():
        return redirect('/login')
    
    id_usuario = session.get('id_usuario')
    param['historial'] = obtenerHistorialUsuario(id_usuario)
    param['sesion_activa'] = True
    
    return render_template('front/historial.html', param=param)


##########################################################################
# + + + PÁGINAS ADICIONALES + + + + + + + + + + + + + + + + + + + + + + +
##########################################################################

def paginaNoEncontrada(name):
    '''### Información:
        Retorna una página genérica indicando que la ruta no existe
        Recibe 'name' el nombre de la ruta solicitada
    '''
    res = f'Página "{name}" no encontrada<br>'
    res += '<a href="/">Volver al inicio</a>'
    return res