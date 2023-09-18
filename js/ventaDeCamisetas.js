window.onload = inicio;
var reyes = [
  "atanagildo",
  "ataulfo",
  "ervigio",
  "leogivildo",
  "recesvinto",
  "sisebuto",
  "teodorico",
];
var camisetas = ["camisetaNegra.png", "camisetaBlanca.png", "img3.png", "roja.webp"];
var camisetaActual = 0;
var reyActual = Math.floor(Math.random() * reyes.length);
var size = 2;

function inicio() {
  // Eventos y acciones iniciales
  // Generar un número aleatorio para seleccionar una camiseta al azar
  camisetaActual = Math.floor(Math.random() * camisetas.length);

  // Cargar la camiseta inicial
  document
    .querySelector(".camiseta")
    .insertAdjacentHTML(
      "beforeend",
      `<img id="dibujo" src="img/${camisetas[camisetaActual]}">`
    );

  // Cargar el rey inicial
  document.querySelector(
    ".imagen"
  ).innerHTML = `<img id="rey" src="img/rey_${reyes[reyActual]}.png">`;

  // Eventos
  window.onkeydown = teclado;
  document.querySelector("#dibujo").onclick = cambiarCamiseta;
  document.querySelector("#rey").onclick = cambiarRey;
  document.querySelector("#imprimir").onclick = imprimir;
  actualizarRey();
}

function teclado(e) {
  let longitud = document.querySelector(".texto").innerHTML.length;
  let excepciones = [
    "Delete",
    "Backspace",
    "ArrowUp",
    "ArrowDown",
    "ArrowRight",
    "ArrowLeft",
    "+",
    "-",
  ];

  if (longitud > 15 && excepciones.indexOf(e.key) == -1) {
    e.preventDefault();
  } else {
    let codigo = e.key;

    if (codigo == "+") {
      if (size < 3) {
        size += 0.1;
      }
      e.preventDefault();
    }
    if (codigo == "-") {
      if (size > 1) {
        size -= 0.1;
      }
      e.preventDefault();
    }
    document.querySelector(".texto").style.fontSize = size + "em";
  }
}

function actualizarRey() {
  let reyConMayusculas =
    reyes[reyActual].substr(0, 1).toUpperCase() +
    reyes[reyActual].substr(1).toLowerCase();
  let inicios = document.querySelector(".texto").innerHTML.substr(0, 3);
  if (inicios == "I ♡" || inicios == "") {
    document.querySelector(".texto").innerHTML = `I ♡ ${reyConMayusculas}`;
  }
}

function cambiarRey() {
  reyActual++;
  if (reyActual >= reyes.length) {
    reyActual = 0;
  }
  document.querySelector("#rey").src = `img/rey_${reyes[reyActual]}.png`;
  actualizarRey();
}

function cambiarCamiseta() {
  camisetaActual++;
  if (camisetaActual >= camisetas.length) {
    camisetaActual = 0;
  }

  document.querySelector("#dibujo").src = `img/${camisetas[camisetaActual]}`;
  document.querySelector(".texto").style.color = colores[camisetaActual];
}

function imprimir() {
  window.print();
}
