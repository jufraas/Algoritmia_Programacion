/*
 * Laboratorio Único Feria Gamer 2026 - Algoritmia y Programación I (Universidad del Norte)
 * Entrega #1 (Parte 1: solo condicionales)
 * Temática 4: Detective de Perfiles Falsos
 */
package detectiveperfilesfalsos;

import java.util.Scanner;

/**
 *
 * @author Juan Francisco Camacho Posso, Camilo Bolaño, Valeria Beltrán, Tomás López
 */
public class DetectivePerfilesFalsos {

    public static void main(String[] args) {

        // ===== CONTRATO DE VARIABLES (NO cambiar nombres) =====
        // Lectura por consola (uno solo en todo el programa)
        Scanner sc = new Scanner(System.in);

        // --- Control ---
        int datosValidos = 1;
        int jugar = 1;

        // --- Registro (Valeria) ---
        String nombre = "Prueba";
        int edad = 17;
        int anio = 2026;
        int mes = 10;
        int dia = 4;
        int hora12 = 10;
        int minuto = 30;
        String franja = "AM";
        int horasUso = 5;
        int bisiesto = 0;
        int diasMes = 31;

        // --- Fechas y horas (Jufra) ---
        int hora24Ingreso = 10;
        int anioSal = 2026;
        int mesSal = 10;
        int diaSal = 4;
        int horaSal = 15;
        int minutoSal = 30;
        int segundoSal = 1;
        int cruzaMedianoche = 0;
        String diaSemanaIngreso = "domingo";
        String diaSemanaSalida = "domingo";
        String fechaIngresoTexto = "04/10/2026";
        String fechaSalidaTexto = "04/10/2026";
        String horaIngresoTexto = "10:30:00";
        String horaSalidaTexto = "15:30:01";

        // --- Expedientes (Camilo: 1 a 3, Valeria: 4 y 5) ---
        int decision1 = 0;
        int decision2 = 0;
        int decision3 = 0;
        int decision4 = 0;
        int decision5 = 0;
        int entregoContrasena = 0;
        int decisionesCorrectas = 0;
        int decisionesIncorrectas = 0;

        // --- Contenido, privacidad, puntaje y finales (Tomás) ---
        int contenido1 = 0;
        int contenido2 = 0;
        int privacidad = 0;
        String textoFinalBueno = "";
        String textoFinalRegular = "";
        String textoFinalMalo = "";
        String textoFinalContrasena = "";
        int puntaje = 0;
        String diagnostico = "";
        int tipoFinal = 0;

        // ############################################################################
        // 1. HISTORIA Y MENÚ PRINCIPAL  (Camilo Bolaño)
        // ############################################################################

        if (jugar == 1 && datosValidos == 1) {
            System.out.println("\n==============================================================================================");
            System.out.println("[][][][]   [][][][][] [][][][][] [][][][][]  [][][][]  [][][][][] [][] []      [] [][][][][]");
            System.out.println("[]      [] []             []     []         []      []     []     [][] []      [] []        ");
            System.out.println("[]      [] [][][][]       []     [][][][]   []             []     [][]  []    []  [][][][]  ");
            System.out.println("[]      [] []             []     []         []      []     []     [][]   []  []   []        ");
            System.out.println("[][][][]   [][][][][]     []     [][][][][]  [][][][]      []     [][]    [][]    [][][][][]");
            System.out.println("");
            System.out.println("                             D E   P E R F I L E S   F A L S O S");
            System.out.println("==============================================================================================\n");

            System.out.println("(𝙿𝚛𝚎𝚜𝚒𝚘𝚗𝚊 𝙴𝙽𝚃𝙴𝚁 𝚙𝚊𝚛𝚊 𝚎𝚗𝚝𝚛𝚊𝚛 𝚊 𝚕𝚊 𝚎𝚜𝚌𝚎𝚗𝚊 𝚍𝚎𝚕 𝚌𝚛𝚒𝚖𝚎𝚗...)");
            sc.nextLine();

            System.out.println("𝘈𝘯𝘵𝘦𝘴 𝘥𝘦 𝘪𝘯𝘪𝘤𝘪𝘢𝘳 𝘵𝘶𝘴 𝘥𝘦𝘴𝘢𝘳𝘳𝘰𝘭𝘭𝘢𝘥𝘰𝘳𝘦𝘴 𝘵𝘦 𝘥𝘢𝘳𝘢𝘯 𝘶𝘯 𝘤𝘰𝘯𝘵𝘦𝘹𝘵𝘰 𝘥𝘦𝘭 𝘫𝘶𝘦𝘨𝘰\n𝘺 𝘤𝘰𝘮𝘰 𝘳𝘦𝘴𝘰𝘭𝘷𝘦𝘳𝘭𝘰:\n ");
            System.out.println("\n══════════════════════════════◈════════════════════════════");
            System.out.println("              𝚂𝙸𝚂𝚃𝙴𝙼𝙰 𝙳𝙴 𝙸𝙽𝚃𝙴𝙻𝙸𝙶𝙴𝙽𝙲𝙸𝙰 𝙳𝙸𝙶𝙸𝚃𝙰𝙻");
            System.out.println("═══════════════════════════════════════════════════════════════");
            System.out.println(" 𝘉𝘪𝘦𝘯𝘷𝘦𝘯𝘪𝘥𝘰 𝘢 𝘭𝘢 𝘳𝘦𝘥, 𝘋𝘦𝘵𝘦𝘤𝘵𝘪𝘷𝘦. 𝘏𝘰𝘺 𝘦𝘭 𝘤𝘪𝘣𝘦𝘳𝘦𝘴𝘱𝘢𝘤𝘪𝘰");
            System.out.println(" 𝘯𝘰 𝘦𝘴 𝘴𝘰𝘭𝘰 𝘶𝘯 𝘭𝘶𝘨𝘢𝘳 𝘥𝘦 𝘦𝘯𝘤𝘶𝘦𝘯𝘵𝘳𝘰: 𝘦𝘴 𝘶𝘯 𝘤𝘢𝘮𝘱𝘰 𝘥𝘦 𝘣𝘢𝘵𝘢𝘭𝘭𝘢");
            System.out.println(" 𝘪𝘯𝘷𝘪𝘴𝘪𝘣𝘭𝘦 𝘥𝘰𝘯𝘥𝘦 𝘭𝘢𝘴 𝘪𝘥𝘦𝘯𝘵𝘪𝘥𝘢𝘥𝘦𝘴 𝘴𝘦 𝘳𝘰𝘣𝘢𝘯 𝘺 𝘭𝘰𝘴 𝘳𝘰𝘴𝘵𝘳𝘰𝘴");
            System.out.println(" 𝘴𝘰𝘯 𝘧𝘢𝘭𝘴𝘪𝘧𝘪𝘤𝘢𝘥𝘰𝘴 𝘱𝘢𝘳𝘢 𝘤𝘢𝘻𝘢𝘳 𝘢 𝘪𝘯𝘰𝘤𝘦𝘯𝘵𝘦𝘴.");
            System.out.println("");
            System.out.println(" 𝘛𝘶 𝘭𝘢𝘣𝘰𝘳 𝘤𝘰𝘯𝘴𝘪𝘴𝘵𝘦 𝘦𝘯 𝘢𝘯𝘢𝘭𝘪𝘻𝘢𝘳 𝘮𝘦𝘵𝘢𝘥𝘢𝘵𝘰𝘴, 𝘳𝘢𝘴𝘵𝘳𝘦𝘢𝘳");
            System.out.println(" 𝘩𝘶𝘦𝘭𝘭𝘢𝘴 𝘥𝘪𝘨𝘪𝘵𝘢𝘭𝘦𝘴 𝘺 𝘦𝘷𝘢𝘭𝘶𝘢𝘳 𝘱𝘪𝘴𝘵𝘢𝘴 𝘭𝘰́𝘨𝘪𝘤𝘢𝘴 𝘱𝘢𝘳𝘢");
            System.out.println(" 𝘴𝘦𝘱𝘢𝘳𝘢𝘳 𝘭𝘢 𝘷𝘦𝘳𝘥𝘢𝘥 𝘥𝘦𝘭 𝘦𝘯𝘨𝘢𝘯̃𝘰 𝘢𝘯𝘵𝘦𝘴 𝘥𝘦 𝘲𝘶𝘦 𝘴𝘦𝘢 𝘵𝘢𝘳𝘥𝘦.");
            System.out.println("═════════════════════════════════════════════════════════════");
            System.out.print("\n(𝙿𝚛𝚎𝚜𝚒𝚘𝚗𝚊 𝙴𝙽𝚃𝙴𝚁 𝚙𝚊𝚛𝚊 𝚟𝚎𝚛 𝚕𝚊 𝚑𝚒𝚜𝚝𝚘𝚛𝚒𝚊 𝚒𝚗𝚒𝚌𝚒𝚊𝚕...) ");
            sc.nextLine();

            // --- BLOQUE DE HISTORIA / NOTICIA (Área superior continua) ---
            System.out.println(" \n==========================================================================================================");
            System.out.println("                            𝐍𝐎𝐓𝐈𝐂𝐈𝐀 𝐃𝐄 𝐔𝐋𝐓𝐈𝐌𝐀 𝐇𝐎𝐑𝐀 | 𝐁𝐨𝐠𝐨𝐭𝐚");
            System.out.println("      ==============================================================================================");
            System.out.println("            𝘊𝘢𝘵𝘢𝘭𝘪𝘯𝘢 𝘥𝘦 𝟤𝟦 𝘢𝘯𝘰𝘴 𝘧𝘶𝘦 𝘢𝘴𝘦𝘴𝘪𝘯𝘢𝘥𝘢 𝘵𝘳𝘢𝘴 𝘢𝘤𝘶𝘥𝘪𝘳 𝘢 𝘶𝘯𝘢 𝘧𝘢𝘭𝘴𝘢 𝘦𝘯𝘵𝘳𝘦𝘷𝘪𝘴𝘵𝘢 𝘥𝘦");
            System.out.println("            𝘵𝘳𝘢𝘣𝘢𝘫𝘰. 𝘌𝘭 𝘤𝘳𝘪𝘮𝘪𝘯𝘢𝘭 𝘯𝘰 𝘧𝘰𝘳𝘻𝘰 𝘱𝘶𝘦𝘳𝘵𝘢𝘴: 𝘩𝘢𝘤𝘬𝘦𝘰 𝘭𝘢𝘴 𝘳𝘦𝘥𝘦𝘴 𝘥𝘦 𝘴𝘶𝘴 𝘢𝘮𝘪𝘨𝘢𝘴,");
            System.out.println("            𝘪𝘮𝘪𝘵𝘰 𝘴𝘶 𝘧𝘰𝘳𝘮𝘢 𝘥𝘦 𝘦𝘴𝘤𝘳𝘪𝘣𝘪𝘳 𝘺 𝘴𝘦 𝘨𝘢𝘯𝘰 𝘴𝘶 𝘤𝘰𝘯𝘧𝘪𝘢𝘯𝘻𝘢. 𝘓𝘢𝘴 𝘢𝘶𝘵𝘰𝘳𝘪𝘥𝘢𝘥𝘦𝘴");
            System.out.println("            𝘢𝘥𝘷𝘪𝘦𝘳𝘵𝘦𝘯 𝘲𝘶𝘦 𝘦𝘴𝘵𝘢 𝘳𝘦𝘥 𝘤𝘳𝘪𝘮𝘪𝘯𝘢𝘭 𝘴𝘪𝘨𝘶𝘦 𝘰𝘱𝘦𝘳𝘢𝘯𝘥𝘰 𝘣𝘢𝘫𝘰 𝘱𝘦𝘳𝘧𝘪𝘭𝘦𝘴 𝘳𝘰𝘣𝘢𝘥𝘰𝘴.");
            System.out.println("            𝘏𝘰𝘺 𝘤𝘰𝘮𝘪𝘦𝘯𝘻𝘢 𝘵𝘶 𝘋𝘪𝘢 𝘋𝘪𝘨𝘪𝘵𝘢𝘭, 𝘋𝘦𝘵𝘦𝘤𝘵𝘪𝘷𝘦. 𝘌𝘳𝘦𝘴 𝘶𝘯 𝘦𝘴𝘵𝘶𝘥𝘪𝘢𝘯𝘵𝘦 𝘤𝘰𝘮𝘶𝘯, 𝘱𝘦𝘳𝘰");
            System.out.println("            𝘵𝘳𝘢𝘴 𝘭𝘦𝘦𝘳 𝘦𝘴𝘵𝘰, 𝘴𝘢𝘣𝘦𝘴 𝘲𝘶𝘦 𝘦𝘭 𝘱𝘦𝘭𝘪𝘨𝘳𝘰 𝘳𝘦𝘴𝘱𝘪𝘳𝘢 𝘦𝘯 𝘵𝘶 𝘱𝘳𝘰𝘱𝘪𝘢 𝘱𝘢𝘯𝘵𝘢𝘭𝘭𝘢. 𝘛u");
            System.out.println("            𝘮𝘪𝘴𝘪𝘰𝘯 𝘦𝘴 𝘴𝘰𝘣𝘳𝘦𝘷𝘪𝘷𝘪𝘳: 𝘢𝘯𝘢𝘭𝘪𝘻𝘢 𝘲𝘶𝘪𝘦𝘯 𝘦𝘴𝘵𝘢 𝘳𝘦𝘢𝘭𝘮𝘦𝘯𝘵𝘦 𝘥𝘦𝘵𝘳𝘢𝘴 𝘥𝘦 𝘤𝘢𝘥𝘢 𝘤𝘩𝘢𝘵,");
            System.out.println("            𝘱𝘳𝘰𝘵𝘦𝘨𝘦 𝘵𝘶𝘴 𝘥𝘢𝘵𝘰𝘴 𝘺 𝘥𝘦𝘴𝘦𝘯𝘮𝘢𝘴𝘤𝘢𝘳𝘢 𝘢 𝘭𝘰𝘴 𝘥𝘦𝘱𝘳𝘦𝘥𝘢𝘥𝘰𝘳𝘦𝘴 𝘢𝘯𝘵𝘦𝘴 𝘥𝘦 𝘤𝘢𝘦𝘳 𝘦𝘯 𝘴𝘶 𝘵𝘳𝘢𝘮𝘱𝘢.");
            System.out.println(" ======================================================================================================\n");

            // --- BLOQUE DEL MENÚ PRINCIPAL (Con tu diseño exacto) ---
            System.out.println("         ═════════════════════════ ◈ ═════════════════════════");
            System.out.println("                            𝗠𝗘𝗡𝗨́ 𝗣𝗥𝗜𝗡𝗖𝗜𝗣𝗔𝗟 ");
            System.out.println("         ═════════════════════════════════════════════════════");
            System.out.println("         (𝙳𝚒𝚐𝚒𝚝𝚊 𝚎𝚕 𝚗𝚞́𝚖𝚎𝚛𝚘 𝚍𝚎 𝚝𝚞 𝚎𝚕𝚎𝚌𝚌𝚒𝚘́𝚗)\n");
            System.out.println("           [ 𝟏 ] 𝖨𝗇𝗂𝖼𝗂𝖺𝗋 𝗂𝗇𝗏𝖾𝗌𝗍𝗂𝗀𝖺𝖼𝗂𝗈́𝗇");
            System.out.println("           [ 𝟐 ] 𝖬𝖺𝗇𝗎𝖺𝗅 𝖽𝖾𝗅 𝖽𝖾𝗍𝖾𝖼𝗍𝗂𝗏𝖾");
            System.out.println("           [ 𝟑 ] 𝖢𝗋𝖾́𝖽𝗂𝗍𝗈𝗌");
            System.out.println("           [ 𝟒 ] 𝖲𝖺𝗅𝗂𝗋");
            System.out.println("         ═════════════════════════ ◈ ═════════════════════════");
            System.out.print("\n         ► 𝙴𝚕𝚒𝚐𝚎 𝚞𝚗𝚊 𝚘𝚙𝚌𝚒𝚘́𝚗: ");

            // Análisis - Entrada: opción numérica del menú (opcionMenu). Proceso: validar que la opción esté en el rango 1-4 y usar switch para iniciar juego, mostrar manual, créditos o salir. Salida: actualización de variable 'jugar' e impresión del contenido seleccionado.
            int opcionMenu = sc.nextInt();
            sc.nextLine();

            // Validación de rango reemplazando las listas largas de case
            if (opcionMenu >= 1 && opcionMenu <= 4) {

                switch (opcionMenu) {
                    case 1:
                        jugar = 1;
                        System.out.println("\n(𝚂𝙸𝚂𝚃𝙴𝙼𝙰 - 𝙸𝚗𝚒𝚌𝚒𝚊𝚗𝚍𝚘 𝚌𝚘𝚗𝚎𝚡𝚒𝚘́𝚗 𝚜𝚎𝚐𝚞𝚛𝚊...) 𝚃𝚞 𝙳ia 𝙳𝚒𝚐𝚒𝚝𝚊𝚕 𝚑𝚊 𝚌𝚘𝚖𝚎𝚗𝚣𝚊𝚍𝚘.");
                        System.out.print("\n(Presiona 𝙴𝙽𝚃𝙴𝚁 y entraras a un mundo peligroso, Mucha suerte Detective... ");
                        sc.nextLine();
                        break;
                    case 2:
                        jugar = 1;
                        System.out.println("\n====== 𝐃𝐄𝐓𝐄𝐂𝐓𝐈𝐕𝐄, 𝐓𝐄𝐍 𝐄𝐍 𝐂𝐔𝐄𝐍𝐓𝐀 𝐓𝐔 𝐌𝐀𝐍𝐔𝐀𝐋: 𝟓 𝐒𝐄𝐍̃𝐀𝐋𝐄𝐒 𝐃𝐄 𝐏𝐄𝐋𝐈𝐆𝐑𝐎 ======\n\n" +
                            "𝟣. 𝘙𝘦𝘷𝘪𝘴𝘢 𝘭𝘢 𝘧𝘦𝘤𝘩𝘢 𝘥𝘦 𝘤𝘳𝘦𝘢𝘤𝘪𝘰́𝘯 𝘥𝘦 𝘭𝘢 𝘤𝘶𝘦𝘯𝘵𝘢, 𝘴𝘪 𝘭𝘢 𝘤𝘶𝘦𝘯𝘵𝘢 𝘦𝘴 𝘮𝘶𝘺 𝘳𝘦𝘤𝘪𝘦𝘯𝘵𝘦: 𝘗𝘦𝘭𝘪𝘨𝘳𝘰.\n" +
                            "𝟤. ¿𝘕𝘰 𝘵𝘪𝘦𝘯𝘦 𝘯𝘪𝘯𝘨𝘶𝘯𝘢 𝘱𝘶𝘣𝘭𝘪𝘤𝘢𝘤𝘪𝘰́𝘯 𝘰 𝘧𝘰𝘵𝘰? 𝘈𝘭𝘦𝘳𝘵𝘢.\n" +
                            "𝟥. 𝘔𝘶𝘤𝘩𝘰𝘴 𝘴𝘦𝘨𝘶𝘪𝘥𝘰𝘴 𝘺 𝘱𝘰𝘤𝘰𝘴 𝘴𝘦𝘨𝘶𝘪𝘥𝘰𝘳𝘦𝘴, 𝘢𝘭𝘨𝘰 𝘢𝘯𝘥𝘢 𝘮𝘢𝘭.\n" +
                            "𝟦. 𝘛𝘦 𝘱𝘪𝘥𝘦 𝘢𝘭𝘨𝘶́𝘯 𝘵𝘪𝘱𝘰 𝘥𝘦 𝘪𝘯𝘧𝘰𝘳𝘮𝘢𝘤𝘪𝘰́𝘯 𝘤𝘰𝘯𝘧𝘪𝘥𝘦𝘯𝘤𝘪𝘢𝘭 (𝘤𝘰𝘯𝘵𝘳𝘢𝘴𝘦𝘯̃𝘢𝘴, 𝘥𝘢𝘵𝘰𝘴 𝘰 𝘥𝘪𝘯𝘦𝘳𝘰). 𝘈𝘭𝘦́𝘫𝘢𝘵𝘦 𝘠𝘈.\n" +
                            "𝟧. ¿𝘎𝘶𝘢𝘳𝘥𝘢𝘳 𝘴𝘦𝘤𝘳𝘦𝘵𝘰𝘴? 𝘕𝘪 𝘭𝘰 𝘴𝘶𝘦𝘯̃𝘦𝘴.\n\n" +
                           "================== 𝐌𝐀𝐍𝐔𝐀𝐋: 𝟓 𝐒𝐄𝐍̃𝐀𝐋𝐄𝐒 𝐃𝐄 𝐏𝐄𝐋𝐈𝐆𝐑𝐎 ==================\n" +
                            "(𝚈𝚊 𝚜𝚊𝚋𝚎𝚜 𝚌𝚞𝚊́𝚕𝚎𝚜 𝚜𝚘𝚗 𝚝𝚞𝚜 𝚊𝚕𝚎𝚛𝚝𝚊𝚜. 𝚃𝚞 𝚒𝚗𝚟𝚎𝚜𝚝𝚒𝚐𝚊𝚌𝚒𝚘́𝚗 𝚌𝚘𝚖𝚒𝚎𝚗𝚣𝚊 𝚊𝚑𝚘𝚛𝚊. 𝚂𝚞𝚎𝚛𝚝𝚎, 𝚍𝚎𝚝𝚎𝚌𝚝𝚒𝚟𝚎.)"
                        );
                        System.out.print("\n(𝙿𝚛𝚎𝚜𝚒𝚘𝚗𝚊 𝙴𝙽𝚃𝙴𝚁 𝚙𝚊𝚛𝚊 𝚟𝚎𝚛 los expedientes...) ");
                        sc.nextLine();

                        break;
                    case 3:
                        jugar = 0;
                        System.out.println("\n=== 𝐁𝐀𝐒𝐄 𝐃𝐄 𝐃𝐀𝐓𝐎𝐒: 𝐏𝐑𝐎𝐘𝐄𝐂𝐓𝐎 𝐅𝐄𝐑𝐈𝐀 𝐆𝐀𝐌𝐄𝐑 𝟐𝟎𝟐𝟔 ===\n" +
                            "𝐉𝐮𝐞𝐠𝐨: 𝙳𝚎𝚝𝚎𝚌𝚝𝚒𝚟𝚎 𝚍𝚎 𝙿𝚎𝚛𝚏𝚒𝚕𝚎𝚜 𝙵𝚊𝚕𝚜𝚘𝚜\n\n" +
                            "𝘌𝘲𝘶𝘪𝘱𝘰 𝘥𝘦 𝘐𝘯𝘷𝘦𝘴𝘵𝘪𝘨𝘢𝘤𝘪𝘰́𝘯:\n" +
                            "  ► 𝚅𝚊𝚕𝚎𝚛𝚒𝚊 𝙱𝚎𝚕𝚝𝚛𝚊́𝚗 (𝚁𝚎𝚐𝚒𝚜𝚝𝚛𝚘, 𝚟𝚊𝚕𝚒𝚍𝚊𝚌𝚒𝚘́𝚗 𝚢 𝚎𝚡𝚙𝚎𝚍𝚒𝚎𝚗𝚝𝚎𝚜 𝟺 𝚢 𝟻)\n" +
                            "  ► 𝙲𝚊𝚖𝚒𝚕𝚘 𝙱𝚘𝚕𝚊𝚗̃𝚘 (𝙷𝚒𝚜𝚝𝚘𝚛𝚒𝚊, 𝚖𝚎𝚗𝚞́ 𝚢 𝚎𝚡𝚙𝚎𝚍𝚒𝚎𝚗𝚝𝚎𝚜 𝟷 𝚊 𝟹)\n" +
                            "  ► 𝚃𝚘𝚖𝚊́𝚜 𝙻𝚘́𝚙𝚎𝚣 (𝙲𝚘𝚗𝚝𝚎𝚗𝚒𝚍𝚘, 𝚙𝚛𝚒𝚟𝚊𝚌𝚒𝚍𝚊𝚍, 𝚙𝚞𝚗𝚝𝚊𝚓𝚎, 𝚏𝚒𝚗𝚊𝚕𝚎𝚜 𝚢 𝚛𝚎𝚙𝚘𝚛𝚝𝚎)\n" +
                            "  ► 𝙹𝚞𝚊𝚗 𝙵𝚛𝚊𝚗𝚌𝚒𝚜𝚌𝚘 𝙲𝚊𝚖𝚊𝚌𝚑𝚘 (𝙻𝚒́𝚍𝚎𝚛: 𝚏𝚎𝚌𝚑𝚊𝚜 𝚢 𝚑𝚘𝚛𝚊𝚜, 𝚎 𝚒𝚗𝚝𝚎𝚐𝚛𝚊𝚌𝚒𝚘́𝚗)"
                        );
                        break;
                    case 4:
                        jugar = 0;
                        System.out.println("\n[𝚂𝙸𝚂𝚃𝙴𝙼𝙰 𝙰𝙿𝙰𝙶𝙰𝙳𝙾]. 𝙳𝚎𝚜𝚌𝚘𝚗𝚎𝚌𝚝𝚊𝚗𝚍𝚘 𝚍𝚎 𝚕𝚊 𝚛𝚎𝚍. 𝙷𝚊𝚜𝚝𝚊 𝚙𝚛𝚘𝚗𝚝𝚘, 𝚍𝚎𝚝𝚎𝚌𝚝𝚒𝚟𝚎.");
                        break;
                }
            } else {
                jugar = 0;
                System.out.println("\n𝚂𝙸𝚂𝚃𝙴𝙼𝙰 - [𝙴𝚁𝚁𝙾𝚁] 𝙾𝚙𝚌𝚒𝚘́𝚗 𝚗𝚘 𝚛𝚎𝚌𝚘𝚗𝚘𝚌𝚒𝚍𝚊 𝚙𝚘𝚛 𝚎𝚕 𝚜𝚎𝚛𝚟𝚒𝚍𝚘𝚛. 𝙳𝚎𝚜𝚌𝚘𝚗𝚎𝚌𝚝𝚊𝚗𝚍𝚘 𝚙𝚘𝚛 𝚜𝚎𝚐𝚞𝚛𝚒𝚍𝚊𝚍. 𝙷𝚊𝚜𝚝𝚊 𝚙𝚛𝚘𝚗𝚝𝚘.");
            }
        } //MENU

        // ############################################################################
        // 2. REGISTRO DEL JUGADOR Y VALIDACIONES  (Valeria Beltrán)
        // ############################################################################

        // 1. Nombre
        // Análisis - Entrada: texto del nombre. Proceso: validar que no esté vacío mediante switch. Salida: nombre o datosValidos = 0
        if (jugar == 1 && datosValidos == 1) {
            System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
            System.out.println("               𝗦𝗜𝗦𝗧𝗘𝗠𝗔 𝗗𝗘 𝗦𝗘𝗚𝗨𝗥𝗜𝗗𝗔𝗗 𝗗𝗜𝗚𝗜𝗧𝗔𝗟");
            System.out.println("═══════════════════════════════════════════════════════════");
            System.out.println(" Se ha detectado una red de perfiles falsos que suplanta");
            System.out.println(" identidades en internet.");
            System.out.println(" [𝙸𝙼𝙿𝙾𝚁𝚃𝙰𝙽𝚃𝙴] Cuando se pida un número, escribe solo el");
            System.out.println(" número (sin letras ni símbolos como \":\").");
            System.out.println("═════════════════════════════⋆○⋆══════════════════════════════\n");
            System.out.print(" ► Ingresa tu nombre para iniciar la revisión: ");
            nombre = sc.nextLine();

            switch (nombre) {
                case "":
                    datosValidos = 0;
                    System.out.println("\n [𝚂𝙸𝚂𝚃𝙴𝙼𝙰 - 𝙴𝚁𝚁𝙾𝚁] Debes escribir tu nombre.\n El juego terminará.");
                    break;
                default:
                    break;
            }
        }

        // 2. Edad
        // Análisis - Entrada: número de edad. Proceso: validar rango entre 6 y 99 mediante if. Salida: edad o datosValidos = 0
        if (jugar == 1 && datosValidos == 1) {
            System.out.print(" ► Hola " + nombre + ", ingresa tu edad, solo el número (6 a 99): ");
            edad = sc.nextInt();
            sc.nextLine();

            if (edad < 6 || edad > 99) {
                datosValidos = 0;
                System.out.println("\n [𝚂𝙸𝚂𝚃𝙴𝙼𝙰 - 𝙴𝚁𝚁𝙾𝚁] La edad debe ser un número entre 6 y 99.\n El juego terminará.");
            }

            if (datosValidos == 1) {
                if (edad < 13) {
                    System.out.println("\n [𝙰𝙳𝚅𝙴𝚁𝚃𝙴𝙽𝙲𝙸𝙰] La mayoría de redes sociales exigen tener al menos\n 13 años. Juega acompañado de un adulto.\n");
                } else if (edad <= 17) {
                    System.out.println("\n [𝙲𝙾𝙽𝚂𝙴𝙹𝙾] Si algo en redes te incomoda o te asusta, cuéntaselo\n a un adulto de confianza.\n");
                } else {
                    System.out.println("\n [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] Detective " + nombre + ", tu investigación comienza.\n");
                }
            }
        }

        // 3. Año
        // Análisis - Entrada: número del año. Proceso: validar rango 1900 a 2100 y determinar bisiesto. Salida: anio, bisiesto o datosValidos = 0
        if (jugar == 1 && datosValidos == 1) {
            System.out.print(" ► Ingresa el año en el que te encuentras (1900 a 2100, ej: 2026): ");
            anio = sc.nextInt();
            sc.nextLine();

            if (anio < 1900 || anio > 2100) {
                datosValidos = 0;
                System.out.println("\n [𝚂𝙸𝚂𝚃𝙴𝙼𝙰 - 𝙴𝚁𝚁𝙾𝚁] El año debe estar entre 1900 y 2100.\n El juego terminará.");
            }

            if (datosValidos == 1) {
                bisiesto = 0;
                if ((anio % 4 == 0 && anio % 100 != 0) || (anio % 400 == 0)) {
                    bisiesto = 1;
                }
            }
        }

        // 4. Mes
        // Análisis - Entrada: número del mes. Proceso: validar rango 1 a 12 y asignar diasMes. Salida: mes, diasMes o datosValidos = 0
        if (jugar == 1 && datosValidos == 1) {
            System.out.print(" ► Ingresa el número del mes actual (1 a 12, ej: 10 para octubre): ");
            mes = sc.nextInt();
            sc.nextLine();

            if (mes < 1 || mes > 12) {
                datosValidos = 0;
                System.out.println("\n [𝚂𝙸𝚂𝚃𝙴𝙼𝙰 - 𝙴𝚁𝚁𝙾𝚁] El mes debe estar entre 1 y 12.\n El juego terminará.");
            }

            if (datosValidos == 1) {
                switch (mes) {
                    case 2:
                        if (bisiesto == 1) {
                            diasMes = 29;
                        } else {
                            diasMes = 28;
                        }
                        break;
                    case 4:
                    case 6:
                    case 9:
                    case 11:
                        diasMes = 30;
                        break;
                    default:
                        diasMes = 31;
                        break;
                }
            }
        }

        // 5. Día
        // Análisis - Entrada: número del día. Proceso: validar rango de 1 a diasMes. Salida: dia o datosValidos = 0
        if (jugar == 1 && datosValidos == 1) {
            System.out.print(" ► Ingresa el día del mes (1 a " + diasMes + "): ");
            dia = sc.nextInt();
            sc.nextLine();

            if (dia < 1 || dia > diasMes) {
                datosValidos = 0;
                System.out.println("\n [𝚂𝙸𝚂𝚃𝙴𝙼𝙰 - 𝙴𝚁𝚁𝙾𝚁] Ese día no existe en el mes elegido.\n El juego terminará.");
            }
        }

        // 6. Hora
        // Análisis - Entrada: número de la hora. Proceso: validar rango 1 a 12. Salida: hora12 o datosValidos = 0
        if (jugar == 1 && datosValidos == 1) {
            System.out.print(" ► Ingresa la hora actual, solo la hora sin minutos (1 a 12, ej: 11): ");
            hora12 = sc.nextInt();
            sc.nextLine();

            if (hora12 < 1 || hora12 > 12) {
                datosValidos = 0;
                System.out.println("\n [𝚂𝙸𝚂𝚃𝙴𝙼𝙰 - 𝙴𝚁𝚁𝙾𝚁] La hora debe estar entre 1 y 12.\n El juego terminará.");
            }
        }

        // 7. Minuto
        // Análisis - Entrada: número del minuto. Proceso: validar rango 0 a 59. Salida: minuto o datosValidos = 0
        if (jugar == 1 && datosValidos == 1) {
            System.out.print(" ► Ingresa los minutos (0 a 59, ej: 16): ");
            minuto = sc.nextInt();
            sc.nextLine();

            if (minuto < 0 || minuto > 59) {
                datosValidos = 0;
                System.out.println("\n [𝚂𝙸𝚂𝚃𝙴𝙼𝙰 - 𝙴𝚁𝚁𝙾𝚁] El minuto debe estar entre 0 y 59.\n El juego terminará.");
            }
        }

        // 8. Franja
        // Análisis - Entrada: texto franja AM/PM. Proceso: validar coincidencia ignorando minúsculas/mayúsculas con switch. Salida: franja o datosValidos = 0
        if (jugar == 1 && datosValidos == 1) {
            System.out.print(" ► Ingresa la franja horaria (AM o PM): ");
            String txtFranja = sc.nextLine();

            switch (txtFranja) {
                case "AM":
                case "am":
                case "Am":
                case "aM":
                    franja = "AM";
                    break;
                case "PM":
                case "pm":
                case "Pm":
                case "pM":
                    franja = "PM";
                    break;
                default:
                    datosValidos = 0;
                    System.out.println("\n [𝚂𝙸𝚂𝚃𝙴𝙼𝙰 - 𝙴𝚁𝚁𝙾𝚁] Escribe AM o PM.\n El juego terminará.");
                    break;
            }
        }

        // 9. Horas de uso
        // Análisis - Entrada: número de horas de uso. Proceso: validar rango 1 a 24. Salida: horasUso o datosValidos = 0
        if (jugar == 1 && datosValidos == 1) {
            System.out.print(" ► ¿Cuántas horas vas a usar las redes sociales en esta sesión?\n   Solo el número (1 a 24): ");
            horasUso = sc.nextInt();
            sc.nextLine();

            if (horasUso < 1 || horasUso > 24) {
                datosValidos = 0;
                System.out.println("\n [𝚂𝙸𝚂𝚃𝙴𝙼𝙰 - 𝙴𝚁𝚁𝙾𝚁] Las horas de uso deben estar entre 1 y 24.\n El juego terminará.");
            }
        }

        // ############################################################################
        // 3. FECHAS Y HORAS: SALIDA, FORMATO MILITAR Y DÍA DE LA SEMANA  (Juan Francisco Camacho)
        // ############################################################################

        // 1. Hora de ingreso en formato de 24 horas
        // Análisis - Entrada: hora12 y franja. Proceso: 12 AM pasa a 0, 1 a 11 AM quedan igual,
        // 12 PM queda en 12 y 1 a 11 PM se les suma 12. Salida: hora24Ingreso (0 a 23)
        if (jugar == 1 && datosValidos == 1) {
            switch (franja) {
                case "AM":
                    if (hora12 == 12) {
                        hora24Ingreso = 0;
                    } else {
                        hora24Ingreso = hora12;
                    }
                    break;
                case "PM":
                    if (hora12 == 12) {
                        hora24Ingreso = 12;
                    } else {
                        hora24Ingreso = hora12 + 12;
                    }
                    break;
                default:
                    hora24Ingreso = hora12;
                    break;
            }
        }

        // 2. Fecha y hora de salida
        // Análisis - Entrada: anio, mes, dia, diasMes, hora24Ingreso, minuto y horasUso.
        // Proceso: sumar horasUso a la hora de ingreso; si llega a 24 o más, se pasa al día siguiente
        // (y si se acaba el mes o el año, también avanzan). Salida: anioSal, mesSal, diaSal,
        // horaSal, minutoSal, segundoSal = 1 y cruzaMedianoche (1 si pasa al día siguiente, 0 si no)
        if (jugar == 1 && datosValidos == 1) {
            anioSal = anio;
            mesSal = mes;
            diaSal = dia;
            minutoSal = minuto;
            segundoSal = 1;
            cruzaMedianoche = 0;
            horaSal = hora24Ingreso + horasUso;

            if (horaSal >= 24) {
                horaSal = horaSal - 24;
                cruzaMedianoche = 1;
                diaSal = diaSal + 1;

                if (diaSal > diasMes) {
                    diaSal = 1;
                    mesSal = mesSal + 1;

                    if (mesSal > 12) {
                        mesSal = 1;
                        anioSal = anioSal + 1;
                    }
                }
            }
        }

        // 3. Textos de fecha y hora en formato militar
        // Análisis - Entrada: dia, mes, anio, hora24Ingreso, minuto y los datos de salida.
        // Proceso: a cada número menor que 10 se le pone un 0 adelante (ej. 7 -> "07").
        // Salida: fechaIngresoTexto, fechaSalidaTexto (dd/mm/aaaa), horaIngresoTexto y horaSalidaTexto (hh:mm:ss)
        if (jugar == 1 && datosValidos == 1) {
            String diaTxt = "";
            String mesTxt = "";
            String horaTxt = "";
            String minutoTxt = "";
            String diaSalTxt = "";
            String mesSalTxt = "";
            String horaSalTxt = "";

            if (dia < 10) {
                diaTxt = "0" + dia;
            } else {
                diaTxt = "" + dia;
            }
            if (mes < 10) {
                mesTxt = "0" + mes;
            } else {
                mesTxt = "" + mes;
            }
            if (hora24Ingreso < 10) {
                horaTxt = "0" + hora24Ingreso;
            } else {
                horaTxt = "" + hora24Ingreso;
            }
            if (minuto < 10) {
                minutoTxt = "0" + minuto;
            } else {
                minutoTxt = "" + minuto;
            }
            if (diaSal < 10) {
                diaSalTxt = "0" + diaSal;
            } else {
                diaSalTxt = "" + diaSal;
            }
            if (mesSal < 10) {
                mesSalTxt = "0" + mesSal;
            } else {
                mesSalTxt = "" + mesSal;
            }
            if (horaSal < 10) {
                horaSalTxt = "0" + horaSal;
            } else {
                horaSalTxt = "" + horaSal;
            }

            fechaIngresoTexto = diaTxt + "/" + mesTxt + "/" + anio;
            fechaSalidaTexto = diaSalTxt + "/" + mesSalTxt + "/" + anioSal;
            horaIngresoTexto = horaTxt + ":" + minutoTxt + ":00";
            horaSalidaTexto = horaSalTxt + ":" + minutoTxt + ":01";
        }

        // 4. Día de la semana de ingreso (congruencia de Zeller)
        // Análisis - Entrada: dia, mes, anio. Proceso: enero y febrero se cuentan como meses 13 y 14
        // del año anterior; luego h = (dia + 13*(mes+1)/5 + k + k/4 + j/4 + 5*j) % 7, donde k son los
        // dos últimos dígitos del año y j los dos primeros. Salida: diaSemanaIngreso (0 = sábado ... 6 = viernes)
        if (jugar == 1 && datosValidos == 1) {
            int mesZ = mes;
            int anioZ = anio;
            if (mesZ < 3) {
                mesZ = mesZ + 12;
                anioZ = anioZ - 1;
            }
            int k = anioZ % 100;
            int j = anioZ / 100;
            int h = (dia + (13 * (mesZ + 1)) / 5 + k + k / 4 + j / 4 + 5 * j) % 7;

            switch (h) {
                case 0: diaSemanaIngreso = "sábado"; break;
                case 1: diaSemanaIngreso = "domingo"; break;
                case 2: diaSemanaIngreso = "lunes"; break;
                case 3: diaSemanaIngreso = "martes"; break;
                case 4: diaSemanaIngreso = "miércoles"; break;
                case 5: diaSemanaIngreso = "jueves"; break;
                default: diaSemanaIngreso = "viernes"; break;
            }
        }

        // 5. Día de la semana de salida (misma fórmula con la fecha de salida)
        // Análisis - Entrada: diaSal, mesSal, anioSal. Proceso: congruencia de Zeller igual que en el paso 4.
        // Salida: diaSemanaSalida
        if (jugar == 1 && datosValidos == 1) {
            int mesZ = mesSal;
            int anioZ = anioSal;
            if (mesZ < 3) {
                mesZ = mesZ + 12;
                anioZ = anioZ - 1;
            }
            int k = anioZ % 100;
            int j = anioZ / 100;
            int h = (diaSal + (13 * (mesZ + 1)) / 5 + k + k / 4 + j / 4 + 5 * j) % 7;

            switch (h) {
                case 0: diaSemanaSalida = "sábado"; break;
                case 1: diaSemanaSalida = "domingo"; break;
                case 2: diaSemanaSalida = "lunes"; break;
                case 3: diaSemanaSalida = "martes"; break;
                case 4: diaSemanaSalida = "miércoles"; break;
                case 5: diaSemanaSalida = "jueves"; break;
                default: diaSemanaSalida = "viernes"; break;
            }
        }

        // 6. Resumen de la sesión
        // Análisis - Entrada: diaSemana, fecha y hora (texto) de ingreso y de salida. Proceso: mostrarlos
        // al jugador y esperar ENTER para que no se pierda. Salida: resumen de la sesión en pantalla
        if (jugar == 1 && datosValidos == 1) {
            System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
            System.out.println("                     𝗦𝗘𝗦𝗜𝗢́𝗡 𝗥𝗘𝗚𝗜𝗦𝗧𝗥𝗔𝗗𝗔");
            System.out.println("═══════════════════════════════════════════════════════════");
            System.out.println(" ► Ingreso: " + diaSemanaIngreso + " " + fechaIngresoTexto + " " + horaIngresoTexto);
            System.out.println(" ► Salida:  " + diaSemanaSalida + " " + fechaSalidaTexto + " " + horaSalidaTexto);
            System.out.println("═════════════════════════════⋆○⋆══════════════════════════════");
            System.out.print("\n(Presiona ENTER para continuar...) ");
            sc.nextLine();
        }

        // ############################################################################
        // 4. CONTENIDO CONSUMIDO  (Tomás López)
        // ############################################################################

        // =========================================================
        // A. CONTENIDO CONSUMIDO
        // Análisis
        // Entrada: contenido1 y contenido2 (leídos por consola con sc.nextInt y sc.nextLine).
        // Proceso: Validar que estén en el rango de 1 a 7. Si son iguales, se alerta
        //          y se cuenta solo una vez. Acumular puntos de riesgo según la categoría.
        //          Si un dato es inválido, asigna datosValidos = 0 y termina.
        // Salida:  Puntaje actualizado y mensajes de advertencia si aplican.
        // =========================================================
        if (jugar == 1 && datosValidos == 1) {
            System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
            System.out.println("                    𝗧𝗨 𝗖𝗢𝗡𝗦𝗨𝗠𝗢 𝗗𝗜𝗚𝗜𝗧𝗔𝗟");
            System.out.println("═══════════════════════════════════════════════════════════");
            System.out.println(" ¿Qué tipo de contenido ves más en redes? Escoge 2 opciones");
            System.out.println(" de la lista.");
            System.out.println("═════════════════════════════⋆○⋆══════════════════════════════\n");
            System.out.println("  [ 𝟏 ] 𝐂𝐨𝐧𝐭𝐞𝐧𝐢𝐝𝐨 𝐞𝐝𝐮𝐜𝐚𝐭𝐢𝐯𝐨");
            System.out.println("  [ 𝟐 ] 𝐍𝐨𝐭𝐢𝐜𝐢𝐚𝐬 𝐨𝐟𝐢𝐜𝐢𝐚𝐥𝐞𝐬");
            System.out.println("  [ 𝟑 ] 𝐄𝐧𝐭𝐫𝐞𝐭𝐞𝐧𝐢𝐦𝐢𝐞𝐧𝐭𝐨");
            System.out.println("  [ 𝟒 ] 𝐂𝐫𝐞𝐚𝐝𝐨𝐫𝐞𝐬 𝐝𝐞 𝐜𝐨𝐧𝐭𝐞𝐧𝐢𝐝𝐨");
            System.out.println("  [ 𝟓 ] 𝐏𝐮𝐛𝐥𝐢𝐜𝐚𝐜𝐢𝐨𝐧𝐞𝐬 𝐝𝐞 𝐩𝐞𝐫𝐟𝐢𝐥𝐞𝐬 𝐚𝐧𝐨́𝐧𝐢𝐦𝐨𝐬");
            System.out.println("  [ 𝟔 ] 𝐂𝐚𝐭𝐟𝐢𝐬𝐡 𝐲 𝐩𝐮𝐛𝐥𝐢𝐜𝐚𝐜𝐢𝐨𝐧𝐞𝐬 𝐞𝐧𝐠𝐚𝐧̃𝐨𝐬𝐚𝐬");
            System.out.println("  [ 𝟕 ] 𝐌𝐞𝐧𝐬𝐚𝐣𝐞𝐬 𝐯𝐢𝐨𝐥𝐞𝐧𝐭𝐨𝐬 𝐨 𝐝𝐞 𝐨𝐝𝐢𝐨\n");

            System.out.print("► 𝙿𝚛𝚒𝚖𝚎𝚛 𝚌𝚘𝚗𝚝𝚎𝚗𝚒𝚍𝚘 (1 a 7): ");
            contenido1 = sc.nextInt();
            sc.nextLine();

            switch (contenido1) {
                case 1: case 2:
                    puntaje += 0;
                    break;
                case 3:
                    puntaje += 1;
                    break;
                case 4:
                    puntaje += 2;
                    break;
                case 5:
                    puntaje += 3;
                    break;
                case 6: case 7:
                    puntaje += 4;
                    break;
                default:
                    datosValidos = 0;
                    System.out.println("\n [𝚂𝙸𝚂𝚃𝙴𝙼𝙰 - 𝙴𝚁𝚁𝙾𝚁] El contenido debe estar entre 1 y 7.\n El juego terminará.");
                    break;
            }
        }

        if (jugar == 1 && datosValidos == 1) {
            System.out.print("► 𝚂𝚎𝚐𝚞𝚗𝚍𝚘 𝚌𝚘𝚗𝚝𝚎𝚗𝚒𝚍𝚘 (1 a 7): ");
            contenido2 = sc.nextInt();
            sc.nextLine();

            if (contenido2 < 1 || contenido2 > 7) {
                datosValidos = 0;
                System.out.println("\n [𝚂𝙸𝚂𝚃𝙴𝙼𝙰 - 𝙴𝚁𝚁𝙾𝚁] El contenido debe estar entre 1 y 7.\n El juego terminará.");
            } else if (contenido2 == contenido1) {
                System.out.println(" ► Elegiste el mismo contenido; se cuenta una sola vez.");
            } else {
                switch (contenido2) {
                    case 1: case 2:
                        puntaje += 0;
                        break;
                    case 3:
                        puntaje += 1;
                        break;
                    case 4:
                        puntaje += 2;
                        break;
                    case 5:
                        puntaje += 3;
                        break;
                    case 6: case 7:
                        puntaje += 4;
                        break;
                    default:
                        break;
                }
            }
        }

        // Pausa antes de los expedientes (integración)
        // Análisis - Entrada: ENTER del jugador. Proceso: esperar a que el jugador esté listo. Salida: ninguna
        if (jugar == 1 && datosValidos == 1) {
            System.out.print("\n(Presiona ENTER para abrir tu primer expediente, Detective...) ");
            sc.nextLine();
        }

        // ############################################################################
        // 5. EXPEDIENTES 1 A 3  (Camilo Bolaño)
        // ############################################################################

        if (jugar == 1 && datosValidos == 1) {

            System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
            System.out.println("                   𝗘𝗟 𝗣𝗥𝗜𝗠𝗘𝗥 𝗖𝗢𝗡𝗧𝗔𝗖𝗧𝗢");
            System.out.println("═══════════════════════════════════════════════════════════");
            System.out.println(" [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - (Tu celular vibra sobre el escritorio...)\n");

            System.out.println(" [𝙼𝙴𝙽𝚂𝙰𝙹𝙴 𝚍𝚎 𝚞𝚗 𝙳𝚎𝚜𝚌𝚘𝚗𝚘𝚌𝚒𝚍𝚘]:");
            System.out.println(" '¡Hola! Vi tu perfil y encajas perfecto en nuestra vacante");
            System.out.println(" remota con excelente sueldo. Abre este enlace para ver detalles...'\n");

            System.out.println(" Un mensaje inocente, una oferta demasiado buena para ser verdad");
            System.out.println(" de alguien que no conoces. Así es como entran: sin forzar cerraduras,");
            System.out.println(" solo esperando que abras la puerta digital tú mismo.");
            System.out.println(" ¿Qué vas a hacer, Detective?");
            System.out.println("═════════════════════════════⋆○⋆══════════════════════════════\n");

            System.out.println("  [ 𝟏 ] 𝐀𝐜𝐞𝐩𝐭𝐚𝐫 (abrir enlace)");
            System.out.println("  [ 𝟐 ] 𝐑𝐞𝐜𝐡𝐚𝐳𝐚𝐫 (ignorar)");
            System.out.println("  [ 𝟑 ] 𝐑𝐞𝐩𝐨𝐫𝐭𝐚𝐫 𝐲 𝐛𝐥𝐨𝐪𝐮𝐞𝐚𝐫");
            System.out.println("  [ 𝟒 ] 𝐈𝐧𝐬𝐩𝐞𝐜𝐜𝐢𝐨𝐧𝐚𝐫 𝐩𝐞𝐫𝐟𝐢𝐥 (investigar más)\n");

            System.out.print("► 𝙴𝚕𝚒𝚐𝚎 𝚞𝚗𝚊 𝚘𝚙𝚌𝚒𝚘́𝚗:");

            // Análisis - Entrada: elección primaria del caso 1 (opcionExp1) y elección secundaria (opcionPista1). Proceso: evaluar rangos (1-4 y 1-3) para asignar una única respuesta a decision1 y calcular impacto mediante switch. Salida: actualización de puntaje, contador de errores y mensaje de retroalimentación en consola.
            int opcionExp1 = sc.nextInt();
            sc.nextLine();

            // Validación de rango con operadores relacionales (>=, <=) y el operador lógico AND (&&)
            if (opcionExp1 >= 1 && opcionExp1 <= 4) {

                if (opcionExp1 == 4) {
                    System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
                    System.out.println("               𝗜𝗡𝗦𝗣𝗘𝗖𝗖𝗜𝗢́𝗡 𝗗𝗘𝗟 𝗣𝗘𝗥𝗙𝗜𝗟");
                    System.out.println("═══════════════════════════════════════════════════════════");
                    System.out.println(" [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - (Analizando metadatos y historial de la cuenta...)\n");

                    System.out.println(" La cuenta fue creada hace apenas 2 días. No tiene foto");
                    System.out.println(" propia y cuenta con tan solo 8 seguidores.");
                    System.out.println(" ¿Será una trampa?, detective. Actúa con cautela.\n");
                    System.out.println("═════════════════════════════⋆○⋆══════════════════════════════\n");

                    System.out.println("  [ 𝟏 ] 𝐀𝐜𝐞𝐩𝐭𝐚𝐫 (abrir enlace)");
                    System.out.println("  [ 𝟐 ] 𝐑𝐞𝐜𝐡𝐚𝐳𝐚𝐫 (ignorar)");
                    System.out.println("  [ 𝟑 ] 𝐑𝐞𝐩𝐨𝐫𝐭𝐚𝐫 𝐲 𝐛𝐥𝐨𝐪𝐮𝐞𝐚𝐫\n");

                    System.out.print("  ► 𝙴𝚕𝚒𝚐𝚎 𝚞𝚗𝚊 𝚘𝚙𝚌𝚒𝚘́𝚗: ");

                    int opcionPista1 = sc.nextInt();
                    sc.nextLine();

                    if (opcionPista1 >= 1 && opcionPista1 <= 3) {
                        decision1 = opcionPista1;
                    } else {
                        decision1 = 0;
                    }
                } else {
                    decision1 = opcionExp1; // Asignación directa si eligió 1, 2 o 3
                }

            } else {
                decision1 = 0; // Opción inválida general
            }

            // Consecuencias: aplicación de Acumuladores y Contadores
            switch (decision1) {
                case 1:
                // ACEPTAR (+3 puntos, incorrecta)
                    puntaje = puntaje + 3; // Acumulador matemático de riesgo
                    decisionesIncorrectas = decisionesIncorrectas + 1; // Contador

                    System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
                    System.out.println("                 [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - 𝙰𝙻𝙴𝚁𝚃𝙰 𝙳𝙴 𝚂𝙴𝙶𝚄𝚁𝙸𝙳𝙰𝙳");
                    System.out.println("═══════════════════════════════════════════════════════════");
                    System.out.println(" Abriste el enlace. Era un ataque de phishing.");
                    System.out.println(" En segundos, una copia de tu agenda de contactos fue robada.");
                    System.out.println(" Las ofertas mágicas de desconocidos SIEMPRE son trampas.");
                    System.out.println("═════════════════════════════⋆○⋆══════════════════════════════");
                    System.out.println("  ► Puntaje de Riesgo Actual: " + puntaje + "\n");
                    System.out.print("(Mucho mas cuidado Detective... ENTER para continuar). ");
                    sc.nextLine();
                    break;

                case 2:
                // RECHAZAR (0 puntos, correcta)
                    decisionesCorrectas = decisionesCorrectas + 1; // Contador

                    System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
                    System.out.println("                 [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - 𝙰𝙲𝙲𝙸𝙾́𝙽 𝙲𝙾𝚁𝚁𝙴𝙲𝚃𝙰");
                    System.out.println("═══════════════════════════════════════════════════════════");
                    System.out.println(" (Deslizas el mensaje para ignorarlo).");
                    System.out.println(" Buena decisión. Al revisar las noticias más tarde, ves que");
                    System.out.println(" ese enlace instalaba un virus espía. Tu instinto te salvó.");
                    System.out.println("═════════════════════════════⋆○⋆══════════════════════════════");
                    System.out.println("  ► Puntaje de Riesgo Actual: " + puntaje + "\n");
                    System.out.print("(Muy bien Detective... ENTER para continuar). ");
                    sc.nextLine();
                    break;

                case 3:
                // REPORTAR Y BLOQUEAR (0 puntos, correcta)
                    decisionesCorrectas = decisionesCorrectas + 1;

                    System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
                    System.out.println("               [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - 𝚉𝙾𝙽𝙰 𝙿𝚁𝙾𝚃𝙴𝙶𝙸𝙳𝙰");
                    System.out.println("═══════════════════════════════════════════════════════════");
                    System.out.println(" Usuario reportado y bloqueado exitosamente.");
                    System.out.println(" Horas después, la plataforma cierra la cuenta por fraude.");
                    System.out.println(" No solo te protegiste a ti, protegiste a otros. Excelente.");
                    System.out.println("═════════════════════════════⋆○⋆══════════════════════════════");
                    System.out.println("  ► Puntaje de Riesgo Actual: " + puntaje + "\n");
                    System.out.print("(Excelente Detective... ENTER para continuar). ");
                    sc.nextLine();
                    break;

                default:
                // INVÁLIDA O NO DECIDISTE (+1 punto, incorrecta)
                    puntaje = puntaje + 1;
                    decisionesIncorrectas = decisionesIncorrectas + 1;

                    System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
                    System.out.println("    [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - 𝚃𝙸𝙴𝙼𝙿𝙾 𝙰𝙶𝙾𝚃𝙰𝙳𝙾/ RESPUESTA INVALIDA");
                    System.out.println("═══════════════════════════════════════════════════════════");
                    System.out.println(" (Te quedas mirando la pantalla sin saber qué hacer).");
                    System.out.println(" Dudaste demasiado y dejaste el mensaje ahí. Aunque no abriste");
                    System.out.println(" el enlace, no tomaste medidas. El depredador sigue activo.");
                    System.out.println("═════════════════════════════⋆○⋆══════════════════════════════");
                    System.out.println("  ► Puntaje de Riesgo Actual: " + puntaje + "\n");
                    System.out.print("(Concentrate Detective en las investigaciones \ntodos los detalles son importantes... ENTER para continuar). ");
                    sc.nextLine();
                    break;
            }
        } //Expediente 1

        if (jugar == 1 && datosValidos == 1) {

            System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
            System.out.println("                 𝗘𝗟 𝗣𝗘𝗥𝗙𝗜𝗟 𝗖𝗟𝗢𝗡𝗔𝗗𝗢");
            System.out.println("═══════════════════════════════════════════════════════════");
            System.out.println(" [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - (Tu celular vibra sobre el escritorio...)\n");

            System.out.println(" [𝙼𝙴𝙽𝚂𝙰𝙹𝙴 𝚍𝚎 𝚞𝚗 𝙲𝚘𝚖𝚙𝚊𝚗̃𝚎𝚛𝚘 𝚍𝚎 𝙲𝚕𝚊𝘴𝚎]:");
            System.out.println(" '¡Ey! ¿De casualidad tienes los apuntes del taller de cálculo");
            System.out.println(" que dejaron hoy? Te dejé un link de Drive con lo que alcancé");
            System.out.println(" a hacer para compararlos.'\n");

            System.out.println(" Una interacción rutinaria, una simple petición de ayuda de alguien");
            System.out.println(" que ves a diario en la universidad. Sin embargo, la sombra de la");
            System.out.println(" noticia reciente te obliga a dudar. Los depredadores también se");
            System.out.println(" disfrazan de amigos y usan la confianza como llave. Tu instinto");
            System.out.println(" te dice que no bajes la guardia todavía.");
            System.out.println(" ¿Qué vas a hacer, Detective?");
            System.out.println("═════════════════════════════⋆○⋆══════════════════════════════\n");

            System.out.println("  [ 𝟏 ] 𝐀𝐜𝐞𝐩𝐭𝐚𝐫 (abrir enlace)");
            System.out.println("  [ 𝟐 ] 𝐑𝐞𝐜𝐡𝐚𝐳𝐚𝐫 (ignorar)");
            System.out.println("  [ 𝟑 ] 𝐑𝐞𝐩𝐨𝐫𝐭𝐚𝐫 𝐲 𝐛𝐥𝐨𝐪𝐮𝐞𝐚𝐫");
            System.out.println("  [ 𝟒 ] 𝐈𝐧𝐬𝐩𝐞𝐜𝐜𝐢𝐨𝐧𝐚𝐫 𝐩𝐞𝐫𝐟𝐢𝐥 (investigar más)\n");

            System.out.print("► 𝙴𝚕𝚒𝚐𝚎 𝚞𝚗𝚊 𝚘𝚙𝚌𝚒𝚘́𝚗: ");
            // Análisis - Entrada: elección primaria del caso 2 (opcionExp2) y posible elección secundaria (opcionPista2). Proceso: validar que se ingresen opciones numéricas correctas para establecer decision2; luego, en el switch asignar puntos e incrementar contadores (correctas/incorrectas) según la lógica del juego. Salida: impresión de la resolución de la trama y estadísticas actualizadas en pantalla.
            int opcionExp2 = sc.nextInt();
            sc.nextLine();

            if (opcionExp2 >= 1 && opcionExp2 <= 4) {

                if (opcionExp2 == 4) {
                    System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
                    System.out.println("               𝗜𝗡𝗦𝗣𝗘𝗖𝗖𝗜𝗢́𝗡 𝗗𝗘𝗟 𝗣𝗘𝗥𝗙𝗜𝗟");
                    System.out.println("═══════════════════════════════════════════════════════════");
                    System.out.println(" [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - (Analizando metadatos y perfil del usuario...)\n");

                    System.out.println(" La cuenta tiene años de actividad. Hay fotos recientes en el");
                    System.out.println(" campus, etiquetas de amigos en común y su forma de escribir");
                    System.out.println(" incluye las mismas muletillas de siempre.");
                    System.out.println(" Todo indica que es tu compañero y no hay señales de manipulación.\n");
                    System.out.println("═════════════════════════════⋆○⋆══════════════════════════════\n");

                    System.out.println("  [ 𝟏 ] 𝐀𝐜𝐞𝐩𝐭𝐚𝐫 (abrir enlace)");
                    System.out.println("  [ 𝟐 ] 𝐑𝐞𝐜𝐡𝐚𝐳𝐚𝐫 (ignorar)");
                    System.out.println("  [ 𝟑 ] 𝐑𝐞𝐩𝐨𝐫𝐭𝐚𝐫 𝐲 𝐛𝐥𝐨𝐪𝐮𝐞𝐚𝐫\n");

                    System.out.print("  ► 𝙴𝚕𝚒𝚐𝚎 𝚞𝚗𝚊 𝚘𝚙𝚌𝚒𝚘́𝚗: ");

                    int opcionPista2 = sc.nextInt();
                    sc.nextLine();

                    if (opcionPista2 >= 1 && opcionPista2 <= 3) {
                        decision2 = opcionPista2;
                    } else {
                        decision2 = 0;
                    }
                } else {
                    decision2 = opcionExp2;
                }

            } else {
                decision2 = 0;
            }

            switch (decision2) {
                case 1:
                // ACEPTAR (0 puntos, correcta porque es un amigo real)
                    decisionesCorrectas = decisionesCorrectas + 1;

                    System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
                    System.out.println("                 [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - 𝙰𝙲𝙲𝙸𝙾́𝙽 𝙲𝙾𝚁𝚁𝙴𝙲𝚃𝙰");
                    System.out.println("═══════════════════════════════════════════════════════════");
                    System.out.println(" Solicitud aceptada. Abres el Drive y están los apuntes de cálculo.");
                    System.out.println(" Era realmente tu compañero. Tener precaución es vital, pero");
                    System.out.println(" también lo es reconocer cuando una cuenta cumple con todo.");
                    System.out.println("═════════════════════════════⋆○⋆══════════════════════════════");
                    System.out.println("  ► Puntaje de Riesgo Actual: " + puntaje + "\n");
                    System.out.print("(Muy bien Detective... ENTER para continuar). ");
                    sc.nextLine();
                    break;

                case 2:
                // RECHAZAR (+1 punto por desconfiar de tu círculo real)
                    puntaje = puntaje + 1;
                    decisionesIncorrectas = decisionesIncorrectas + 1;

                    System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
                    System.out.println("              [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - 𝙾𝙿𝙾𝚁𝚃𝗨𝙽𝙸𝙳𝙰𝙳 𝙿𝙴𝚁𝙳𝙸𝙳𝙰");
                    System.out.println("═══════════════════════════════════════════════════════════");
                    System.out.println(" Solicitud rechazada. Te dejaste llevar por la paranoia.");
                    System.out.println(" Un perfil con años de actividad y fotos en el campus es confiable.");
                    System.out.println(" Perdiste la oportunidad de colaborar con tu compañero.");
                    System.out.println("═════════════════════════════⋆○⋆══════════════════════════════");
                    System.out.println("  ► Puntaje de Riesgo Actual: " + puntaje + "\n");
                    System.out.print("(Cuidado con la paranoia Detective... ENTER para continuar). ");
                    sc.nextLine();
                    break;

                case 3:
                // REPORTAR Y BLOQUEAR (+1 punto por reportar a un inocente)
                    puntaje = puntaje + 1;
                    decisionesIncorrectas = decisionesIncorrectas + 1;

                    System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
                    System.out.println("                 [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - 𝙴𝚁𝚁𝙾𝚁 𝙳𝙴 𝙹𝗨𝙸𝗖𝙸𝗢");
                    System.out.println("═══════════════════════════════════════════════════════════");
                    System.out.println(" Usuario reportado. Reportaste a tu compañero real.");
                    System.out.println(" Abusar de las herramientas de reporte por miedo puede afectar");
                    System.out.println(" a usuarios inocentes. Debes aprender a leer bien las pistas.");
                    System.out.println("═════════════════════════════⋆○⋆══════════════════════════════");
                    System.out.println("  ► Puntaje de Riesgo Actual: " + puntaje + "\n");
                    System.out.print("(Analiza mejor las pistas... ENTER para continuar). ");
                    sc.nextLine();
                    break;

                default:
                // INVÁLIDA O NO DECIDISTE (+1 punto)
                    puntaje = puntaje + 1;
                    decisionesIncorrectas = decisionesIncorrectas + 1;

                    System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
                    System.out.println("                 [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - 𝚃𝙸𝙴𝙼𝙿𝙾 𝙰𝙶𝙾𝚃𝙰𝙳𝙾");
                    System.out.println("═══════════════════════════════════════════════════════════");
                    System.out.println(" (Ignoras el mensaje y sigues deslizando la pantalla).");
                    System.out.println(" Está bien dudar, pero ignorar a tu círculo social real también");
                    System.out.println(" es un mal hábito digital. Debes tomar decisiones firmes.");
                    System.out.println("═════════════════════════════⋆○⋆══════════════════════════════");
                    System.out.println("  ► Puntaje de Riesgo Actual: " + puntaje + "\n");
                    System.out.print("(Mantén firmeza en tus decisiones... ENTER para continuar). ");
                    sc.nextLine();
                    break;
            }
        } // Expediente 2

        if (jugar == 1 && datosValidos == 1) {

            System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
            System.out.println("                 𝗘𝗟 𝗖𝗢𝗥𝗥𝗘𝗢 𝗙𝗥𝗔𝗨𝗗𝗨𝗟𝗘𝗡𝗧𝗢");
            System.out.println("═══════════════════════════════════════════════════════════");
            System.out.println(" [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - (Cae la tarde. Recibes un mensaje de alerta grave...)\n");

            System.out.println(" [𝙼𝙴𝙽𝚂𝙰𝙹𝙴 𝚍𝚎 𝚂𝚘𝚙𝚘𝚛𝚝𝚎_𝙾𝚏𝚒𝚌𝚒𝚊𝚕]:");
            System.out.println(" 'Tu cuenta ha sido reportada por violar las normas de la comunidad.");
            System.out.println(" Será eliminada en 24 horas si no confirmas tu identidad.");
            System.out.println(" Responde a este mensaje con tu contraseña actual para verificarla.'\n");

            System.out.println(" El pánico intenta nublar tu juicio. Las cuentas oficiales no actúan");
            System.out.println(" así, ¿o sí? El reloj corre, Detective. ¿Qué vas a hacer?");
            System.out.println("═════════════════════════════⋆○⋆══════════════════════════════\n");

            System.out.println("  [ 𝟏 ] 𝐀𝐜𝐞𝐩𝐭𝐚𝐫 (Enviar contraseña)");
            System.out.println("  [ 𝟐 ] 𝐑𝐞𝐜𝐡𝐚𝐳𝐚𝐫 (Ignorar mensaje)");
            System.out.println("  [ 𝟑 ] 𝐑𝐞𝐩𝐨𝐫𝐭𝐚𝐫 𝐲 𝐛𝐥𝐨𝐪𝐮𝐞𝐚𝐫");
            System.out.println("  [ 𝟒 ] 𝐈𝐧𝐬𝐩𝐞𝐜𝐜𝐢𝐨𝐧𝐚𝐫 𝐩𝐞𝐫𝐟𝐢𝐥 (Investigar más)\n");

            System.out.print("► 𝙴𝚕𝚒𝚐𝚎 𝚞𝚗𝚊 𝚘𝚙𝚌𝚒𝚘́𝚗: ");

            // Análisis - Entrada: elección principal del caso 3 (opcionExp3) e inspección (opcionPista3). Proceso: validar formato de entrada y estructurar decision3; usar estructura switch para procesar consecuencias, prestando especial atención en activar bandera crítica (entregoContrasena) si el usuario comete el error fatal. Salida: resumen del desenlace, retroalimentación del riesgo y modificación de las variables de estado del juego.
            int opcionExp3 = sc.nextInt();
            sc.nextLine();

            if (opcionExp3 >= 1 && opcionExp3 <= 4) {

                if (opcionExp3 == 4) {
                    System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
                    System.out.println("               𝗜𝗡𝗦𝗣𝗘𝗖𝗖𝗜𝗢́𝗡 𝗗𝗘𝗟 𝗥𝗘𝗠𝗜𝗧𝗘𝗡𝗧𝗘");
                    System.out.println("═══════════════════════════════════════════════════════════");
                    System.out.println(" [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - (Analizando detalles de la cuenta remitente...)\n");

                    System.out.println(" El nombre de usuario tiene un cero en lugar de una letra 'O'");
                    System.out.println(" (S0porte_Oficial). Además, recuerdas una regla de oro:");
                    System.out.println(" las plataformas NUNCA te piden tu contraseña por chat.");
                    System.out.println(" Es una trampa evidente. Actúa, detective.\n");
                    System.out.println("═════════════════════════════⋆○⋆══════════════════════════════\n");

                    System.out.println("  [ 𝟏 ] 𝐀𝐜𝐞𝐩𝐭𝐚𝐫 (Enviar contraseña)");
                    System.out.println("  [ 𝟐 ] 𝐑𝐞𝐜𝐡𝐚𝐳𝐚𝐫 (Ignorar mensaje)");
                    System.out.println("  [ 𝟑 ] 𝐑𝐞𝐩𝐨𝐫𝐭𝐚𝐫 𝐲 𝐛𝐥𝐨𝐪𝐮𝐞𝐚𝐫\n");

                    System.out.print("  ► 𝙴𝚕𝚒𝚐𝚎 𝚞𝚗𝚊 𝚘𝚙𝚌𝚒𝚘́𝚗: ");
                    int opcionPista3 = sc.nextInt();
                    sc.nextLine();

                    if (opcionPista3 >= 1 && opcionPista3 <= 3) {
                        decision3 = opcionPista3;
                    } else {
                        decision3 = 0;
                    }
                } else {
                    decision3 = opcionExp3;
                }

            } else {
                decision3 = 0;
            }

            // Consecuencias: manejo de puntaje, contadores y bandera crítica
            switch (decision3) {
                case 1:
                // ACEPTAR (+3 puntos, incorrecta, PIERDE LA CONTRASEÑA)
                    puntaje = puntaje + 3;
                    decisionesIncorrectas = decisionesIncorrectas + 1;
                    entregoContrasena = 1; // BANDERA CRÍTICA QUE ACTIVA EL FINAL MALO

                    System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
                    System.out.println("              [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - 𝗘𝗥𝗥𝗢𝗥 𝗖𝗥𝗜́𝗧𝗜𝗖𝗢");
                    System.out.println("═══════════════════════════════════════════════════════════");
                    System.out.println(" Entregaste tu contraseña. El pánico fue tu perdición.");
                    System.out.println(" En minutos te cambian la clave y estafan a tus contactos");
                    System.out.println(" haciéndose pasar por ti. Grave error, detective.");
                    System.out.println("═════════════════════════════⋆○⋆══════════════════════════════");
                    System.out.println("  ► Puntaje de Riesgo Actual: " + puntaje + "\n");
                    System.out.print("(Mantén la cabeza fría ante el pánico... ENTER para continuar). ");
                    sc.nextLine();
                    break;

                case 2:
                // RECHAZAR (+1 punto, incorrecta porque debió reportar)
                    puntaje = puntaje + 1;
                    decisionesIncorrectas = decisionesIncorrectas + 1;

                    System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
                    System.out.println("               [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - 𝙰𝙼𝙴𝙽𝙰𝙕𝙰 𝙾𝙲𝚄𝙻𝚃𝙰");
                    System.out.println("═══════════════════════════════════════════════════════════");
                    System.out.println(" (Cierras el chat sin responder). Ignoraste el mensaje.");
                    System.out.println(" Aunque no perdiste tu cuenta, el estafador de 'S0porte_Oficial'");
                    System.out.println(" sigue libre intentando cazar a otros. Debiste neutralizarlo.");
                    System.out.println("═════════════════════════════⋆○⋆══════════════════════════════");
                    System.out.println("  ► Puntaje de Riesgo Actual: " + puntaje + "\n");
                    System.out.print("(Hay que neutralizar las amenazas... ENTER para continuar). ");
                    sc.nextLine();
                    break;

                case 3:
                // REPORTAR (0 puntos, correcta)
                    decisionesCorrectas = decisionesCorrectas + 1;

                    System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
                    System.out.println("               [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - 𝚉𝙾𝙽𝙰 𝙿𝚁𝙾𝚃𝙴𝙶𝙸𝙳𝙰");
                    System.out.println("═══════════════════════════════════════════════════════════");
                    System.out.println(" Cuenta fraudulenta reportada y bloqueada exitosamente.");
                    System.out.println(" Excelente. El miedo es el arma favorita de los hackers,");
                    System.out.println(" pero mantuviste la calma. Las plataformas jamás piden claves.");
                    System.out.println("═════════════════════════════⋆○⋆══════════════════════════════");
                    System.out.println("  ► Puntaje de Riesgo Actual: " + puntaje + "\n");
                    System.out.print("(Excelente manejo de crisis, detective... ENTER para continuar). ");
                    sc.nextLine();
                    break;

                default:
                // INVÁLIDA O CANCELAR (+1 punto, incorrecta)
                    puntaje = puntaje + 1;
                    decisionesIncorrectas = decisionesIncorrectas + 1;

                    System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
                    System.out.println("                 [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - 𝚃𝙸𝙴𝙼𝙿𝙾 𝙰𝙶𝙾𝚃𝙰𝙳𝙾");
                    System.out.println("═══════════════════════════════════════════════════════════");
                    System.out.println(" (El miedo te paraliza y bloqueas la pantalla sin hacer nada).");
                    System.out.println(" En el mundo digital, no denunciar un perfil que roba datos");
                    System.out.println(" permite que sigan operando. La inacción también es un riesgo.");
                    System.out.println("═════════════════════════════⋆○⋆══════════════════════════════");
                    System.out.println("  ► Puntaje de Riesgo Actual: " + puntaje + "\n");
                    System.out.print("(No dejes que el miedo te paralice... ENTER para continuar). ");
                    sc.nextLine();
                    break;
            }
        } // Expediente 3

        // ############################################################################
        // 6. EXPEDIENTES 4 Y 5  (Valeria Beltrán)
        // ############################################################################

        // EXPEDIENTE 4: El influencer falso
        // Análisis - Entrada: opción del jugador. Proceso: guardar la decisión, sumar puntos y contadores. Salida: decision4, puntaje, contadores y mensaje.
        if (jugar == 1 && datosValidos == 1) {
            System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
            System.out.println("                    𝗘𝗟 𝗜𝗡𝗙𝗟𝗨𝗘𝗡𝗖𝗘𝗥 𝗙𝗔𝗟𝗦𝗢");
            System.out.println("═══════════════════════════════════════════════════════════");
            System.out.println(" [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - (Cae la tarde. Tu celular vibra sobre el escritorio...)\n");
            System.out.println(" [𝙼𝙴𝙽𝚂𝙰𝙹𝙴 𝚍𝚎 @𝙲𝚊𝚊𝚛𝚕𝚘𝚜_𝙿𝚎𝚛𝚎𝚣_𝙾𝚏𝚒𝚌𝚒𝚊𝚕]:");
            System.out.println(" '¡Ey! Soy Carlos Pérez. ¿Qué más? Vi que sigues mi contenido");
            System.out.println(" y quería invitarte a una dinámica especial. Está brutal, ¿te");
            System.out.println(" gustaría participar?'\n");
            System.out.println(" Reconoces la forma en que escribe y esa manera tan");
            System.out.println(" particular de expresarse. Parece exactamente el mismo Carlos");
            System.out.println(" que ves en sus videos. Pero algo en el perfil te hace dudar.");
            System.out.println(" ¿Será realmente él o alguien usando su identidad? ¿Qué vas a");
            System.out.println(" hacer, Detective?");
            System.out.println("═════════════════════════════⋆○⋆══════════════════════════════\n");
            System.out.println("  [ 𝟏 ] 𝐀𝐜𝐞𝐩𝐭𝐚𝐫");
            System.out.println("  [ 𝟐 ] 𝐑𝐞𝐜𝐡𝐚𝐳𝐚𝐫");
            System.out.println("  [ 𝟑 ] 𝐑𝐞𝐩𝐨𝐫𝐭𝐚𝐫 𝐲 𝐛𝐥𝐨𝐪𝐮𝐞𝐚𝐫");
            System.out.println("  [ 𝟒 ] 𝐈𝐧𝐯𝐞𝐬𝐭𝐢𝐠𝐚𝐫 𝐦𝐚́𝐬\n");
            System.out.print("► 𝙴𝚕𝚒𝚐𝚎 𝚞𝚗𝚊 𝚘𝚙𝚌𝚒𝚘́𝚗: ");

            int opcionExp4 = sc.nextInt();
            sc.nextLine();

            switch (opcionExp4) {                      // Paso 1: guardar la decisión
                case 1:
                case 2:
                case 3:
                    decision4 = opcionExp4;
                    break;
                case 4:                                // Investigar más: switch anidado
                    System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
                    System.out.println("                   𝗜𝗡𝗦𝗣𝗘𝗖𝗖𝗜𝗢́𝗡 𝗗𝗘𝗟 𝗣𝗘𝗥𝗙𝗜𝗟");
                    System.out.println("═══════════════════════════════════════════════════════════");
                    System.out.println(" [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - (Analizando el nombre y el historial de la cuenta...)\n");
                    System.out.println(" Al revisar la descripción del perfil, notas que el nombre");
                    System.out.println(" tiene una letra cambiada respecto al verdadero influencer y");
                    System.out.println(" la cuenta apenas fue creada hace 3 semanas. Varias");
                    System.out.println(" publicaciones parecen copiadas del perfil verdadero. ¿Perfil");
                    System.out.println(" clonado? Actúa, detective.");
                    System.out.println("═════════════════════════════⋆○⋆══════════════════════════════\n");
                    System.out.println("  [ 𝟏 ] 𝐀𝐜𝐞𝐩𝐭𝐚𝐫");
                    System.out.println("  [ 𝟐 ] 𝐑𝐞𝐜𝐡𝐚𝐳𝐚𝐫");
                    System.out.println("  [ 𝟑 ] 𝐑𝐞𝐩𝐨𝐫𝐭𝐚𝐫 𝐲 𝐛𝐥𝐨𝐪𝐮𝐞𝐚𝐫\n");
                    System.out.print("  ► 𝙴𝚕𝚒𝚐𝚎 𝚞𝚗𝚊 𝚘𝚙𝚌𝚒𝚘́𝚗: ");

                    int opcionPista4 = sc.nextInt();
                    sc.nextLine(); // Limpieza de búfer

                    switch (opcionPista4) {
                        case 1:
                        case 2:
                        case 3:
                            decision4 = opcionPista4;
                            break;
                        default:
                            decision4 = 0;
                    }
                    break;
                default:
                    decision4 = 0;
            }

            switch (decision4) {                       // Paso 2: puntos, contadores y consecuencia
                case 1:                                // Aceptar: +3, incorrecta
                    puntaje = puntaje + 3;
                    decisionesIncorrectas = decisionesIncorrectas + 1;
                    System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
                    System.out.println("              [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - 𝙰𝙻𝙴𝚁𝚃𝙰 𝙳𝙴 𝚂𝙴𝙶𝚄𝚁𝙸𝙳𝙰𝙳");
                    System.out.println("═══════════════════════════════════════════════════════════");
                    System.out.println(" Decidiste confiar en el perfil.");
                    System.out.println(" La forma de escribir te convenció, pero no era el verdadero");
                    System.out.println(" influencer. Alguien estaba usando su nombre, sus fotos y su");
                    System.out.println(" manera de hablar para ganarse tu confianza.");
                    System.out.println("═════════════════════════════⋆○⋆══════════════════════════════");
                    System.out.println("  ► Puntaje de Riesgo Actual: " + puntaje + "\n");
                    System.out.print("(Cuidado, Detective... ENTER para continuar). ");
                    sc.nextLine();
                    break;
                case 2:                                //  Rechazar: +1, incorrecta
                    puntaje = puntaje + 1;
                    decisionesIncorrectas = decisionesIncorrectas + 1;
                    System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
                    System.out.println("                [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - 𝙰𝙼𝙴𝙽𝙰𝚉𝙰 𝙰𝙲𝚃𝙸𝚅𝙰");
                    System.out.println("═══════════════════════════════════════════════════════════");
                    System.out.println(" Decidiste no seguir la conversación.");
                    System.out.println(" No compartiste información y te alejaste del perfil, pero la");
                    System.out.println(" cuenta falsa sigue activa buscando a alguien que sí confíe");
                    System.out.println(" en ella.");
                    System.out.println("═════════════════════════════⋆○⋆══════════════════════════════");
                    System.out.println("  ► Puntaje de Riesgo Actual: " + puntaje + "\n");
                    System.out.print("(Alejarte no basta, Detective... ENTER para continuar). ");
                    sc.nextLine();
                    break;
                case 3:                                //  Reportar: 0, correcta
                    decisionesCorrectas = decisionesCorrectas + 1;
                    System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
                    System.out.println("                [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - 𝚉𝙾𝙽𝙰 𝙿𝚁𝙾𝚃𝙴𝙶𝙸𝙳𝙰");
                    System.out.println("═══════════════════════════════════════════════════════════");
                    System.out.println(" Reportaste y bloqueaste el perfil.");
                    System.out.println(" El nombre tenía una letra cambiada, la cuenta era muy");
                    System.out.println(" reciente y copiaba contenido del influencer verdadero.");
                    System.out.println(" Detectaste la suplantación.");
                    System.out.println("═════════════════════════════⋆○⋆══════════════════════════════");
                    System.out.println("  ► Puntaje de Riesgo Actual: " + puntaje + "\n");
                    System.out.print("(Excelente, Detective... ENTER para continuar). ");
                    sc.nextLine();
                    break;
                default:                               // No decidió: +1, incorrecta
                    puntaje = puntaje + 1;
                    decisionesIncorrectas = decisionesIncorrectas + 1;
                    System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
                    System.out.println("                [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - 𝚃𝙸𝙴𝙼𝙿𝙾 𝙰𝙶𝙾𝚃𝙰𝙳𝙾");
                    System.out.println("═══════════════════════════════════════════════════════════");
                    System.out.println(" Te quedaste mirando el perfil sin decidir.");
                    System.out.println(" No hablaste más con la cuenta, pero tampoco la reportaste.");
                    System.out.println(" El perfil falso sigue activo. No ignores las señales,");
                    System.out.println(" detective. Actúa.");
                    System.out.println("═════════════════════════════⋆○⋆══════════════════════════════");
                    System.out.println("  ► Puntaje de Riesgo Actual: " + puntaje + "\n");
                    System.out.print("(No ignores las señales, Detective... ENTER para continuar). ");
                    sc.nextLine();
                    break;
            }
        }
        // EXPEDIENTE 5: El desconocido amable
        // Análisis - Entrada: opción del jugador. Proceso: guardar la decisión, sumar puntos y contadores. Salida: decision5, puntaje, contadores y mensaje.
        if (jugar == 1 && datosValidos == 1) {
            System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
            System.out.println("                   𝗘𝗟 𝗗𝗘𝗦𝗖𝗢𝗡𝗢𝗖𝗜𝗗𝗢 𝗔𝗠𝗔𝗕𝗟𝗘");
            System.out.println("═══════════════════════════════════════════════════════════");
            System.out.println(" [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - (Es de noche. Tu celular vibra mientras estás en tu habitación...)\n");
            System.out.println(" [𝙼𝙴𝙽𝚂𝙰𝙹𝙴 𝚍𝚎 @𝙳𝚊𝚗𝚒𝚎𝚕_𝚁𝚘𝚍𝚛𝚒𝚐𝚞𝚎𝚣]:");
            System.out.println(" 'Hola. Creo que encontré algo que puede ser tuyo. No estoy");
            System.out.println(" seguro, pero prefiero preguntarte antes de dejarlo por ahí.");
            System.out.println(" Si quieres que te lo entregue, dime dónde estás y te lo");
            System.out.println(" llevo.'\n");
            System.out.println(" La situación parece bastante normal, incluso amable. Pero");
            System.out.println(" después de unos mensajes, la persona empieza a hacer más");
            System.out.println(" preguntas sobre ti y te pide que no le cuentes a nadie de la");
            System.out.println(" conversación. ¿Por qué tanta insistencia? ¿Qué vas a hacer,");
            System.out.println(" Detective?");
            System.out.println("═════════════════════════════⋆○⋆══════════════════════════════\n");
            System.out.println("  [ 𝟏 ] 𝐀𝐜𝐞𝐩𝐭𝐚𝐫");
            System.out.println("  [ 𝟐 ] 𝐑𝐞𝐜𝐡𝐚𝐳𝐚𝐫");
            System.out.println("  [ 𝟑 ] 𝐑𝐞𝐩𝐨𝐫𝐭𝐚𝐫 𝐲 𝐛𝐥𝐨𝐪𝐮𝐞𝐚𝐫");
            System.out.println("  [ 𝟒 ] 𝐈𝐧𝐯𝐞𝐬𝐭𝐢𝐠𝐚𝐫 𝐦𝐚́𝐬\n");
            System.out.print("► 𝙴𝚕𝚒𝚐𝚎 𝚞𝚗𝚊 𝚘𝚙𝚌𝚒𝚘́𝚗: ");

            int opcionExp5 = sc.nextInt();
            sc.nextLine();

            switch (opcionExp5) {                      // Paso 1: guardar la decisión
                case 1:
                case 2:
                case 3:
                    decision5 = opcionExp5;
                    break;

                case 4:                                // Investigar más: switch anidado
                    System.out.println();

                    System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
                    System.out.println("                   𝗜𝗡𝗦𝗣𝗘𝗖𝗖𝗜𝗢́𝗡 𝗗𝗘𝗟 𝗣𝗘𝗥𝗙𝗜𝗟");
                    System.out.println("═══════════════════════════════════════════════════════════");
                    System.out.println(" [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - (Analizando los mensajes de la conversación...)\n");
                    System.out.println(" La persona insiste en saber dónde estás y además te pide");
                    System.out.println(" mantener la conversación en secreto. Pedir tu ubicación y");
                    System.out.println(" datos personales mientras exige guardar un secreto es una");
                    System.out.println(" señal de alerta. Actúa, detective.");
                    System.out.println("═════════════════════════════⋆○⋆══════════════════════════════\n");
                    System.out.println("  [ 𝟏 ] 𝐀𝐜𝐞𝐩𝐭𝐚𝐫");
                    System.out.println("  [ 𝟐 ] 𝐑𝐞𝐜𝐡𝐚𝐳𝐚𝐫");
                    System.out.println("  [ 𝟑 ] 𝐑𝐞𝐩𝐨𝐫𝐭𝐚𝐫 𝐲 𝐛𝐥𝐨𝐪𝐮𝐞𝐚𝐫\n");
                    System.out.print("  ► 𝙴𝚕𝚒𝚐𝚎 𝚞𝚗𝚊 𝚘𝚙𝚌𝚒𝚘́𝚗: ");

                    int opcionPista5 = sc.nextInt();
                    sc.nextLine(); // Limpieza de búfer

                    switch (opcionPista5) {
                        case 1:
                        case 2:
                        case 3:
                            decision5 = opcionPista5;
                            break;

                        default:
                            decision5 = 0;
                            break;
                    }
                    break;

                default:
                    decision5 = 0;
                    break;
            }

            switch (decision5) {                       // Paso 2: puntos, contadores y consecuencia

                case 1:                                // Aceptar: +3, incorrecta
                    puntaje = puntaje + 3;
                    decisionesIncorrectas = decisionesIncorrectas + 1;

                    System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
                    System.out.println("              [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - 𝙰𝙻𝙴𝚁𝚃𝙰 𝙳𝙴 𝚂𝙴𝙶𝚄𝚁𝙸𝙳𝙰𝙳");
                    System.out.println("═══════════════════════════════════════════════════════════");
                    System.out.println(" Le diste tu ubicación al desconocido.");
                    System.out.println(" También aceptaste mantener la conversación en secreto.");
                    System.out.println(" Compartir datos personales con alguien que no conoces puede");
                    System.out.println(" ponerte en riesgo.");
                    System.out.println("═════════════════════════════⋆○⋆══════════════════════════════");
                    System.out.println("  ► Puntaje de Riesgo Actual: " + puntaje + "\n");
                    System.out.print("(Tus datos valen mucho, Detective... ENTER para continuar). ");
                    sc.nextLine();
                    break;

                case 2:                                //  Rechazar: +1, incorrecta
                    puntaje = puntaje + 1;
                    decisionesIncorrectas = decisionesIncorrectas + 1;

                    System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
                    System.out.println("                [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - 𝙰𝙼𝙴𝙽𝙰𝚉𝙰 𝙰𝙲𝚃𝙸𝚅𝙰");
                    System.out.println("═══════════════════════════════════════════════════════════");
                    System.out.println(" Le dijiste que no y decidiste no compartir tu ubicación.");
                    System.out.println(" Te protegiste, pero no reportaste la cuenta ni tomaste más");
                    System.out.println(" medidas. El desconocido podría intentar lo mismo con otra");
                    System.out.println(" persona.");
                    System.out.println("═════════════════════════════⋆○⋆══════════════════════════════");
                    System.out.println("  ► Puntaje de Riesgo Actual: " + puntaje + "\n");
                    System.out.print("(Alejarte no basta, Detective... ENTER para continuar). ");
                    sc.nextLine();
                    break;

                case 3:                                //  Reportar: 0, correcta
                    decisionesCorrectas = decisionesCorrectas + 1;

                    System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
                    System.out.println("                [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - 𝚉𝙾𝙽𝙰 𝙿𝚁𝙾𝚃𝙴𝙶𝙸𝙳𝙰");
                    System.out.println("═══════════════════════════════════════════════════════════");
                    System.out.println(" Reportaste y bloqueaste al desconocido.");
                    System.out.println(" Cuéntale a un adulto de confianza lo que pasó: pedirte tu");
                    System.out.println(" ubicación y un secreto nunca es normal.");
                    System.out.println("═════════════════════════════⋆○⋆══════════════════════════════");
                    System.out.println("  ► Puntaje de Riesgo Actual: " + puntaje + "\n");
                    System.out.print("(Excelente, Detective... ENTER para continuar). ");
                    sc.nextLine();
                    break;

                default:                               // No decidió: +1, incorrecta
                    puntaje = puntaje + 1;
                    decisionesIncorrectas = decisionesIncorrectas + 1;

                    System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
                    System.out.println("                [𝚂𝙸𝚂𝚃𝙴𝙼𝙰] - 𝚃𝙸𝙴𝙼𝙿𝙾 𝙰𝙶𝙾𝚃𝙰𝙳𝙾");
                    System.out.println("═══════════════════════════════════════════════════════════");
                    System.out.println(" Te quedaste pensando y cerraste la conversación.");
                    System.out.println(" No compartiste tu ubicación, pero tampoco reportaste la");
                    System.out.println(" cuenta. El desconocido sigue activo y podría intentarlo");
                    System.out.println(" nuevamente.");
                    System.out.println("═════════════════════════════⋆○⋆══════════════════════════════");
                    System.out.println("  ► Puntaje de Riesgo Actual: " + puntaje + "\n");
                    System.out.print("(No ignores las señales, Detective... ENTER para continuar). ");
                    sc.nextLine();
                    break;
            }
        }

        // ############################################################################
        // 7. PRIVACIDAD, TIEMPO, HORARIO, FINALES Y REPORTE  (Tomás López)
        // ############################################################################

        // =========================================================
        // B. CONFIGURACIÓN DE PRIVACIDAD
        // Análisis
        // Entrada: variable privacidad (leída por consola con sc.nextInt y sc.nextLine).
        // Proceso: Evaluar con switch. Opción 1 (+0 pts), Opción 2 (+1 pt), Opción 3 (+3 pts).
        //          Si es fuera de rango (inválida), asigna privacidad = 3 y suma +3 pts sin detener el juego.
        // Salida:  Puntaje actualizado y mensaje explicativo sobre la privacidad.
        // =========================================================
        if (jugar == 1 && datosValidos == 1) {
            System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
            System.out.println("                  𝗣𝗥𝗜𝗩𝗔𝗖𝗜𝗗𝗔𝗗 𝗗𝗘 𝗧𝗨 𝗖𝗨𝗘𝗡𝗧𝗔");
            System.out.println("═══════════════════════════════════════════════════════════");
            System.out.println(" ¿Cómo quieres configurar la privacidad de tu cuenta?");
            System.out.println("═════════════════════════════⋆○⋆══════════════════════════════\n");
            System.out.println("  [ 𝟏 ] 𝐏𝐫𝐢𝐯𝐚𝐝𝐚");
            System.out.println("  [ 𝟐 ] 𝐒𝐨𝐥𝐨 𝐚𝐦𝐢𝐠𝐨𝐬");
            System.out.println("  [ 𝟑 ] 𝐏𝐮́𝐛𝐥𝐢𝐜𝐚\n");
            System.out.print("► 𝙴𝚕𝚒𝚐𝚎 𝚞𝚗𝚊 𝚘𝚙𝚌𝚒𝚘́𝚗: ");
            privacidad = sc.nextInt();
            sc.nextLine();

            switch (privacidad) {
                case 1:
                    puntaje += 0;
                    System.out.println("\n ► Tener la cuenta privada implica que controlas a quién sigues y quién te sigue.");
                    break;
                case 2:
                    puntaje += 1;
                    System.out.println("\n ► Es menos seguro que la privada, conoce bien a tus amigos.");
                    break;
                case 3:
                    puntaje += 3;
                    System.out.println("\n ► Cualquier persona te puede seguir y te expones mucho más.");
                    break;
                default:
                    privacidad = 3;
                    puntaje += 3;
                    System.out.println("\n ► No elegiste una opción válida: tu cuenta quedó pública.");
                    break;
            }
        }

        // =========================================================
        // C. PUNTOS POR TIEMPO DE USO
        // Análisis
        // Entrada: variable horasUso (procedente del contrato de registro).
        // Proceso: Evaluar tiempo. Si horasUso > 3 y < 8 suma +4 pts;
        //          si horasUso >= 8 suma +7 pts; si horasUso <= 3 suma +0 pts.
        // Salida:  Puntaje acumulado e impresión del mensaje de recomendación.
        // =========================================================
        if (jugar == 1 && datosValidos == 1) {
            if (horasUso > 3 && horasUso < 8) {
                puntaje += 4;
                System.out.println(" ► No es mucho tiempo, pero podrías reducir tu tiempo de conexión.");
            } else if (horasUso >= 8) {
                puntaje += 7;
                System.out.println(" ► Mucho tiempo en redes te expone a riesgos y afecta tu salud.");
            } else {
                puntaje += 0;
                System.out.println(" ► Un hábito saludable es saber cuándo parar.");
            }
        }

        // =========================================================
        // D. PUNTOS POR HORARIO SALUDABLE
        // Análisis
        // Entrada: hora24Ingreso, minuto, horaSal, minutoSal, segundoSal, cruzaMedianoche.
        // Proceso: Calcular inicio en minutos y salida en segundos. Evaluar si la
        //          sesión se realiza fuera del horario de 8:00 a 20:00 o cruza la medianoche.
        // Salida:  Suma +4 puntos al puntaje digital si infringe el horario saludable.
        // =========================================================
        if (jugar == 1 && datosValidos == 1) {
            int inicioMin = hora24Ingreso * 60 + minuto;
            int salidaSeg = horaSal * 3600 + minutoSal * 60 + segundoSal;

            if (inicioMin < 480 || inicioMin > 1200 || cruzaMedianoche == 1 || salidaSeg < 28800 || salidaSeg > 72000) {
                puntaje += 4;
            }
        }

        // =========================================================
        // E. TEXTOS DE LOS FINALES
        // Análisis
        // Entrada: Variables del contrato.
        // Proceso: Asignar las descripciones extensas correspondientes a cada uno de los 4 finales.
        // Salida:  Variables textoFinalBueno, textoFinalRegular, textoFinalMalo y textoFinalContrasena inicializadas.
        // =========================================================
        if (jugar == 1 && datosValidos == 1) {
            textoFinalBueno = "Mantuviste un comportamiento digital ejemplar. Sabes identificar\n" +
                              "perfiles falsos, regulas tu tiempo de conexión y cuidas la privacidad\n" +
                              "de tu información personal. ¡Excelente trabajo, Detective!";

            textoFinalRegular = "Demostraste buenas habilidades de detección en varios casos, pero\n" +
                                "aún tienes hábitos de riesgo en el tiempo de uso o la privacidad.\n" +
                                "Aprende de los errores para no caer en trampas futuras.";

            textoFinalMalo = "Tus decisiones te expusieron gravemente en la red. Interactuaste con\n" +
                             "fuentes no confiables y descuidaste tu privacidad. Es urgente que\n" +
                             "revises tus hábitos digitales para evitar peligros reales.";

            textoFinalContrasena = "¡GIRO INESPERADO! Cometiste el error crítico de compartir tu contraseña.\n" +
                                   "Tu cuenta fue hackeada, tu identidad suplantada y perdiste el control.\n" +
                                   "RECUERDA: Las entidades oficiales NUNCA te pedirán tu contraseña.";
        }

        // =========================================================
        // F. DIAGNÓSTICO Y TIPO DE FINAL
        // Análisis
        // Entrada: puntaje digital acumulado y variable entregoContrasena.
        // Proceso: Evaluar rangos de puntaje: < 5 (tipoFinal = 1), <= 13 (tipoFinal = 2), > 13 (tipoFinal = 3).
        //          Asignar la cadena del diagnóstico. Si entregoContrasena == 1, forzar tipoFinal = 3.
        // Salida:  Variables diagnostico y tipoFinal configuradas.
        // =========================================================
        if (jugar == 1 && datosValidos == 1) {
            if (puntaje < 5) {
                diagnostico = "Uso saludable de redes sociales";
                tipoFinal = 1;
            } else if (puntaje <= 13) {
                diagnostico = "Debe mejorar algunos hábitos digitales";
                tipoFinal = 2;
            } else {
                diagnostico = "Uso no saludable de redes sociales";
                tipoFinal = 3;
            }

            if (entregoContrasena == 1) {
                tipoFinal = 3;
            }
        }

        // =========================================================
        // G. REPORTE FINAL DEL DETECTIVE
        // Análisis
        // Entrada: nombre, edad, diaSemanaIngreso, fechaIngresoTexto, horaIngresoTexto,
        //          diaSemanaSalida, fechaSalidaTexto, horaSalidaTexto, horasUso,
        //          decisionesCorrectas, decisionesIncorrectas, puntaje, diagnostico,
        //          entregoContrasena, tipoFinal y textos de finales.
        // Proceso: Desplegar la ficha de métricas. Evaluar si entregoContrasena == 1 para
        //          mostrar ÚNICAMENTE el final de Identidad Robada; de lo contrario, usar
        //          un switch (tipoFinal) para proyectar el título y texto correspondiente.
        // Salida:  Impresión limpia del Reporte del Detective por consola.
        // =========================================================
        if (jugar == 1 && datosValidos == 1) {
            System.out.print("\n(Presiona ENTER para ver tu reporte final, Detective...) ");
            sc.nextLine();
            System.out.println("\n══════════════════════════ ⋆○⋆ ══════════════════════════");
            System.out.println("                   𝗥𝗘𝗣𝗢𝗥𝗧𝗘 𝗗𝗘𝗟 𝗗𝗘𝗧𝗘𝗖𝗧𝗜𝗩𝗘");
            System.out.println("═══════════════════════════════════════════════════════════");
            System.out.println(" ► Jugador: " + nombre + " (" + edad + " años).");
            System.out.println(" ► Ingreso: " + diaSemanaIngreso + " " + fechaIngresoTexto + " " + horaIngresoTexto);
            System.out.println(" ► Salida:  " + diaSemanaSalida + " " + fechaSalidaTexto + " " + horaSalidaTexto);
            System.out.println(" ► Horas de uso: " + horasUso + ".");
            System.out.println(" ► Decisiones correctas: " + decisionesCorrectas + " de 5 | Incorrectas: " + decisionesIncorrectas);
            System.out.println(" ► Puntaje Digital: " + puntaje);
            System.out.println(" ► Diagnóstico: " + diagnostico);
            System.out.println("═══════════════════════════════════════════════════════════");

            if (entregoContrasena == 1) {
                System.out.println(" 𝗙𝗜𝗡𝗔𝗟: 𝗜𝗱𝗲𝗻𝘁𝗶𝗱𝗮𝗱 𝗥𝗼𝗯𝗮𝗱𝗮\n");
                System.out.println(textoFinalContrasena);
            } else {
                switch (tipoFinal) {
                    case 1:
                        System.out.println(" 𝗙𝗜𝗡𝗔𝗟: 𝗗𝗲𝘁𝗲𝗰𝘁𝗶𝘃𝗲 𝗘𝘅𝗽𝗲𝗿𝘁𝗼\n");
                        System.out.println(textoFinalBueno);
                        break;
                    case 2:
                        System.out.println(" 𝗙𝗜𝗡𝗔𝗟: 𝗗𝗲𝘁𝗲𝗰𝘁𝗶𝘃𝗲 𝗲𝗻 𝗘𝗻𝘁𝗿𝗲𝗻𝗮𝗺𝗶𝗲𝗻𝘁𝗼\n");
                        System.out.println(textoFinalRegular);
                        break;
                    case 3:
                        System.out.println(" 𝗙𝗜𝗡𝗔𝗟: 𝗩𝗶́𝗰𝘁𝗶𝗺𝗮 𝗱𝗲𝗹 𝗘𝗻𝗴𝗮𝗻̃𝗼\n");
                        System.out.println(textoFinalMalo);
                        break;
                }
            }
            System.out.println("═════════════════════════════⋆○⋆══════════════════════════════");
        }
    }
}
