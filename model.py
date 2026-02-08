'''### info:
    MODEL - ACCESO A LOS DATOS DEL CINE LCU
    
    Gestiona todos los accesos a la información de la base de datos:
    - Usuarios (registro, login, actualización)
    - Películas (cartelera, búsqueda, detalles)
    - Funciones (horarios, salas)
    - Candy (productos, stock)
    - Reservas y tickets
    - Historial de compras
'''

from _mysql_db import *

##########################################################################
# + + + USUARIOS + + + + + + + + + + + + + + + + + + + + + + + + + + + + 
##########################################################################

def crearUsuario(di):
    '''### Información:
        Crea un nuevo usuario en la base de datos
        Recibe 'di' un diccionario con los datos del usuario:
            - nombres
            - apellidos
            - nacimiento (fecha)
            - email
            - telefono
            - password
        Retorna True si se crea exitosamente, False caso contrario
    '''
    sQuery = """
        INSERT INTO usuario
        (id, nombres, apellidos, nacimiento, email, telefono, password, avatar)
        VALUES
        (%s, %s, %s, %s, %s, %s, %s, %s);
    """
    val = (
        None,
        di.get('nombres'),
        di.get('apellidos'),
        di.get('nacimiento'),
        di.get('email'),
        di.get('telefono'),
        di.get('password', ''),
        ''  # avatar vacío por defecto
    )
    resultado = insertDB(BASE, sQuery, val)
    return resultado == 1


def obtenerUsuarioXEmail(param, email, clave='usuario'):
    '''### Información:
        Obtiene todos los campos de un usuario a partir de su email
        Carga la información en el dict 'param'
        Recibe 'param' un diccionario donde se guardará la info
        Recibe 'email' el email del usuario a buscar
        Recibe 'clave' la clave del dict donde se guardará (default: 'usuario')
    '''
    sSql = """
        SELECT id, nombres, apellidos, nacimiento, email, telefono, password, avatar
        FROM usuario 
        WHERE email = %s;
    """
    val = (email,)
    
    fila = selectDB(BASE, sSql, val)
    
    if fila and len(fila) > 0:
        param[clave] = {}
        param[clave]['id'] = fila[0][0]
        param[clave]['nombres'] = fila[0][1]
        param[clave]['apellidos'] = fila[0][2]
        param[clave]['nacimiento'] = fila[0][3]
        param[clave]['email'] = fila[0][4]
        param[clave]['telefono'] = fila[0][5]
        param[clave]['password'] = fila[0][6]
        param[clave]['avatar'] = fila[0][7]


def validarUsuario(email, password):
    '''### Información:
        Valida si un usuario existe con ese email y password
        Recibe 'email' y 'password'
        Retorna True si es válido, False caso contrario
    '''
    sSql = """
        SELECT id FROM usuario
        WHERE email = %s AND password = %s;
    """
    val = (email, password)
    fila = selectDB(BASE, sSql, val)
    return fila != [] and len(fila) > 0


def obtenerUsuarioXEmailPass(result, email, password):
    '''### Información:
        Obtiene los datos de un usuario validando email y password
        Carga la información en el dict 'result'
        Recibe 'result' diccionario donde se almacena la respuesta
        Recibe 'email' y 'password'
        Retorna True si encuentra el usuario, False caso contrario
    '''
    res = False
    sSql = """
        SELECT id, nombres, apellidos, nacimiento, email, telefono, password, avatar, rol
        FROM usuario 
        WHERE email = %s AND password = %s;
    """
    val = (email, password)
    fila = selectDB(BASE, sSql, val)
    
    if fila and len(fila) > 0:
        res = True
        result['id'] = fila[0][0]
        result['nombres'] = fila[0][1]
        result['apellidos'] = fila[0][2]
        result['nacimiento'] = fila[0][3]
        result['username'] = fila[0][4]  # email
        result['telefono'] = fila[0][5]
        result['password'] = fila[0][6]
        result['avatar'] = fila[0][7]
        result['imagen'] = fila[0][7]
        result['rol'] = fila[0][8]
    
    return res


