// ============================================================================
// LABORATORIO ÚNICO FERIA GAMER 2026 · ENTREGA #2 · NRC 4511
// DETECTIVE: FALSE ID  ·  Temática 4: Detective de Perfiles Falsos
// Prof. Rocío Ramos Rodríguez · Algoritmia y Programación I · Uninorte
//
// EQUIPO (roles de la Entrega 2)
//   Valeria Beltrán Urquijo ........... Gerente del proyecto (casos días 1-4, contenido, consejos)
//   Camilo Bolaño De La Hoz ........... Diseñador y desarrollador (arte, menú, historieta,
//                                        cómo jugar, créditos, registro, consola, contenidos y expediente)
//   Juan Francisco Camacho Posso ...... Desarrollador líder (fechas y horas, validaciones,
//                                        veredicto, resumen, reporte, finales, ranking, sonido e integración)
//   Tomás López Possauner ............. Desarrollador (puntajes, niveles, logros, reporte, casos días 5-7)
//
// BONUS DIAMANTE: Processing con imágenes (carpeta data), sonidos (música, clic,
// teclas, acierto, regular, error y logro) y animaciones (arranque del monitor,
// historieta, deslizamientos, lupa, sellos y barras).
// Necesita la librería Sound: Sketch > Importar biblioteca > Gestionar bibliotecas > "Sound".
//
// REGLAS QUE CUMPLE TODO EL ARCHIVO (guía, monitores y respuestas de la profe):
//  - Solo los métodos que trae Processing: setup, draw, mousePressed y keyPressed.
//  - Sin condicionales encadenados en una línea: se usa if anidado o switch.
//  - Sin asignaciones abreviadas: siempre x = x + 1.
//  - Sin variables lógicas (se usan int con 1 = sí y 0 = no) y sin arreglos.
//  - Sin funciones de texto (ninguna que mida, recorte, compare o formatee textos):
//    los textos se arman con concatenación y los números se escriben cifra por cifra.
//
// MAPA DE CICLOS
//  Para        · barra de progreso de 10 bloques y calendario de 7 días (HUD)
//  Para        · 7 tarjetas de contenido del celular
//  Para        · 3 botones de decisión A, B y C · aros de la lupa sobre las 4 pistas
//  Para (P5)   · avanza la fecha un día por cada día de juego (meses y bisiestos)
//  Para (P3)   · recorre los 7 días: día con más horas y día con más riesgo
//  Para (P6)   · gráfico de 7 barras de horas en el informe final
//  Para        · 3 puestos del ranking · 5 logros del resumen · líneas del monitor
//  Mientras (M1)    · mientras sobre un día completo de minutos, la salida pasa al
//                     día siguiente (hora militar y fecha de salida)
//  Mientras (M2)    · convierte las horas acumuladas en días completos y horas
//  Hacer hasta (H1) · consejo del día al azar, distinto al del día anterior
//  Hacer hasta (H2) · día 7: el perfil real cae en una posición distinta a la
//                     de la partida anterior
//
// CONTADORES: diaActual, diasJugados, decisionDia, totalElegidos, decisionesCorrectas,
//   decisionesIncorrectas, racha, diasHorarioSaludable, diasUsoModerado,
//   decisionesPrivacidadSeguras, pistasHalladas, pistasDia, pistasEncontradas,
//   logrosObtenidos, partidasJugadas, lenNombre, letrasReales y las cifras de cada campo
// ACUMULADORES: puntosRiesgo, puntajeDia, puntosDecisiones, horasAcumuladas
//
// MAPA DE PANTALLAS
//   1 Menú · 16 Historieta · 2 Cómo jugar · 3 Créditos · 4 Ranking
//   5 Registro · 6 Consola de sesión del día · 7 Contenido consumido
//   8 Expediente (lupa y decisión) · 9 Veredicto · 10 Resumen del día
//   11 Informe final · 12 Final de la historia
// ============================================================================

import processing.sound.*;

// ============================================================================
// 1. VARIABLES GLOBALES
// ============================================================================

// === Navegación ===
int pantalla = 1;          // pantalla actual (mapa arriba)
int pantallaAnterior = 0;  // para saber cuándo se entra a una pantalla nueva
int opcionHover = 0;       // menú: 0 ninguna, 1 nueva partida, 2 cómo jugar, 3 ranking, 4 créditos, 5 salir
int pistasAbiertas = 0;    // cómo jugar: 0 monitor esperando clic, 1 manual abierto
int zonaHover = 0;
int botonSobre = 0;        // botón con el mouse encima en las pantallas 4, 9, 10, 11 y 12
int frameInicioEscena = 0; // frame en que empezó la escena actual

// === Sonido (Bonus Diamante) ===
SoundFile musica;          // música de fondo en bucle
SoundFile sonidoClic;      // clic del mouse
SoundFile sonidoTecla;     // tecla en los campos de texto
SoundFile sonidoAcierto;   // veredicto: decisión segura
SoundFile sonidoRegular;   // veredicto: decisión regular
SoundFile sonidoError;     // veredicto riesgoso o dato inválido
SoundFile sonidoLogro;     // logro desbloqueado
int sonidoActivo = 1;      // 1 con sonido, 0 en silencio (tecla M)
float volumenMusica = 0.35;

// === Imágenes de Camilo ===
PImage fondo;              // FondoMenu.jpg
PImage Titulo;             // Titulo.png
PImage imgVineta1;         // Historia00.png
PImage imgVineta2;         // Historia01.png
PImage imgVineta3;         // Historia03.png
PImage imgVineta4;         // Historia02.png
PImage imgVineta5;         // Historia04.png
PImage CuadroDialogo;      // CuadroDialogo.png
PImage imgJugar1;          // laptop apagada
PImage imgJugar2;          // encendiendo
PImage imgJugar3;          // cargando datos
PImage imgJugar4;          // pantalla encendida con [REGLAS y PISTAS]
PImage icono1;             // auditoría
PImage icono2;             // fechas y creación
PImage icono3;             // análisis de perfil
PImage icono4;             // confidencialidad
PImage icono5;             // información confidencial
PImage Creditos;
PImage imgFondoRegistro;   // Expediente.jpg (sobre de la Fiscalía)
PImage imgConsolaSesion;   // ConsolaSesion.jpg (monitor forense)
PImage imgContenidos;      // Contenidos.jpg (escritorio con celular y libreta)
PImage imgCasos;           // Casos.jpg (celular centrado y libreta)
PImage imgFondoInforme;    // FondoVineta.jpg (papel del informe final)
PImage imgFinalBueno;      // Historia2.jpg (rueda de prensa)
PImage imgFinalRegular;    // Historia3.jpg (estudiante con el celular)
PImage imgFinalMalo;       // Historia1.jpg (noticia en la televisión)
PImage imgFinalIdentidad;  // Historia0.jpg (escena de la policía)
PImage imgRanking;         // Historia4.jpg (detective en la laptop)
PImage icont1;             // educativo
PImage icont2;             // noticias oficiales
PImage icont3;             // entretenimiento
PImage icont4;             // creadores
PImage icont5;             // perfiles anónimos
PImage icont6;             // catfish y engaños
PImage icont7;             // mensajes violentos

// === Tarjetas de perfil (una por perfil: días 1 a 6 y los 3 perfiles del día 7) ===
PImage imgPerfil1;         // @valen.tina_2009x (Camilo)
PImage imgPerfil2;         // @NoticiasYa_24h
PImage imgPerfil3;         // @Sorteos.Oficial.Col
PImage imgPerfil4;         // @JuanPaGamer.oficial_
PImage imgPerfil5;         // @Soporte_Seguridad_IG
PImage imgPerfil6;         // @la.verdad.de.todos
PImage imgPerfil7;         // @laura.gomez (la real)
PImage imgPerfil8;         // @laura.gomez_ (falso 1)
PImage imgPerfil9;         // @lau.gomez.oficial (falso 2)
PImage imgPerfilActual;    // la tarjeta que se muestra en el expediente

// === Íconos de las opciones A, B y C ===
PImage imgResp1;           // R1.png (día 1, Camilo)
PImage imgResp2;           // R2.png
PImage imgResp3;           // R3.png
PImage opVerificar;
PImage opCompartir;
PImage opMeGusta;
PImage opDatos;
PImage opPrivado;
PImage opPreguntar;
PImage opQuedarse;
PImage opLive;
PImage opDormir;
PImage opReportar;
PImage opProteger;
PImage opClave;
PImage opInsultar;
PImage opIgnorar;
PImage opSeguir;
PImage opHablar;
PImage imgOpA;             // ícono de la opción A del caso actual
PImage imgOpB;
PImage imgOpC;

// === Fuentes ===
PFont fuenteOpciones;      // Titulo.ttf
PFont fuenteVinetas;       // Escritura.ttf
PFont fuenteNitida;        // CourierPrime.ttf (letra pequeña del celular, se ve más nítida)

// === Registro (pantalla 5) ===
int campoActivoP5 = 1;     // 1 nombre, 2 edad, 3 día, 4 mes, 5 año
String regNombre = "";
String regEdadTexto = "";
String regDiaTexto = "";
String regMesTexto = "";
String regAnioTexto = "";
int lenNombre = 0;         // contador de caracteres del nombre (contador manual)
int letrasReales = 0;      // contador de letras sin contar espacios
int ultimoEspacio = 0;     // 1 si lo último escrito fue un espacio
int lenEdad = 0;
int lenDia = 0;
int lenMes = 0;
int lenAnio = 0;
int regEdad = 0;
int regDia = 0;
int regMes = 0;
int regAnio = 0;
int datosOkP5 = 0;         // 1 si todo el registro es válido
String mensajeP5 = "";
int avisoP5 = -1000;       // frame en que se intentó seguir con datos inválidos

// === Fecha y hora del día (Jufra) ===
int diaSemanaInicio = 1;   // 1 lunes ... 7 domingo (congruencia de Zeller)
int sesDia = 1;            // fecha del día de juego actual
int sesMes = 1;
int sesAnio = 2026;
int diaSemana = 1;
String textoDiaSemana = "";
String textoFecha = "";
int bisiesto = 0;          // 1 si el año es bisiesto
int diasMes = 31;          // días del mes que se revisa

// === Consola de sesión (pantalla 6) ===
int diaActual = 1;               // contador de la semana: día 1 a 7
int diasJugados = 0;             // contador de días terminados
int puntosRiesgo = 0;            // ACUMULADOR del puntaje digital (menos es mejor)
int campoActivoP6 = 4;           // 4 hora, 5 minuto, 6 AM/PM, 7 horas de uso
int desbloqueandoCelular = 0;    // 1 mientras se ve la animación de desbloqueo
int frameDesbloqueo = 0;
String sesHoraTexto = "";
String sesMinutoTexto = "";
String sesHorasUsoTexto = "";
int lenSesHora = 0;
int lenSesMinuto = 0;
int lenSesHorasUso = 0;
int regFranjaNum = 0;            // 0 sin elegir, 1 AM, 2 PM
int regHora12 = 0;
int regMinuto = 0;
int regHorasUso = 0;
int sesHora24Ingreso = 0;
int inicioMin = 0;               // minuto del día en que empieza la sesión
int salidaMin = 0;               // minuto del día en que termina (sin el segundo extra)
int minutosTotales = 0;          // para el ciclo M1
int sesHoraSal = 0;
int sesMinutoSal = 0;
int sesDiaSal = 1;
int sesMesSal = 1;
int sesAnioSal = 2026;
int diaSemanaSal = 1;
int sesCruzaMedianoche = 0;      // 1 si la sesión termina al día siguiente
String sesHoraSalidaTexto = "__:__:__";
String textoSalida12 = "";       // la misma salida en formato de 12 horas
String textoFechaSalida = "";
String textoDiaSemanaSal = "";
String textoIngreso = "";
int cruzaAnterior = 0;           // 1 si la sesión de ayer terminó después de medianoche
int salidaMinAnterior = 0;
String textoSalidaAnterior = "";
int datosOkP6 = 0;               // 1 si la sesión es válida
String mensajeP6 = "";
int avisoP6 = -1000;
int puntosTiempo = 0;            // +4 (más de 3 y menos de 8 h) o +7 (8 h o más)
int puntosHorario = 0;           // +4 si empieza o termina fuera de 8:00 a.m. - 8:00 p.m.
String textoIngresoD1 = "";      // para el informe: ingreso del día 1
String textoFechaIngresoD1 = "";
String textoSalidaFinal = "";    // para el informe: salida del último día
String textoFechaSalidaFinal = "";

// === Contenido consumido (pantalla 7) ===
int selCat1 = 0;
int selCat2 = 0;
int selCat3 = 0;
int selCat4 = 0;
int selCat5 = 0;
int selCat6 = 0;
int selCat7 = 0;
int totalElegidos = 0;           // contador: 0, 1 o 2
int casoElegido1 = 0;
int casoElegido2 = 0;
int alertaMaxContenidos = 0;
int puntosContenido = 0;
String nombreContenido1 = "";
String nombreContenido2 = "";

// === Expediente (pantalla 8) ===
int frameSonar = 0;
int pistaVista1 = 0;             // 1 si ya se encontró esa pista con la lupa
int pistaVista2 = 0;
int pistaVista3 = 0;
int pistaVista4 = 0;
int pistasHalladas = 0;          // contador de pistas del perfil actual
int pistasMinimas = 2;           // 2 en los niveles 1 y 2, 3 en el nivel 3
int avisoSinPistas = -1000;
String tituloCaso8 = "";
String situacionCaso8 = "";
String txtPista1 = "";
String txtPista2 = "";
String txtPista3 = "";
String txtPista4 = "";
String opATexto8 = "";
String opBTexto8 = "";
String opCTexto8 = "";
String opAEtiq = "";             // texto corto debajo del ícono
String opBEtiq = "";
String opCEtiq = "";
int opATipo8 = 0;                // 0 segura, 1 regular, 2 riesgosa
int opBTipo8 = 1;
int opCTipo8 = 2;
String retroA = "";              // lo que pasó con cada opción (veredicto)
String retroB = "";
String retroC = "";

// === Semana, niveles y decisiones (Tomás) ===
int nivel = 1;                   // 1 Principiante, 2 Usuario frecuente, 3 Experto digital
String nombreNivel = "PRINCIPIANTE DIGITAL";
int decisionDia = 1;             // decisión actual del día (el día 7 tiene 3)
int decisionesDelDia = 1;
int opcionElegida = 0;           // 1 A, 2 B, 3 C
int tipoOpcion = 0;              // tipo de la opción elegida
String textoOpcionElegida = "";
String retroElegida = "";
int puntosDecision = 0;
int puntosDecisiones = 0;        // ACUMULADOR de las decisiones del día
int puntajeDia = 0;
int identidadRobada = 0;         // 1 si entregó la contraseña (día 5)
int tipoFinal = 0;               // 1 bueno, 2 regular, 3 malo, 4 identidad robada
int posicionReal = 1;            // día 7: posición del perfil real (1 a 3)
int posicionAnterior = 0;
int esReal = 0;                  // día 7: 1 si el perfil que se muestra es el real
int falsoActual = 0;             // día 7: cuál perfil falso se muestra

// === Contadores y acumuladores (Tomás) ===
int decisionesCorrectas = 0;
int decisionesIncorrectas = 0;
int racha = 0;
int rachaMaxima = 0;
int diasHorarioSaludable = 0;
int diasUsoModerado = 0;
int decisionesPrivacidadSeguras = 0;
int pistasDia = 0;
int pistasEncontradas = 0;
int partidasJugadas = 0;
int horasAcumuladas = 0;

// === Logros: 0 bloqueado, 1 ganado (Tomás) ===
int logroFakeNews = 0;           // Detective de Fake News
int logroPrivacidad = 0;         // Guardián de la Privacidad
int logroTiempo = 0;             // Rey del Tiempo
int logroBienestar = 0;          // Experto en Bienestar Digital
int logroOjoHalcon = 0;          // Ojo de Halcón
int logrosObtenidos = 0;
int logroNuevo = 0;              // 1 si hoy se ganó un logro
int logrosHoy = 0;
String textoLogroNuevo = "";
int logroEnVeredicto = 0;        // 1 si Ojo de Halcón se ganó en esta decisión

// === Por día, para el informe ===
int horasD1 = 0;
int horasD2 = 0;
int horasD3 = 0;
int horasD4 = 0;
int horasD5 = 0;
int horasD6 = 0;
int horasD7 = 0;
int puntajeD1 = 0;
int puntajeD2 = 0;
int puntajeD3 = 0;
int puntajeD4 = 0;
int puntajeD5 = 0;
int puntajeD6 = 0;
int puntajeD7 = 0;
String clasificacionDia = "";

// === Informe final (Tomás calcula, Jufra dibuja) ===
float promedioDiario = 0;
float diasEquivalentes = 0;
String textoPromedio = "0,0";
String textoDiasEquivalentes = "0,0";
int diasCompletos = 0;
int horasSobrantes = 0;
int diaMasHoras = 1;
int diaMasPuntaje = 1;
String clasificacionTexto = "";
String diagnosticoTexto = "";

// === Ranking personal de la sesión (3 mejores promedios; menor = mejor) ===
String rankNombre1 = "";
String rankNombre2 = "";
String rankNombre3 = "";
int rankValor1 = -1;             // promedio x 10 como entero (4,5 = 45); -1 = vacío
int rankValor2 = -1;
int rankValor3 = -1;
String rankClas1 = "";
String rankClas2 = "";
String rankClas3 = "";

// === Consejo del día (Valeria) ===
int consejo = 0;
int consejoAnterior = 0;
String textoConsejo = "";

// ============================================================================
// 2. SETUP · se ejecuta una sola vez al abrir el juego
// ============================================================================
void setup() {
  size(1280, 720);           // resolución HD
  smooth(4);
  frameRate(60);

  // Imágenes de Camilo (ya vienen con el tamaño en que se dibujan, para que
  // el juego cargue rápido y no se ponga lento)
  fondo = loadImage("FondoMenu.jpg");
  Titulo = loadImage("Titulo.png");
  imgVineta1 = loadImage("Historia00.png");
  imgVineta2 = loadImage("Historia01.png");
  imgVineta3 = loadImage("Historia03.png");
  imgVineta4 = loadImage("Historia02.png");
  imgVineta5 = loadImage("Historia04.png");
  CuadroDialogo = loadImage("CuadroDialogo.png");
  imgJugar1 = loadImage("jugar1.jpg");
  imgJugar2 = loadImage("jugar2.jpg");
  imgJugar3 = loadImage("jugar3.jpg");
  imgJugar4 = loadImage("jugar4.jpg");
  icono1 = loadImage("icono1.png");
  icono2 = loadImage("icono2.png");
  icono3 = loadImage("icono3.png");
  icono4 = loadImage("icono4.png");
  icono5 = loadImage("icono5.png");
  Creditos = loadImage("Creditos.jpg");
  imgFondoRegistro = loadImage("Expediente.jpg");
  imgConsolaSesion = loadImage("ConsolaSesion.jpg");
  imgContenidos = loadImage("Contenidos.jpg");
  imgCasos = loadImage("Casos.jpg");
  imgFondoInforme = loadImage("FondoVineta.jpg");
  imgFinalBueno = loadImage("Historia2.jpg");
  imgFinalRegular = loadImage("Historia3.jpg");
  imgFinalMalo = loadImage("Historia1.jpg");
  imgFinalIdentidad = loadImage("Historia0.jpg");
  imgRanking = loadImage("Historia4.jpg");
  icont1 = loadImage("Icont1.png");
  icont2 = loadImage("Icont2.png");
  icont3 = loadImage("Icont3.png");
  icont4 = loadImage("Icont4.png");
  icont5 = loadImage("Icont5.png");
  icont6 = loadImage("Icont6.png");
  icont7 = loadImage("Icont7.png");

  // Tarjetas de perfil
  imgPerfil1 = loadImage("Perfil1.png");
  imgPerfil2 = loadImage("Perfil2.png");
  imgPerfil3 = loadImage("Perfil3.png");
  imgPerfil4 = loadImage("Perfil4.png");
  imgPerfil5 = loadImage("Perfil5.png");
  imgPerfil6 = loadImage("Perfil6.png");
  imgPerfil7 = loadImage("Perfil7.png");
  imgPerfil8 = loadImage("Perfil8.png");
  imgPerfil9 = loadImage("Perfil9.png");
  imgPerfilActual = imgPerfil1;

  // Íconos de las opciones
  imgResp1 = loadImage("R1.png");
  imgResp2 = loadImage("R2.png");
  imgResp3 = loadImage("R3.png");
  opVerificar = loadImage("op_verificar.png");
  opCompartir = loadImage("op_compartir.png");
  opMeGusta = loadImage("op_megusta.png");
  opDatos = loadImage("op_datos.png");
  opPrivado = loadImage("op_privado.png");
  opPreguntar = loadImage("op_preguntar.png");
  opQuedarse = loadImage("op_quedarse.png");
  opLive = loadImage("op_live.png");
  opDormir = loadImage("op_dormir.png");
  opReportar = loadImage("op_reportar.png");
  opProteger = loadImage("op_proteger.png");
  opClave = loadImage("op_clave.png");
  opInsultar = loadImage("op_insultar.png");
  opIgnorar = loadImage("op_ignorar.png");
  opSeguir = loadImage("op_seguir.png");
  opHablar = loadImage("op_hablar.png");
  imgOpA = imgResp1;
  imgOpB = imgResp2;
  imgOpC = imgResp3;

  // Fuentes de Camilo (vienen en la carpeta data)
  fuenteOpciones = createFont("Titulo.ttf", 48);
  fuenteVinetas = createFont("Escritura.ttf", 48);
  // A 10-12 px Titulo.ttf se ve borrosa: el texto pequeño del celular usa Courier Prime
  fuenteNitida = createFont("CourierPrime.ttf", 48);

  // Sonidos (librería Sound de Processing). La música suena en bucle.
  musica = new SoundFile(this, "musica.wav");
  sonidoClic = new SoundFile(this, "clic.wav");
  sonidoTecla = new SoundFile(this, "tecla.wav");
  sonidoAcierto = new SoundFile(this, "acierto.wav");
  sonidoRegular = new SoundFile(this, "regular.wav");
  sonidoError = new SoundFile(this, "error.wav");
  sonidoLogro = new SoundFile(this, "logro.wav");
  musica.loop();
  musica.amp(volumenMusica);
}

