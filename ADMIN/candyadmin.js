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

function validarCandy(e) {
  e.preventDefault();
  limpiarErrores();

  var hasErrors = false;

  var nombre   = document.getElementById("name").value.trim();
  var precio   = document.getElementById("price").value.trim();
  var stock    = document.getElementById("stock").value.trim();
  var categoria= document.getElementById("category").value.trim();
  var imagenEl = document.getElementById("image");
  var imagen   = (imagenEl && imagenEl.files && imagenEl.files[0]) ? imagenEl.files[0] : null;

  if (nombre.length < 2) {
    setError("error-name", "Ingrese un nombre válido (mín. 2 caracteres).");
    hasErrors = true;
  } else {
    setError("error-name", "");
  }

  var precioNum = Number(precio);
  if (!precio || isNaN(precioNum) || precioNum < 100) {
    setError("error-price", "Ingrese un precio válido (mínimo $100).");
    hasErrors = true;
  } else {
    setError("error-price", "");
  }

  var stockNum = Number(stock);
  if (stock === "" || isNaN(stockNum) || stockNum < 0) {
    setError("error-stock", "Ingrese un stock válido (número mayor o igual a 0).");
    hasErrors = true;
  } else {
    setError("error-stock", "");
  }

  if (!categoria) {
    setError("error-category", "Debe seleccionar una categoría.");
    hasErrors = true;
  } else {
    setError("error-category", "");
  }

  if (!imagen) {
    setError("error-image", "Debe seleccionar una imagen.");
    hasErrors = true;
  } else if (imagen.type.indexOf("image/") !== 0) {
    setError("error-image", "El archivo debe ser una imagen.");
    hasErrors = true;
  } else {
    setError("error-image", "");
  }

  if (hasErrors) return;

  var form = e.currentTarget;
  form.submit();
}

function cargarEventos() {
  var form = document.getElementById("addCandyForm");
  
  if (form) {
    form.addEventListener("submit", validarCandy);
  }
}

cargarEventos();