def actualizarUsuario(di, email):
    '''### Información:
        Actualiza los datos de un usuario incluyendo avatar
        Recibe 'di' diccionario con los campos a modificar
        Recibe 'email' la clave para identificar el usuario
        Retorna True si actualiza correctamente, False caso contrario
    '''
    # Si se proporciona avatar, actualizar también
    if 'avatar' in di and di['avatar']:
        sQuery = """
            UPDATE usuario 
            SET nombres = %s, 
                apellidos = %s,
                telefono = %s,
                password = %s,
                avatar = %s
            WHERE email = %s;
        """
        val = (
            di.get('nombres'),
            di.get('apellidos'),
            di.get('telefono'),
            di.get('password', ''),
            di.get('avatar'),
            email
        )
    else:
        # Sin avatar, actualizar solo los demás campos
        sQuery = """
            UPDATE usuario 
            SET nombres = %s, 
                apellidos = %s,
                telefono = %s,
                password = %s
            WHERE email = %s;
        """
        val = (
            di.get('nombres'),
            di.get('apellidos'),
            di.get('telefono'),
            di.get('password', ''),
            email
        )
    
    resultado = updateDB(BASE, sQuery, val=val)
    return resultado == 1


##########################################################################
# + + + PELÍCULAS + + + + + + + + + + + + + + + + + + + + + + + + + + + 
##########################################################################

def obtenerTodasLasPeliculas():
    '''### Información:
        Obtiene todas las películas de la cartelera
        Retorna una lista de diccionarios con la info de cada película
    '''
    sSql = """
        SELECT id, titulo, sinopsis, duracion, año, genero, clas_edad, poster, imdb, rotten, trailer
        FROM pelicula
        ORDER BY titulo;
    """
    
    return selectDB(BASE, sSql, dictionary=True)


def obtenerPeliculaXId(id_pelicula):
    '''### Información:
        Obtiene los datos de una película específica
        Recibe 'id_pelicula' el ID de la película
        Retorna un diccionario con los datos de la película
    '''
    sSql = """
        SELECT id, titulo, sinopsis, duracion, año, genero, clas_edad, poster, imdb, rotten, trailer
        FROM pelicula
        WHERE id = %s;
    """
    val = (id_pelicula,)
    
    resultado = selectDB(BASE, sSql, val, dictionary=True)
    return resultado[0] if resultado else None


def buscarPeliculas(nombre='', genero='', clasificacion=''):
    '''### Información:
        Busca películas por nombre, género y/o clasificación
        Recibe 'nombre' (opcional)
        Recibe 'genero' (opcional)
        Recibe 'clasificacion' (opcional)
        Retorna lista de películas que coincidan con los criterios
    '''
    sSql = """
        SELECT id, titulo, sinopsis, duracion, año, genero, clas_edad, poster, imdb, rotten, trailer
        FROM pelicula
        WHERE 1=1
    """
    val = []
    
    if nombre:
        sSql += " AND titulo LIKE %s"
        val.append(f"%{nombre}%")
    
    if genero:
        sSql += " AND genero = %s"
        val.append(genero)
    
    if clasificacion:
        sSql += " AND clas_edad = %s"
        val.append(clasificacion)
    
    sSql += " ORDER BY titulo;"
    
    if val:
        return selectDB(BASE, sSql, tuple(val), dictionary=True)
    else:
        return selectDB(BASE, sSql, dictionary=True)


##########################################################################
# + + + FUNCIONES (HORARIOS) + + + + + + + + + + + + + + + + + + + + + +
##########################################################################

def obtenerFuncionesXPelicula(id_pelicula):
    '''### Información:
        Obtiene todas las funciones (horarios) de una película
        Recibe 'id_pelicula'
        Retorna lista de funciones con sala, horario, día, formato
    '''
    sSql = """
        SELECT f.id, f.horario, f.dia, pf.formato, s.numero as sala, s.asientos
        FROM funcion f
        INNER JOIN sala s ON f.id_sala = s.id
        INNER JOIN precio_formato pf ON f.id_formato = pf.id
        WHERE f.id_pelicula = %s
        ORDER BY f.dia, f.horario;
    """
    val = (id_pelicula,)
    
    return selectDB(BASE, sSql, val, dictionary=True)


def obtenerFuncionXId(id_funcion):
    '''### Información:
        Obtiene los datos de una función específica
        Recibe 'id_funcion'
        Retorna diccionario con info de la función
    '''
    sSql = """
        SELECT f.id, f.horario, f.dia, pf.formato, f.id_pelicula,
               s.numero as sala, s.asientos, p.titulo
        FROM funcion f
        INNER JOIN sala s ON f.id_sala = s.id
        INNER JOIN pelicula p ON f.id_pelicula = p.id
        INNER JOIN precio_formato pf ON f.id_formato = pf.id
        WHERE f.id = %s;
    """
    val = (id_funcion,)
    
    resultado = selectDB(BASE, sSql, val, dictionary=True)
    return resultado[0] if resultado else None


##########################################################################
# + + + CANDY (PRODUCTOS) + + + + + + + + + + + + + + + + + + + + + + +
##########################################################################

