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
}

function limpiarErrores() {
  var errores = document.querySelectorAll(".error");
  for (var i = 0; i < errores.length; i++) {
    errores[i].textContent = "";
    errores[i].classList.remove("mostrar");
  }
}

function actualizarHorarios() {
  var diaSelect = document.getElementById("dia");
  var formatoSelect = document.getElementById("formato");
  var horaSelect = document.getElementById("hora");
  
  var diaSeleccionado = diaSelect.value;
  var formatoSeleccionado = formatoSelect.value;
  
  // Limpiar opciones anteriores
  horaSelect.innerHTML = '<option value="" selected disabled>Seleccione</option>';
  
  // Si no hay día O formato seleccionado, no mostrar horarios
  if (!diaSeleccionado || !formatoSeleccionado) {
    horaSelect.innerHTML = '<option value="" disabled>Seleccione día y formato primero</option>';
    return;
  }
  
  // Filtrar funciones que coincidan con día Y formato
  var funcionesFiltradas = funcionesDisponibles.filter(function(f) {
    return f.dia === diaSeleccionado && f.formato === formatoSeleccionado;
  });
  
  // Si no hay funciones para esa combinación
  if (funcionesFiltradas.length === 0) {
    horaSelect.innerHTML = '<option value="" disabled>No hay horarios disponibles para esta combinación</option>';
    return;
  }
  
  // Extraer horarios únicos (por si hay duplicados)
  var horariosUnicos = [];
  var horariosSet = {};
  
  for (var i = 0; i < funcionesFiltradas.length; i++) {
    var horario = funcionesFiltradas[i].horario;
    if (!horariosSet[horario]) {
      horariosSet[horario] = true;
      horariosUnicos.push(horario);
    }
  }
  
  // Ordenar horarios
  horariosUnicos.sort();
  
  // Agregar opciones al select
  for (var i = 0; i < horariosUnicos.length; i++) {
    var option = document.createElement("option");
    option.value = horariosUnicos[i];
    option.textContent = horariosUnicos[i];
    horaSelect.appendChild(option);
  }
}

function validarDyH(e) {
  limpiarErrores();
  var hasErrors = false;

  var dia = document.getElementById("dia");
  var formato = document.getElementById("formato");
  var hora = document.getElementById("hora");
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
    e.preventDefault();
  }
}

function cargarEventos() {
  var formDyh = document.getElementById("formDyh");
  var diaSelect = document.getElementById("dia");
  var formatoSelect = document.getElementById("formato");
  
  if (formDyh) {
    formDyh.addEventListener("submit", validarDyH);
  }
  
  // Cuando cambia el día → actualizar horarios
  if (diaSelect) {
    diaSelect.addEventListener("change", actualizarHorarios);
  }
  
  // Cuando cambia el formato → actualizar horarios
  if (formatoSelect) {
    formatoSelect.addEventListener("change", actualizarHorarios);
  }
}

cargarEventos();