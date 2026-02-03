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

  e.preventDefault(); // 🚫 Frena el envío SIEMPRE hasta validar

  limpiarErrores();
  var hasErrors = false;

  var email = document.getElementById("email").value
  var pass  = document.getElementById("cont").value

  var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (!emailRegex.test(email)) {
    setError("error-email", "Correo electrónico inválido.");
    hasErrors = true;
  }

  var passRegla = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/;
  if (!passRegla.test(pass)) {
    setError("error-cont", "Mín. 8 caracteres: una mayúscula, una minúscula y un número.");
    hasErrors = true;
  }

  if (hasErrors) return; // ⛔ Si hay errores, no sigue

  var mensaje = document.getElementById("mensaje-exito");
  mensaje.textContent = "¡Inicio de sesión exitoso!";
  mensaje.classList.add("mostrar");

  setTimeout(function () {
    mensaje.classList.remove("mostrar");
  }, 3000);

  // Ahora sí enviamos el formulario después del mensaje
  setTimeout(function () {
    document.getElementById("formLogin").submit();
  }, 1500);
}

function cargarEventos() {
  document.getElementById("formLogin").addEventListener("submit", validarLogin);
}

cargarEventos();
