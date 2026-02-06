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

function validarAdministrarSala(form) {
  var hasErrors = false;
  var sala1  = (form.querySelector("#sala").value).trim();
  var fecha1 = (form.querySelector("#fecha").value).trim();
  var hora1  = (form.querySelector("#hora").value).trim();

  if (!sala1)  { setError("error-sala1",  "Debe ingresar una sala."); hasErrors = true; } else { setError("error-sala1", ""); }
  if (!fecha1) { setError("error-fecha1", "Debe seleccionar una fecha."); hasErrors = true; } else { setError("error-fecha1", ""); }
  if (!hora1)  { setError("error-hora1",  "Debe seleccionar un horario."); hasErrors = true; } else { setError("error-hora1", ""); }

  return hasErrors;
}

function validarBorrarSala(form) {
  var hasErrors = false;
  var sala2 = (form.querySelector("#sala-borrar").value).trim();

  if (!sala2) { setError("error-sala2", "Debe seleccionar una sala."); hasErrors = true; } else { setError("error-sala2", ""); }

  return hasErrors;
}

function validarAdministrarButacas(form) {
  var hasErrors = false;
  var sala3  = form.querySelector("#sala") ? (form.querySelector("#sala").value ).trim() : "";
  var fila   = (form.querySelector("#fila").value).trim();
  var numero = (form.querySelector("#numero").value).trim();
  var fechaB = (form.querySelector("#fecha-butaca").value ).trim();
  var horaB  = (form.querySelector("#hora-butaca").value ).trim();

  if (!sala3)  { setError("error-sala3",  "Debe seleccionar una sala."); hasErrors = true; } else { setError("error-sala3", ""); }
  if (!fila)   { setError("error-fila3",  "Debe ingresar una fila.");   hasErrors = true; }
  else if (!/^[A-Za-z]$/.test(fila)) {
    setError("error-fila3", "Use una sola letra (A, B, C...)."); hasErrors = true;
  } else {  if (!hasErrors) setError("error-fila3", ""); }
  if (!numero) { setError("error-numero3","Debe seleccionar un número."); hasErrors = true; } else { setError("error-numero3",""); }
  if (!fechaB) { setError("error-fecha3", "Debe seleccionar una fecha."); hasErrors = true; } else { setError("error-fecha3", ""); }
  if (!horaB)  { setError("error-hora3",  "Debe seleccionar un horario."); hasErrors = true; } else { setError("error-hora3", ""); }

  return hasErrors;
}

function validarButAdmin(e) {
  e.preventDefault();
  limpiarErrores();
  var form = e.currentTarget;
  var hasErrors = false;

  // A) Administrar Sala
  if (form.querySelector("#sala") && form.querySelector("#fecha") && form.querySelector("#hora") && !form.querySelector("#fila")) {
    hasErrors = validarAdministrarSala(form);
    if (hasErrors) return;
    form.submit();
    return;
  }

  // B) Borrar Sala
  if (form.querySelector("#sala-borrar")) {
    hasErrors = validarBorrarSala(form);
    if (hasErrors) return;
    form.submit();
    return;
  }

  // C) Administrar Butacas
  if (form.querySelector("#fila") && form.querySelector("#numero") && form.querySelector("#fecha-butaca") && form.querySelector("#hora-butaca")) {
    hasErrors = validarAdministrarButacas(form);
    if (hasErrors) return;
    form.submit();
    return;
  }

  form.submit();
}

function cargarEventos() {
  var forms = document.querySelectorAll(".formulario form");
  if (!forms.length) return;

  for (var i = 0; i < forms.length; i++) {
    forms[i].addEventListener("submit", validarButAdmin);
  }
}

cargarEventos();