def obtenerTodosLosProductosCandy():
    '''### Información:
        Obtiene todos los productos de candy
        Retorna lista de diccionarios con todos los productos
    '''
    sSql = """
        SELECT id, nombre, precio, stock, categoría, tipo, tamaño, imagen
        FROM candy
        WHERE stock > 0
        ORDER BY categoría, tipo, 
                 CASE tamaño
                     WHEN 'Chico' THEN 1
                     WHEN 'Mediano' THEN 2
                     WHEN 'Grande' THEN 3
                     WHEN 'Único' THEN 4
                     ELSE 5
                 END;
    """
    
    return selectDB(BASE, sSql, dictionary=True)


def obtenerProductoCandyXId(id_candy):
    '''### Información:
        Obtiene un producto específico de candy
        Recibe 'id_candy'
        Retorna diccionario con la info del producto
    '''
    sSql = """
        SELECT id, nombre, precio, stock, categoría, tipo, tamaño, imagen
        FROM candy
        WHERE id = %s;
    """
    val = (id_candy,)
    
    resultado = selectDB(BASE, sSql, val, dictionary=True)
    return resultado[0] if resultado else None


def obtenerCandyXCategoria(categoria):
    '''### Información:
        Obtiene productos de candy por categoría
        Recibe 'categoria' (Pochoclos, Bebidas, Snacks, Combos, Otros)
        Retorna lista de productos de esa categoría
    '''
    sSql = """
        SELECT id, nombre, precio, stock, categoría, tipo, tamaño, imagen
        FROM candy
        WHERE categoría = %s AND stock > 0
        ORDER BY tipo, 
                 CASE tamaño
                     WHEN 'Chico' THEN 1
                     WHEN 'Mediano' THEN 2
                     WHEN 'Grande' THEN 3
                     WHEN 'Único' THEN 4
                     ELSE 5
                 END;
    """
    val = (categoria,)
    
    return selectDB(BASE, sSql, val, dictionary=True)

def agregarCandyACompra(id_resumen, carrito_candy):
    '''### Información:
        Agrega múltiples productos de candy a una compra
    '''
    if not carrito_candy or len(carrito_candy) == 0:
        return True
    
    try:
        items_validos = [item for item in carrito_candy 
                        if item.get('id') and item.get('precio')]
        
        if not items_validos:
            return True
        
        for item in items_validos:
            sSqlNext = "SELECT IFNULL(MAX(id), 0) + 1 as next_id FROM compra_candy;"
            resultado = selectDB(BASE, sSqlNext)
            next_id = resultado[0][0] if resultado and resultado[0] else 1
            
            sSql = """
                INSERT INTO compra_candy (id, id_resumen, id_candy, cantidad, precio)
                VALUES (%s, %s, %s, %s, %s);
            """
            val = (next_id, id_resumen, item.get('id'), 1, int(item.get('precio')))
            
            insertDB(BASE, sSql, val)
        
        return True
    except:
        return False


def obtenerCandyDeCompra(id_resumen):
    '''### Información:
        Obtiene todos los productos de candy de una compra
        Recibe 'id_resumen' del resumen_compra
        Retorna lista de diccionarios con los candies
    '''
    sSql = """
        SELECT 
            cc.id,
            cc.id_candy,
            cc.cantidad,
            cc.precio,
            c.nombre,
            c.tipo,
            c.tamaño
        FROM compra_candy cc
        LEFT JOIN candy c ON cc.id_candy = c.id
        WHERE cc.id_resumen = %s
        ORDER BY cc.id;
    """
    val = (id_resumen,)
    
    return selectDB(BASE, sSql, val, dictionary=True)

##########################################################################
# + + + TICKETS Y RESERVAS + + + + + + + + + + + + + + + + + + + + + + +
##########################################################################

def crearTicket(cantidad, id_funcion, id_formato=1):
    '''### Información:
        Crea un nuevo ticket
    '''
    cantidad_str = str(cantidad)
    
    if cantidad not in range(1, 11):
        return None
    
    sSql = "SELECT IFNULL(MAX(id), 0) + 1 as next_id FROM ticket;"
    resultado = selectDB(BASE, sSql)
    
    if not resultado or not resultado[0]:
        return None
    
    next_id = resultado[0][0]
    
    sQuery = """
        INSERT INTO ticket (id, cantidad, id_funcion, id_formato)
        VALUES (%s, %s, %s, %s);
    """
    val = (next_id, cantidad_str, id_funcion, id_formato)
    
    resultado_insert = insertDB(BASE, sQuery, val)
    
    return next_id if resultado_insert == 1 else None


