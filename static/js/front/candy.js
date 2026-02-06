function setError(id, mensaje) {
  var el = document.getElementById(id);
  if (!el) return;
  if (mensaje) {
    el.textContent = mensaje;
    el.classList.add("mostrar");
  } else {
    el.textContent = "";
    el.classList.remove("mostrar");
  }
}

function limpiarErrores() {
  var errores = document.querySelectorAll(".error");
  for (var i = 0; i < errores.length; i++) {
    errores[i].textContent = "";
    errores[i].classList.remove("mostrar");
  }
}

function agregarAlCarrito(e) {
  e.preventDefault();
  limpiarErrores();

  var boton = e.currentTarget;
  var bloque = boton.closest(".bloque");
  if (!bloque) return;

  var num = boton.id.replace("carrito", "");

  var tipo =
    bloque.querySelector('input[type="radio"][name^="tipo"]:checked');

  var tamano =
    bloque.querySelector('input[type="radio"][name^="tamano"]:checked');

  var hasErrors = false;

  if (!tipo || !tamano) {
    setError("error-candy" + num, "Debe seleccionar un tipo y un tamaño.");
    hasErrors = true;
  } else {
    setError("error-candy" + num, "");
  }

  if (hasErrors) return;

  alert("Producto agregado al carrito correctamente.");
}

function cargarEventos() {
  var botones = document.querySelectorAll('input[id^="carrito"]');
  if (!botones.length) return;

  for (var i = 0; i < botones.length; i++) {
    botones[i].addEventListener("click", agregarAlCarrito);
  }
}

cargarEventos();