function setError(id, msg) {
  var error = document.getElementById("error-" + id);
  if (!error) return;

  if (msg) {
    error.textContent = msg;
    error.classList.add("mostrar");
  } else {
    error.textContent = "";
    error.classList.remove("mostrar");
  }
} /*🔹 ¿Qué hace?
Muestra o borra el mensaje de error debajo de cada campo.
🔹 ¿Cómo lo hace?
Busca el <small> que tiene el mensaje de error
Ej: si id es "dia" → busca "error-dia"
Si hay mensaje (msg):
Escribe el texto dentro del <small>
Le agrega la clase "mostrar" 
Si no hay mensaje:
Borra el texto
Quita la clase "mostrar" (lo oculta)
*/

function limpiarErrores() {
  var errores = document.querySelectorAll(".error");
  for (var i = 0; i < errores.length; i++) {
    errores[i].textContent = "";
    errores[i].classList.remove("mostrar");
  }
}/*🔹 ¿Qué hace?
Borra todos los mensajes de error del formulario antes de volver a validar.
🔹 ¿Cómo lo hace?
Busca todos los elementos con clase .error (tus <small>)
Recorre uno por uno con un for
A cada uno:
Le borra el texto
Le quita la clase "mostrar" */

function validarDyH(e) {
  limpiarErrores(); // Borra errores anteriores
  var hasErrors = false;

  var dia      = document.getElementById("dia");
  var formato  = document.getElementById("formato");
  var hora     = document.getElementById("hora");
  var entradas = document.getElementById("entradas");

  if (!dia.value) {
    setError("dia", "Debe seleccionar un día.");
    hasErrors = true;
  }

  if (!formato.value) {
    setError("formato", "Debe seleccionar un formato.");
    hasErrors = true;
  }

  if (!hora.value) {
    setError("hora", "Debe seleccionar un horario.");
    hasErrors = true;
  }

  if (!entradas.value) {
    setError("entradas", "Debe seleccionar la cantidad de entradas.");
    hasErrors = true;
  }

  if (hasErrors) {
    e.preventDefault(); // Evita que el formulario se envíe
  }
}/*.value es lo que el usuario eligió
Si está vacío → muestra error con setError
Marca hasErrors = true
Si hubo errores → frena el envío
*/

function cargarEventos() {
  document.getElementById("formDyh").addEventListener("submit", validarDyH);
}

cargarEventos()
