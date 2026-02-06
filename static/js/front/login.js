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

function validarLogin(e) {
  e.preventDefault(); // Prevenir envío para validar primero
  
  limpiarErrores();
  var hasErrors = false;

  var email = document.getElementById("email").value.trim();
  var pass  = document.getElementById("cont").value;

  // Validar email
  if (!email) {
    setError("error-email", "Debe ingresar un correo electrónico.");
    hasErrors = true;
  } else {
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
      setError("error-email", "Correo electrónico inválido.");
      hasErrors = true;
    }
  }

  // Validar contraseña
  if (!pass) {
    setError("error-cont", "Debe ingresar una contraseña.");
    hasErrors = true;
  } else if (pass.length < 3) {
    setError("error-cont", "La contraseña es demasiado corta.");
    hasErrors = true;
  }

  // Si hay errores, NO enviar el formulario
  if (hasErrors) {
    return false;
  }

  // Si no hay errores, enviar el formulario al servidor
  document.getElementById("formLogin").submit();
  return true;
}

function cargarEventos() {
  var form = document.getElementById("formLogin");
  if (form) {
    form.addEventListener("submit", validarLogin);
  }
}

// Cargar eventos cuando el DOM esté listo
if (document.readyState === "loading") {
  document.addEventListener("DOMContentLoaded", cargarEventos);
} else {
  cargarEventos();
}