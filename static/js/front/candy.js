function setError(categoria, msg) {
  var errorElement = document.getElementById("error-" + categoria.toLowerCase());
  if (!errorElement) return;
  
  if (msg) {
    errorElement.textContent = msg;
    errorElement.classList.add("mostrar");
  } else {
    errorElement.textContent = "";
    errorElement.classList.remove("mostrar");
  }
}

function filtrarTamañosPorTipo(categoria) {
  var categoriaLower = categoria.toLowerCase();
  var tipoRadios = document.querySelectorAll('input[name="tipo_' + categoriaLower + '"]:checked');
  var tamañoLabels = document.querySelectorAll('input[name="tamaño_' + categoriaLower + '"]');
  
  if (tipoRadios.length === 0) {
    // Si no hay tipo seleccionado, ocultar todos los tamaños
    tamañoLabels.forEach(function(radio) {
      radio.parentElement.style.display = "none";
      radio.checked = false;
    });
    return;
  }
  
  var tipoSeleccionado = tipoRadios[0].value;
  
  // Mostrar solo los tamaños que coincidan con el tipo seleccionado
  tamañoLabels.forEach(function(radio) {
    var tipoDelProducto = radio.getAttribute("data-tipo");
    if (tipoDelProducto === tipoSeleccionado) {
      radio.parentElement.style.display = "block";
    } else {
      radio.parentElement.style.display = "none";
      radio.checked = false;
    }
  });
}

function agregarAlCarrito(e) {
  var boton = e.currentTarget;
  var categoria = boton.getAttribute("data-categoria");
  
  setError(categoria, ""); // Limpiar errores
  
  // Verificar que se haya seleccionado un tipo
  var tipoRadios = document.querySelectorAll('input[name="tipo_' + categoria.toLowerCase() + '"]:checked');
  if (tipoRadios.length === 0) {
    setError(categoria, "Debe seleccionar un tipo.");
    return;
  }
  
  // Verificar que se haya seleccionado un tamaño
  var tamañoRadios = document.querySelectorAll('input[name="tamaño_' + categoria.toLowerCase() + '"]:checked');
  if (tamañoRadios.length === 0) {
    setError(categoria, "Debe seleccionar un tamaño.");
    return;
  }
  
  var productoId = tamañoRadios[0].value;
  var precio = tamañoRadios[0].getAttribute("data-precio");
  
  // Enviar al servidor para agregar al carrito
  var formData = new FormData();
  formData.append('producto_id', productoId);
  
  fetch('/agregar_candy', {
    method: 'POST',
    body: formData
  })
  .then(function(response) {
    return response.json();
  })
  .then(function(data) {
    if (data.success) {
      alert("¡Producto agregado al carrito!");
      // Limpiar selección
      document.querySelectorAll('input[name="tipo_' + categoria.toLowerCase() + '"]').forEach(function(r) {
        r.checked = false;
      });
      document.querySelectorAll('input[name="tamaño_' + categoria.toLowerCase() + '"]').forEach(function(r) {
        r.checked = false;
        r.parentElement.style.display = "none";
      });
    } else {
      setError(categoria, data.error || "Error al agregar el producto");
    }
  })
  .catch(function(error) {
    console.error('Error:', error);
    setError(categoria, "Error de conexión");
  });
}

function limpiarCarrito() {
  if (!confirm("¿Estás seguro de que quieres vaciar el carrito?")) {
    return;
  }
  
  fetch('/limpiar_carrito', {
    method: 'POST'
  })
  .then(function(response) {
    return response.json();
  })
  .then(function(data) {
    if (data.success) {
      alert("¡Carrito vaciado exitosamente!");
    } else {
      alert("Error al limpiar el carrito");
    }
  })
  .catch(function(error) {
    console.error('Error:', error);
    alert("Error de conexión");
  });
}

function cargarEventos() {
  // Event listeners para los radio buttons de tipo
  var tiposRadios = document.querySelectorAll('input[name^="tipo_"]');
  tiposRadios.forEach(function(radio) {
    radio.addEventListener("change", function() {
      // Extraer categoría del nombre (tipo_pochoclos -> Pochoclos)
      var nombre = radio.getAttribute("name");
      var categoriaLower = nombre.replace("tipo_", "");
      var categoria = categoriaLower.charAt(0).toUpperCase() + categoriaLower.slice(1);
      
      filtrarTamañosPorTipo(categoria);
    });
  });
  
  // Event listeners para botones de agregar al carrito
  var botonesAgregar = document.querySelectorAll(".agregar-carrito");
  botonesAgregar.forEach(function(boton) {
    boton.addEventListener("click", agregarAlCarrito);
  });
  
  // Event listener para botón de limpiar carrito
  var botonLimpiar = document.getElementById("btnLimpiarCarrito");
  if (botonLimpiar) {
    botonLimpiar.addEventListener("click", limpiarCarrito);
  }
  
  // Inicialmente, ocultar todos los tamaños hasta que se seleccione un tipo
  ["Pochoclos", "Bebidas", "Snacks", "Combos"].forEach(function(categoria) {
    filtrarTamañosPorTipo(categoria);
  });
}

cargarEventos();