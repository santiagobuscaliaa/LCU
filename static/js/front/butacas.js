// intTotal viene del template (inyectado en línea 67 de butacas.html)
var seleccionadas = [];

function manejarClicButaca(e) {
  var boton = e.currentTarget;  
  var asiento = boton.id;       

  var indice = seleccionadas.indexOf(asiento);

  if (indice !== -1) {
    // Deseleccionar
    seleccionadas.splice(indice, 1);
    boton.classList.remove("seleccionado");
  } else {
    // Seleccionar
    if (seleccionadas.length >= intTotal) {
      alert("Solo puede seleccionar " + intTotal + " butacas.");
      return;
    }
    seleccionadas.push(asiento);
    boton.classList.add("seleccionado");
  }
  
  // Actualizar contador visual (opcional)
  actualizarContador();
}

function actualizarContador() {
  var contador = document.getElementById("contador-butacas");
  if (contador) {
    contador.textContent = "Seleccionadas: " + seleccionadas.length + "/" + intTotal;
  }
}

function validarContinuar(e) {
  e.preventDefault(); // Siempre prevenir el click directo del enlace
  
  if (seleccionadas.length < intTotal) {
    alert("Debe seleccionar exactamente " + intTotal + " butaca(s). Ha seleccionado " + seleccionadas.length + ".");
    return false;
  } else if (seleccionadas.length > intTotal) {
    alert("Ha seleccionado más butacas de las permitidas (" + seleccionadas.length + "/" + intTotal + ").");
    return false;
  }
  
  // Si seleccionó exactamente la cantidad correcta
  // Guardar en el input oculto
  var inputButacas = document.getElementById("butacasInput");
  if (inputButacas) {
    inputButacas.value = seleccionadas.join(",");
  }
  
  // Enviar el formulario
  var form = document.getElementById("formButacas");
  if (form) {
    form.submit();
  }
}

function cargarEventos() {
  // Event listeners para todas las butacas
  var botones = document.querySelectorAll(".box button:not(.ocupada)");
  for (var i = 0; i < botones.length; i++) {
    botones[i].addEventListener("click", manejarClicButaca);
  }

  // Event listener para el botón continuar
  var botonContinuar = document.querySelector(".boton");
  if (botonContinuar) {
    botonContinuar.addEventListener("click", validarContinuar);
  }
}

cargarEventos();