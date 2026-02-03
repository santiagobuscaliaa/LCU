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

function validarRegistro(e) {
    e.preventDefault(); 
    limpiarErrores();

    var hasErrors = false;

    var nombres   = document.getElementById("nombres").value
    var apellidos = document.getElementById("apellidos").value
    var fecha     = document.getElementById("fecha").value
    var email     = document.getElementById("email").value
    var pass      = document.getElementById("cont").value
    var pass2     = document.getElementById("cont2").value
    var tel       = document.getElementById("telefono").value
    
    if (nombres.length < 2) {
      setError("error-nombres", "El nombre es obligatorio.");
      hasErrors = true;
    } else {
      setError("error-nombres", "");
    }

    if (apellidos.length < 2) {
      setError("error-apellidos", "El apellido es obligatorio.");
      hasErrors = true;
    } else {
      setError("error-apellidos", "");
    }

    if (!fecha) {
      setError("error-fecha", "La fecha de nacimiento es obligatoria.");
      hasErrors = true;
    } else {
      setError("error-fecha", "");
    }

    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
      setError("error-email", "Correo electrónico inválido.");
      hasErrors = true;
    } else {
      setError("error-email", "");
    }

    var passRegla = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/;
    if (!passRegla.test(pass)) {
      setError("error-cont", "Mín. 8 caracteres: una mayúscula, una minúscula y un número.");
      hasErrors = true;
    } else {
      setError("error-cont", "");
    }

    if (pass !== pass2) {
      setError("error-cont2", "Las contraseñas no coinciden.");
      hasErrors = true;
    } else {
      setError("error-cont2", "");
    }

    var telRegex = /^[0-9]{7,15}$/;
    if (!telRegex.test(tel)) {
      setError("error-telefono", "Entre 7 y 15 números.");
      hasErrors = true;
    } else {
      setError("error-telefono", "");
    }

    if (hasErrors) return;

    var mensaje = document.getElementById("mensaje-exito");
    mensaje.textContent = "Registro exitoso!";
    mensaje.classList.add("mostrar");

    setTimeout(function () {
      mensaje.classList.remove("mostrar");
    }, 3000);

   setTimeout(function () {
    document.getElementById("formRegist").submit();
  }, 1500);
}

function cargarEventos() {
  document.getElementById("formRegist").addEventListener("submit", validarRegistro);
}

cargarEventos();