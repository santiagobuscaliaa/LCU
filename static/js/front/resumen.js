function redirigirCartelera() {
  window.location.href = "cartelera.html";
}

function confirmarCompra() {
  var mensaje = document.getElementById("mensaje-exito");
  mensaje.textContent = "¡Compra realizada con éxito!";
  mensaje.classList.add("mostrar");

  setTimeout(redirigirCartelera, 1500);
}

function cargarEventos() {
  var btn = document.getElementById("comprarBtn");
  var mensaje = document.getElementById("mensaje-exito");
  if (!btn || !mensaje) return;

  btn.addEventListener("click", confirmarCompra);
}

cargarEventos();