// ============================================================================
// 3. DRAW · dibuja una "página" nueva unas 60 veces por segundo
// ============================================================================
void draw() {

  // ==========================================================================
  // A. AL ENTRAR A UNA PANTALLA (Jufra)
  // Análisis · Entrada: pantalla, pantallaAnterior
  //   Proceso: si la pantalla cambió, reinicia el reloj de la escena y prepara
  //            los datos que esa pantalla necesita (una sola vez)
  //   Salida: frameInicioEscena y los datos de la pantalla
  // ==========================================================================
  if (pantalla != pantallaAnterior) {
    pantallaAnterior = pantalla;
    frameInicioEscena = frameCount;

    switch (pantalla) {

      // ===============================================================
      // Cómo jugar: la laptop empieza apagada
      // ===============================================================
      case 2:
        pistasAbiertas = 0;
        break;

      // ===============================================================
      // Registro: es una partida nueva, así que todo vuelve a cero
      // ===============================================================
      case 5:
        // =============================================================
        // BLOQUE T6 · REINICIO COMPLETO DEL JUEGO (Tomás)
        // Todo vuelve a cero, menos el ranking de la sesión. Sirve igual
        // para "Nueva partida" y para "Jugar de nuevo".
        // =============================================================
        diaActual = 1; diasJugados = 0; puntosRiesgo = 0; nivel = 1;
        decisionDia = 1; decisionesDelDia = 1; identidadRobada = 0; tipoFinal = 0;
        puntajeDia = 0; puntosTiempo = 0; puntosHorario = 0; puntosContenido = 0;
        puntosDecision = 0; puntosDecisiones = 0;
        decisionesCorrectas = 0; decisionesIncorrectas = 0; racha = 0; rachaMaxima = 0;
        diasHorarioSaludable = 0; diasUsoModerado = 0; decisionesPrivacidadSeguras = 0;
        pistasDia = 0; pistasEncontradas = 0; horasAcumuladas = 0;
        logroFakeNews = 0; logroPrivacidad = 0; logroTiempo = 0; logroBienestar = 0; logroOjoHalcon = 0;
        logrosObtenidos = 0; logroNuevo = 0; logrosHoy = 0; textoLogroNuevo = ""; logroEnVeredicto = 0;
        horasD1 = 0; horasD2 = 0; horasD3 = 0; horasD4 = 0; horasD5 = 0; horasD6 = 0; horasD7 = 0;
        puntajeD1 = 0; puntajeD2 = 0; puntajeD3 = 0; puntajeD4 = 0; puntajeD5 = 0; puntajeD6 = 0; puntajeD7 = 0;
        cruzaAnterior = 0; salidaMinAnterior = 0; textoSalidaAnterior = "";
        textoIngresoD1 = ""; textoFechaIngresoD1 = ""; textoSalidaFinal = ""; textoFechaSalidaFinal = "";
        clasificacionDia = ""; clasificacionTexto = ""; diagnosticoTexto = "";
        desbloqueandoCelular = 0;

        // Campos del registro: nombre y edad vacíos; la fecha de inicio se
        // propone con la fecha del computador (se puede cambiar)
        regNombre = ""; lenNombre = 0; letrasReales = 0; ultimoEspacio = 0;
        regEdadTexto = ""; lenEdad = 0; regEdad = 0;
        regDia = day(); regMes = month(); regAnio = year();
        regDiaTexto = "" + regDia;
        if (regDia < 10) { regDiaTexto = "0" + regDia; }
        regMesTexto = "" + regMes;
        if (regMes < 10) { regMesTexto = "0" + regMes; }
        regAnioTexto = "" + regAnio;
        lenDia = 2; lenMes = 2; lenAnio = 4;
        campoActivoP5 = 1;
        avisoP5 = -1000;
        break;

      // ===============================================================
      // Consola: empieza un día nuevo de la semana
      // ===============================================================
      case 6:
        // =============================================================
        // FECHA DEL DÍA (Jufra)
        // Análisis · Entrada: regDia, regMes, regAnio, diaSemanaInicio, diaActual
        //   Proceso: parte de la fecha de inicio y avanza un día por cada día
        //            de juego que ya pasó, con los días de cada mes, los años
        //            bisiestos y el cambio de año
        //   Salida: sesDia, sesMes, sesAnio, diaSemana, textoFecha, textoDiaSemana
        // =============================================================
        sesDia = regDia;
        sesMes = regMes;
        sesAnio = regAnio;
        diaSemana = diaSemanaInicio;
        // CICLO PARA (P5): se sabe cuántas vueltas da: diaActual - 1
        for (int d = 2; d <= diaActual; d = d + 1) {
          bisiesto = 0;
          if ((sesAnio % 4 == 0 && sesAnio % 100 != 0) || sesAnio % 400 == 0) { bisiesto = 1; }
          diasMes = 31;
          switch (sesMes) {
            case 4: case 6: case 9: case 11: diasMes = 30; break;
            case 2: diasMes = 28 + bisiesto; break;
          }
          sesDia = sesDia + 1;
          if (sesDia > diasMes) {
            sesDia = 1;
            sesMes = sesMes + 1;
            if (sesMes > 12) {
              sesMes = 1;
              sesAnio = sesAnio + 1;
            }
          }
          diaSemana = diaSemana % 7 + 1;        // después del domingo (7) vuelve el lunes (1)
        }
        textoFecha = "";
        if (sesDia < 10) { textoFecha = "0"; }
        textoFecha = textoFecha + sesDia + "/";
        if (sesMes < 10) { textoFecha = textoFecha + "0"; }
        textoFecha = textoFecha + sesMes + "/" + sesAnio;
        switch (diaSemana) {
          case 1: textoDiaSemana = "lunes"; break;
          case 2: textoDiaSemana = "martes"; break;
          case 3: textoDiaSemana = "miércoles"; break;
          case 4: textoDiaSemana = "jueves"; break;
          case 5: textoDiaSemana = "viernes"; break;
          case 6: textoDiaSemana = "sábado"; break;
          case 7: textoDiaSemana = "domingo"; break;
        }

        // =============================================================
        // BLOQUE T2 · NIVEL SEGÚN EL DÍA (Tomás)
        // Entrada: diaActual · Proceso: días 1-2 nivel 1, días 3-5 nivel 2,
        // días 6-7 nivel 3. En el nivel 3 hay que hallar 3 pistas y el día 7
        // tiene 3 perfiles. · Salida: nivel, nombreNivel, pistasMinimas, decisionesDelDia
        // =============================================================
        nivel = 1;
        if (diaActual >= 3) { nivel = 2; }
        if (diaActual >= 6) { nivel = 3; }
        switch (nivel) {
          case 1: nombreNivel = "PRINCIPIANTE DIGITAL"; pistasMinimas = 2; break;
          case 2: nombreNivel = "USUARIO FRECUENTE"; pistasMinimas = 2; break;
          case 3: nombreNivel = "EXPERTO DIGITAL"; pistasMinimas = 3; break;
        }
        decisionesDelDia = 1;
        if (diaActual == 7) { decisionesDelDia = 3; }
        decisionDia = 1;

        // lo que se cuenta por día vuelve a cero
        puntosTiempo = 0; puntosHorario = 0; puntosContenido = 0; puntosDecisiones = 0;
        pistasDia = 0; logroNuevo = 0; logrosHoy = 0; textoLogroNuevo = "";

        // campos de la sesión vacíos: el jugador escribe su hora cada día
        sesHoraTexto = ""; lenSesHora = 0; regHora12 = 0;
        sesMinutoTexto = ""; lenSesMinuto = 0; regMinuto = 0;
        sesHorasUsoTexto = ""; lenSesHorasUso = 0; regHorasUso = 0;
        regFranjaNum = 0;
        campoActivoP6 = 4;
        desbloqueandoCelular = 0;
        avisoP6 = -1000;

        // =============================================================
        // BLOQUE L2 · CONSEJO DEL DÍA (Valeria)
        // CICLO HACER HASTA (H1): se elige al menos una vez y se repite
        // mientras salga el mismo consejo del día anterior.
        // =============================================================
        do {
          consejo = (int) random(1, 8);          // un número del 1 al 7
        } while (consejo == consejoAnterior);
        consejoAnterior = consejo;
        switch (consejo) {
          case 1: textoConsejo = "No abras enlaces sospechosos, aunque vengan de conocidos, sin verificar la fuente."; break;
          case 2: textoConsejo = "Las plataformas oficiales NUNCA te pedirán contraseñas ni códigos por chat."; break;
          case 3: textoConsejo = "Revisa siempre la antigüedad de la cuenta y si sus seguidores son reales."; break;
          case 4: textoConsejo = "Desconfía de premios mágicos y ofertas con sueldos exagerados."; break;
          case 5: textoConsejo = "Nunca compartas tu ubicación ni guardes chats en secreto con desconocidos."; break;
          case 6: textoConsejo = "Si dudas de una cuenta, usa la lupa: revisa su nombre, sus números y sus fotos."; break;
          case 7: textoConsejo = "Reportar y bloquear a tiempo te protege a ti y a toda la comunidad."; break;
        }

        // =============================================================
        // BLOQUE T7 · DÍA 7: PERFIL REAL AL AZAR (Tomás)
        // CICLO HACER HASTA (H2): se elige la posición del perfil real y se
        // repite mientras sea la misma de la partida anterior.
        // =============================================================
        if (diaActual == 7) {
          do {
            posicionReal = (int) random(1, 4);   // 1, 2 o 3
          } while (posicionReal == posicionAnterior);
          posicionAnterior = posicionReal;
        }
        break;

      // ===============================================================
      // Expediente: se carga el perfil de la decisión actual
      // ===============================================================
      case 8:
        pistaVista1 = 0;
        pistaVista2 = 0;
        pistaVista3 = 0;
        pistaVista4 = 0;
        pistasHalladas = 0;
        avisoSinPistas = -1000;
        frameSonar = frameCount;

        // día 7: ¿el perfil de esta decisión es el real o uno falso?
        esReal = 0;
        falsoActual = 0;
        if (diaActual == 7) {
          if (decisionDia == posicionReal) {
            esReal = 1;
          } else {
            if (decisionDia < posicionReal) { falsoActual = decisionDia; } else { falsoActual = decisionDia - 1; }
          }
        }

        // =============================================================
        // BLOQUE L3 · CASOS DE LOS DÍAS 1 A 4 (Valeria) y 5 A 7 (Tomás)
        // Entrada: diaActual, esReal, falsoActual
        // Proceso: Dependiendo De el día, llena el perfil, las 4 pistas
        //          (1 nombre y bio, 2 números, 3 foto de perfil, 4 publicaciones),
        //          las opciones, su tipo y lo que pasa con cada una
        // Salida: textos del caso, tipos (0 segura, 1 regular, 2 riesgosa) e íconos
        // =============================================================
        switch (diaActual) {

          case 1:   // Nivel 1 · uso de redes
            tituloCaso8 = "La solicitud de amistad";
            imgPerfilActual = imgPerfil1;
            situacionCaso8 = "Te escribe: «¡Hola! ¿En qué colegio estudias?»";
            txtPista1 = "Cuenta creada hace 4 días.";
            txtPista2 = "Sigue a 1.843 cuentas; la siguen 12.";
            txtPista3 = "Foto usada en otras 6 cuentas.";
            txtPista4 = "3 fotos subidas el mismo día.";
            opATexto8 = "[A] Decirle tu colegio";       opATipo8 = 2; opAEtiq = "DAR COLEGIO"; imgOpA = imgResp1;
            opBTexto8 = "[B] Aceptar sin responder";    opBTipo8 = 1; opBEtiq = "ACEPTAR";     imgOpB = imgResp2;
            opCTexto8 = "[C] Rechazar y reportar";      opCTipo8 = 0; opCEtiq = "REPORTAR";    imgOpC = imgResp3;
            retroA = "Le diste a un desconocido el lugar donde puede encontrarte.";
            retroB = "No respondiste, pero ahora puede ver tus fotos y tus amigos.";
            retroC = "¡Bien hecho! 4 días y 12 seguidores: señales de perfil falso.";
            break;

          case 2:   // Nivel 1 · noticias falsas
            tituloCaso8 = "Noticias sin fuente";
            imgPerfilActual = imgPerfil2;
            situacionCaso8 = "Publica: «¡URGENTE! Mañana cancelan las clases en todo el país»";
            txtPista1 = "Cambió de nombre 5 veces este mes.";
            txtPista2 = "Publica 80 noticias al día: un bot.";
            txtPista3 = "Su logo es captura de un noticiero.";
            txtPista4 = "Ninguna noticia dice de dónde salió.";
            opATexto8 = "[A] Verificar en la web oficial";  opATipo8 = 0; opAEtiq = "VERIFICAR"; imgOpA = opVerificar;
            opBTexto8 = "[B] Compartir al grupo del salón"; opBTipo8 = 2; opBEtiq = "COMPARTIR"; imgOpB = opCompartir;
            opCTexto8 = "[C] No compartir, dar me gusta";   opCTipo8 = 1; opCEtiq = "ME GUSTA";  imgOpC = opMeGusta;
            retroA = "Exacto: la página oficial no dice nada. Era una noticia falsa.";
            retroB = "La mentira llegó a 40 personas más gracias a ti.";
            retroC = "Tu me gusta hace que la noticia parezca más creíble.";
            break;

          case 3:   // Nivel 2 · privacidad
            tituloCaso8 = "Concurso fraudulento";
            imgPerfilActual = imgPerfil3;
            situacionCaso8 = "«¡Ganaste un celular! Envía tu dirección y una foto de tu documento»";
            txtPista1 = "Dice «Oficial», pero no es verificada.";
            txtPista2 = "Sigue a 7.100 cuentas; la siguen 3.400.";
            txtPista3 = "Su foto es un anzuelo, no una marca.";
            txtPista4 = "Fotos de «ganadores» de internet.";
            opATexto8 = "[A] Enviar mis datos";          opATipo8 = 2; opAEtiq = "ENVIAR DATOS"; imgOpA = opDatos;
            opBTexto8 = "[B] Reportar y poner privado";  opBTipo8 = 0; opBEtiq = "PRIVACIDAD";   imgOpB = opPrivado;
            opCTexto8 = "[C] Pedir más información";     opCTipo8 = 1; opCEtiq = "PREGUNTAR";    imgOpC = opPreguntar;
            retroA = "Nadie regala celulares por mensaje. Ahora tienen tus datos.";
            retroB = "¡Así se protege la privacidad! Era un concurso falso.";
            retroC = "Seguir hablando les da tiempo para convencerte.";
            break;

          case 4:   // Nivel 2 · tiempo de pantalla
            tituloCaso8 = "El influencer clonado";
            imgPerfilActual = imgPerfil4;
            situacionCaso8 = "Son las 11 p. m.: «No te vayas, a medianoche sorteamos premios»";
            txtPista1 = "El nombre tiene un guion bajo de más.";
            txtPista2 = "La real tiene 2 millones; esta, 980.";
            txtPista3 = "La foto está copiada de la cuenta real.";
            txtPista4 = "2 posts: el «live 24/7» es repetido.";
            opATexto8 = "[A] Quedarme hasta el sorteo";  opATipo8 = 2; opAEtiq = "QUEDARME";  imgOpA = opQuedarse;
            opBTexto8 = "[B] Dejar el live de fondo";    opBTipo8 = 1; opBEtiq = "DE FONDO";  imgOpB = opLive;
            opCTexto8 = "[C] Cerrar y revisar mañana";   opCTipo8 = 0; opCEtiq = "DESCANSAR"; imgOpC = opDormir;
            retroA = "Era un video repetido: perdiste horas de sueño por nada.";
            retroB = "Igual te quedaste enganchado y despierto hasta tarde.";
            retroC = "¡Bien! La cuenta oficial no tenía ningún sorteo. Era un clon.";
            break;

          case 5:   // Nivel 2 · mensajes sospechosos (la contraseña)
            tituloCaso8 = "Soporte técnico falso";
            imgPerfilActual = imgPerfil5;
            situacionCaso8 = "«Envía tu contraseña o el código SMS para no bloquear tu cuenta»";
            txtPista1 = "Las redes nunca escriben por privado.";
            txtPista2 = "45 seguidores: no es un equipo oficial.";
            txtPista3 = "Ese escudo no es de ninguna red.";
            txtPista4 = "Creada hace 2 días: 0 publicaciones.";
            opATexto8 = "[A] No responder y reportar";   opATipo8 = 0; opAEtiq = "REPORTAR";     imgOpA = opProteger;
            opBTexto8 = "[B] Pedir que lo demuestren";   opBTipo8 = 1; opBEtiq = "PREGUNTAR";    imgOpB = opPreguntar;
            opCTexto8 = "[C] Enviar mi contraseña";      opCTipo8 = 2; opCEtiq = "ENVIAR CLAVE"; imgOpC = opClave;
            retroA = "Así se hace: el soporte real jamás pide contraseñas ni códigos.";
            retroB = "Mejor no seguir: te pueden engañar con una buena respuesta.";
            retroC = "Entraron a tu cuenta y les escribieron a tus amigos como si fueras tú.";
            break;

          case 6:   // Nivel 3 · bienestar digital
            tituloCaso8 = "La cuenta anónima";
            imgPerfilActual = imgPerfil6;
            situacionCaso8 = "Publicó una foto tuya editada con un comentario que te hace sentir mal.";
            txtPista1 = "Nació cuando empezaron las burlas.";
            txtPista2 = "No sigue a nadie: solo habla de otros.";
            txtPista3 = "Sin foto: nadie sabe quién la maneja.";
            txtPista4 = "Sus fotos se burlan de estudiantes.";
            opATexto8 = "[A] Responder con otro insulto";  opATipo8 = 2; opAEtiq = "RESPONDER";   imgOpA = opInsultar;
            opBTexto8 = "[B] Bloquear, reportar y contar"; opBTipo8 = 0; opBEtiq = "PEDIR AYUDA"; imgOpB = opReportar;
            opCTexto8 = "[C] Ignorar y no contarlo";       opCTipo8 = 1; opCEtiq = "IGNORAR";     imgOpC = opIgnorar;
            retroA = "Responder con odio le da a la cuenta lo que busca.";
            retroB = "Así se hace: no estás solo y reportar ayuda a que la eliminen.";
            retroC = "Ignorarlo te protege un poco, pero guardártelo pesa.";
            break;

          case 7:   // Nivel 3 · evaluación final: 3 perfiles, solo uno es real
            tituloCaso8 = "La red de perfiles";
            situacionCaso8 = "Tres cuentas dicen ser Laura, tu compañera. ¿Esta es la real?";
            opATexto8 = "[A] Es real: la sigo";           opAEtiq = "SEGUIR";    imgOpA = opSeguir;
            opBTexto8 = "[B] Preguntarle en persona";     opBEtiq = "PREGUNTAR"; imgOpB = opHablar;
            opCTexto8 = "[C] Es falsa: la reporto";       opCEtiq = "REPORTAR";  imgOpC = opReportar;
            if (esReal == 1) {
              imgPerfilActual = imgPerfil7;
              txtPista1 = "Nombre y bio coinciden con su salón.";
              txtPista2 = "Tienen 56 amigos en común contigo.";
              txtPista3 = "Tiene esa foto de perfil hace 4 años.";
              txtPista4 = "180 fotos con comentarios de tu salón.";
              opATipo8 = 0; retroA = "¡Correcto! 4 años y 56 amigos en común: es la real.";
              opBTipo8 = 1; retroB = "Preguntar nunca sobra, pero las pistas ya lo mostraban.";
              opCTipo8 = 1; retroC = "Era la cuenta real de Laura: revisa antigüedad y amigos.";
            } else {
              opATipo8 = 2; retroA = "Seguiste a un perfil falso: ahora ve todo lo que publicas.";
              opBTipo8 = 1; retroB = "Bien pensado, pero las pistas ya mostraban que era falso.";
              opCTipo8 = 0; retroC = "¡Correcto! Era un perfil falso.";
              if (falsoActual == 1) {
                imgPerfilActual = imgPerfil8;
                txtPista1 = "Guion bajo de más al final del nombre.";
                txtPista2 = "Sigue a 900 cuentas y la siguen 25.";
                txtPista3 = "Misma foto de perfil que la real.";
                txtPista4 = "Fotos copiadas; se creó hace 3 días.";
              } else {
                imgPerfilActual = imgPerfil9;
                txtPista1 = "Te pide hablar a solas por privado.";
                txtPista2 = "Sigue a 1.200 cuentas y la siguen 8.";
                txtPista3 = "La foto de perfil es de otra persona.";
                txtPista4 = "Una sola foto, sacada de internet.";
              }
            }
            break;
        }
        break;

      // ===============================================================
      // Veredicto: sonido según la decisión (Bonus Diamante)
      // ===============================================================
      case 9:
        if (sonidoActivo == 1) {
          switch (tipoOpcion) {
            case 0: sonidoAcierto.play(); break;
            case 1: sonidoRegular.play(); break;
            case 2: sonidoError.play(); break;
          }
        }
        break;

      // ===============================================================
      // Resumen del día: sonido si hoy se ganó un logro
      // ===============================================================
      case 10:
        if (sonidoActivo == 1 && logroNuevo == 1) {
          sonidoLogro.play();
        }
        break;

      // ===============================================================
      // Informe final: se calcula todo y se guarda la partida en el ranking
      // ===============================================================
      case 11:
        // =============================================================
        // BLOQUE T4 · INFORME, CLASIFICACIÓN Y FINAL (Tomás)
        // Entrada: puntosRiesgo, diasJugados, horasAcumuladas, identidadRobada
        // Proceso: promedio diario, días equivalentes por año, clasificación,
        //          diagnóstico y tipo de final
        // Salida: promedioDiario, diasEquivalentes, clasificacionTexto,
        //         diagnosticoTexto, diasCompletos, horasSobrantes, tipoFinal
        // =============================================================
        promedioDiario = 0;
        diasEquivalentes = 0;
        if (diasJugados > 0) {
          promedioDiario = (float) puntosRiesgo / diasJugados;
          // días al año que se pasarían en redes: promedio de horas × 365 / 24
          diasEquivalentes = ((float) horasAcumuladas / diasJugados) * 365 / 24;
        }
        // un decimal con coma (12.83 → "12,8") solo con round, división y residuo
        int decimas = round(promedioDiario * 10);
        textoPromedio = (decimas / 10) + "," + (decimas % 10);
        decimas = round(diasEquivalentes * 10);
        textoDiasEquivalentes = (decimas / 10) + "," + (decimas % 10);

        // CICLO MIENTRAS (M2): convierte las horas acumuladas en días y horas.
        // No se sabe cuántas vueltas da: depende de cuántas horas haya.
        diasCompletos = 0;
        horasSobrantes = horasAcumuladas;
        while (horasSobrantes >= 24) {
          diasCompletos = diasCompletos + 1;
          horasSobrantes = horasSobrantes - 24;
        }

        // CICLO PARA (P3): recorre los días jugados para hallar el día con
        // más horas y el día con más riesgo.
        diaMasHoras = 1;
        diaMasPuntaje = 1;
        int maxHoras = -1;
        int maxPuntaje = -1;
        for (int d = 1; d <= diasJugados; d = d + 1) {
          int horasDelDia = 0;
          int puntajeDelDia = 0;
          switch (d) {
            case 1: horasDelDia = horasD1; puntajeDelDia = puntajeD1; break;
            case 2: horasDelDia = horasD2; puntajeDelDia = puntajeD2; break;
            case 3: horasDelDia = horasD3; puntajeDelDia = puntajeD3; break;
            case 4: horasDelDia = horasD4; puntajeDelDia = puntajeD4; break;
            case 5: horasDelDia = horasD5; puntajeDelDia = puntajeD5; break;
            case 6: horasDelDia = horasD6; puntajeDelDia = puntajeD6; break;
            case 7: horasDelDia = horasD7; puntajeDelDia = puntajeD7; break;
          }
          if (horasDelDia > maxHoras) {
            maxHoras = horasDelDia;
            diaMasHoras = d;
          }
          if (puntajeDelDia > maxPuntaje) {
            maxPuntaje = puntajeDelDia;
            diaMasPuntaje = d;
          }
        }

        // Clasificación con la tabla del documento usando el promedio diario.
        // Una sola variable decide el final: tipoFinal.
        if (identidadRobada == 1) {
          tipoFinal = 4;
          clasificacionTexto = "Identidad Comprometida";
          diagnosticoTexto = "Uso no saludable de redes sociales: entregaste tu contraseña.";
        } else {
          if (promedioDiario < 5) {
            tipoFinal = 1;
            clasificacionTexto = "Ciudadano Digital Ejemplar";
            diagnosticoTexto = "Uso saludable de redes sociales.";
          } else {
            if (promedioDiario <= 13) {
              tipoFinal = 2;
              clasificacionTexto = "Usuario Digital Responsable";
              diagnosticoTexto = "Debe mejorar algunos hábitos digitales.";
            } else {
              tipoFinal = 3;
              if (promedioDiario <= 20) {
                clasificacionTexto = "Usuario en Riesgo";
              } else {
                clasificacionTexto = "Dependencia Digital Alta";
              }
              diagnosticoTexto = "Uso no saludable de redes sociales.";
            }
          }
        }

        // =============================================================
        // BLOQUE T5 · RANKING PERSONAL (Tomás)
        // Entrada: regNombre, promedioDiario · Proceso: ubica la partida entre
        // las 3 mejores de la sesión (menor promedio = mejor)
        // Salida: rankNombre1..3, rankValor1..3, rankClas1..3
        // =============================================================
        partidasJugadas = partidasJugadas + 1;              // CONTADOR
        int valorPartida = round(promedioDiario * 10);
        if (identidadRobada == 1) { valorPartida = 999; }   // queda de último
        if (rankValor1 == -1 || valorPartida < rankValor1) {
          rankNombre3 = rankNombre2; rankValor3 = rankValor2; rankClas3 = rankClas2;
          rankNombre2 = rankNombre1; rankValor2 = rankValor1; rankClas2 = rankClas1;
          rankNombre1 = regNombre;   rankValor1 = valorPartida; rankClas1 = clasificacionTexto;
        } else {
          if (rankValor2 == -1 || valorPartida < rankValor2) {
            rankNombre3 = rankNombre2; rankValor3 = rankValor2; rankClas3 = rankClas2;
            rankNombre2 = regNombre;   rankValor2 = valorPartida; rankClas2 = clasificacionTexto;
          } else {
            if (rankValor3 == -1 || valorPartida < rankValor3) {
              rankNombre3 = regNombre; rankValor3 = valorPartida; rankClas3 = clasificacionTexto;
            }
          }
        }
        break;
    }
  }

  botonSobre = 0;

  // ==========================================================================
  // B. MÁQUINA DE PANTALLAS · Dependiendo De (pantalla)
  // ==========================================================================
  switch (pantalla) {

    // ==============================================================
    // PANTALLA 1: MENÚ PRINCIPAL
    // ==============================================================
    case 1:
      tint(140);
      image(fondo, 0, 0, width, height);
      noTint();

      float desY = sin(frameCount * 0.015) * 2.0;
      float yTitulo = 55 + desY;
      float prob = random(1);
      if (prob < 0.03) {
        tint(255, 100);
      } else {
        tint(255, 255);
      }
      image(Titulo, 40, int(yTitulo), 600, 300);
      noTint();

      int xMenu = 100;
      int yMenu = 420;
      int pasoMenu = 52;
      opcionHover = 0;
      cursor(ARROW);

      if (mouseX >= xMenu - 15 && mouseX <= xMenu + 230 && mouseY >= yMenu - 18 && mouseY <= yMenu + 18) {
        opcionHover = 1;
        cursor(HAND);
      } else {
        if (mouseX >= xMenu - 15 && mouseX <= xMenu + 230 && mouseY >= (yMenu + pasoMenu) - 18 && mouseY <= (yMenu + pasoMenu) + 18) {
          opcionHover = 2;
          cursor(HAND);
        } else {
          if (mouseX >= xMenu - 15 && mouseX <= xMenu + 230 && mouseY >= (yMenu + (pasoMenu * 2)) - 18 && mouseY <= (yMenu + (pasoMenu * 2)) + 18) {
            opcionHover = 3;
            cursor(HAND);
          } else {
            if (mouseX >= xMenu - 15 && mouseX <= xMenu + 230 && mouseY >= (yMenu + (pasoMenu * 3)) - 18 && mouseY <= (yMenu + (pasoMenu * 3)) + 18) {
              opcionHover = 4;
              cursor(HAND);
            } else {
              if (mouseX >= xMenu - 15 && mouseX <= xMenu + 230 && mouseY >= (yMenu + (pasoMenu * 4)) - 18 && mouseY <= (yMenu + (pasoMenu * 4)) + 18) {
                opcionHover = 5;
                cursor(HAND);
              }
            }
          }
        }
      }

      stroke(46, 158, 107, 90);
      strokeWeight(5);
      line(xMenu, yMenu, xMenu, yMenu + (pasoMenu * 4));

      stroke(55, 255, 175);
      strokeWeight(2);
      line(xMenu, yMenu, xMenu, yMenu + (pasoMenu * 4));

      textFont(fuenteOpciones);
      textSize(28);
      textAlign(LEFT, CENTER);

      // Nodo 1: Nueva Partida
      if (opcionHover == 1) {
        fill(55, 255, 175, 100); noStroke(); circle(xMenu, yMenu, 22);
        fill(235, 255, 245); stroke(55, 255, 175); strokeWeight(2.5); circle(xMenu, yMenu, 12);
        fill(55, 255, 175, 120); text("NUEVA PARTIDA", xMenu + 28, yMenu + 1);
        fill(245, 255, 250); text("NUEVA PARTIDA", xMenu + 26, yMenu - 1);
      } else {
        fill(22, 33, 58); stroke(46, 158, 107); strokeWeight(1.5); circle(xMenu, yMenu, 12);
        fill(55, 255, 175); noStroke(); circle(xMenu, yMenu, 6);
        fill(55, 255, 175, 200); text("NUEVA PARTIDA", xMenu + 26, yMenu - 1);
      }

      // Nodo 2: Cómo Jugar
      int yNodo2 = yMenu + pasoMenu;
      if (opcionHover == 2) {
        fill(55, 255, 175, 100); noStroke(); circle(xMenu, yNodo2, 22);
        fill(235, 255, 245); stroke(55, 255, 175); strokeWeight(2.5); circle(xMenu, yNodo2, 12);
        fill(55, 255, 175, 120); text("CÓMO JUGAR", xMenu + 28, yNodo2 + 1);
        fill(245, 255, 250); text("CÓMO JUGAR", xMenu + 26, yNodo2 - 1);
      } else {
        fill(22, 33, 58); stroke(46, 158, 107); strokeWeight(1.5); circle(xMenu, yNodo2, 12);
        fill(55, 255, 175); noStroke(); circle(xMenu, yNodo2, 6);
        fill(55, 255, 175, 200); text("CÓMO JUGAR", xMenu + 26, yNodo2 - 1);
      }

      // Nodo 3: Ranking
      int yNodo3 = yMenu + (pasoMenu * 2);
      if (opcionHover == 3) {
        fill(55, 255, 175, 100); noStroke(); circle(xMenu, yNodo3, 22);
        fill(235, 255, 245); stroke(55, 255, 175); strokeWeight(2.5); circle(xMenu, yNodo3, 12);
        fill(55, 255, 175, 120); text("RANKING", xMenu + 28, yNodo3 + 1);
        fill(245, 255, 250); text("RANKING", xMenu + 26, yNodo3 - 1);
      } else {
        fill(22, 33, 58); stroke(46, 158, 107); strokeWeight(1.5); circle(xMenu, yNodo3, 12);
        fill(55, 255, 175); noStroke(); circle(xMenu, yNodo3, 6);
        fill(55, 255, 175, 200); text("RANKING", xMenu + 26, yNodo3 - 1);
      }

      // Nodo 4: Créditos
      int yNodo4 = yMenu + (pasoMenu * 3);
      if (opcionHover == 4) {
        fill(55, 255, 175, 100); noStroke(); circle(xMenu, yNodo4, 22);
        fill(235, 255, 245); stroke(55, 255, 175); strokeWeight(2.5); circle(xMenu, yNodo4, 12);
        fill(55, 255, 175, 120); text("CRÉDITOS", xMenu + 28, yNodo4 + 1);
        fill(245, 255, 250); text("CRÉDITOS", xMenu + 26, yNodo4 - 1);
      } else {
        fill(22, 33, 58); stroke(46, 158, 107); strokeWeight(1.5); circle(xMenu, yNodo4, 12);
        fill(55, 255, 175); noStroke(); circle(xMenu, yNodo4, 6);
        fill(55, 255, 175, 200); text("CRÉDITOS", xMenu + 26, yNodo4 - 1);
      }

      // Nodo 5: Salir
      int yNodo5 = yMenu + (pasoMenu * 4);
      if (opcionHover == 5) {
        fill(55, 255, 175, 100); noStroke(); circle(xMenu, yNodo5, 22);
        fill(235, 255, 245); stroke(55, 255, 175); strokeWeight(2.5); circle(xMenu, yNodo5, 12);
        fill(55, 255, 175, 120); text("SALIR", xMenu + 28, yNodo5 + 1);
        fill(245, 255, 250); text("SALIR", xMenu + 26, yNodo5 - 1);
      } else {
        fill(22, 33, 58); stroke(46, 158, 107); strokeWeight(1.5); circle(xMenu, yNodo5, 12);
        fill(55, 255, 175); noStroke(); circle(xMenu, yNodo5, 6);
        fill(55, 255, 175, 200); text("SALIR", xMenu + 26, yNodo5 - 1);
      }
      break;

    // ==============================================================
    // PANTALLA 16: HISTORIETA - REVELADO LÍNEA POR LÍNEA CON 2 PERSIANAS
    // ==============================================================
    case 16:
      background(236, 236, 236);

      int t = frameCount - frameInicioEscena;
      int anchoV = 640;
      int altoV = 360;
      int xDer = 640;
      int yAbj = 350;
      int anchoPapel = 540;
      int altoPapel = 58;

      // Viñeta 1 (Arriba Izquierda)
      if (t > 0) {
        float a1 = t * 5.0;
        if (a1 > 255) { a1 = 255; }
        tint(255, a1);
        image(imgVineta1, 0, 0, anchoV, altoV);
        noTint();

        if (t > 30) {
          int xPapel1 = 50;
          int yPapel1 = altoV - 72;
          int centroX1 = xPapel1 + (anchoPapel / 2);

          tint(255, 175);
          image(CuadroDialogo, xPapel1, yPapel1, anchoPapel, altoPapel);
          noTint();

          textFont(fuenteVinetas);
          textSize(14);
          fill(245, 250, 255);
          textAlign(CENTER, TOP);
          text("NOTICIA DE ULTIMA HORA | Bogota.", centroX1, yPapel1 + 12);
          text("Catalina de 24 años asesinada en falsa entrevista.", centroX1, yPapel1 + 29);

          int anchoL1 = 330;
          int xIniL1 = centroX1 - (anchoL1 / 2);
          int velL1 = 7;
          int durL1 = anchoL1 / velL1;

          int avL1 = (t - 30) * velL1;
          if (avL1 > anchoL1) { avL1 = anchoL1; }

          int anchoL2 = 470;
          int xIniL2 = centroX1 - (anchoL2 / 2);
          int velL2 = 7;
          int avL2 = 0;
          if ((t - 30) > durL1) {
            avL2 = ((t - 30) - durL1) * velL2;
            if (avL2 > anchoL2) { avL2 = anchoL2; }
          }

          noStroke();
          fill(15, 24, 40, 235);
          rect(xIniL1 + avL1, yPapel1 + 10, anchoL1 - avL1, 16);
          rect(xIniL2 + avL2, yPapel1 + 28, anchoL2 - avL2, 18);
        }
      }

      // Viñeta 2 (Arriba Derecha)
      if (t > 150) {
        float a2 = (t - 150) * 5.0;
        if (a2 > 255) { a2 = 255; }
        tint(255, a2);
        image(imgVineta2, xDer, 0, anchoV, altoV);
        noTint();

        if (t > 180) {
          int xPapel2 = xDer + 50;
          int yPapel2 = altoV - 72;
          int centroX2 = xPapel2 + (anchoPapel / 2);

          tint(255, 175);
          image(CuadroDialogo, xPapel2, yPapel2, anchoPapel, altoPapel);
          noTint();

          textFont(fuenteVinetas);
          textSize(14);
          fill(245, 250, 255);
          textAlign(CENTER, TOP);
          text("El agresor imito los chats de sus amigas.", centroX2, yPapel2 + 12);
          text("La red criminal opera bajo perfiles robados.", centroX2, yPapel2 + 29);

          int anchoL1 = 390;
          int xIniL1 = centroX2 - (anchoL1 / 2);
          int velL1 = 7;
          int durL1 = anchoL1 / velL1;

          int avL1 = (t - 180) * velL1;
          if (avL1 > anchoL1) { avL1 = anchoL1; }

          int anchoL2 = 420;
          int xIniL2 = centroX2 - (anchoL2 / 2);
          int velL2 = 7;
          int avL2 = 0;
          if ((t - 180) > durL1) {
            avL2 = ((t - 180) - durL1) * velL2;
            if (avL2 > anchoL2) { avL2 = anchoL2; }
          }

          noStroke();
          fill(15, 24, 40, 235);
          rect(xIniL1 + avL1, yPapel2 + 10, anchoL1 - avL1, 16);
          rect(xIniL2 + avL2, yPapel2 + 28, anchoL2 - avL2, 18);
        }
      }

      // Viñeta 3 (Abajo Izquierda)
      if (t > 300) {
        float a3 = (t - 300) * 5.0;
        if (a3 > 255) { a3 = 255; }
        tint(255, a3);
        image(imgVineta3, 0, yAbj, anchoV, altoV);
        noTint();

        if (t > 330) {
          int xPapel3 = 50;
          int yPapel3 = (yAbj + altoV) - 72;
          int centroX3 = xPapel3 + (anchoPapel / 2);

          tint(255, 175);
          image(CuadroDialogo, xPapel3, yPapel3, anchoPapel, altoPapel);
          noTint();

          textFont(fuenteVinetas);
          textSize(14);
          fill(245, 250, 255);
          textAlign(CENTER, TOP);
          text("Las autoridades alertan: el peligro acecha.", centroX3, yPapel3 + 12);
          text("Cualquier estudiante puede ser la victima.", centroX3, yPapel3 + 29);

          int anchoL1 = 400;
          int xIniL1 = centroX3 - (anchoL1 / 2);
          int velL1 = 7;
          int durL1 = anchoL1 / velL1;

          int avL1 = (t - 330) * velL1;
          if (avL1 > anchoL1) { avL1 = anchoL1; }

          int anchoL2 = 410;
          int xIniL2 = centroX3 - (anchoL2 / 2);
          int velL2 = 7;
          int avL2 = 0;
          if ((t - 330) > durL1) {
            avL2 = ((t - 330) - durL1) * velL2;
            if (avL2 > anchoL2) { avL2 = anchoL2; }
          }

          noStroke();
          fill(15, 24, 40, 235);
          rect(xIniL1 + avL1, yPapel3 + 10, anchoL1 - avL1, 16);
          rect(xIniL2 + avL2, yPapel3 + 28, anchoL2 - avL2, 18);
        }
      }

      // Viñeta 4 (Abajo Derecha)
      if (t > 450) {
        float a4 = (t - 450) * 5.0;
        if (a4 > 255) { a4 = 255; }
        tint(255, a4);
        image(imgVineta4, xDer, yAbj, anchoV, altoV);
        noTint();

        if (t > 480) {
          int xPapel4 = xDer + 50;
          int yPapel4 = (yAbj + altoV) - 72;
          int centroX4 = xPapel4 + (anchoPapel / 2);

          tint(255, 175);
          image(CuadroDialogo, xPapel4, yPapel4, anchoPapel, altoPapel);
          noTint();

          textFont(fuenteVinetas);
          textSize(14);
          fill(245, 250, 255);
          textAlign(CENTER, TOP);
          text("Hoy comienza tu Dia Digital, Detective.", centroX4, yPapel4 + 12);
          text("El peligro respira tras tu propia pantalla.", centroX4, yPapel4 + 29);

          int anchoL1 = 390;
          int xIniL1 = centroX4 - (anchoL1 / 2);
          int velL1 = 7;
          int durL1 = anchoL1 / velL1;

          int avL1 = (t - 480) * velL1;
          if (avL1 > anchoL1) { avL1 = anchoL1; }

          int anchoL2 = 410;
          int xIniL2 = centroX4 - (anchoL2 / 2);
          int velL2 = 7;
          int avL2 = 0;
          if ((t - 480) > durL1) {
            avL2 = ((t - 480) - durL1) * velL2;
            if (avL2 > anchoL2) { avL2 = anchoL2; }
          }

          noStroke();
          fill(15, 24, 40, 235);
          rect(xIniL1 + avL1, yPapel4 + 10, anchoL1 - avL1, 16);
          rect(xIniL2 + avL2, yPapel4 + 28, anchoL2 - avL2, 18);
        }
      }

      // Viñeta 5 (Pantalla Completa)
      if (t > 810) {
        float a5 = (t - 810) * 5.0;
        if (a5 > 255) { a5 = 255; }
        tint(255, a5);
        image(imgVineta5, 0, 0, width, height);
        noTint();

        if (t > 840) {
          int centroX5 = width / 2;

          textFont(fuenteVinetas);
          textSize(23);
          fill(20, 25, 35);
          textAlign(CENTER, TOP);
          text("Tu mision: protege tus datos y analiza cada chat.", centroX5, 295);
          text("Desenmascara a los depredadores antes de caer.", centroX5, 330);

          int anchoL1 = 680;
          int xIniL1 = centroX5 - (anchoL1 / 2);
          int velL1 = 9;
          int durL1 = anchoL1 / velL1;

          int avL1 = (t - 840) * velL1;
          if (avL1 > anchoL1) { avL1 = anchoL1; }

          int anchoL2 = 640;
          int xIniL2 = centroX5 - (anchoL2 / 2);
          int velL2 = 9;
          int avL2 = 0;
          if ((t - 840) > durL1) {
            avL2 = ((t - 840) - durL1) * velL2;
            if (avL2 > anchoL2) { avL2 = anchoL2; }
          }

          noStroke();
          fill(238, 235, 225);
          rect(xIniL1 + avL1, 292, anchoL1 - avL1, 32);
          rect(xIniL2 + avL2, 328, anchoL2 - avL2, 34);
        }
      }

      // Indicador textual arriba a la izquierda
      textFont(fuenteVinetas);
      textSize(16);
      fill(226, 204, 148);
      textAlign(LEFT, TOP);
      text("[ENTER] AVANZAR >>", 30, 25);
      break;

    // ==============================================================
    // PANTALLA 2: CÓMO JUGAR (REGLAS DEL JUEGO + PISTAS DE AUDITORÍA)
    // ==============================================================
    case 2:
      int tJuego = frameCount - frameInicioEscena;

      if (tJuego < 40) {
        image(imgJugar1, 0, 0, width, height);
      } else {
        if (tJuego < 80) {
          image(imgJugar2, 0, 0, width, height);
        } else {
          if (tJuego < 120) {
            image(imgJugar3, 0, 0, width, height);
          } else {
            image(imgJugar4, 0, 0, width, height);

            if (pistasAbiertas == 0) {
              int xPantallaMin = 380;
              int xPantallaMax = 940;
              int yPantallaMin = 90;
              int yPantallaMax = 425;
              int anchoPantalla = xPantallaMax - xPantallaMin;
              int altoPantalla = yPantallaMax - yPantallaMin;

              textFont(fuenteVinetas);
              textSize(15);
              textAlign(CENTER, CENTER);
              if ((frameCount / 25) % 2 == 0) {
                fill(55, 255, 175);
              } else {
                fill(226, 204, 148);
              }
              text(">>> HAZ CLIC EN LA PANTALLA PARA ACCEDER AL MANUAL <<<", width / 2, 60);

              if (mouseX >= xPantallaMin && mouseX <= xPantallaMax && mouseY >= yPantallaMin && mouseY <= yPantallaMax) {
                cursor(HAND);
                noFill();
                if ((frameCount / 6) % 2 == 0) {
                  stroke(55, 255, 175, 255);
                  strokeWeight(4);
                } else {
                  stroke(55, 255, 175, 110);
                  strokeWeight(2.5);
                }
                rect(xPantallaMin, yPantallaMin, anchoPantalla, altoPantalla, 4);
              } else {
                cursor(ARROW);
              }

            } else {
              noStroke();
              fill(13, 21, 40, 165);
              rect(0, 0, width, height);

              int xPanel = 230;
              int yPanel = 55;
              int anchoPanel = 820;
              int altoPanel = 550;

              fill(13, 21, 40, 245);
              stroke(55, 255, 175);
              strokeWeight(2);
              rect(xPanel, yPanel, anchoPanel, altoPanel, 10);

              textFont(fuenteVinetas);
              textSize(15);
              fill(150, 175, 175);
              textAlign(LEFT, CENTER);
              text("[REF: DET_0x24]", xPanel + 20, yPanel + 22);

              fill(226, 204, 148);
              textAlign(CENTER, CENTER);
              text("MANUAL DE OPERACIÓN Y AUDITORÍA", width / 2, yPanel + 22);

              textFont(fuenteOpciones);
              textSize(30);
              textAlign(LEFT, CENTER);
              String tituloVerde = "REGLAS Y PISTAS ";
              String tituloOro = "DEL DETECTIVE:";
              // posiciones medidas una vez (la fuente es de ancho fijo): sin funciones de texto
              int xTitulo = 367;
              fill(55, 255, 175);
              text(tituloVerde, xTitulo, yPanel + 55);
              fill(226, 204, 148);
              text(tituloOro, xTitulo + 291, yPanel + 55);

              fill(22, 42, 72, 235);
              stroke(226, 204, 148, 180);
              strokeWeight(1.5);
              rect(xPanel + 20, yPanel + 80, anchoPanel - 40, 118, 6);

              textFont(fuenteVinetas);
              textSize(15);
              textAlign(LEFT, TOP);
              fill(226, 204, 148);
              text(">> MECÁNICA DE LA INVESTIGACIÓN (7 JORNADAS):", xPanel + 34, yPanel + 88);

              fill(240, 248, 255);
              textSize(14);
              text("1. El caso dura 7 DÍAS en 3 NIVELES. Cada día registras tu sesión y eliges 2 TIPOS DE CONTENIDO.", xPanel + 34, yPanel + 112);
              text("2. Usa la LUPA sobre el perfil sospechoso: halla MÍNIMO 2 PISTAS (3 en el nivel 3).", xPanel + 34, yPanel + 134);
              text("3. Elige A, B o C: cada decisión puede ser SEGURA, REGULAR o RIESGOSA.", xPanel + 34, yPanel + 156);
              fill(55, 255, 175);
              text("4. RIESGO: horas de uso, horario, contenido y errores suman puntos. ¡MENOS ES MEJOR!", xPanel + 34, yPanel + 178);

              for (int r = 1; r <= 5; r = r + 1) {
                int xTarjeta = xPanel + 20;
                int yTarjeta = yPanel + 210;
                int anchoTarjeta = 250;
                int altoTarjeta = 152;
                PImage iconoRegla = icono1;
                String tituloRegla = "";
                String textoRegla = "";

                switch (r) {
                  case 1:
                    iconoRegla = icono1;
                    tituloRegla = "[01] AUDITORÍA\nDE PERFILES:";
                    textoRegla = "Inspecciona fotos, amigos y patrones en chats.";
                    break;
                  case 2:
                    xTarjeta = xPanel + 285;
                    iconoRegla = icono2;
                    tituloRegla = "[02] FECHAS Y\nCREACIÓN:";
                    textoRegla = "¿Sin publicaciones ni fotos reales? ALERTA.";
                    break;
                  case 3:
                    xTarjeta = xPanel + 550;
                    iconoRegla = icono3;
                    tituloRegla = "[03] ANÁLISIS\nDE PERFIL:";
                    textoRegla = "Muchos seguidos y pocos seguidores = falso.";
                    break;
                  case 4:
                    xTarjeta = xPanel + 20;
                    yTarjeta = yPanel + 374;
                    anchoTarjeta = 382;
                    altoTarjeta = 155;
                    iconoRegla = icono5;
                    tituloRegla = "[04] INFORMACIÓN CONFIDENCIAL:";
                    textoRegla = "Si te pide contraseñas, datos personales o dinero, aléjate y reporta de inmediato.";
                    break;
                  case 5:
                    xTarjeta = xPanel + 418;
                    yTarjeta = yPanel + 374;
                    anchoTarjeta = 382;
                    altoTarjeta = 155;
                    iconoRegla = icono4;
                    tituloRegla = "[05] CONFIDENCIALIDAD:";
                    textoRegla = "¿Te pide guardar secretos frente a tus padres o amigos? Nunca aceptes.";
                    break;
                }

                fill(16, 33, 58, 235);
                stroke(55, 255, 175, 130);
                strokeWeight(1.5);
                rect(xTarjeta, yTarjeta, anchoTarjeta, altoTarjeta, 6);

                noStroke();
                fill(46, 158, 107, 70);
                rect(xTarjeta + 2, yTarjeta + 2, anchoTarjeta - 4, 48, 4);

                textFont(fuenteVinetas);
                textAlign(LEFT, TOP);
                textSize(15);
                textLeading(19);
                fill(226, 204, 148);
                text(tituloRegla, xTarjeta + 10, yTarjeta + 8);

                image(iconoRegla, xTarjeta + anchoTarjeta - 50, yTarjeta + 4, 44, 44);

                textSize(15);
                textLeading(19);
                fill(240, 245, 250);
                text(textoRegla, xTarjeta + 12, yTarjeta + 56, anchoTarjeta - 22, altoTarjeta - 62);
              }

              int xBtnCerrar = width / 2 - 140;
              int yBtnCerrar = 625;
              int anchoBtn = 280;
              int altoBtn = 50;

              stroke(55, 255, 175);
              strokeWeight(2);
              fill(20, 35, 55);

              if (mouseX >= xBtnCerrar && mouseX <= xBtnCerrar + anchoBtn && mouseY >= yBtnCerrar && mouseY <= yBtnCerrar + altoBtn) {
                zonaHover = 2;
                cursor(HAND);
                fill(55, 255, 175, 90);
                if (mousePressed) {
                  fill(55, 255, 175);
                }
              }
              rect(xBtnCerrar, yBtnCerrar, anchoBtn, altoBtn, 10);

              fill(245, 255, 250);
              textFont(fuenteOpciones);
              textSize(19);
              textAlign(CENTER, CENTER);
              text("[ VOLVER AL MONITOR ]", width / 2, yBtnCerrar + (altoBtn / 2));
            }
          }
        }
      }

      if (mouseX >= 30 && mouseX <= 420 && mouseY >= 20 && mouseY <= 50) {
        zonaHover = 3;
        fill(55, 255, 175);
        cursor(HAND);
      } else {
        fill(226, 204, 148);
      }
      textFont(fuenteVinetas);
      textSize(18);
      textAlign(LEFT, TOP);
      text("<- [ESC / BACKSPACE] VOLVER AL MENÚ", 30, 25);
      break;

    // ==============================================================
    // PANTALLA 3: CRÉDITOS
    // ==============================================================
    case 3:
      image(Creditos, 0, 0, width, height);

      if (mouseX >= 30 && mouseX <= 380 && mouseY >= 20 && mouseY <= 55) {
        fill(55, 255, 175);
        cursor(HAND);
      } else {
        fill(226, 204, 148);
        cursor(ARROW);
      }
      textFont(fuenteVinetas);
      textSize(16);
      textAlign(LEFT, TOP);
      text("<- [ESC / BACKSPACE] VOLVER AL MENÚ", 30, 25);
      break;
    // ==============================================================
    // PANTALLA 4: RANKING PERSONAL (3 mejores partidas de la sesión) · Jufra
    // Lee lo que calculó el BLOQUE T5 al terminar cada semana.
    // botonSobre: 1 volver al menú
    // ==============================================================
    case 4:
      tint(95);
      image(imgRanking, 0, 0, width, height);
      noTint();
      cursor(ARROW);

      int tRank = frameCount - frameInicioEscena;
      int altoPanelRank = tRank * 30;
      if (altoPanelRank > 560) { altoPanelRank = 560; }

      fill(13, 21, 40, 238);
      stroke(55, 255, 175);
      strokeWeight(2);
      rect(290, 345 - (altoPanelRank / 2), 700, altoPanelRank, 10);

      if (tRank > 20) {
        textFont(fuenteVinetas);
        textSize(14);
        textAlign(CENTER, CENTER);
        fill(150, 175, 175);
        text("[ARCHIVO: TOP_DETECTIVES.LOG]", width / 2, 92);

        textFont(fuenteOpciones);
        textSize(32);
        fill(55, 255, 175);
        text("RANKING DE DETECTIVES", width / 2, 125);

        textFont(fuenteVinetas);
        textSize(14);
        fill(226, 204, 148);
        text("Las 3 mejores partidas de esta sesión · menor riesgo promedio por día = mejor puesto", width / 2, 158);

        // CICLO PARA: dibuja los 3 puestos del ranking
        for (int puesto = 1; puesto <= 3; puesto = puesto + 1) {
          int yPuesto = 185 + ((puesto - 1) * 118);
          String nombrePuesto = "";
          String clasPuesto = "";
          int valorPuesto = -1;
          switch (puesto) {
            case 1: nombrePuesto = rankNombre1; valorPuesto = rankValor1; clasPuesto = rankClas1; break;
            case 2: nombrePuesto = rankNombre2; valorPuesto = rankValor2; clasPuesto = rankClas2; break;
            case 3: nombrePuesto = rankNombre3; valorPuesto = rankValor3; clasPuesto = rankClas3; break;
          }

          // cada fila entra deslizándose desde la derecha
          int despPuesto = (tRank - 20 - (puesto * 8)) * 40;
          int xPuesto = 330;
          if (despPuesto < 0) { despPuesto = 0; }
          if (despPuesto < 640) { xPuesto = 330 + (640 - despPuesto); }

          fill(16, 33, 58, 235);
          stroke(55, 255, 175, 130);
          strokeWeight(1.5);
          rect(xPuesto, yPuesto, 620, 100, 8);

          // medalla: oro, plata y bronce
          noStroke();
          switch (puesto) {
            case 1: fill(232, 190, 92); break;
            case 2: fill(190, 200, 210); break;
            case 3: fill(205, 127, 50); break;
          }
          circle(xPuesto + 56, yPuesto + 50, 62);
          fill(13, 21, 40);
          circle(xPuesto + 56, yPuesto + 50, 46);
          switch (puesto) {
            case 1: fill(232, 190, 92); break;
            case 2: fill(190, 200, 210); break;
            case 3: fill(205, 127, 50); break;
          }
          textFont(fuenteOpciones);
          textSize(28);
          textAlign(CENTER, CENTER);
          text("" + puesto, xPuesto + 56, yPuesto + 48);

          textAlign(LEFT, TOP);
          if (valorPuesto == -1) {
            textFont(fuenteVinetas);
            textSize(16);
            fill(140, 165, 170);
            text("Puesto libre: ¡juega una semana completa!", xPuesto + 110, yPuesto + 38);
          } else {
            textFont(fuenteOpciones);
            textSize(24);
            fill(245, 255, 250);
            text(nombrePuesto, xPuesto + 110, yPuesto + 14);
            textFont(fuenteVinetas);
            textSize(15);
            if (valorPuesto == 999) {
              fill(245, 110, 95);
              text("Identidad robada: la semana terminó antes de tiempo", xPuesto + 110, yPuesto + 48);
            } else {
              fill(55, 255, 175);
              text("Riesgo promedio por día: " + (valorPuesto / 10) + "," + (valorPuesto % 10) + " puntos", xPuesto + 110, yPuesto + 48);
            }
            fill(226, 204, 148);
            textSize(14);
            text(clasPuesto, xPuesto + 110, yPuesto + 72);
          }
        }

        textFont(fuenteVinetas);
        textSize(14);
        textAlign(CENTER, CENTER);
        fill(200, 220, 215);
        text("Partidas jugadas en esta sesión: " + partidasJugadas + "  ·  El ranking se borra al cerrar el juego.", width / 2, 556);

        // botón volver
        int xBtnRank = width / 2 - 140;
        if (mouseX >= xBtnRank && mouseX <= xBtnRank + 280 && mouseY >= 578 && mouseY <= 618) {
          botonSobre = 1;
          cursor(HAND);
          fill(55, 255, 175, 90);
        } else {
          fill(20, 35, 55);
        }
        stroke(55, 255, 175);
        strokeWeight(2);
        rect(xBtnRank, 578, 280, 40, 10);
        fill(245, 255, 250);
        textFont(fuenteOpciones);
        textSize(18);
        text("[ VOLVER AL MENÚ ]", width / 2, 597);
      }

      if (mouseX >= 30 && mouseX <= 380 && mouseY >= 20 && mouseY <= 55) {
        botonSobre = 1;
        fill(55, 255, 175);
        cursor(HAND);
      } else {
        fill(226, 204, 148);
      }
      textFont(fuenteVinetas);
      textSize(16);
      textAlign(LEFT, TOP);
      text("<- [ESC / BACKSPACE] VOLVER AL MENÚ", 30, 25);
      break;

    // ==============================================================
    // PANTALLA 5: REGISTRO UNIFICADO (NOMBRE, EDAD Y FECHA INICIAL)
    // ==============================================================
    case 5:
      // ============================================================
      // VALIDACIÓN DEL REGISTRO (Jufra)
      // Análisis · Entrada: regNombre, regEdad, regDia, regMes, regAnio y sus cifras
      //   Proceso: nombre con letras, edad de 6 a 99, mes de 1 a 12, año de 4
      //            cifras y día que exista en ese mes (meses de 28, 29, 30 o 31
      //            días y años bisiestos). Si todo está bien, calcula qué día de
      //            la semana es con la congruencia de Zeller.
      //   Salida: datosOkP5, mensajeP5, diaSemanaInicio
      // ============================================================
      datosOkP5 = 1;
      mensajeP5 = "";
      if (letrasReales == 0) {
        datosOkP5 = 0;
        mensajeP5 = "Escribe tu nombre (solo letras y espacios).";
      }
      if (datosOkP5 == 1 && lenEdad == 0) {
        datosOkP5 = 0;
        mensajeP5 = "Escribe tu edad.";
      }
      if (datosOkP5 == 1 && (regEdad < 6 || regEdad > 99)) {
        datosOkP5 = 0;
        mensajeP5 = "La edad debe estar entre 6 y 99 años.";
      }
      // un año es bisiesto si es divisible por 4 y no por 100, o si es divisible por 400
      bisiesto = 0;
      if ((regAnio % 4 == 0 && regAnio % 100 != 0) || regAnio % 400 == 0) { bisiesto = 1; }
      diasMes = 31;
      switch (regMes) {
        case 4: case 6: case 9: case 11: diasMes = 30; break;
        case 2: diasMes = 28 + bisiesto; break;
      }
      if (datosOkP5 == 1 && (lenDia == 0 || regDia < 1)) {
        datosOkP5 = 0;
        mensajeP5 = "Escribe el día de inicio (DD).";
      }
      if (datosOkP5 == 1 && (lenMes == 0 || regMes < 1 || regMes > 12)) {
        datosOkP5 = 0;
        mensajeP5 = "El mes va de 01 a 12.";
      }
      if (datosOkP5 == 1 && (lenAnio < 4 || regAnio < 1900 || regAnio > 2100)) {
        datosOkP5 = 0;
        mensajeP5 = "El año debe tener 4 cifras, entre 1900 y 2100.";
      }
      if (datosOkP5 == 1 && regDia > diasMes) {
        datosOkP5 = 0;
        mensajeP5 = "Ese mes solo tiene " + diasMes + " días.";
        if (regMes == 2 && regDia == 29) {
          mensajeP5 = "Febrero de " + regAnio + " tiene 28 días: no es año bisiesto.";
        }
      }
      String textoDiaInicio = "";
      if (datosOkP5 == 1) {
        // Congruencia de Zeller: enero y febrero cuentan como los meses 13 y 14
        // del año anterior. h: 0 sábado, 1 domingo ... 6 viernes
        int mesZ = regMes;
        int anioZ = regAnio;
        if (mesZ < 3) {
          mesZ = mesZ + 12;
          anioZ = anioZ - 1;
        }
        int kZ = anioZ % 100;
        int jZ = anioZ / 100;
        int hZ = (regDia + (13 * (mesZ + 1)) / 5 + kZ + kZ / 4 + jZ / 4 + 5 * jZ) % 7;
        diaSemanaInicio = (hZ + 5) % 7 + 1;      // se pasa a 1 lunes ... 7 domingo
        switch (diaSemanaInicio) {
          case 1: textoDiaInicio = "lunes"; break;
          case 2: textoDiaInicio = "martes"; break;
          case 3: textoDiaInicio = "miércoles"; break;
          case 4: textoDiaInicio = "jueves"; break;
          case 5: textoDiaInicio = "viernes"; break;
          case 6: textoDiaInicio = "sábado"; break;
          case 7: textoDiaInicio = "domingo"; break;
        }
      }

      image(imgFondoRegistro, 0, 0, width, height);

      fill(40, 35, 30);
      textAlign(CENTER, TOP);
      textFont(fuenteVinetas);
      textSize(17);
      text("- FISCALIA GENERAL -", 580, 145);

      textFont(fuenteOpciones);
      textSize(25);
      text("REGISTRO DE INVESTIGADOR", 580, 172);

      stroke(70, 60, 50);
      strokeWeight(2);
      line(315, 208, 845, 208);
      strokeWeight(1);
      line(315, 212, 845, 212);

      pushMatrix();
      translate(792, 130);
      rotate(radians(-8));
      noFill();
      stroke(165, 45, 35, 220);
      strokeWeight(3);
      rect(-75, -18, 150, 36, 4);
      strokeWeight(1.5);
      rect(-71, -14, 142, 28, 2);
      fill(165, 45, 35, 220);
      textFont(fuenteOpciones);
      textSize(17);
      textAlign(CENTER, CENTER);
      text("CONFIDENCIAL", 0, 0);
      popMatrix();

      String cursorTitilante = "";
      if ((frameCount / 30) % 2 == 0) {
        cursorTitilante = "|";
      }

      textFont(fuenteVinetas);
      textSize(16);
      textAlign(LEFT, TOP);
      fill(35, 30, 25);
      text("1. NOMBRE DEL AGENTE: ", 330, 245);

      if (campoActivoP5 == 1) {
        fill(255, 255, 255, 180);
        stroke(55, 175, 120);
        strokeWeight(1.5);
      } else {
        fill(240, 235, 220, 115);
        stroke(180, 170, 150);
        strokeWeight(1);
      }
      rect(545, 240, 285, 28, 3);
      fill(20, 25, 35);
      if (campoActivoP5 == 1) {
        text(regNombre + cursorTitilante, 553, 246);
      } else {
        text(regNombre, 553, 246);
      }

      textSize(12);
      fill(100, 90, 80);
      text("* Solo letras y espacios (máximo 20).", 545, 272);

      textSize(16);
      fill(35, 30, 25);
      text("2. EDAD DEL AGENTE: ", 330, 308);

      if (campoActivoP5 == 2) {
        fill(255, 255, 255, 180);
        stroke(55, 175, 120);
        strokeWeight(1.5);
      } else {
        fill(240, 235, 220, 115);
        stroke(180, 170, 150);
        strokeWeight(1);
      }
      rect(545, 303, 75, 28, 3);
      fill(20, 25, 35);
      if (campoActivoP5 == 2) {
        text(regEdadTexto + cursorTitilante, 553, 309);
      } else {
        text(regEdadTexto, 553, 309);
      }

      textSize(12);
      fill(100, 90, 80);
      text("* Solo números (de 6 a 99 años)", 632, 310);

      textSize(16);
      fill(35, 30, 25);
      text("3. FECHA DE INICIO: ", 330, 370);

      if (campoActivoP5 == 3) { fill(255, 255, 255, 180); stroke(55, 175, 120); strokeWeight(1.5); }
      else { fill(240, 235, 220, 115); stroke(180, 170, 150); strokeWeight(1); }
      rect(545, 365, 55, 28, 3);
      fill(20, 25, 35);
      if (campoActivoP5 == 3) { text(regDiaTexto + cursorTitilante, 551, 371); } else { text(regDiaTexto, 551, 371); }

      fill(35, 30, 25); text("/", 610, 371);

      if (campoActivoP5 == 4) { fill(255, 255, 255, 180); stroke(55, 175, 120); strokeWeight(1.5); }
      else { fill(240, 235, 220, 115); stroke(180, 170, 150); strokeWeight(1); }
      rect(625, 365, 55, 28, 3);
      fill(20, 25, 35);
      if (campoActivoP5 == 4) { text(regMesTexto + cursorTitilante, 631, 371); } else { text(regMesTexto, 631, 371); }

      fill(35, 30, 25); text("/", 690, 371);

      if (campoActivoP5 == 5) { fill(255, 255, 255, 180); stroke(55, 175, 120); strokeWeight(1.5); }
      else { fill(240, 235, 220, 115); stroke(180, 170, 150); strokeWeight(1); }
      rect(705, 365, 75, 28, 3);
      fill(20, 25, 35);
      if (campoActivoP5 == 5) { text(regAnioTexto + cursorTitilante, 711, 371); } else { text(regAnioTexto, 711, 371); }

      textSize(12);
      fill(100, 90, 80);
      text("* Formato: DD / MM / AAAA (Clic o TAB para cambiar)", 545, 398);

      textSize(15);
      fill(35, 30, 25);
      text("DEPARTAMENTO: BOGOTÁ D.C. / UNIDAD CIBERNÉTICA", 330, 442);

      // Mensaje de validación: listo (verde) o el primer error (rojo)
      textFont(fuenteVinetas);
      textSize(14);
      textAlign(LEFT, TOP);
      if (datosOkP5 == 1) {
        fill(35, 120, 70);
        text("Listo, agente. Tu semana empieza el " + textoDiaInicio + " " + regDiaTexto + "/" + regMesTexto + "/" + regAnioTexto + ".", 330, 556);
      } else {
        if (frameCount - avisoP5 < 180) {
          fill(175, 40, 30);
          text("¡Revisa el registro! " + mensajeP5, 330, 556);
        } else {
          fill(110, 95, 80);
          text(mensajeP5, 330, 556);
        }
      }

      pushMatrix();
      translate(430, 515);
      rotate(radians(-10));
      noFill();
      stroke(165, 45, 35, 190);
      strokeWeight(3);
      rect(-75, -18, 150, 36, 4);
      fill(165, 45, 35, 190);
      textFont(fuenteOpciones);
      textSize(18);
      textAlign(CENTER, CENTER);
      text("CONFIDENCIAL", 0, 0);
      popMatrix();

      pushMatrix();
      translate(615, 510);
      rotate(radians(-3));
      noFill();
      stroke(165, 45, 35, 210);
      strokeWeight(3);
      rect(-70, -18, 140, 36, 4);
      fill(165, 45, 35, 210);
      textFont(fuenteOpciones);
      textSize(18);
      textAlign(CENTER, CENTER);
      text("AUTORIZADO", 0, 0);
      popMatrix();

      int xBtnReg = 330;
      int yBtnReg = 590;
      int anchoBtnReg = 340;
      int altoBtnReg = 40;

      if (mouseX >= xBtnReg && mouseX <= xBtnReg + anchoBtnReg && mouseY >= yBtnReg && mouseY <= yBtnReg + altoBtnReg) {
        fill(45, 120, 80, 40);
        noStroke();
        rect(xBtnReg - 6, yBtnReg - 4, anchoBtnReg + 12, altoBtnReg + 8, 4);
        fill(35, 130, 75);
        cursor(HAND);
      } else {
        fill(40, 35, 30);
        cursor(ARROW);
      }

      textFont(fuenteOpciones);
      textSize(18);
      textAlign(LEFT, CENTER);
      text("GUARDAR E INICIAR DIA 1 ->", xBtnReg, yBtnReg + (altoBtnReg / 2));

      if (mouseX >= 30 && mouseX <= 380 && mouseY >= 20 && mouseY <= 55) {
        fill(55, 255, 175);
        cursor(HAND);
      } else {
        fill(226, 204, 148);
      }
      textFont(fuenteVinetas);
      textSize(16);
      textAlign(LEFT, TOP);
      text("<- [ESC] VOLVER AL MENÚ", 30, 25);
      break;

    // ==============================================================
    // PANTALLA 6: SECUENCIA BOOT CRT + ESCANEO + CONSOLA + DESBLOQUEO
    // ==============================================================
    case 6:
      // ============================================================
      // VALIDACIÓN Y CÁLCULO DE LA SESIÓN (Jufra)
      // Análisis · Entrada: regHora12, regMinuto, regFranjaNum, regHorasUso,
      //                     fecha del día, cruzaAnterior, salidaMinAnterior
      //   Proceso: hora de 1 a 12, minutos de 0 a 59, AM o PM elegido, horas de
      //            uso de 1 a 24 y que la sesión no empiece antes de que termine
      //            la de ayer. Convierte la hora de 12 a 24 horas, suma las horas
      //            de uso y un segundo, y pasa la fecha si se cruza la medianoche.
      //   Salida: datosOkP6, mensajeP6, hora y fecha de salida, puntos de tiempo y horario
      // ============================================================
      datosOkP6 = 1;
      mensajeP6 = "";
      if (lenSesHora == 0 || regHora12 < 1 || regHora12 > 12) {
        datosOkP6 = 0;
        mensajeP6 = "La hora de ingreso va de 1 a 12.";
      }
      if (datosOkP6 == 1 && (lenSesMinuto == 0 || regMinuto > 59)) {
        datosOkP6 = 0;
        mensajeP6 = "Los minutos van de 00 a 59.";
      }
      if (datosOkP6 == 1 && regFranjaNum == 0) {
        datosOkP6 = 0;
        mensajeP6 = "Elige la franja: AM o PM (clic o teclas A / P).";
      }
      if (datosOkP6 == 1 && (lenSesHorasUso == 0 || regHorasUso < 1 || regHorasUso > 24)) {
        datosOkP6 = 0;
        mensajeP6 = "Las horas de uso van de 1 a 24.";
      }
      sesHoraSalidaTexto = "__:__:__";
      textoSalida12 = "";
      textoFechaSalida = "__/__/____";
      textoDiaSemanaSal = "";
      if (datosOkP6 == 1) {
        // de 12 a 24 horas: 12 AM es 0 (medianoche) y de 1 PM a 11 PM se suman 12
        sesHora24Ingreso = regHora12;
        if (regFranjaNum == 1 && regHora12 == 12) { sesHora24Ingreso = 0; }
        if (regFranjaNum == 2 && regHora12 != 12) { sesHora24Ingreso = regHora12 + 12; }
        inicioMin = sesHora24Ingreso * 60 + regMinuto;
        // si ayer se pasó la medianoche, hoy no se puede empezar antes de esa salida
        if (cruzaAnterior == 1 && inicioMin <= salidaMinAnterior) {
          datosOkP6 = 0;
          mensajeP6 = "Ayer saliste hoy a las " + textoSalidaAnterior + ": empieza después de esa hora.";
        }
      }
      if (datosOkP6 == 1) {
        // CICLO MIENTRAS (M1): mientras sobre un día completo de minutos
        // (1440 = 24 horas), la salida pasa al día siguiente.
        minutosTotales = inicioMin + regHorasUso * 60;
        sesCruzaMedianoche = 0;
        sesAnioSal = sesAnio;
        sesMesSal = sesMes;
        sesDiaSal = sesDia;
        diaSemanaSal = diaSemana;
        while (minutosTotales >= 1440) {
          minutosTotales = minutosTotales - 1440;
          sesCruzaMedianoche = 1;
          bisiesto = 0;
          if ((sesAnioSal % 4 == 0 && sesAnioSal % 100 != 0) || sesAnioSal % 400 == 0) { bisiesto = 1; }
          diasMes = 31;
          switch (sesMesSal) {
            case 4: case 6: case 9: case 11: diasMes = 30; break;
            case 2: diasMes = 28 + bisiesto; break;
          }
          sesDiaSal = sesDiaSal + 1;
          if (sesDiaSal > diasMes) {
            sesDiaSal = 1;
            sesMesSal = sesMesSal + 1;
            if (sesMesSal > 12) {
              sesMesSal = 1;
              sesAnioSal = sesAnioSal + 1;
            }
          }
          diaSemanaSal = diaSemanaSal % 7 + 1;
        }
        salidaMin = minutosTotales;
        sesHoraSal = salidaMin / 60;
        sesMinutoSal = salidaMin % 60;

        // hora militar HH:MM:SS (el segundo extra que pide el documento)
        sesHoraSalidaTexto = "";
        if (sesHoraSal < 10) { sesHoraSalidaTexto = "0"; }
        sesHoraSalidaTexto = sesHoraSalidaTexto + sesHoraSal + ":";
        if (sesMinutoSal < 10) { sesHoraSalidaTexto = sesHoraSalidaTexto + "0"; }
        sesHoraSalidaTexto = sesHoraSalidaTexto + sesMinutoSal + ":01";

        // la misma hora en formato de 12 horas (cambia de a. m. a p. m. al pasar el mediodía)
        int hora12Sal = sesHoraSal % 12;
        if (hora12Sal == 0) { hora12Sal = 12; }
        textoSalida12 = hora12Sal + ":";
        if (sesMinutoSal < 10) { textoSalida12 = textoSalida12 + "0"; }
        if (sesHoraSal < 12) {
          textoSalida12 = textoSalida12 + sesMinutoSal + ":01 a. m.";
        } else {
          textoSalida12 = textoSalida12 + sesMinutoSal + ":01 p. m.";
        }

        // hora de ingreso HH:MM:00 y fecha de salida dd/mm/aaaa
        textoIngreso = "";
        if (sesHora24Ingreso < 10) { textoIngreso = "0"; }
        textoIngreso = textoIngreso + sesHora24Ingreso + ":";
        if (regMinuto < 10) { textoIngreso = textoIngreso + "0"; }
        textoIngreso = textoIngreso + regMinuto + ":00";
        textoFechaSalida = "";
        if (sesDiaSal < 10) { textoFechaSalida = "0"; }
        textoFechaSalida = textoFechaSalida + sesDiaSal + "/";
        if (sesMesSal < 10) { textoFechaSalida = textoFechaSalida + "0"; }
        textoFechaSalida = textoFechaSalida + sesMesSal + "/" + sesAnioSal;
        switch (diaSemanaSal) {
          case 1: textoDiaSemanaSal = "lunes"; break;
          case 2: textoDiaSemanaSal = "martes"; break;
          case 3: textoDiaSemanaSal = "miércoles"; break;
          case 4: textoDiaSemanaSal = "jueves"; break;
          case 5: textoDiaSemanaSal = "viernes"; break;
          case 6: textoDiaSemanaSal = "sábado"; break;
          case 7: textoDiaSemanaSal = "domingo"; break;
        }

        // =========================================================
        // BLOQUE T1 · PUNTOS DE TIEMPO Y HORARIO (Tomás)
        // Tiempo: más de 3 y menos de 8 horas +4; 8 horas o más +7.
        // Horario saludable: de 8:00 a. m. (minuto 480) a 8:00 p. m. (minuto 1200).
        // Si la sesión empieza o termina fuera de ese rango: +4.
        // Con el segundo extra, salir a las 8:00:01 p. m. ya cuenta fuera.
        // =========================================================
        puntosTiempo = 0;
        if (regHorasUso > 3 && regHorasUso < 8) {
          puntosTiempo = 4;
        } else {
          if (regHorasUso >= 8) {
            puntosTiempo = 7;
          }
        }
        puntosHorario = 0;
        if (inicioMin < 480 || inicioMin > 1200 || sesCruzaMedianoche == 1 || salidaMin >= 1200 || salidaMin < 480) {
          puntosHorario = 4;
        }
      }

      image(imgConsolaSesion, 0, 0, width, height);

      int tConsola = frameCount - frameInicioEscena;

      noStroke();
      if ((frameCount / 18) % 2 == 0) {
        fill(65, 255, 145, 230);
      } else {
        fill(35, 130, 75, 140);
      }
      rect(1002, 629, 14, 5, 2);

      if (tConsola < 270) {
        int xVidrio = 198;
        int yVidrio = 92;
        int wVidrio = 884;
        int hVidrio = 510;
        int cxVidrio = xVidrio + (wVidrio / 2);
        int cyVidrio = yVidrio + (hVidrio / 2);

        noStroke();
        fill(8, 15, 24);
        rect(xVidrio, yVidrio, wVidrio, hVidrio, 8);

        if (tConsola < 35) {
          int altoCRT = tConsola * 15;
          if (altoCRT > hVidrio) { altoCRT = hVidrio; }
          int yCentroCRT = cyVidrio - (altoCRT / 2);
          fill(20, 48, 58);
          rect(xVidrio, yCentroCRT, wVidrio, altoCRT, 6);
          stroke(180, 255, 245);
          strokeWeight(3);
          line(xVidrio + 8, cyVidrio, xVidrio + wVidrio - 8, cyVidrio);
        } else {
          stroke(55, 255, 175, 14);
          strokeWeight(1);
          for (int yScan = yVidrio + 8; yScan < yVidrio + hVidrio - 8; yScan = yScan + 6) {
            line(xVidrio + 6, yScan, xVidrio + wVidrio - 6, yScan);
          }

          noFill();
          stroke(55, 255, 175, 65);
          strokeWeight(1.5);
          rect(xVidrio + 14, yVidrio + 14, wVidrio - 28, hVidrio - 28, 6);

          if (tConsola < 130) {
            textFont(fuenteVinetas);
            textSize(16);
            textAlign(LEFT, TOP);
            fill(55, 255, 175);

            text("FISCALIA_BIOS v4.02 (C) BOGOTA D.C.", xVidrio + 36, yVidrio + 40);
            text("MEMORIA FORENSE: 640K OK", xVidrio + 36, yVidrio + 72);
            text("MODULO DE RASTREO CELULAR: DETECTADO", xVidrio + 36, yVidrio + 104);
            fill(226, 204, 148);
            text("INICIANDO PROTOCOLO DE SEGURIDAD...", xVidrio + 36, yVidrio + 148);

            int velBios = 18;
            int avB1 = (tConsola - 35) * velBios;
            if (avB1 > 460) { avB1 = 460; }

            int avB2 = 0;
            if (tConsola > 56) {
              avB2 = (tConsola - 56) * velBios;
              if (avB2 > 360) { avB2 = 360; }
            }

            int avB3 = 0;
            if (tConsola > 74) {
              avB3 = (tConsola - 74) * velBios;
              if (avB3 > 480) { avB3 = 480; }
            }

            int avB4 = 0;
            if (tConsola > 96) {
              avB4 = (tConsola - 96) * velBios;
              if (avB4 > 460) { avB4 = 460; }
            }

            noStroke();
            fill(8, 15, 24);
            rect(xVidrio + 36 + avB1, yVidrio + 37, 460 - avB1, 24);
            rect(xVidrio + 36 + avB2, yVidrio + 69, 360 - avB2, 24);
            rect(xVidrio + 36 + avB3, yVidrio + 101, 480 - avB3, 24);
            rect(xVidrio + 36 + avB4, yVidrio + 145, 460 - avB4, 24);
          }

          if (tConsola >= 130) {
            int cyEscudo = cyVidrio - 65;

            noFill();
            stroke(55, 255, 175);
            strokeWeight(2.5);
            beginShape();
            vertex(cxVidrio - 44, cyEscudo - 46);
            vertex(cxVidrio + 44, cyEscudo - 46);
            vertex(cxVidrio + 44, cyEscudo + 6);
            vertex(cxVidrio, cyEscudo + 50);
            vertex(cxVidrio - 44, cyEscudo + 6);
            endShape(CLOSE);

            line(cxVidrio, cyEscudo - 36, cxVidrio, cyEscudo + 38);
            line(cxVidrio - 32, cyEscudo - 12, cxVidrio + 32, cyEscudo - 12);

            textFont(fuenteOpciones);
            textSize(21);
            fill(55, 255, 175);
            textAlign(CENTER, TOP);
            text("UNIDAD CIBERNÉTICA - ACCESO NIVEL " + nivel, cxVidrio, cyVidrio + 6);

            textFont(fuenteVinetas);
            textSize(16);
            fill(225, 245, 240);
            text("VERIFICANDO CREDENCIALES DEL AGENTE: " + regNombre, cxVidrio, cyVidrio + 46);

            int avId = (tConsola - 130) * 16;
            if (avId > 660) { avId = 660; }
            noStroke();
            fill(8, 15, 24);
            rect((cxVidrio - 330) + avId, cyVidrio + 43, 660 - avId, 24);

            int anchoBarraId = 440;
            int xBarraId = cxVidrio - (anchoBarraId / 2);
            int yBarraId = cyVidrio + 86;
            noFill();
            stroke(55, 255, 175);
            strokeWeight(1.5);
            rect(xBarraId, yBarraId, anchoBarraId, 22, 3);

            int progresoId = (tConsola - 150) * 6;
            if (progresoId < 0) { progresoId = 0; }
            if (progresoId > anchoBarraId - 6) { progresoId = anchoBarraId - 6; }
            noStroke();
            fill(55, 255, 175, 185);
            rect(xBarraId + 3, yBarraId + 3, progresoId, 16, 2);

            if (tConsola > 225) {
              textFont(fuenteOpciones);
              textSize(18);
              fill(55, 255, 175);
              textAlign(CENTER, TOP);
              text("[ CREDENCIAL VERIFICADA - ACCESO AUTORIZADO ]", cxVidrio, cyVidrio + 128);
            }
          }
        }

        textFont(fuenteVinetas);
        textSize(12);
        fill(140, 180, 170);
        textAlign(RIGHT, TOP);
        text("[ENTER / CLIC] OMITIR ARRANQUE >>", xVidrio + wVidrio - 26, yVidrio + hVidrio - 32);

      } else {
        int tUI = tConsola - 270;

        int xTel = 896;
        textFont(fuenteVinetas);
        textSize(13);
        textAlign(LEFT, TOP);
        fill(210, 240, 230);
        text("TELEMETRÍA DEL AGENTE", xTel, 152);

        fill(160, 195, 185);
        text("Agente:", xTel, 184);
        fill(245, 255, 250);
        textSize(12);
        text(regNombre, xTel, 202, 168, 30);

        textSize(13);
        fill(160, 195, 185);
        text("Jornada:", xTel, 234);
        fill(245, 255, 250);
        text("DÍA " + diaActual + " DE 7 · NIVEL " + nivel, xTel, 252);

        fill(160, 195, 185);
        text("RIESGO ACTUAL:", xTel, 284);
        if (puntosRiesgo >= 25) {
          fill(245, 85, 75);
          text(puntosRiesgo + " PTS [ALERTA]", xTel, 302);
        } else {
          fill(55, 255, 175);
          text(puntosRiesgo + " PTS [ESTABLE]", xTel, 302);
        }

        noFill();
        stroke(55, 255, 175, 180);
        strokeWeight(1.5);
        rect(xTel, 326, 166, 16, 2);

        noStroke();
        if (puntosRiesgo >= 25) { fill(220, 65, 55, 190); } else { fill(55, 255, 175, 160); }
        int anchoMaxBarra = 160 - (puntosRiesgo * 2);
        if (anchoMaxBarra < 16) { anchoMaxBarra = 16; }
        int anchoAnimBarra = tUI * 10;
        if (anchoAnimBarra > anchoMaxBarra) { anchoAnimBarra = anchoMaxBarra; }
        rect(xTel + 3, 329, anchoAnimBarra, 10);

        fill(160, 195, 185);
        text("SALIDA MILITAR (+1 s):", xTel, 362);
        fill(245, 255, 250);
        textSize(16);
        text(sesHoraSalidaTexto, xTel, 380);
        textSize(12);
        fill(190, 220, 210);
        text(textoSalida12, xTel, 402);

        textSize(13);
        fill(160, 195, 185);
        text("FECHA DE SALIDA:", xTel, 426);
        fill(245, 255, 250);
        textSize(12);
        text(textoDiaSemanaSal + " " + textoFechaSalida, xTel, 444);

        textSize(13);
        fill(160, 195, 185);
        text("RIESGO DE LA SESIÓN:", xTel, 470);
        if (puntosTiempo + puntosHorario == 0) { fill(55, 255, 175); } else { fill(255, 215, 95); }
        if (datosOkP6 == 1) {
          text("+" + puntosTiempo + " tiempo · +" + puntosHorario + " horario", xTel, 488);
        } else {
          text("(completa los datos)", xTel, 488);
        }

        int xIzq6 = 222;
        textFont(fuenteVinetas);
        textSize(14);
        textAlign(LEFT, TOP);

        fill(200, 235, 220);
        text("FISCAL_OS [Versión 4.02 · Unidad Cibernética]", xIzq6, 152);
        text("(c) Ciudad Digital 2026. Uso exclusivo de agentes autorizados.", xIzq6, 174);

        fill(55, 255, 175);
        text("C:\\Users\\Investigador_" + regNombre + "> run forense_digital_v1.0.bat", xIzq6, 210);
        fill(210, 240, 230);
        text("Cargando bases de datos de la Fiscalía General... [OK]", xIzq6, 232);
        text("Conectando con Unidad Cibernética de Bogotá... [OK]", xIzq6, 254);

        fill(55, 255, 175);
        text("=== REGISTRO DE INGRESO DE SESIÓN ===", xIzq6, 290);

        int velTxt6 = 22;

        int avR1 = tUI * velTxt6;
        if (avR1 > 380) { avR1 = 380; }

        int avR2 = 0;
        if (tUI > 18) {
          avR2 = (tUI - 18) * velTxt6;
          if (avR2 > 520) { avR2 = 520; }
        }

        int avR3 = 0;
        if (tUI > 42) {
          avR3 = (tUI - 42) * velTxt6;
          if (avR3 > 640) { avR3 = 640; }
        }

        int avR4 = 0;
        if (tUI > 72) {
          avR4 = (tUI - 72) * velTxt6;
          if (avR4 > 500) { avR4 = 500; }
        }

        int avR5 = 0;
        if (tUI > 95) {
          avR5 = (tUI - 95) * velTxt6;
          if (avR5 > 500) { avR5 = 500; }
        }

        int avR6 = 0;
        if (tUI > 118) {
          avR6 = (tUI - 118) * velTxt6;
          if (avR6 > 360) { avR6 = 360; }
        }

        noStroke();
        fill(14, 28, 40);
        rect(xIzq6 + avR1, 150, 380 - avR1, 20);
        rect(xIzq6 + avR2, 172, 520 - avR2, 20);
        rect(xIzq6 + avR3, 208, 640 - avR3, 20);
        rect(xIzq6 + avR4, 230, 500 - avR4, 20);
        rect(xIzq6 + avR5, 252, 500 - avR5, 20);
        rect(xIzq6 + avR6, 288, 360 - avR6, 20);

        if (tUI > 135) {
          String curConsola = "";
          if ((frameCount / 20) % 2 == 0) {
            curConsola = "|";
          }

          textAlign(LEFT, TOP);
          fill(220, 245, 235);
          text("[1] FECHA DE JORNADA:", xIzq6, 330);
          // la fecha de cada día se calcula sola a partir de la fecha de inicio
          fill(18, 44, 46);
          stroke(55, 255, 175, 120);
          strokeWeight(1);
          rect(418, 326, 250, 22, 3);
          textAlign(CENTER, CENTER);
          fill(55, 255, 175);
          text(textoDiaSemana + " " + textoFecha, 543, 337);
          textAlign(LEFT, TOP);
          fill(140, 180, 170);
          textSize(12);
          text("(automática)", 680, 332);
          textSize(14);

          textAlign(LEFT, TOP);
          fill(220, 245, 235);
          text("[2] HORA DE INGRESO (HH:MM AM/PM):", xIzq6, 366);

          if (campoActivoP6 == 4) { fill(30, 82, 76); stroke(55, 255, 175); strokeWeight(2); }
          else { fill(18, 36, 48); stroke(226, 204, 148, 130); strokeWeight(1); }
          rect(498, 362, 34, 22, 3);
          textAlign(CENTER, CENTER);
          if (campoActivoP6 == 4) { fill(55, 255, 175); text(sesHoraTexto + curConsola, 515, 373); }
          else { fill(255, 215, 95); text(sesHoraTexto, 515, 373); }

          textAlign(LEFT, TOP);
          fill(200, 235, 220); text(":", 536, 366);

          if (campoActivoP6 == 5) { fill(30, 82, 76); stroke(55, 255, 175); strokeWeight(2); }
          else { fill(18, 36, 48); stroke(226, 204, 148, 130); strokeWeight(1); }
          rect(547, 362, 34, 22, 3);
          textAlign(CENTER, CENTER);
          if (campoActivoP6 == 5) { fill(55, 255, 175); text(sesMinutoTexto + curConsola, 564, 373); }
          else { fill(255, 215, 95); text(sesMinutoTexto, 564, 373); }

          int xBtnAM = 592;
          int yBtnFranja = 362;
          if (regFranjaNum == 1) {
            fill(30, 85, 95);
            stroke(55, 255, 175);
            strokeWeight(2);
          } else {
            fill(16, 30, 42);
            stroke(226, 204, 148, 130);
            strokeWeight(1);
          }
          rect(xBtnAM, yBtnFranja, 50, 22, 3);
          textAlign(CENTER, CENTER);
          if (regFranjaNum == 1) { fill(55, 255, 175); } else { fill(255, 215, 95); }
          text("[ AM ]", xBtnAM + 25, yBtnFranja + 11);

          int xBtnPM = 650;
          if (regFranjaNum == 2) {
            fill(30, 85, 95);
            stroke(55, 255, 175);
            strokeWeight(2);
          } else {
            fill(16, 30, 42);
            stroke(226, 204, 148, 130);
            strokeWeight(1);
          }
          rect(xBtnPM, yBtnFranja, 50, 22, 3);
          if (regFranjaNum == 2) { fill(55, 255, 175); } else { fill(255, 215, 95); }
          text("[ PM ]", xBtnPM + 25, yBtnFranja + 11);

          textAlign(LEFT, TOP);
          fill(220, 245, 235);
          text("[3] HORAS DE USO ESTIMADAS (1-24h):", xIzq6, 402);

          if (campoActivoP6 == 7) { fill(30, 82, 76); stroke(55, 255, 175); strokeWeight(2); }
          else { fill(18, 36, 48); stroke(226, 204, 148, 130); strokeWeight(1); }
          rect(508, 398, 40, 22, 3);
          textAlign(CENTER, CENTER);
          if (campoActivoP6 == 7) { fill(55, 255, 175); text(sesHorasUsoTexto + curConsola, 528, 409); }
          else { fill(255, 215, 95); text(sesHorasUsoTexto, 528, 409); }

          textAlign(LEFT, TOP);
          textSize(12);
          fill(255, 215, 95, 210);
          text("* Los campos en ÁMBAR se editan: clic o [TAB] · A / P cambia AM o PM · BACKSPACE borra.", xIzq6, 448);
          text("* Horario saludable: 8:00 a. m. a 8:00 p. m. · Más de 3 h de uso suma riesgo.", xIzq6, 466);

          textFont(fuenteVinetas);
          textSize(13);
          textAlign(LEFT, CENTER);
          String mensajeLog6 = "> ESTADO (jornada " + diaActual + "): " + mensajeP6;
          fill(160, 220, 200);
          if (frameCount - avisoP6 < 180) {
            mensajeLog6 = "> ERROR: " + mensajeP6;
            fill(255, 120, 100);
          }
          if (datosOkP6 == 1) {
            mensajeLog6 = "> LISTO: sesión de " + regHorasUso + " h. Salida a las " + sesHoraSalidaTexto + ".";
            fill(55, 255, 175);
            if (puntosTiempo + puntosHorario > 0) {
              mensajeLog6 = "> ADVERTENCIA: horario fuera de rango o uso prolongado (+" + (puntosTiempo + puntosHorario) + " de riesgo).";
              fill(255, 215, 95);
            }
          }

          if (mouseX >= 592 && mouseX <= 700 && mouseY >= 362 && mouseY <= 384) {
            mensajeLog6 = "> AYUDA: Seleccione franja horaria de ingreso (AM o PM).";
            fill(55, 255, 175);
          }
          if (datosOkP6 == 1 && mouseX >= 868 && mouseX <= 1066 && mouseY >= 546 && mouseY <= 578) {
            mensajeLog6 = "> LISTO: presione para desbloquear el celular e iniciar el rastreo.";
            fill(55, 255, 175);
          }
          if (desbloqueandoCelular == 1) {
            mensajeLog6 = "> ENVIANDO SEÑAL DE DESBLOQUEO AL DISPOSITIVO... [OK]";
            fill(55, 255, 175);
          }
          text(mensajeLog6, 215, 562);

          int xBtnDesb = 868;
          int yBtnDesb = 546;
          int anchoBtnDesb = 198;
          int altoBtnDesb = 32;

          if (desbloqueandoCelular == 1) {
            fill(55, 255, 175, 120);
            stroke(220, 255, 240);
            strokeWeight(2.5);
          } else {
            if (mouseX >= xBtnDesb && mouseX <= xBtnDesb + anchoBtnDesb && mouseY >= yBtnDesb && mouseY <= yBtnDesb + altoBtnDesb) {
              cursor(HAND);
              fill(55, 255, 175, 65);
              stroke(55, 255, 175);
              strokeWeight(2);
            } else {
              fill(16, 36, 48);
              stroke(55, 255, 175);
              strokeWeight(1.5);
            }
          }
          rect(xBtnDesb, yBtnDesb, anchoBtnDesb, altoBtnDesb, 4);

          fill(245, 255, 250);
          textFont(fuenteVinetas);
          textSize(13);
          textAlign(CENTER, CENTER);
          text("DESBLOQUEAR CELULAR >>", xBtnDesb + (anchoBtnDesb / 2), yBtnDesb + (altoBtnDesb / 2));
        }
      }

      if (desbloqueandoCelular == 1) {
        int tDesb = frameCount - frameDesbloqueo;
        int alphaPenumbra = tDesb * 4;
        if (alphaPenumbra > 250) { alphaPenumbra = 250; }
        noStroke();
        fill(8, 16, 26, alphaPenumbra);
        rect(0, 0, width, height);

        if (tDesb >= 65) {
          desbloqueandoCelular = 0;
          selCat1 = 0;
          selCat2 = 0;
          selCat3 = 0;
          selCat4 = 0;
          selCat5 = 0;
          selCat6 = 0;
          selCat7 = 0;
          totalElegidos = 0;
          casoElegido1 = 0;
          casoElegido2 = 0;
          alertaMaxContenidos = 0;
          frameInicioEscena = frameCount;
          pantalla = 7;
        }
      }

      if (mouseX >= 25 && mouseX <= 340 && mouseY >= 18 && mouseY <= 52) {
        fill(55, 255, 175);
        cursor(HAND);
      } else {
        fill(235, 240, 245);
      }
      textFont(fuenteVinetas);
      textSize(17);
      textAlign(LEFT, TOP);
      text("<- [ESC] VOLVER AL MENÚ", 28, 22);
      break;

    // ==============================================================
    // PANTALLA 7: SELECTOR DE CONTENIDOS DIARIOS (DESLIZAMIENTO LIMPIO)
    // ==============================================================
    case 7:
      int t7 = frameCount - frameInicioEscena;
      background(8, 16, 26);

      int offsetY7 = 0;
      if (t7 < 48) {
        offsetY7 = (48 - t7) * 10;
      }

      image(imgContenidos, 0, offsetY7, width, height);

      cursor(ARROW);

      noStroke();
      float pulsoMon = (sin(frameCount * 0.08) + 1.0) * 8.0;
      fill(55, 255, 175, 10 + pulsoMon);
      rect(470, offsetY7, 465, 185, 12);

      int xCel7 = 236;
      int wCel7 = 338;
      int cxCel7 = 405;

      textFont(fuenteVinetas);
      textSize(11);
      fill(55, 255, 175);
      textAlign(LEFT, TOP);
      String franjaTxt7 = "AM";
      if (regFranjaNum == 2) { franjaTxt7 = "PM"; }
      String minCel7 = "" + regMinuto;
      if (regMinuto < 10) { minCel7 = "0" + regMinuto; }
      text(regHora12 + ":" + minCel7 + " " + franjaTxt7, xCel7 + 6, 72 + offsetY7);

      textAlign(RIGHT, TOP);
      fill(226, 204, 148);
      text("DIA " + diaActual + "/7", xCel7 + wCel7 - 6, 72 + offsetY7);

      textFont(fuenteOpciones);
      textSize(19);
      fill(238, 245, 242);
      textAlign(CENTER, TOP);
      text("¿QUÉ CONTENIDO VISTE HOY?", cxCel7, 94 + offsetY7);

      textFont(fuenteVinetas);
      textSize(15);
      fill(175, 195, 192);
      text("(elige 2)", cxCel7, 118 + offsetY7);

      int yIniNotif = 144 + offsetY7;
      int altoNotif = 65;
      int gapNotif = 5;

      for (int c = 1; c <= 7; c = c + 1) {
        int tAparicion = 48 + ((c - 1) * 9);
        if (t7 >= tAparicion) {
          int dtCard = t7 - tAparicion;
          int despCard = 0;
          if (dtCard < 10) {
            despCard = (10 - dtCard) * 2;
          }

          int yCard = yIniNotif + ((c - 1) * (altoNotif + gapNotif)) + despCard;
          int estaSel = 0;
          String titCat = "";
          String subAmbar = "";
          String descCat = "";
          PImage iconoActual7 = icont1;

          switch (c) {
            case 1:
              estaSel = selCat1;
              titCat = "Educativo";
              descCat = "Nueva guía de ciberseguridad disponible";
              iconoActual7 = icont1;
              break;
            case 2:
              estaSel = selCat2;
              titCat = "Noticias oficiales";
              subAmbar = "Boletín informativo: ";
              descCat = "Actualización local";
              iconoActual7 = icont2;
              break;
            case 3:
              estaSel = selCat3;
              titCat = "Entretenimiento";
              descCat = "Tendencias virales y clips recomendados";
              iconoActual7 = icont3;
              break;
            case 4:
              estaSel = selCat4;
              titCat = "Creadores";
              descCat = "Nuevo directo de canal verificado";
              iconoActual7 = icont4;
              break;
            case 5:
              estaSel = selCat5;
              titCat = "Perfiles anónimos";
              descCat = "Solicitud de seguimiento sin foto";
              iconoActual7 = icont5;
              break;
            case 6:
              estaSel = selCat6;
              titCat = "Catfish y engaños";
              descCat = "Mensaje directo: ¡Ganaste un premio!";
              iconoActual7 = icont6;
              break;
            case 7:
              estaSel = selCat7;
              titCat = "Mensajes violentos";
              subAmbar = "Advertencia: ";
              descCat = "Mensaje con contenido sensible";
              iconoActual7 = icont7;
              break;
          }

          int hoverCard = 0;
          if (t7 >= 115 && mouseX >= xCel7 && mouseX <= xCel7 + wCel7 && mouseY >= yCard && mouseY <= yCard + altoNotif) {
            hoverCard = 1;
            cursor(HAND);
          }

          if (estaSel == 1) {
            fill(22, 76, 62, 245);
            stroke(85, 240, 180);
            strokeWeight(2);
          } else {
            if (hoverCard == 1) {
              fill(20, 38, 50, 240);
              stroke(226, 204, 148);
              strokeWeight(1.5);
            } else {
              fill(14, 26, 36, 235);
              stroke(48, 72, 84);
              strokeWeight(1);
            }
          }
          rect(xCel7, yCard, wCel7, altoNotif, 5);

          int xIcono = xCel7 + 6;
          int yIcono = yCard + 5;
          int tamIcono = 54;
          image(iconoActual7, xIcono, yIcono, tamIcono, tamIcono);

          noFill();
          if (estaSel == 1) {
            stroke(85, 240, 180, 180);
          } else {
            stroke(55, 255, 175, 95);
          }
          strokeWeight(1);
          rect(xIcono, yIcono, tamIcono, tamIcono, 3);

          textFont(fuenteOpciones);
          textAlign(LEFT, TOP);
          textSize(14);
          if (estaSel == 1) {
            fill(165, 255, 220);
          } else {
            fill(55, 255, 175);
          }
          text(titCat, xIcono + 62, yCard + 6);

          textFont(fuenteVinetas);
          textAlign(RIGHT, TOP);
          textSize(10);
          if (estaSel == 1) {
            fill(165, 255, 215);
            text("[✓ EVIDENCIA]", xCel7 + wCel7 - 8, yCard + 8);
          } else {
            if (hoverCard == 1) {
              fill(226, 204, 148);
              text("[ELEGIR]", xCel7 + wCel7 - 8, yCard + 8);
            }
          }

          textFont(fuenteVinetas);
          textAlign(LEFT, TOP);
          textSize(12);
          textLeading(14);
          if (c == 2 || c == 7) {
            fill(235, 195, 115);
            text(subAmbar, xIcono + 62, yCard + 25);
            if (estaSel == 1) { fill(245, 255, 250); } else { fill(225, 232, 230); }
            if (c == 2) {
              text("Actualización local", xIcono + 62, yCard + 40);
            } else {
              text("Mensaje con", xIcono + 154, yCard + 25);
              text("contenido sensible", xIcono + 62, yCard + 40);
            }
          } else {
            if (estaSel == 1) {
              fill(245, 255, 250);
            } else {
              fill(225, 232, 230);
            }
            text(descCat, xIcono + 62, yCard + 25, wCel7 - 72, 36);
          }
        }
      }

      if (t7 >= 115) {
        int xBtnAnalizar = xCel7;
        int yBtnAnalizar = 640 + offsetY7;
        int wBtnAnalizar = wCel7;
        int hBtnAnalizar = 36;

        if (totalElegidos == 2) {
          if (mouseX >= xBtnAnalizar && mouseX <= xBtnAnalizar + wBtnAnalizar && mouseY >= yBtnAnalizar && mouseY <= yBtnAnalizar + hBtnAnalizar) {
            cursor(HAND);
            fill(105, 250, 190);
            stroke(220, 255, 240);
            strokeWeight(2);
          } else {
            fill(75, 225, 165);
            stroke(150, 255, 215);
            strokeWeight(1.5);
          }
          rect(xBtnAnalizar, yBtnAnalizar, wBtnAnalizar, hBtnAnalizar, 6);

          fill(14, 34, 28);
          textFont(fuenteNitida);
          textSize(14);
          textAlign(CENTER, CENTER);
          text("[ INICIAR ANÁLISIS DE EVIDENCIA >> ]", cxCel7, yBtnAnalizar + (hBtnAnalizar / 2));
        } else {
          fill(18, 30, 40, 220);
          stroke(65, 95, 110);
          strokeWeight(1.2);
          rect(xBtnAnalizar, yBtnAnalizar, wBtnAnalizar, hBtnAnalizar, 6);

          fill(140, 170, 175);
          textFont(fuenteVinetas);
          textSize(13);
          textAlign(CENTER, CENTER);
          text("[ SELECCIONADOS: " + totalElegidos + " / 2 ]", cxCel7, yBtnAnalizar + (hBtnAnalizar / 2));
        }
      }

      int xLib7 = 968;
      int yLibOff7 = offsetY7;
      textFont(fuenteVinetas);
      textAlign(LEFT, TOP);

      textSize(14);
      fill(28, 26, 22);
      text("TELEMETRÍA DE INVESTIGACIÓN //", xLib7, 384 + yLibOff7);

      noStroke();
      fill(28, 28, 24, 235);
      rect(xLib7 - 2, 410 + yLibOff7, 276, 28, 3);

      textSize(15);
      fill(245, 248, 242);
      textAlign(LEFT, CENTER);
      text("AGENTE: " + regNombre, xLib7 + 8, 424 + yLibOff7);

      fill(28, 28, 24, 235);
      rect(xLib7 - 2, 444 + yLibOff7, 244, 28, 3);

      textSize(15);
      fill(245, 248, 242);
      text("RIESGO ACTUAL:", xLib7 + 8, 458 + yLibOff7);

      if (puntosRiesgo >= 25) {
        fill(245, 85, 75);
      } else {
        fill(55, 255, 175);
      }
      text(puntosRiesgo + " PTS", xLib7 + 152, 458 + yLibOff7);

      textAlign(LEFT, TOP);
      fill(28, 26, 22);
      textSize(16);
      text("Elegidos: " + totalElegidos + " de 2", xLib7 + 4, 486 + yLibOff7);

      textSize(13);
      fill(20, 95, 58);
      String nomCaso1 = "1. [Sin seleccionar]";
      if (casoElegido1 == 1) { nomCaso1 = "1. Educativo"; }
      if (casoElegido1 == 2) { nomCaso1 = "1. Noticias oficiales"; }
      if (casoElegido1 == 3) { nomCaso1 = "1. Entretenimiento"; }
      if (casoElegido1 == 4) { nomCaso1 = "1. Creadores"; }
      if (casoElegido1 == 5) { nomCaso1 = "1. Perfiles anónimos"; }
      if (casoElegido1 == 6) { nomCaso1 = "1. Catfish y engaños"; }
      if (casoElegido1 == 7) { nomCaso1 = "1. Mensajes violentos"; }
      text(nomCaso1, xLib7 + 4, 514 + yLibOff7);

      String nomCaso2 = "2. [Sin seleccionar]";
      if (casoElegido2 == 1) { nomCaso2 = "2. Educativo"; }
      if (casoElegido2 == 2) { nomCaso2 = "2. Noticias oficiales"; }
      if (casoElegido2 == 3) { nomCaso2 = "2. Entretenimiento"; }
      if (casoElegido2 == 4) { nomCaso2 = "2. Creadores"; }
      if (casoElegido2 == 5) { nomCaso2 = "2. Perfiles anónimos"; }
      if (casoElegido2 == 6) { nomCaso2 = "2. Catfish y engaños"; }
      if (casoElegido2 == 7) { nomCaso2 = "2. Mensajes violentos"; }
      text(nomCaso2, xLib7 + 4, 536 + yLibOff7);

      textSize(14);
      textLeading(18);
      if (alertaMaxContenidos == 1) {
        fill(185, 35, 30);
        text("¡Máximo 2 contenidos!\nDesmarca uno para\ncambiar.", xLib7 + 4, 572 + yLibOff7, 215, 75);
      } else {
        fill(35, 32, 28);
        text("Haz clic otra vez en\nuna tarjeta elegida\npara quitarla.", xLib7 + 4, 572 + yLibOff7, 215, 75);
      }

      if (mouseX >= 25 && mouseX <= 165 && mouseY >= 18 && mouseY <= 52) {
        fill(55, 255, 175);
        cursor(HAND);
      } else {
        fill(235, 240, 245);
      }
      textFont(fuenteVinetas);
      textSize(17);
      textAlign(LEFT, TOP);
      text("<- [ESC] MENÚ", 28, 22);
      break;
    case 8:
      image(imgCasos, 0, 0, width, height);

      cursor(ARROW);

      // ============================================================
      // 1. HUD SUPERIOR EN LA FRANJA NEGRA (y: 0 a 58)
      // ============================================================
      noStroke();
      fill(12, 18, 28, 240);
      rect(0, 0, width, 58);

      // Botón izquierdo completo: <- [ESC] MENÚ
      if (mouseX >= 22 && mouseX <= 195 && mouseY >= 14 && mouseY <= 44) {
        fill(55, 255, 175);
        cursor(HAND);
      } else {
        fill(235, 242, 245);
      }
      textFont(fuenteVinetas);
      textSize(17);
      textAlign(LEFT, CENTER);
      text("<- [ESC] MENÚ", 26, 29);

      // Etiqueta DÍA ACTUAL
      fill(22, 68, 56);
      stroke(55, 255, 175);
      strokeWeight(1.5);
      rect(225, 14, 72, 30, 5);
      fill(165, 255, 215);
      textFont(fuenteOpciones);
      textSize(15);
      textAlign(CENTER, CENTER);
      text("DÍA " + diaActual, 261, 29);

      // 7 Cuadros del calendario semanal
      for (int d = 1; d <= 7; d = d + 1) {
        int xDiaHud = 310 + ((d - 1) * 32);
        if (d < diaActual) {
          fill(46, 158, 107);
          stroke(110, 245, 180);
          strokeWeight(1.5);
        } else {
          if (d == diaActual) {
            fill(235, 195, 110);
            stroke(255, 235, 165);
            strokeWeight(2);
          } else {
            fill(34, 46, 62);
            stroke(75, 95, 115);
            strokeWeight(1);
          }
        }
        rect(xDiaHud, 16, 26, 26, 4);
      }

      // Barra de progreso de 10 bloques
      int bloquesHud = (diasJugados * 10) / 7;
      if (bloquesHud < 1 && diaActual == 1) { bloquesHud = 1; }
      noFill();
      stroke(55, 255, 175, 160);
      strokeWeight(1.5);
      rect(565, 15, 232, 28, 5);

      noStroke();
      for (int b = 1; b <= 10; b = b + 1) {
        if (b <= bloquesHud) {
          fill(55, 255, 175);
        } else {
          fill(28, 42, 54);
        }
        rect(570 + ((b - 1) * 22), 19, 19, 20, 3);
      }

      // Nivel actual (BLOQUE T2)
      textFont(fuenteVinetas);
      textSize(13);
      textAlign(LEFT, CENTER);
      fill(226, 204, 148);
      text("NIVEL " + nivel + " · " + nombreNivel, 815, 29);

      // Indicador de RIESGO a la derecha del HUD
      textFont(fuenteOpciones);
      textSize(18);
      textAlign(RIGHT, CENTER);
      if (puntosRiesgo >= 25) {
        fill(245, 85, 75);
      } else {
        if (puntosRiesgo >= 10) {
          fill(235, 195, 110);
        } else {
          fill(55, 255, 175);
        }
      }
      text("RIESGO: " + puntosRiesgo + " PTS", width - 28, 29);

      // ============================================================
      // 2. PANTALLA DEL CELULAR CENTRADO (Ancho real exacto: x 368..684)
      // ============================================================
      int xCel8 = 368;
      int wCel8 = 316;
      int cxCel8 = 526;

      // Barra de estado superior (Fecha y Hora sincronizadas)
      textFont(fuenteNitida);
      textSize(12);
      textAlign(LEFT, TOP);
      fill(55, 255, 175);
      text(textoFecha, xCel8 + 8, 82);

      String franjaTxt8 = "AM";
      if (regFranjaNum == 2) { franjaTxt8 = "PM"; }
      String minCel8 = "" + regMinuto;
      if (regMinuto < 10) { minCel8 = "0" + regMinuto; }
      textAlign(RIGHT, TOP);
      fill(235, 215, 150);
      text(regHora12 + ":" + minCel8 + " " + franjaTxt8, xCel8 + wCel8 - 8, 82);

      // Encabezado del caso activo
      fill(20, 44, 52);
      stroke(55, 255, 175, 130);
      strokeWeight(1);
      rect(xCel8 + 8, 102, wCel8 - 16, 24, 4);

      textSize(11);
      fill(235, 215, 150);
      textAlign(CENTER, CENTER);
      if (diaActual == 7) {
        text("CASO ACTIVO // JORNADA 07 · PERFIL " + decisionDia + " DE 3", cxCel8, 114);
      } else {
        text("CASO ACTIVO // JORNADA 0" + diaActual, cxCel8, 114);
      }

      // Descripción / Situación del caso
      textSize(13);
      textLeading(15);
      fill(235, 248, 242);
      textAlign(LEFT, TOP);
      text(situacionCaso8, xCel8 + 10, 134, wCel8 - 20, 52);

      // ============================================================
      // ZONA ROJA: VISOR DEL PERFIL (300 x 328 px dentro del marco)
      // ============================================================
      int xVisor8 = xCel8 + 8;   // 376
      int yVisor8 = 190;
      int wVisor8 = wCel8 - 16;  // 300
      int hVisor8 = 328;

      // Coordenadas de las 4 zonas de pistas sobre el visor
      int xP1 = xVisor8 + 185;   // Zona 1: Usuario y bio (@valen.tina_2009x)
      int yP1 = yVisor8 + 74;
      int xP2 = cxCel8;          // Zona 2: Estadísticas (3 / 12 / 1.843)
      int yP2 = yVisor8 + 144;
      int xP3 = xVisor8 + 64;    // Zona 3: Avatar con gafas
      int yP3 = yVisor8 + 80;
      int xP4 = cxCel8;          // Zona 4: 3 fotos inferiores
      int yP4 = yVisor8 + 230;

      // Tarjeta del perfil del día (una imagen por perfil)
      image(imgPerfilActual, xVisor8 - 64, yVisor8 - 22, wVisor8 + 128, hVisor8 + 44);

      // Animación temporal del sonar dorado
      int tSonar = frameCount - frameSonar;
      float pulsoRadio = sin(frameCount * 0.14) * 6.0;

      for (int p = 1; p <= 4; p = p + 1) {
        int px = 0;
        int py = 0;
        int pVista = 0;
        if (p == 1) { px = xP1; py = yP1; pVista = pistaVista1; }
        if (p == 2) { px = xP2; py = yP2; pVista = pistaVista2; }
        if (p == 3) { px = xP3; py = yP3; pVista = pistaVista3; }
        if (p == 4) { px = xP4; py = yP4; pVista = pistaVista4; }

        if (pVista == 0) {
          float distLupa = dist(mouseX, mouseY, px, py);
          if (tSonar < 150 || distLupa < 48) {
            float alphaAro = 235;
            if (distLupa >= 48 && tSonar > 110) {
              alphaAro = (150 - tSonar) * 5.7;
            }
            noFill();
            stroke(245, 205, 95, alphaAro);
            strokeWeight(3);
            circle(px, py, 34 + pulsoRadio);
            stroke(245, 205, 95, alphaAro * 0.45);
            strokeWeight(1.5);
            circle(px, py, 46 + pulsoRadio);
          }
        }
      }

      // ============================================================
      // ZONA VERDE: BOTONES [A], [B], [C] DENTRO DEL MARCO (x 376..676)
      // ============================================================
      int wBtnDec = 94;
      int hBtnDec = 104;
      int yBtnDec = 532;
      int puedeDecidir = 0;
      if (pistasHalladas >= pistasMinimas) { puedeDecidir = 1; }

      for (int b = 1; b <= 3; b = b + 1) {
        int xBtnD = xVisor8 + ((b - 1) * 103); // 376, 479, 582 -> termina en 676
        int hoverDec = 0;
        if (mouseX >= xBtnD && mouseX <= xBtnD + wBtnDec && mouseY >= yBtnDec && mouseY <= yBtnDec + hBtnDec) {
          hoverDec = 1;
          cursor(HAND);
        }

        fill(12, 20, 30);
        if (puedeDecidir == 1) {
          if (hoverDec == 1) {
            stroke(55, 255, 175);
            strokeWeight(2.5);
          } else {
            stroke(55, 255, 175, 170);
            strokeWeight(1.5);
          }
        } else {
          stroke(70, 90, 105);
          strokeWeight(1);
        }
        rect(xBtnD, yBtnDec, wBtnDec, hBtnDec, 6);

        textFont(fuenteNitida);
        textSize(11);
        textAlign(LEFT, TOP);
        if (puedeDecidir == 1) { fill(55, 255, 175); } else { fill(120, 140, 150); }
        if (b == 1) { text("A]", xBtnD + 6, yBtnDec + 5); }
        if (b == 2) { text("B]", xBtnD + 6, yBtnDec + 5); }
        if (b == 3) { text("C]", xBtnD + 6, yBtnDec + 5); }

        PImage imgOpcionActual = imgOpA;
        if (b == 2) { imgOpcionActual = imgOpB; }
        if (b == 3) { imgOpcionActual = imgOpC; }

        if (puedeDecidir == 0) {
          tint(150, 165, 175, 135);
        } else {
          noTint();
        }
        image(imgOpcionActual, xBtnD + 20, yBtnDec + 16, 54, 54);
        noTint();

        textSize(11);
        textAlign(CENTER, CENTER);
        if (puedeDecidir == 1) { fill(235, 248, 242); } else { fill(120, 140, 150); }
        if (b == 1) { text(opAEtiq, xBtnD + 47, yBtnDec + 88); }
        if (b == 2) { text(opBEtiq, xBtnD + 47, yBtnDec + 88); }
        if (b == 3) { text(opCEtiq, xBtnD + 47, yBtnDec + 88); }
      }

      // ============================================================
      // 3. LIBRETA AMARILLA (TIPOGRAFÍA DE LIBRETA RESTAURADA)
      // ============================================================
      int xLib8 = 898;
      int wLib8 = 232;
      textFont(fuenteVinetas);
      textAlign(LEFT, TOP);

      textSize(13);
      fill(28, 26, 22);
      text("TELEMETRÍA // AGENTE: " + regNombre, xLib8, 254, wLib8, 22);

      // Franja oscura ajustada exactamente dentro de la hoja amarilla
      noStroke();
      fill(28, 28, 24, 235);
      rect(xLib8, 276, wLib8, 26, 3);
      textSize(14);
      fill(245, 248, 242);
      textAlign(LEFT, CENTER);
      text("RIESGO ACTUAL:", xLib8 + 8, 289);
      if (puntosRiesgo >= 25) { fill(245, 85, 75); } else { fill(55, 255, 175); }
      text(puntosRiesgo + " PTS", xLib8 + 144, 289);

      // Contador de Pistas Halladas
      textAlign(LEFT, TOP);
      fill(28, 26, 22);
      textSize(14);
      text("Pistas halladas (" + pistasHalladas + "/4):", xLib8, 314);

      // Listado en tinta roja oscura dentro del ancho wLib8
      textSize(11);
      textLeading(13);
      fill(175, 32, 28);
      int yPistaLib = 338;
      if (pistaVista1 == 1) { text("• " + txtPista1, xLib8, yPistaLib, wLib8, 28); yPistaLib = yPistaLib + 24; }
      if (pistaVista2 == 1) { text("• " + txtPista2, xLib8, yPistaLib, wLib8, 28); yPistaLib = yPistaLib + 24; }
      if (pistaVista3 == 1) { text("• " + txtPista3, xLib8, yPistaLib, wLib8, 28); yPistaLib = yPistaLib + 24; }
      if (pistaVista4 == 1) { text("• " + txtPista4, xLib8, yPistaLib, wLib8, 28); yPistaLib = yPistaLib + 24; }

      if (pistasHalladas == 0) {
        fill(85, 78, 68);
        text("Usa la lupa sobre el perfil\ny haz clic en los círculos\ndorados para investigar.", xLib8, 340, wLib8, 60);
      }

      // Opciones de decisión con prefijos [A], [B], [C]
      fill(28, 26, 22);
      textSize(13);
      text("Opciones de decisión:", xLib8, 444);

      textSize(12);
      if (puedeDecidir == 1) {
        fill(20, 75, 48);
      } else {
        fill(85, 80, 72);
      }
      text(opATexto8, xLib8, 468, wLib8, 22);
      text(opBTexto8, xLib8, 492, wLib8, 22);
      text(opCTexto8, xLib8, 516, wLib8, 22);

      if (frameCount - avisoSinPistas < 140) {
        noStroke();
        fill(185, 35, 30);
        rect(xLib8, 550, wLib8, 44, 4);
        fill(255, 248, 245);
        textSize(11);
        textAlign(CENTER, CENTER);
        text("¡INVESTIGA PRIMERO!\nHalla mínimo " + pistasMinimas + " pistas con la lupa.", xLib8 + (wLib8 / 2), 572);
      } else {
        if (puedeDecidir == 0) {
          fill(165, 42, 35);
          textSize(11);
          textAlign(LEFT, TOP);
          text("* Halla mínimo " + pistasMinimas + " pistas para\ndesbloquear A, B, C.", xLib8, 554, wLib8, 40);
        }
      }

      // ============================================================
      // 4. ÚNICA LUPA TRANSPARENTE SIGUIENDO EL CURSOR EN EL VISOR
      // ============================================================
      if (mouseX >= xVisor8 && mouseX <= xVisor8 + wVisor8 && mouseY >= yVisor8 && mouseY <= yVisor8 + hVisor8) {
        noCursor();

        stroke(15, 28, 34);
        strokeWeight(8);
        line(mouseX + 24, mouseY + 24, mouseX + 48, mouseY + 48);
        stroke(115, 145, 130);
        strokeWeight(4);
        line(mouseX + 24, mouseY + 24, mouseX + 48, mouseY + 48);

        noStroke();
        fill(120, 255, 230, 32);
        ellipse(mouseX, mouseY, 68, 68);

        noFill();
        stroke(15, 28, 34);
        strokeWeight(6);
        ellipse(mouseX, mouseY, 70, 70);
        stroke(55, 255, 175);
        strokeWeight(3);
        ellipse(mouseX, mouseY, 70, 70);

        stroke(240, 255, 255, 200);
        strokeWeight(2.5);
        arc(mouseX, mouseY, 50, 50, PI + 0.35, PI + 1.35);
        noStroke();
      }
      break;
    // ==============================================================
    // PANTALLA 9: VEREDICTO DE LA DECISIÓN (buena, regular o mala) · Jufra
    // El celular muestra si la decisión fue SEGURA, REGULAR o RIESGOSA y la
    // libreta explica qué pasó. botonSobre: 2 continuar
    // ==============================================================
    case 9:
      image(imgCasos, 0, 0, width, height);
      cursor(ARROW);
      int tVer = frameCount - frameInicioEscena;

      // franja superior
      noStroke();
      fill(12, 18, 28, 240);
      rect(0, 0, width, 58);
      textFont(fuenteVinetas);
      textSize(17);
      textAlign(LEFT, CENTER);
      fill(235, 242, 245);
      text("VEREDICTO · DÍA " + diaActual + " · NIVEL " + nivel + " · " + nombreNivel, 26, 29);
      textFont(fuenteOpciones);
      textSize(18);
      textAlign(RIGHT, CENTER);
      if (puntosRiesgo >= 25) {
        fill(245, 85, 75);
      } else {
        if (puntosRiesgo >= 10) { fill(235, 195, 110); } else { fill(55, 255, 175); }
      }
      text("RIESGO: " + puntosRiesgo + " PTS", width - 28, 29);

      // colores según el tipo de decisión (0 segura, 1 regular, 2 riesgosa)
      int rVer = 55;
      int gVer = 255;
      int bVer = 175;
      String tituloVer = "DECISIÓN SEGURA";
      switch (tipoOpcion) {
        case 1:
          rVer = 245; gVer = 200; bVer = 95;
          tituloVer = "DECISIÓN REGULAR";
          break;
        case 2:
          rVer = 245; gVer = 90; bVer = 80;
          tituloVer = "DECISIÓN RIESGOSA";
          break;
      }

      // pantalla del celular: destello del color del veredicto
      int alfaDestello = 160 - (tVer * 6);
      if (alfaDestello < 0) { alfaDestello = 0; }
      fill(rVer, gVer, bVer, alfaDestello);
      rect(370, 72, 312, 570, 18);

      // panel del veredicto con el ícono que crece
      fill(14, 24, 34, 240);
      stroke(rVer, gVer, bVer);
      strokeWeight(2);
      rect(378, 100, 296, 290, 10);

      float escalaVer = tVer / 18.0;
      if (escalaVer > 1) { escalaVer = 1; }
      pushMatrix();
      translate(526, 200);
      scale(escalaVer);
      noFill();
      stroke(rVer, gVer, bVer);
      strokeWeight(7);
      circle(0, 0, 130);
      strokeWeight(12);
      switch (tipoOpcion) {
        case 0:
          // visto bueno
          line(-34, 2, -10, 28);
          line(-10, 28, 38, -26);
          break;
        case 1:
          // signo de advertencia
          line(0, -38, 0, 12);
          noStroke();
          fill(rVer, gVer, bVer);
          circle(0, 34, 14);
          break;
        case 2:
          // equis
          line(-30, -30, 30, 30);
          line(30, -30, -30, 30);
          break;
      }
      popMatrix();

      textFont(fuenteOpciones);
      textSize(23);
      textAlign(CENTER, CENTER);
      fill(rVer, gVer, bVer);
      text(tituloVer, 526, 298);
      textFont(fuenteVinetas);
      textSize(16);
      fill(235, 248, 242);
      if (puntosDecision == 0) {
        text("+0 puntos de riesgo", 526, 330);
      } else {
        text("+" + puntosDecision + " puntos de riesgo (nivel " + nivel + ")", 526, 330);
      }
      textSize(12);
      fill(170, 195, 195);
      text("Riesgo de las decisiones de hoy: " + puntosDecisiones, 526, 360);

      // lo que eligió el jugador
      fill(16, 30, 42, 235);
      stroke(55, 255, 175, 90);
      strokeWeight(1);
      rect(378, 404, 296, 120, 8);
      textAlign(LEFT, TOP);
      textSize(12);
      fill(226, 204, 148);
      text("ELEGISTE:", 390, 414);
      textSize(14);
      textLeading(18);
      fill(240, 248, 250);
      text(textoOpcionElegida, 390, 434, 272, 40);
      textSize(12);
      fill(170, 195, 195);
      text("Perfil: " + tituloCaso8, 390, 478, 272, 36);

      // botón continuar dentro del celular
      String textoContinuar = "CONTINUAR >>";
      if (decisionDia < decisionesDelDia && identidadRobada == 0) {
        textoContinuar = "SIGUIENTE PERFIL >>";
      }
      if (tVer > 25) {
        if (mouseX >= 378 && mouseX <= 674 && mouseY >= 560 && mouseY <= 604) {
          botonSobre = 2;
          cursor(HAND);
          fill(105, 250, 190);
          stroke(220, 255, 240);
          strokeWeight(2);
        } else {
          fill(75, 225, 165);
          stroke(150, 255, 215);
          strokeWeight(1.5);
        }
        rect(378, 560, 296, 44, 8);
        fill(14, 34, 28);
        textFont(fuenteOpciones);
        textSize(17);
        textAlign(CENTER, CENTER);
        text("[ " + textoContinuar + " ]", 526, 581);
      }

      // libreta amarilla: qué pasó y cómo va la investigación
      int xLibV = 898;
      int wLibV = 232;
      textFont(fuenteVinetas);
      textAlign(LEFT, TOP);
      textSize(14);
      fill(28, 26, 22);
      text("VEREDICTO // CASO " + diaActual, xLibV, 254);
      noStroke();
      fill(28, 28, 24, 235);
      rect(xLibV, 276, wLibV, 26, 3);
      textSize(14);
      textAlign(LEFT, CENTER);
      fill(rVer, gVer, bVer);
      text(tituloVer, xLibV + 8, 289);

      textAlign(LEFT, TOP);
      textSize(14);
      textLeading(18);
      fill(35, 30, 26);
      text(retroElegida, xLibV, 312, wLibV, 96);

      textSize(13);
      fill(20, 95, 58);
      text("Pistas halladas: " + pistasHalladas + " de 4", xLibV, 414);
      text("Racha de decisiones seguras: " + racha, xLibV, 434);
      text("Correctas: " + decisionesCorrectas + " · Incorrectas: " + decisionesIncorrectas, xLibV, 454);

      if (logroEnVeredicto == 1) {
        fill(185, 140, 30);
        rect(xLibV, 482, wLibV, 40, 4);
        fill(255, 250, 235);
        textAlign(CENTER, CENTER);
        textSize(13);
        text("¡LOGRO DESBLOQUEADO!\nOJO DE HALCÓN", xLibV + (wLibV / 2), 502);
      }
      if (identidadRobada == 1) {
        fill(185, 35, 30);
        rect(xLibV, 530, wLibV, 56, 4);
        fill(255, 248, 245);
        textAlign(CENTER, CENTER);
        textSize(12);
        text("¡ALERTA! Entregaste tu clave:\ntu identidad digital fue robada.\nLa semana termina hoy.", xLibV + (wLibV / 2), 558);
      }
      break;

    // ==============================================================
    // PANTALLA 10: RESUMEN DEL DÍA (pantalla de puntajes) · Jufra
    // El monitor forense imprime el cierre de la jornada: de dónde salió cada
    // punto, la clasificación del día, el progreso, los logros y el consejo.
    // botonSobre: 2 siguiente día o informe final
    // ==============================================================
    case 10:
      image(imgConsolaSesion, 0, 0, width, height);
      cursor(ARROW);
      int tRes = frameCount - frameInicioEscena;

      // luz de encendido del monitor
      noStroke();
      if ((frameCount / 18) % 2 == 0) { fill(65, 255, 145, 230); } else { fill(35, 130, 75, 140); }
      rect(1002, 629, 14, 5, 2);

      // líneas de escaneo del monitor
      stroke(55, 255, 175, 12);
      strokeWeight(1);
      for (int yLinea = 140; yLinea < 590; yLinea = yLinea + 6) {
        line(206, yLinea, 1074, yLinea);
      }

      int xRes = 222;
      int dRes = 860;          // borde derecho de la columna de puntos
      textFont(fuenteVinetas);
      textSize(14);
      textAlign(LEFT, TOP);

      // cada línea aparece unos frames después de la anterior (efecto de impresión)
      if (tRes > 0) {
        fill(55, 255, 175);
        text("C:\\Fiscalia\\Agente_" + regNombre + "> cierre_jornada.exe " + diaActual, xRes, 150);
      }
      if (tRes > 10) {
        fill(226, 204, 148);
        text("=== CIERRE DE LA JORNADA " + diaActual + " · " + textoDiaSemana + " " + textoFecha + " ===", xRes, 176);
      }
      if (tRes > 20) {
        fill(210, 240, 230);
        text("Ingreso: " + textoIngreso + "   Salida: " + sesHoraSalidaTexto + " (" + textoDiaSemanaSal + " " + textoFechaSalida + ")", xRes, 204);
      }
      if (tRes > 30) {
        fill(210, 240, 230);
        text("Horas de uso: " + regHorasUso + " h", xRes, 230);
        textAlign(RIGHT, TOP);
        if (puntosTiempo == 0) { fill(55, 255, 175); } else { fill(255, 215, 95); }
        text("+" + puntosTiempo, dRes, 230);
        textAlign(LEFT, TOP);
      }
      if (tRes > 40) {
        fill(210, 240, 230);
        if (puntosHorario == 0) {
          text("Horario: dentro del horario saludable (8 a. m. - 8 p. m.)", xRes, 254);
        } else {
          text("Horario: fuera del horario saludable (8 a. m. - 8 p. m.)", xRes, 254);
        }
        textAlign(RIGHT, TOP);
        if (puntosHorario == 0) { fill(55, 255, 175); } else { fill(255, 215, 95); }
        text("+" + puntosHorario, dRes, 254);
        textAlign(LEFT, TOP);
      }
      if (tRes > 50) {
        fill(210, 240, 230);
        text("Contenido: " + nombreContenido1 + " y " + nombreContenido2, xRes, 278);
        textAlign(RIGHT, TOP);
        if (puntosContenido == 0) { fill(55, 255, 175); } else { fill(255, 215, 95); }
        text("+" + puntosContenido, dRes, 278);
        textAlign(LEFT, TOP);
      }
      if (tRes > 60) {
        fill(210, 240, 230);
        if (decisionesDelDia == 1) {
          text("Decisión del caso: " + tituloCaso8, xRes, 302);
        } else {
          text("Decisiones del caso: " + tituloCaso8 + " (3 perfiles)", xRes, 302);
        }
        textAlign(RIGHT, TOP);
        if (puntosDecisiones == 0) { fill(55, 255, 175); } else { fill(255, 215, 95); }
        text("+" + puntosDecisiones, dRes, 302);
        textAlign(LEFT, TOP);
      }
      if (tRes > 70) {
        stroke(55, 255, 175, 140);
        strokeWeight(1);
        line(xRes, 330, dRes, 330);
        noStroke();
        textFont(fuenteOpciones);
        textSize(19);
        fill(245, 255, 250);
        text("PUNTAJE DEL DÍA: " + puntajeDia, xRes, 340);
        textAlign(RIGHT, TOP);
        if (puntajeDia < 5) {
          fill(55, 255, 175);
        } else {
          if (puntajeDia <= 13) { fill(255, 215, 95); } else { fill(255, 110, 95); }
        }
        text(clasificacionDia, dRes, 340);
        textAlign(LEFT, TOP);
        textFont(fuenteVinetas);
        textSize(14);
        fill(210, 240, 230);
        text("Riesgo acumulado de la semana: " + puntosRiesgo + " puntos", xRes, 372);
      }
      if (tRes > 85) {
        fill(226, 204, 148);
        text("CONSEJO DEL DÍA:", xRes, 404);
        fill(225, 245, 238);
        textLeading(19);
        text(textoConsejo, xRes, 424, 630, 44);
      }
      if (tRes > 95 && logroNuevo == 1) {
        float brilloLogro = (sin(frameCount * 0.12) + 1) * 40;
        fill(185, 140, 30, 175 + brilloLogro);
        rect(xRes, 474, 630, 34, 5);
        fill(255, 250, 230);
        textFont(fuenteOpciones);
        textSize(16);
        textAlign(CENTER, CENTER);
        text("¡LOGRO DESBLOQUEADO! " + textoLogroNuevo, xRes + 315, 490);
        textAlign(LEFT, TOP);
      }

      // ==== columna derecha: progreso, nivel y logros ====
      int xTelR = 896;
      textFont(fuenteVinetas);
      textSize(13);
      textAlign(LEFT, TOP);
      fill(210, 240, 230);
      text("PROGRESO SEMANAL", xTelR, 152);

      // CICLO PARA: barra de progreso de 10 bloques (días terminados de 7)
      int bloquesRes = (diasJugados * 10) / 7;
      for (int bloque = 1; bloque <= 10; bloque = bloque + 1) {
        if (bloque <= bloquesRes) { fill(55, 255, 175); } else { fill(28, 42, 54); }
        noStroke();
        rect(xTelR + ((bloque - 1) * 16), 174, 14, 16, 2);
      }
      fill(245, 255, 250);
      text(diasJugados + " de 7 días · " + (diasJugados * 100 / 7) + " %", xTelR, 198);

      fill(160, 195, 185);
      text("NIVEL " + nivel + ":", xTelR, 226);
      fill(245, 255, 250);
      text(nombreNivel, xTelR, 244);

      fill(160, 195, 185);
      text("LOGROS (" + logrosObtenidos + " de 5):", xTelR, 274);
      // CICLO PARA: los 5 logros, ganados en dorado y bloqueados en gris
      textSize(12);
      for (int numLogro = 1; numLogro <= 5; numLogro = numLogro + 1) {
        int ganado = 0;
        String nombreLogro = "";
        switch (numLogro) {
          case 1: ganado = logroFakeNews; nombreLogro = "Detective Fake News"; break;
          case 2: ganado = logroPrivacidad; nombreLogro = "Guardián Privacidad"; break;
          case 3: ganado = logroTiempo; nombreLogro = "Rey del Tiempo"; break;
          case 4: ganado = logroBienestar; nombreLogro = "Bienestar Digital"; break;
          case 5: ganado = logroOjoHalcon; nombreLogro = "Ojo de Halcón"; break;
        }
        if (ganado == 1) {
          fill(245, 205, 95);
          text("[*] " + nombreLogro, xTelR, 296 + ((numLogro - 1) * 20));
        } else {
          fill(95, 120, 125);
          text("[ ] " + nombreLogro, xTelR, 296 + ((numLogro - 1) * 20));
        }
      }

      // ==== barra inferior: estado y botón ====
      textFont(fuenteVinetas);
      textSize(13);
      textAlign(LEFT, CENTER);
      if (identidadRobada == 1) {
        fill(255, 120, 100);
        text("> ALERTA: identidad comprometida. La investigación termina hoy.", 215, 562);
      } else {
        if (diaActual == 7) {
          fill(55, 255, 175);
          text("> Semana completa. El informe final está listo.", 215, 562);
        } else {
          fill(160, 220, 200);
          text("> Jornada " + diaActual + " guardada. Mañana te espera un caso nuevo.", 215, 562);
        }
      }

      String textoBotonRes = "SIGUIENTE DÍA >>";
      if (diaActual == 7 || identidadRobada == 1) {
        textoBotonRes = "VER INFORME FINAL >>";
      }
      if (tRes > 30) {
        if (mouseX >= 868 && mouseX <= 1066 && mouseY >= 546 && mouseY <= 578) {
          botonSobre = 2;
          cursor(HAND);
          fill(55, 255, 175, 65);
          stroke(55, 255, 175);
          strokeWeight(2);
        } else {
          fill(16, 36, 48);
          stroke(55, 255, 175);
          strokeWeight(1.5);
        }
        rect(868, 546, 198, 32, 4);
        fill(245, 255, 250);
        textSize(13);
        textAlign(CENTER, CENTER);
        text(textoBotonRes, 967, 562);
      }
      break;

    // ==============================================================
    // PANTALLA 11: INFORME FINAL DE LA SEMANA (Jufra dibuja · Tomás calculó en T4)
    // Datos básicos, estadísticas de juego, gráfico de horas por día,
    // clasificación y diagnóstico. botonSobre: 2 ver el final
    // ==============================================================
    case 11:
      image(imgFondoInforme, 0, 0, width, height);
      cursor(ARROW);
      int tInf = frameCount - frameInicioEscena;

      // encabezado
      fill(60, 50, 40);
      textAlign(CENTER, TOP);
      textFont(fuenteVinetas);
      textSize(16);
      text("- FISCALÍA GENERAL · UNIDAD CIBERNÉTICA · CASO FALSE ID -", width / 2, 62);
      textFont(fuenteOpciones);
      textSize(30);
      fill(40, 35, 30);
      text("INFORME FINAL DE LA SEMANA DIGITAL", width / 2, 86);
      stroke(70, 60, 50);
      strokeWeight(2);
      line(140, 126, 1140, 126);
      strokeWeight(1);
      line(140, 130, 1140, 130);
      noStroke();

      // ==== columna izquierda: datos y estadísticas ====
      int xInf = 170;
      textFont(fuenteVinetas);
      textAlign(LEFT, TOP);
      textSize(16);
      fill(40, 35, 30);
      text("AGENTE: " + regNombre + " · " + regEdad + " años", xInf, 142);

      fill(150, 40, 30);
      textSize(15);
      text("DATOS BÁSICOS", xInf, 174);
      fill(45, 40, 34);
      textSize(14);
      text("Hora de ingreso (día 1): " + textoFechaIngresoD1 + " · " + textoIngresoD1, xInf, 196);
      text("Hora de salida (día " + diasJugados + "): " + textoFechaSalidaFinal + " · " + textoSalidaFinal, xInf, 217);
      if (diasCompletos == 1) {
        text("Horas acumuladas: " + horasAcumuladas + " h (1 día y " + horasSobrantes + " horas)", xInf, 238);
      } else {
        text("Horas acumuladas: " + horasAcumuladas + " h (" + diasCompletos + " días y " + horasSobrantes + " horas)", xInf, 238);
      }
      text("Días equivalentes por año: " + textoDiasEquivalentes + " días en redes", xInf, 259);

      fill(150, 40, 30);
      textSize(15);
      text("ESTADÍSTICAS DE JUEGO", xInf, 292);
      fill(45, 40, 34);
      textSize(14);
      text("Días jugados: " + diasJugados + " de 7", xInf, 314);
      text("Decisiones correctas: " + decisionesCorrectas + " · incorrectas: " + decisionesIncorrectas, xInf, 335);
      text("Racha máxima de decisiones seguras: " + rachaMaxima, xInf, 356);
      text("Pistas encontradas con la lupa: " + pistasEncontradas, xInf, 377);
      text("Nivel alcanzado: " + nivel + " · " + nombreNivel, xInf, 398);
      text("Logros obtenidos: " + logrosObtenidos + " de 5", xInf, 419);
      String listaLogros = "";
      if (logroFakeNews == 1) { listaLogros = listaLogros + "Detective de Fake News · "; }
      if (logroPrivacidad == 1) { listaLogros = listaLogros + "Guardián de la Privacidad · "; }
      if (logroTiempo == 1) { listaLogros = listaLogros + "Rey del Tiempo · "; }
      if (logroBienestar == 1) { listaLogros = listaLogros + "Experto en Bienestar Digital · "; }
      if (logroOjoHalcon == 1) { listaLogros = listaLogros + "Ojo de Halcón · "; }
      if (logrosObtenidos == 0) { listaLogros = "Ninguno esta vez."; }
      textSize(12);
      fill(90, 75, 60);
      text(listaLogros, xInf, 438, 480, 34);
      textSize(14);
      fill(45, 40, 34);
      text("Puntaje digital acumulado: " + puntosRiesgo + " (promedio por día: " + textoPromedio + ")", xInf, 474);

      fill(150, 40, 30);
      textSize(15);
      text("CLASIFICACIÓN Y DIAGNÓSTICO", xInf, 506);
      textFont(fuenteOpciones);
      textSize(25);
      if (tipoFinal == 1) {
        fill(30, 110, 65);
      } else {
        if (tipoFinal == 2) { fill(150, 100, 20); } else { fill(165, 40, 30); }
      }
      text(clasificacionTexto, xInf, 528);
      textFont(fuenteVinetas);
      textSize(14);
      fill(45, 40, 34);
      text(diagnosticoTexto, xInf, 562, 520, 40);

      // ==== columna derecha: gráfico de horas por día ====
      int xGraf = 720;
      int baseGraf = 430;
      fill(150, 40, 30);
      textSize(15);
      textAlign(LEFT, TOP);
      text("HORAS DE USO POR DÍA", xGraf, 174);
      stroke(70, 60, 50);
      strokeWeight(1.5);
      line(xGraf, baseGraf, xGraf + 440, baseGraf);
      line(xGraf, baseGraf, xGraf, 200);
      noStroke();

      // CICLO PARA (P6): una barra por día; crece con la animación
      for (int dBar = 1; dBar <= 7; dBar = dBar + 1) {
        int horasBar = 0;
        int puntajeBar = 0;
        switch (dBar) {
          case 1: horasBar = horasD1; puntajeBar = puntajeD1; break;
          case 2: horasBar = horasD2; puntajeBar = puntajeD2; break;
          case 3: horasBar = horasD3; puntajeBar = puntajeD3; break;
          case 4: horasBar = horasD4; puntajeBar = puntajeD4; break;
          case 5: horasBar = horasD5; puntajeBar = puntajeD5; break;
          case 6: horasBar = horasD6; puntajeBar = puntajeD6; break;
          case 7: horasBar = horasD7; puntajeBar = puntajeD7; break;
        }
        int altoBar = horasBar * 9;
        int altoAnim = (tInf - (dBar * 4)) * 6;
        if (altoAnim < 0) { altoAnim = 0; }
        if (altoAnim > altoBar) { altoAnim = altoBar; }
        int xBar = xGraf + 18 + ((dBar - 1) * 60);
        // color de la barra según el riesgo de ese día
        if (puntajeBar < 5) {
          fill(46, 140, 90);
        } else {
          if (puntajeBar <= 13) { fill(205, 150, 45); } else { fill(175, 50, 40); }
        }
        if (dBar > diasJugados) { fill(150, 140, 125); }
        rect(xBar, baseGraf - altoAnim, 40, altoAnim);

        // inicial del día de la semana debajo de la barra
        int diaSemBar = (diaSemanaInicio + dBar - 2) % 7 + 1;
        String inicialBar = "";
        switch (diaSemBar) {
          case 1: inicialBar = "L"; break;
          case 2: inicialBar = "M"; break;
          case 3: inicialBar = "X"; break;
          case 4: inicialBar = "J"; break;
          case 5: inicialBar = "V"; break;
          case 6: inicialBar = "S"; break;
          case 7: inicialBar = "D"; break;
        }
        textAlign(CENTER, TOP);
        textSize(13);
        fill(45, 40, 34);
        text("D" + dBar + " " + inicialBar, xBar + 20, baseGraf + 6);
        textAlign(CENTER, BOTTOM);
        if (dBar <= diasJugados) {
          text(horasBar + " h", xBar + 20, baseGraf - altoAnim - 4);
        } else {
          text("-", xBar + 20, baseGraf - 4);
        }
      }
      textAlign(LEFT, TOP);
      textSize(13);
      fill(45, 40, 34);
      text("Día con más horas: día " + diaMasHoras + "  ·  Día con más riesgo: día " + diaMasPuntaje, xGraf, 458);
      textSize(12);
      fill(100, 85, 70);
      text("Color de cada barra: verde poco riesgo · ámbar medio · rojo alto", xGraf, 480);
      text("Clasificación (promedio por día): menos de 5 Ejemplar · 5 a 13", xGraf, 498);
      text("Responsable · 14 a 20 En riesgo · más de 20 Dependencia alta", xGraf, 514);

      // sello de la clasificación
      float escalaSello = 2.0 - (tInf / 20.0);
      if (escalaSello < 1) { escalaSello = 1; }
      if (tInf > 30) {
        pushMatrix();
        translate(900, 570);
        rotate(radians(-7));
        scale(escalaSello);
        noFill();
        if (tipoFinal == 1) { stroke(30, 120, 70, 220); } else { stroke(170, 40, 30, 220); }
        strokeWeight(4);
        rect(-150, -30, 300, 60, 6);
        strokeWeight(1.5);
        rect(-144, -24, 288, 48, 4);
        if (tipoFinal == 1) { fill(30, 120, 70, 220); } else { fill(170, 40, 30, 220); }
        textFont(fuenteOpciones);
        textSize(22);
        textAlign(CENTER, CENTER);
        switch (tipoFinal) {
          case 1: text("CASO RESUELTO", 0, 0); break;
          case 2: text("MEJORA PARCIAL", 0, 0); break;
          case 3: text("HÁBITOS DE RIESGO", 0, 0); break;
          case 4: text("IDENTIDAD ROBADA", 0, 0); break;
        }
        popMatrix();
      }

      // botón ver el final
      textFont(fuenteOpciones);
      textSize(18);
      textAlign(LEFT, CENTER);
      if (mouseX >= 800 && mouseX <= 1080 && mouseY >= 620 && mouseY <= 660) {
        botonSobre = 2;
        cursor(HAND);
        noStroke();
        fill(45, 120, 80, 40);
        rect(794, 616, 292, 48, 4);
        fill(35, 130, 75);
      } else {
        fill(40, 35, 30);
      }
      text("VER EL FINAL DE LA HISTORIA ->", 806, 640);
      break;

    // ==============================================================
    // PANTALLA 12: FINAL DE LA HISTORIA (Tomás decidió tipoFinal en T4)
    // 1 bueno · 2 regular · 3 malo · 4 identidad robada
    // botonSobre: 1 jugar de nuevo · 2 menú principal
    // ==============================================================
    case 12:
      int tFin = frameCount - frameInicioEscena;
      int brilloFin = tFin * 3;
      if (brilloFin > 200) { brilloFin = 200; }
      tint(brilloFin);
      switch (tipoFinal) {
        case 1: image(imgFinalBueno, 0, 0, width, height); break;
        case 2: image(imgFinalRegular, 0, 0, width, height); break;
        case 3: image(imgFinalMalo, 0, 0, width, height); break;
        case 4: image(imgFinalIdentidad, 0, 0, width, height); break;
      }
      noTint();
      cursor(ARROW);

      String tituloFin = "";
      String textoFin = "";
      int rFin = 55;
      int gFin = 255;
      int bFin = 175;
      switch (tipoFinal) {
        case 1:
          tituloFin = "FINAL BUENO · CASO CERRADO";
          textoFin = "Gracias a tus reportes, la Unidad Cibernética desarticuló la red de perfiles falsos. Mantuviste hábitos sanos y protegiste tus datos toda la semana. ¡Excelente trabajo, detective " + regNombre + "!";
          break;
        case 2:
          tituloFin = "FINAL REGULAR · MEJORA PARCIAL";
          textoFin = "Descubriste varios perfiles falsos, pero algunas decisiones y horas de más te pusieron en riesgo. Vas por buen camino: revisa antes de confiar y desconéctate a tiempo.";
          rFin = 245; gFin = 205; bFin = 95;
          break;
        case 3:
          tituloFin = "FINAL MALO · HÁBITOS DE RIESGO";
          textoFin = "Pasaste demasiadas horas conectado y confiaste en perfiles falsos. La red siguió engañando a más estudiantes. Aún puedes cambiar tus hábitos: empieza por desconectarte a tiempo.";
          rFin = 245; gFin = 95; bFin = 80;
          break;
        case 4:
          tituloFin = "FINAL MALO · IDENTIDAD ROBADA";
          textoFin = "Entregaste tu contraseña y el agresor tomó tu cuenta para engañar a tus amigos. La investigación se cerró antes de tiempo. Nunca compartas claves ni códigos, aunque parezcan oficiales.";
          rFin = 245; gFin = 95; bFin = 80;
          break;
      }

      // franja superior con el resultado
      noStroke();
      fill(8, 14, 24, 215);
      rect(0, 0, width, 120);
      textFont(fuenteVinetas);
      textSize(15);
      textAlign(CENTER, CENTER);
      fill(200, 220, 215);
      text("AGENTE " + regNombre + " · " + clasificacionTexto + " · Riesgo promedio por día: " + textoPromedio, width / 2, 28);
      if (tFin > 20) {
        textFont(fuenteOpciones);
        textSize(38);
        fill(rFin, gFin, bFin);
        text(tituloFin, width / 2, 74);
      }

      // texto de la historia sobre el papel rasgado de Camilo
      if (tFin > 40) {
        tint(255, 235);
        image(CuadroDialogo, 90, 430, 1100, 190);
        noTint();
        fill(245, 238, 222);
        textFont(fuenteVinetas);
        textSize(19);
        textLeading(26);
        textAlign(CENTER, CENTER);
        text(textoFin, 190, 455, 900, 140);
      }

      // lema oficial
      textFont(fuenteVinetas);
      textSize(15);
      textAlign(CENTER, CENTER);
      fill(226, 204, 148);
      if (tFin > 60) {
        text("«Tus decisiones digitales construyen tu futuro.»", width / 2, 636);
      }

      // botones: jugar de nuevo (1) y menú principal (2)
      if (tFin > 60) {
        int yBtnFin = 662;
        if (mouseX >= 360 && mouseX <= 620 && mouseY >= yBtnFin && mouseY <= yBtnFin + 40) {
          botonSobre = 1;
          cursor(HAND);
          fill(55, 255, 175, 90);
        } else {
          fill(20, 35, 55, 230);
        }
        stroke(55, 255, 175);
        strokeWeight(2);
        rect(360, yBtnFin, 260, 40, 10);
        if (mouseX >= 660 && mouseX <= 920 && mouseY >= yBtnFin && mouseY <= yBtnFin + 40) {
          botonSobre = 2;
          cursor(HAND);
          fill(55, 255, 175, 90);
        } else {
          fill(20, 35, 55, 230);
        }
        rect(660, yBtnFin, 260, 40, 10);
        fill(245, 255, 250);
        textFont(fuenteOpciones);
        textSize(18);
        textAlign(CENTER, CENTER);
        text("[ JUGAR DE NUEVO ]", 490, yBtnFin + 20);
        text("[ MENÚ PRINCIPAL ]", 790, yBtnFin + 20);
      }
      break;
  }

  // ==========================================================================
  // C. INDICADOR DE SONIDO EN EL MENÚ (tecla M)
  // ==========================================================================
  if (pantalla == 1) {
    textFont(fuenteVinetas);
    textSize(14);
    textAlign(RIGHT, BOTTOM);
    fill(55, 255, 175, 200);
    if (sonidoActivo == 1) {
      text("[M] SONIDO: ON", width - 24, height - 18);
    } else {
      text("[M] SONIDO: OFF", width - 24, height - 18);
    }
  }
}