def agregarButacas(id_ticket, lista_butacas):
    '''### Información:
        Agrega butacas a un ticket
    '''
    if not lista_butacas or len(lista_butacas) == 0:
        return True
    
    if not id_ticket:
        return False
    
    sQuery = """
        INSERT INTO butaca (id, id_ticket, butaca)
        VALUES (%s, %s, %s);
    """
    
    exito = True
    for butaca in lista_butacas:
        try:
            sSql = "SELECT IFNULL(MAX(id), 0) + 1 as next_id FROM butaca;"
            resultado = selectDB(BASE, sSql)
            
            if not resultado or not resultado[0]:
                exito = False
                continue
            
            next_id = resultado[0][0]
            val = (next_id, id_ticket, butaca)
            resultado_insert = insertDB(BASE, sQuery, val)
            
            if resultado_insert != 1:
                exito = False
                
        except:
            exito = False
    
    return exito


def obtenerButacasOcupadas(id_funcion):
    '''### Información:
        Obtiene todas las butacas ya ocupadas para una función
    '''
    sSql = """
        SELECT DISTINCT b.butaca
        FROM butaca b
        INNER JOIN ticket t ON b.id_ticket = t.id
        WHERE t.id_funcion = %s;
    """
    val = (id_funcion,)
    
    resultado = selectDB(BASE, sSql, val)
    
    return [fila[0] for fila in resultado] if resultado else []


##########################################################################
# + + + HISTORIAL DE COMPRAS + + + + + + + + + + + + + + + + + + + + + +
##########################################################################

def crearResumenCompra(id_usuario, id_ticket, id_candy, cantidad_candy, total, pagado):
    '''### Información:
        Crea un resumen de compra
    '''
    sSql = "SELECT IFNULL(MAX(id), 0) + 1 as next_id FROM resumen_compra;"
    resultado = selectDB(BASE, sSql)
    
    if not resultado or not resultado[0]:
        return None
    
    next_id = resultado[0][0]
    
    sQuery = """
        INSERT INTO resumen_compra (id, id_ticket, id_usuario, id_candy, cantidad, total, estado)
        VALUES (%s, %s, %s, %s, %s, %s, %s);
    """
    val = (next_id, id_ticket, id_usuario, id_candy, cantidad_candy, total, pagado)
    
    resultado_insert = insertDB(BASE, sQuery, val)
    
    return next_id if resultado_insert == 1 else None

def agregarAlHistorial(id_usuario, id_resumen):
    '''### Información:
        Agrega una compra al historial del usuario
    '''
    sSql = "SELECT IFNULL(MAX(id), 0) + 1 as next_id FROM historial_compra;"
    resultado = selectDB(BASE, sSql)
    
    if not resultado or not resultado[0]:
        return False
    
    next_id = resultado[0][0]
    
    sQuery = """
        INSERT INTO historial_compra (id, id_usuario, id_resumen)
        VALUES (%s, %s, %s);
    """
    val = (next_id, id_usuario, id_resumen)
    
    resultado_insert = insertDB(BASE, sQuery, val)
    return resultado_insert == 1


def obtenerHistorialUsuario(id_usuario):
    '''### Información:
        Obtiene el historial de compras de un usuario
    '''
    sSql = """
        SELECT 
            r.id,
            r.total,
            r.estado as pagado,
            r.cantidad as cantidad_candy,
            p.titulo,
            f.dia,
            f.horario,
            c.nombre as candy
        FROM historial_compra h
        INNER JOIN resumen_compra r ON h.id_resumen = r.id
        LEFT JOIN ticket t ON r.id_ticket = t.id
        LEFT JOIN funcion f ON t.id_funcion = f.id
        LEFT JOIN pelicula p ON f.id_pelicula = p.id
        LEFT JOIN candy c ON r.id_candy = c.id
        WHERE h.id_usuario = %s
        ORDER BY r.id DESC;
    """
    val = (id_usuario,)
    
    return selectDB(BASE, sSql, val, dictionary=True)


##########################################################################
# + + + PRECIOS + + + + + + + + + + + + + + + + + + + + + + + + + + + + +
##########################################################################

def obtenerPrecioFormato(id_formato):
    '''### Información:
        Obtiene el precio de un formato (2D o 3D)
        Recibe 'id_formato' (1=2D, 2=3D)
        Retorna el precio
    '''
    sSql = """
        SELECT precio
        FROM precio_formato
        WHERE id = %s;
    """
    val = (id_formato,)
    
    resultado = selectDB(BASE, sSql, val)
    return resultado[0][0] if resultado else 0


       
    