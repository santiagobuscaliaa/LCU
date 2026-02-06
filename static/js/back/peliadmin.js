function setError(key, mensaje) {
    var el = document.getElementById("error-" + key);
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
    var errs = document.querySelectorAll(".error");
    for (var i = 0; i < errs.length; i++) {
      errs[i].textContent = "";
      errs[i].classList.remove("mostrar");
    }
  }

  function urlValida(u) {
    if (!u) return false;
    try {
      var x = new URL(u);
      return x.protocol === "http:" || x.protocol === "https:";
    } catch (e) {
      return false;
    }
  }

  function validarPelicula(e) {
    e.preventDefault();
    limpiarErrores();

    var hasErrors = false;


    var title   = document.getElementById("title").value
    var sinop   = document.getElementById("Sinopsis").value 
    var dur     = document.getElementById("duracion").value
    var genre   = document.getElementById("genre").value 
    var clasif  = document.getElementById("clasificacion").value 
    var imdb    = document.getElementById("IMDb").value 
    var rotten  = document.getElementById("rotten").value 
    var trailer = document.getElementById("trailer").value 
    var imageEl = document.getElementById("image");
    var image   = (imageEl && imageEl.files && imageEl.files[0]) ? imageEl.files[0] : null;


    if (title.length < 2) {
      setError("title", "Ingrese un título válido (mín. 2 caracteres).");
      hasErrors = true;
    } else {
      setError("title", "");
    }

    if (sinop.length < 10) {
      setError("Sinopsis", "Ingrese una sinopsis (mín. 10 caracteres).");
      hasErrors = true;
    } else {
      setError("Sinopsis", "");
    }

    var reDur = /^(\d+h\s?\d{1,2}min|\d{1,3}\s?min)$/i;
    if (!reDur.test(dur)) {
      setError("duracion", "Formato inválido. Ej: 2h 15min o 120 min.");
      hasErrors = true;
    } else {
      setError("duracion", "");
    }

    if (!genre) {
      setError("genre", "Seleccione un género.");
      hasErrors = true;
    } else {
      setError("genre", "");
    }

    if (!clasif) {
      setError("clasificacion", "Seleccione una clasificación.");
      hasErrors = true;
    } else {
      setError("clasificacion", "");
    }

    if (!image) {
      setError("image", "Debe seleccionar un póster (imagen).");
      hasErrors = true;
    } else if (!image.type || image.type.indexOf("image/") !== 0) {
      setError("image", "El archivo debe ser una imagen.");
      hasErrors = true;
    } else {
      setError("image", "");
    }

    if (!imdb) {
      setError("IMDb", "Debe ingresar un enlace de IMDb.");
      hasErrors = true;
    } else if (!urlValida(imdb)) {
      setError("IMDb", "URL inválida (debe empezar con http o https).");
      hasErrors = true;
    } else {
      setError("IMDb", "");
    }

    if (!rotten) {
      setError("rotten", "Debe ingresar un enlace de Rotten Tomatoes.");
      hasErrors = true;
    } else if (!urlValida(rotten)) {
      setError("rotten", "URL inválida (debe empezar con http o https).");
      hasErrors = true;
    } else {
      setError("rotten", "");
    }

    if (!trailer) {
      setError("trailer", "Debe ingresar un enlace al tráiler.");
      hasErrors = true;
    } else if (!urlValida(trailer)) {
      setError("trailer", "URL inválida (debe empezar con http o https).");
      hasErrors = true;
    } else {
      setError("trailer", "");
    }

    if (hasErrors) return;

    
    
  }


function cargarEventos() {
  document.getElementById("addMovieForm").addEventListener("submit",  validarPelicula);
}

cargarEventos()