// ============================================================================
// 4. MOUSEPRESSED · clics del ratón
// ============================================================================
void mousePressed() {
  // sonido de clic (Bonus Diamante)
  if (sonidoActivo == 1) {
    sonidoClic.play();
  }

  switch (pantalla) {

    // ================ Menú principal · Dependiendo De la opción ================
    case 1:
      switch (opcionHover) {
        case 1:
          pantalla = 16;            // nueva partida: primero la historieta
          break;
        case 2:
          pantalla = 2;             // cómo jugar
          break;
        case 3:
          pantalla = 4;             // ranking
          break;
        case 4:
          pantalla = 3;             // créditos
          break;
        case 5:
          exit();                   // salir
          break;
      }
      break;

    // ================ Cómo jugar ================
    case 2:
      int tPresionado = frameCount - frameInicioEscena;
      if (tPresionado >= 120) {
        if (pistasAbiertas == 0) {
          if (mouseX >= 380 && mouseX <= 940 && mouseY >= 90 && mouseY <= 425) {
            pistasAbiertas = 1;
          }
        } else {
          int xBtnC = width / 2 - 140;
          int yBtnC = 625;
          int anchoB = 280;
          int altoB = 50;
          if (mouseX >= xBtnC && mouseX <= xBtnC + anchoB && mouseY >= yBtnC && mouseY <= yBtnC + altoB) {
            pistasAbiertas = 0;
          }
        }
      }
      if (mouseX >= 30 && mouseX <= 420 && mouseY >= 20 && mouseY <= 50) {
        cursor(ARROW);
        pantalla = 1;
      }
      break;

    // ================ Créditos ================
    case 3:
      if (mouseX >= 30 && mouseX <= 380 && mouseY >= 20 && mouseY <= 55) {
        cursor(ARROW);
        pantalla = 1;
      }
      break;

    // ================ Ranking ================
    case 4:
      if (botonSobre == 1) {
        cursor(ARROW);
        pantalla = 1;
      }
      break;

    // ================ Historieta: un clic avanza igual que ENTER ================
    case 16:
      int tClicHist = frameCount - frameInicioEscena;
      if (tClicHist < 150) {
        frameInicioEscena = frameCount - 150;
      } else {
        if (tClicHist < 300) {
          frameInicioEscena = frameCount - 300;
        } else {
          if (tClicHist < 450) {
            frameInicioEscena = frameCount - 450;
          } else {
            if (tClicHist < 845) {
              frameInicioEscena = frameCount - 845;
            } else {
              if (tClicHist < 980) {
                frameInicioEscena = frameCount - 980;
              } else {
                cursor(ARROW);
                pantalla = 5;
              }
            }
          }
        }
      }
      break;

    // ================ Registro ================
    case 5:
      // foco en los campos: 1 nombre, 2 edad, 3 día, 4 mes, 5 año
      if (mouseX >= 545 && mouseX <= 830 && mouseY >= 240 && mouseY <= 268) { campoActivoP5 = 1; }
      if (mouseX >= 545 && mouseX <= 620 && mouseY >= 303 && mouseY <= 331) { campoActivoP5 = 2; }
      if (mouseX >= 545 && mouseX <= 600 && mouseY >= 365 && mouseY <= 393) { campoActivoP5 = 3; }
      if (mouseX >= 625 && mouseX <= 680 && mouseY >= 365 && mouseY <= 393) { campoActivoP5 = 4; }
      if (mouseX >= 705 && mouseX <= 780 && mouseY >= 365 && mouseY <= 393) { campoActivoP5 = 5; }

      // "GUARDAR E INICIAR DÍA 1": solo si todos los datos son válidos
      if (mouseX >= 330 && mouseX <= 330 + 340 && mouseY >= 590 && mouseY <= 590 + 40) {
        if (datosOkP5 == 1) {
          cursor(ARROW);
          diaActual = 1;
          pantalla = 6;
        } else {
          avisoP5 = frameCount;
          if (sonidoActivo == 1) { sonidoError.play(); }
        }
      }

      if (mouseX >= 30 && mouseX <= 380 && mouseY >= 20 && mouseY <= 55) {
        cursor(ARROW);
        pantalla = 1;
      }
      break;

    // ================ Consola de sesión ================
    case 6:
      // si aún está la secuencia de arranque, un clic la adelanta
      if ((frameCount - frameInicioEscena) < 405) {
        frameInicioEscena = frameCount - 410;
      } else {
        if (desbloqueandoCelular == 0) {
          // campos: 4 hora, 5 minuto, 6 AM/PM, 7 horas de uso
          if (mouseX >= 498 && mouseX <= 532 && mouseY >= 362 && mouseY <= 384) { campoActivoP6 = 4; }
          if (mouseX >= 547 && mouseX <= 581 && mouseY >= 362 && mouseY <= 384) { campoActivoP6 = 5; }
          if (mouseX >= 592 && mouseX <= 642 && mouseY >= 362 && mouseY <= 384) {
            campoActivoP6 = 6;
            regFranjaNum = 1;
          }
          if (mouseX >= 650 && mouseX <= 700 && mouseY >= 362 && mouseY <= 384) {
            campoActivoP6 = 6;
            regFranjaNum = 2;
          }
          if (mouseX >= 508 && mouseX <= 548 && mouseY >= 398 && mouseY <= 420) { campoActivoP6 = 7; }

          // "DESBLOQUEAR CELULAR": guarda la sesión del día
          if (mouseX >= 868 && mouseX <= 1066 && mouseY >= 546 && mouseY <= 578) {
            if (datosOkP6 == 1) {
              // ===================================================
              // BLOQUE T1 · SE SUMAN LOS PUNTOS DE LA SESIÓN (Tomás)
              // ===================================================
              puntosRiesgo = puntosRiesgo + puntosTiempo + puntosHorario;     // ACUMULADOR
              // se guarda para revisar que la sesión de mañana no se cruce con esta
              cruzaAnterior = sesCruzaMedianoche;
              salidaMinAnterior = salidaMin;
              textoSalidaAnterior = sesHoraSalidaTexto;
              if (diaActual == 1) {
                textoIngresoD1 = textoIngreso;
                textoFechaIngresoD1 = textoDiaSemana + " " + textoFecha;
              }
              textoSalidaFinal = sesHoraSalidaTexto;
              textoFechaSalidaFinal = textoDiaSemanaSal + " " + textoFechaSalida;
              cursor(ARROW);
              desbloqueandoCelular = 1;
              frameDesbloqueo = frameCount;
            } else {
              avisoP6 = frameCount;
              if (sonidoActivo == 1) { sonidoError.play(); }
            }
          }
        }
      }
      if (mouseX >= 25 && mouseX <= 340 && mouseY >= 18 && mouseY <= 52) {
        cursor(ARROW);
        desbloqueandoCelular = 0;
        pantalla = 1;
      }
      break;

    // ================ Contenido consumido: elegir 2 de 7 ================
    case 7:
      if ((frameCount - frameInicioEscena) < 115) {
        frameInicioEscena = frameCount - 118;
      } else {
        int xC7 = 236;
        int wC7 = 338;
        int yIni7 = 144;
        int altoN7 = 65;
        int gapN7 = 5;

        // CICLO PARA: revisa sobre cuál de las 7 tarjetas se hizo clic
        for (int c = 1; c <= 7; c = c + 1) {
          int yCard = yIni7 + ((c - 1) * (altoN7 + gapN7));
          if (mouseX >= xC7 && mouseX <= xC7 + wC7 && mouseY >= yCard && mouseY <= yCard + altoN7) {
            alertaMaxContenidos = 0;
            int estadoActual = 0;
            if (c == 1) { estadoActual = selCat1; }
            if (c == 2) { estadoActual = selCat2; }
            if (c == 3) { estadoActual = selCat3; }
            if (c == 4) { estadoActual = selCat4; }
            if (c == 5) { estadoActual = selCat5; }
            if (c == 6) { estadoActual = selCat6; }
            if (c == 7) { estadoActual = selCat7; }

            if (estadoActual == 1) {
              // clic en una tarjeta elegida: se quita
              if (c == 1) { selCat1 = 0; }
              if (c == 2) { selCat2 = 0; }
              if (c == 3) { selCat3 = 0; }
              if (c == 4) { selCat4 = 0; }
              if (c == 5) { selCat5 = 0; }
              if (c == 6) { selCat6 = 0; }
              if (c == 7) { selCat7 = 0; }
              totalElegidos = totalElegidos - 1;                    // CONTADOR (resta 1)
              if (casoElegido1 == c) {
                casoElegido1 = casoElegido2;
                casoElegido2 = 0;
              } else {
                if (casoElegido2 == c) {
                  casoElegido2 = 0;
                }
              }
            } else {
              if (totalElegidos < 2) {
                if (c == 1) { selCat1 = 1; }
                if (c == 2) { selCat2 = 1; }
                if (c == 3) { selCat3 = 1; }
                if (c == 4) { selCat4 = 1; }
                if (c == 5) { selCat5 = 1; }
                if (c == 6) { selCat6 = 1; }
                if (c == 7) { selCat7 = 1; }
                totalElegidos = totalElegidos + 1;                  // CONTADOR
                if (casoElegido1 == 0) {
                  casoElegido1 = c;
                } else {
                  casoElegido2 = c;
                }
              } else {
                alertaMaxContenidos = 1;
              }
            }
          }
        }

        if (totalElegidos == 2) {
          if (mouseX >= xC7 && mouseX <= xC7 + wC7 && mouseY >= 640 && mouseY <= 676) {
            cursor(ARROW);
            // =====================================================
            // BLOQUE L1 · PUNTOS DEL CONTENIDO (Valeria)
            // Entrada: casoElegido1, casoElegido2 (1 a 7, nunca iguales)
            // Proceso: suma los puntos de riesgo de cada contenido
            // Salida: puntosContenido y el nombre de cada contenido
            // =====================================================
            puntosContenido = 0;
            switch (casoElegido1) {
              case 1: case 2: puntosContenido = puntosContenido + 0; break;   // educativo, noticias oficiales
              case 3:         puntosContenido = puntosContenido + 1; break;   // entretenimiento
              case 4:         puntosContenido = puntosContenido + 2; break;   // creadores
              case 5:         puntosContenido = puntosContenido + 3; break;   // perfiles anónimos
              case 6: case 7: puntosContenido = puntosContenido + 4; break;   // engaños, violentos
            }
            switch (casoElegido2) {
              case 1: case 2: puntosContenido = puntosContenido + 0; break;
              case 3:         puntosContenido = puntosContenido + 1; break;
              case 4:         puntosContenido = puntosContenido + 2; break;
              case 5:         puntosContenido = puntosContenido + 3; break;
              case 6: case 7: puntosContenido = puntosContenido + 4; break;
            }
            puntosRiesgo = puntosRiesgo + puntosContenido;                   // ACUMULADOR
            switch (casoElegido1) {
              case 1: nombreContenido1 = "educativo"; break;
              case 2: nombreContenido1 = "noticias oficiales"; break;
              case 3: nombreContenido1 = "entretenimiento"; break;
              case 4: nombreContenido1 = "creadores"; break;
              case 5: nombreContenido1 = "perfiles anónimos"; break;
              case 6: nombreContenido1 = "engaños"; break;
              case 7: nombreContenido1 = "mensajes violentos"; break;
            }
            switch (casoElegido2) {
              case 1: nombreContenido2 = "educativo"; break;
              case 2: nombreContenido2 = "noticias oficiales"; break;
              case 3: nombreContenido2 = "entretenimiento"; break;
              case 4: nombreContenido2 = "creadores"; break;
              case 5: nombreContenido2 = "perfiles anónimos"; break;
              case 6: nombreContenido2 = "engaños"; break;
              case 7: nombreContenido2 = "mensajes violentos"; break;
            }
            pantalla = 8;           // el caso del día se carga al entrar al expediente
          }
        }
      }
      if (mouseX >= 25 && mouseX <= 165 && mouseY >= 18 && mouseY <= 52) {
        cursor(ARROW);
        pantalla = 1;
      }
      break;

    // ================ Expediente: lupa y decisión ================
    case 8:
      int xVis8 = 376;
      int yVis8 = 190;

      // 1. clic en el botón [ INVESTIGAR ] de la tarjeta: repite el sonar
      if (mouseX >= 565 && mouseX <= 655 && mouseY >= 446 && mouseY <= 476) {
        frameSonar = frameCount;
      }

      // 2. clic con la lupa sobre las 4 zonas de pistas (CONTADORES)
      if (dist(mouseX, mouseY, xVis8 + 185, yVis8 + 74) < 42 && pistaVista1 == 0) {
        pistaVista1 = 1;
        pistasHalladas = pistasHalladas + 1;
        pistasDia = pistasDia + 1;
        pistasEncontradas = pistasEncontradas + 1;
      }
      if (dist(mouseX, mouseY, 526, yVis8 + 144) < 46 && pistaVista2 == 0) {
        pistaVista2 = 1;
        pistasHalladas = pistasHalladas + 1;
        pistasDia = pistasDia + 1;
        pistasEncontradas = pistasEncontradas + 1;
      }
      if (dist(mouseX, mouseY, xVis8 + 64, yVis8 + 80) < 38 && pistaVista3 == 0) {
        pistaVista3 = 1;
        pistasHalladas = pistasHalladas + 1;
        pistasDia = pistasDia + 1;
        pistasEncontradas = pistasEncontradas + 1;
      }
      if (dist(mouseX, mouseY, 526, yVis8 + 230) < 55 && pistaVista4 == 0) {
        pistaVista4 = 1;
        pistasHalladas = pistasHalladas + 1;
        pistasDia = pistasDia + 1;
        pistasEncontradas = pistasEncontradas + 1;
      }

      // 3. clic en los botones [A], [B] o [C]
      int yBtnD8 = 532;
      int hBtnD8 = 104;
      int wBtnD8 = 94;
      for (int b = 1; b <= 3; b = b + 1) {
        int xBtnD8 = xVis8 + ((b - 1) * 103);
        if (mouseX >= xBtnD8 && mouseX <= xBtnD8 + wBtnD8 && mouseY >= yBtnD8 && mouseY <= yBtnD8 + hBtnD8) {
          if (pistasHalladas < pistasMinimas) {
            // todavía no ha investigado lo suficiente
            avisoSinPistas = frameCount;
            if (sonidoActivo == 1) { sonidoError.play(); }
          } else {
            opcionElegida = b;
            switch (opcionElegida) {
              case 1: tipoOpcion = opATipo8; retroElegida = retroA; textoOpcionElegida = opATexto8; break;
              case 2: tipoOpcion = opBTipo8; retroElegida = retroB; textoOpcionElegida = opBTexto8; break;
              case 3: tipoOpcion = opCTipo8; retroElegida = retroC; textoOpcionElegida = opCTexto8; break;
            }

            // =====================================================
            // BLOQUE T1 · PUNTOS DE LA DECISIÓN Y CONTADORES (Tomás)
            // Entrada: tipoOpcion, nivel, diaActual
            // Proceso: segura 0 · regular 1 × nivel · riesgosa 3 × nivel
            //          (en cada nivel las decisiones pesan más);
            //          cuenta aciertos, errores y la racha
            // Salida: puntosDecision, puntosDecisiones, contadores, identidadRobada
            // =====================================================
            switch (tipoOpcion) {
              case 0: puntosDecision = 0; break;
              case 1: puntosDecision = 1 * nivel; break;
              case 2: puntosDecision = 3 * nivel; break;
            }
            puntosDecisiones = puntosDecisiones + puntosDecision;            // ACUMULADOR
            puntosRiesgo = puntosRiesgo + puntosDecision;                    // ACUMULADOR

            if (tipoOpcion == 0) {
              decisionesCorrectas = decisionesCorrectas + 1;                 // CONTADOR
              racha = racha + 1;                                             // CONTADOR
              if (racha > rachaMaxima) {
                rachaMaxima = racha;
              }
              if (diaActual == 3 || diaActual == 5) {
                decisionesPrivacidadSeguras = decisionesPrivacidadSeguras + 1;   // CONTADOR
              }
            } else {
              decisionesIncorrectas = decisionesIncorrectas + 1;             // CONTADOR
              racha = 0;                                                     // la racha se corta
            }

            // día 5: la opción riesgosa es entregar la contraseña
            if (diaActual == 5 && tipoOpcion == 2) {
              identidadRobada = 1;
            }

            // BLOQUE T3 · logro Ojo de Halcón: 5 decisiones seguras seguidas
            logroEnVeredicto = 0;
            if (racha >= 5 && logroOjoHalcon == 0) {
              logroOjoHalcon = 1;
              logrosObtenidos = logrosObtenidos + 1;                         // CONTADOR
              logroNuevo = 1;
              logroEnVeredicto = 1;
              logrosHoy = logrosHoy + 1;                                     // CONTADOR
              if (logrosHoy == 1) {
                textoLogroNuevo = "Ojo de Halcón";
              } else {
                textoLogroNuevo = textoLogroNuevo + " y Ojo de Halcón";
              }
            }
            cursor(ARROW);
            pantalla = 9;
          }
        }
      }

      // volver al menú
      if (mouseX >= 22 && mouseX <= 195 && mouseY >= 14 && mouseY <= 44) {
        cursor(ARROW);
        pantalla = 1;
      }
      break;

    // ================ Veredicto ================
    case 9:
      if (botonSobre == 2) {
        if (decisionDia < decisionesDelDia && identidadRobada == 0) {
          // día 7: sigue el siguiente perfil
          decisionDia = decisionDia + 1;                                     // CONTADOR
          pantalla = 8;
        } else {
          // =====================================================
          // BLOQUE T1 · CIERRE DEL DÍA (Tomás)
          // Entrada: puntos de tiempo, horario, contenido y decisiones
          // Proceso: puntaje del día, acumuladores, contadores y clasificación
          // Salida: puntajeDia, horasAcumuladas, datos del día para el informe
          // =====================================================
          puntajeDia = puntosTiempo + puntosHorario + puntosContenido + puntosDecisiones;
          horasAcumuladas = horasAcumuladas + regHorasUso;                   // ACUMULADOR
          if (puntosHorario == 0) {
            diasHorarioSaludable = diasHorarioSaludable + 1;                 // CONTADOR
          }
          if (regHorasUso <= 3) {
            diasUsoModerado = diasUsoModerado + 1;                           // CONTADOR
          }
          switch (diaActual) {
            case 1: horasD1 = regHorasUso; puntajeD1 = puntajeDia; break;
            case 2: horasD2 = regHorasUso; puntajeD2 = puntajeDia; break;
            case 3: horasD3 = regHorasUso; puntajeD3 = puntajeDia; break;
            case 4: horasD4 = regHorasUso; puntajeD4 = puntajeDia; break;
            case 5: horasD5 = regHorasUso; puntajeD5 = puntajeDia; break;
            case 6: horasD6 = regHorasUso; puntajeD6 = puntajeDia; break;
            case 7: horasD7 = regHorasUso; puntajeD7 = puntajeDia; break;
          }

          // clasificación del día con la tabla del documento
          if (puntajeDia < 5) {
            clasificacionDia = "Ciudadano Digital Ejemplar";
          } else {
            if (puntajeDia <= 13) {
              clasificacionDia = "Usuario Digital Responsable";
            } else {
              if (puntajeDia <= 20) {
                clasificacionDia = "Usuario en Riesgo";
              } else {
                clasificacionDia = "Dependencia Digital Alta";
              }
            }
          }
          if (identidadRobada == 1) {
            clasificacionDia = "Identidad Comprometida";
          }

          // =====================================================
          // BLOQUE T3 · LOGROS AL CERRAR EL DÍA (Tomás)
          // =====================================================
          // Detective de Fake News: día 2 con decisión segura y las 4 pistas
          if (diaActual == 2 && tipoOpcion == 0 && pistasDia == 4 && logroFakeNews == 0) {
            logroFakeNews = 1;
            logrosObtenidos = logrosObtenidos + 1;
            logroNuevo = 1;
            logrosHoy = logrosHoy + 1;
            if (logrosHoy == 1) { textoLogroNuevo = "Detective de Fake News"; } else { textoLogroNuevo = textoLogroNuevo + " y Detective de Fake News"; }
          }
          // Guardián de la Privacidad: días 3 y 5 con decisión segura
          if (diaActual == 5 && decisionesPrivacidadSeguras == 2 && logroPrivacidad == 0) {
            logroPrivacidad = 1;
            logrosObtenidos = logrosObtenidos + 1;
            logroNuevo = 1;
            logrosHoy = logrosHoy + 1;
            if (logrosHoy == 1) { textoLogroNuevo = "Guardián de la Privacidad"; } else { textoLogroNuevo = textoLogroNuevo + " y Guardián de la Privacidad"; }
          }
          // Rey del Tiempo y Experto en Bienestar Digital: los 7 días
          if (diaActual == 7) {
            if (diasUsoModerado == 7 && logroTiempo == 0) {
              logroTiempo = 1;
              logrosObtenidos = logrosObtenidos + 1;
              logroNuevo = 1;
              logrosHoy = logrosHoy + 1;
              if (logrosHoy == 1) { textoLogroNuevo = "Rey del Tiempo"; } else { textoLogroNuevo = textoLogroNuevo + " y Rey del Tiempo"; }
            }
            if (diasHorarioSaludable == 7 && logroBienestar == 0) {
              logroBienestar = 1;
              logrosObtenidos = logrosObtenidos + 1;
              logroNuevo = 1;
              logrosHoy = logrosHoy + 1;
              if (logrosHoy == 1) { textoLogroNuevo = "Experto en Bienestar Digital"; } else { textoLogroNuevo = textoLogroNuevo + " y Experto en Bienestar Digital"; }
            }
          }

          diasJugados = diasJugados + 1;                                     // CONTADOR
          pantalla = 10;
        }
      }
      break;

    // ================ Resumen del día ================
    case 10:
      if (botonSobre == 2) {
        if (diaActual == 7 || identidadRobada == 1) {
          pantalla = 11;
        } else {
          diaActual = diaActual + 1;                                         // CONTADOR de la semana
          pantalla = 6;
        }
      }
      break;

    // ================ Informe final ================
    case 11:
      if (botonSobre == 2) {
        pantalla = 12;
      }
      break;

    // ================ Final: jugar de nuevo o menú ================
    case 12:
      if (botonSobre == 1) {
        pantalla = 5;               // el reinicio (BLOQUE T6) se hace al entrar al registro
      }
      if (botonSobre == 2) {
        pantalla = 1;
      }
      break;
  }
}

