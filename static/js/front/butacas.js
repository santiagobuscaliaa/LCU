var intTotal = 3;
var seleccionadas = [];

function manejarClicButaca(e) {
  var boton = e.currentTarget;  
  var asiento = boton.id;       

  var indice = seleccionadas.indexOf(asiento);

  if (indice !== -1) {
    seleccionadas.splice(indice, 1);
    boton.classList.remove("seleccionado");
  } else {
    if (seleccionadas.length >= intTotal) {
      alert("Solo puede seleccionar " + intTotal + " butacas.");
      return;
    }
    seleccionadas.push(asiento);
    boton.classList.add("seleccionado");
  }
}

function validarContinuar(e) {
  if (seleccionadas.length < intTotal) {
    e.preventDefault();
    alert("Debe seleccionar " + intTotal + " butacas.");
  } else if (seleccionadas.length > intTotal) {
    e.preventDefault();
    alert("Ha seleccionado más butacas de las permitidas.");
  }
}

function cargarEventos() {
  var botones = document.querySelectorAll(".box button");
  var botonContinuar = document.querySelector(".boton");

  for (var i = 0; i < botones.length; i++) {
    botones[i].addEventListener("click", manejarClicButaca);
  }

  if (botonContinuar) {
    botonContinuar.addEventListener("click", validarContinuar);
  }
}

cargarEventos();