// ============================================================================
// 5. KEYPRESSED · teclado (sin funciones de texto)
// Cada número se arma cifra por cifra: valor = valor * 10 + cifra, y se lleva
// la cuenta de cifras escritas (contador). BACKSPACE borra el campo completo.
// ============================================================================
void keyPressed() {
  // ESC no cierra el juego: se usa para volver al menú
  if (key == ESC) {
    key = 0;
  }

  // M prende o apaga el sonido (menos en el registro, donde se escribe el nombre)
  if ((key == 'm' || key == 'M') && pantalla != 5) {
    if (sonidoActivo == 1) {
      sonidoActivo = 0;
      musica.amp(0);
    } else {
      sonidoActivo = 1;
      musica.amp(volumenMusica);
    }
  }

  switch (pantalla) {

    // ================ Menú: atajos del 1 al 5 ================
    case 1:
      switch (key) {
        case '1': pantalla = 16; break;
        case '2': pantalla = 2; break;
        case '3': pantalla = 4; break;
        case '4': pantalla = 3; break;
        case '5': exit(); break;
      }
      break;

    // ================ Cómo jugar, créditos y ranking: volver ================
    case 2:
    case 3:
    case 4:
      if (key == 0 || key == BACKSPACE) {
        cursor(ARROW);
        pantalla = 1;
      }
      break;

    // ================ Historieta: ENTER avanza ================
    case 16:
      if (key == 0) {
        pantalla = 1;
      }
      if (key == ENTER || key == RETURN) {
        int tActual = frameCount - frameInicioEscena;
        if (tActual < 150) {
          frameInicioEscena = frameCount - 150;
        } else {
          if (tActual < 300) {
            frameInicioEscena = frameCount - 300;
          } else {
            if (tActual < 450) {
              frameInicioEscena = frameCount - 450;
            } else {
              if (tActual < 845) {
                frameInicioEscena = frameCount - 845;
              } else {
                if (tActual < 980) {
                  frameInicioEscena = frameCount - 980;
                } else {
                  cursor(ARROW);
                  pantalla = 5;
                }
              }
            }
          }
        }
      }
      break;

    // ================ Registro: nombre, edad y fecha de inicio ================
    case 5:
      if (key == 0) {
        cursor(ARROW);
        pantalla = 1;
      }

      // TAB o ENTER pasan al siguiente campo
      if (key == TAB || key == ENTER || key == RETURN) {
        if (campoActivoP5 == 5) {
          campoActivoP5 = 1;
        } else {
          campoActivoP5 = campoActivoP5 + 1;
        }
      }

      // BACKSPACE borra el campo activo completo
      if (key == BACKSPACE) {
        switch (campoActivoP5) {
          case 1: regNombre = ""; lenNombre = 0; letrasReales = 0; ultimoEspacio = 0; break;
          case 2: regEdadTexto = ""; lenEdad = 0; regEdad = 0; break;
          case 3: regDiaTexto = ""; lenDia = 0; regDia = 0; break;
          case 4: regMesTexto = ""; lenMes = 0; regMes = 0; break;
          case 5: regAnioTexto = ""; lenAnio = 0; regAnio = 0; break;
        }
      }

      // Nombre: solo letras (con tildes y ñ) y espacios sueltos, máximo 20
      if (campoActivoP5 == 1 && lenNombre < 20) {
        int esLetra = 0;
        if (key >= 'a' && key <= 'z') { esLetra = 1; }
        if (key >= 'A' && key <= 'Z') { esLetra = 1; }
        switch (key) {
          case 'á': case 'é': case 'í': case 'ó': case 'ú': case 'ü': case 'ñ':
          case 'Á': case 'É': case 'Í': case 'Ó': case 'Ú': case 'Ü': case 'Ñ':
            esLetra = 1;
            break;
        }
        if (esLetra == 1) {
          regNombre = regNombre + key;
          lenNombre = lenNombre + 1;                 // CONTADOR de caracteres
          letrasReales = letrasReales + 1;           // CONTADOR de letras
          ultimoEspacio = 0;
          if (sonidoActivo == 1) { sonidoTecla.play(); }
        } else {
          // el espacio no puede ir al inicio ni repetido
          if (key == ' ' && lenNombre > 0 && ultimoEspacio == 0) {
            regNombre = regNombre + key;
            lenNombre = lenNombre + 1;
            ultimoEspacio = 1;
            if (sonidoActivo == 1) { sonidoTecla.play(); }
          }
        }
      }

      // Edad, día, mes y año: solo cifras
      if (key >= '0' && key <= '9') {
        int cifra = key - '0';
        if (campoActivoP5 == 2 && lenEdad < 2) {
          regEdadTexto = regEdadTexto + key;
          regEdad = regEdad * 10 + cifra;
          lenEdad = lenEdad + 1;
          if (sonidoActivo == 1) { sonidoTecla.play(); }
        }
        if (campoActivoP5 == 3 && lenDia < 2) {
          regDiaTexto = regDiaTexto + key;
          regDia = regDia * 10 + cifra;
          lenDia = lenDia + 1;
          if (sonidoActivo == 1) { sonidoTecla.play(); }
        }
        if (campoActivoP5 == 4 && lenMes < 2) {
          regMesTexto = regMesTexto + key;
          regMes = regMes * 10 + cifra;
          lenMes = lenMes + 1;
          if (sonidoActivo == 1) { sonidoTecla.play(); }
        }
        if (campoActivoP5 == 5 && lenAnio < 4) {
          regAnioTexto = regAnioTexto + key;
          regAnio = regAnio * 10 + cifra;
          lenAnio = lenAnio + 1;
          if (sonidoActivo == 1) { sonidoTecla.play(); }
        }
      }
      break;

    // ================ Consola: hora, minuto, AM/PM y horas de uso ================
    case 6:
      if (key == 0) {
        cursor(ARROW);
        desbloqueandoCelular = 0;
        pantalla = 1;
      }

      // ENTER adelanta la animación de arranque
      if ((key == ENTER || key == RETURN) && (frameCount - frameInicioEscena) < 405) {
        frameInicioEscena = frameCount - 410;
      }

      if ((frameCount - frameInicioEscena) >= 405 && desbloqueandoCelular == 0) {
        // TAB rota entre los 4 campos
        if (key == TAB) {
          if (campoActivoP6 == 7) {
            campoActivoP6 = 4;
          } else {
            campoActivoP6 = campoActivoP6 + 1;
          }
        }

        // A o P eligen la franja; ESPACIO la cambia si el foco está en AM/PM
        if (key == 'a' || key == 'A') {
          regFranjaNum = 1;
        }
        if (key == 'p' || key == 'P') {
          regFranjaNum = 2;
        }
        if (campoActivoP6 == 6 && key == ' ') {
          if (regFranjaNum == 1) {
            regFranjaNum = 2;
          } else {
            regFranjaNum = 1;
          }
        }

        // BACKSPACE borra el campo activo completo
        if (key == BACKSPACE) {
          switch (campoActivoP6) {
            case 4: sesHoraTexto = ""; lenSesHora = 0; regHora12 = 0; break;
            case 5: sesMinutoTexto = ""; lenSesMinuto = 0; regMinuto = 0; break;
            case 6: regFranjaNum = 0; break;
            case 7: sesHorasUsoTexto = ""; lenSesHorasUso = 0; regHorasUso = 0; break;
          }
        }

        // cifras de cada campo
        if (key >= '0' && key <= '9') {
          int cifraP6 = key - '0';
          if (campoActivoP6 == 4 && lenSesHora < 2) {
            sesHoraTexto = sesHoraTexto + key;
            regHora12 = regHora12 * 10 + cifraP6;
            lenSesHora = lenSesHora + 1;
            if (sonidoActivo == 1) { sonidoTecla.play(); }
          }
          if (campoActivoP6 == 5 && lenSesMinuto < 2) {
            sesMinutoTexto = sesMinutoTexto + key;
            regMinuto = regMinuto * 10 + cifraP6;
            lenSesMinuto = lenSesMinuto + 1;
            if (sonidoActivo == 1) { sonidoTecla.play(); }
          }
          if (campoActivoP6 == 7 && lenSesHorasUso < 2) {
            sesHorasUsoTexto = sesHorasUsoTexto + key;
            regHorasUso = regHorasUso * 10 + cifraP6;
            lenSesHorasUso = lenSesHorasUso + 1;
            if (sonidoActivo == 1) { sonidoTecla.play(); }
          }
        }
      }
      break;

    // ================ Contenido: ENTER adelanta la cascada ================
    case 7:
      if (key == 0) {
        cursor(ARROW);
        pantalla = 1;
      }
      if ((key == ENTER || key == RETURN) && (frameCount - frameInicioEscena) < 115) {
        frameInicioEscena = frameCount - 118;
      }
      break;

    // ================ Expediente: S o ESPACIO repiten el sonar ================
    case 8:
      if (key == 0) {
        cursor(ARROW);
        pantalla = 1;
      }
      if (key == 's' || key == 'S' || key == ' ') {
        frameSonar = frameCount;
      }
      break;

    // ================ Veredicto, resumen, informe y final: ESC al menú ================
    case 9:
    case 10:
    case 11:
    case 12:
      if (key == 0) {
        cursor(ARROW);
        pantalla = 1;
      }
      break;
  }
}
