/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package menu_cond_iniciales1_iniciales2_nrc;

import java.util.Locale;
import java.util.Scanner;

/**
 *
 * @author fcamachoj, valeriau, bolanocamilo
 */
public class Menu_cond_iniciales1_iniciales2_NRC {

    // Scanner compartido: lo usan todas las opciones del men
    static Scanner leer;

    public static void main(String[] args) {
        // Todo el programa usa punto decimal (3.5), no coma
        Locale.setDefault(Locale.US);
        leer = new Scanner(System.in);

        int opcion;

        System.out.println();
        System.out.println("  ╔==================================================╗");
        System.out.println("  ║           ♦  MENÚ CON CONDICIONALES  ♦           ║");
        System.out.println("  ║              SI  y  DEPENDIENDO_DE               ║");
        System.out.println("  ╠==================================================╣");
        System.out.println("  ║                                                  ║");
        System.out.println("  ║   1. ● Coordenadas (cuadrante)                   ║");
        System.out.println("  ║   2. ● Dígito en romano                          ║");
        System.out.println("  ║   3. ● Ley de Ohm                                ║");
        System.out.println("  ║   4. ● Nota del estudiante                       ║");
        System.out.println("  ║   5. ● Pescadería                                ║");
        System.out.println("  ║   6. ● Cines Colombia                            ║");
        System.out.println("  ║   7. ● Libre: último dígito                      ║");
        System.out.println("  ║   8. ● Salir                                     ║");
        System.out.println("  ║                                                  ║");
        System.out.println("  ╚==================================================╝");
        System.out.println("  ► Elige una opción (1-8):");
        System.out.print("    ");
        opcion = leer.nextInt();

        switch (opcion) {
            case 1:
                coordenadas();
                break;
            case 2:
                romano();
                break;
            case 3:
                leyDeOhm();
                break;
            case 4:
                notaEstudiante();
                break;
            case 5:
                pescaderia();
                break;
            case 6:
                cinesColombia();
                break;
            case 7:
                ultimoDigito();
                break;
            case 8:
                salir();
                break;
            default:
                System.out.println("  ■ Error: opción inválida. Debe ser un número del 1 al 8.");
        }

        leer.close();
    }

    // ═══════════════════ OPCIÓN 1: COORDENADAS ═══════════════════
    static void coordenadas() {
        double x, y;
        int cuadrante;
        String ubicacion;

        System.out.println();
        System.out.println("  ╔==================================================╗");
        System.out.println("  ║              ● COORDENADAS (x, y) ●              ║");
        System.out.println("  ╚==================================================╝");
        System.out.println("  ► Ingresa la coordenada x:");
        System.out.print("    ");
        x = leer.nextDouble();
        System.out.println("  ► Ingresa la coordenada y:");
        System.out.print("    ");
        y = leer.nextDouble();

        // SI anidado: decide el cuadrante según los signos de x e y
        if (x > 0 && y > 0) {
            cuadrante = 1;
        } else if (x < 0 && y > 0) {
            cuadrante = 2;
        } else if (x < 0 && y < 0) {
            cuadrante = 3;
        } else if (x > 0 && y < 0) {
            cuadrante = 4;
        } else {
            cuadrante = 0; 
        }


        String c1 = " ", c2 = " ", c3 = " ", c4 = " ";
        String izquierda = "-------------------";
        String derecha = "-------------------";
        String arriba = "|";
        String abajo = "|";
        String centro = "+";

        switch (cuadrante) {
            case 1:
                c1 = "●";
                ubicacion = "Cuadrante I";
                break;
            case 2:
                c2 = "●";
                ubicacion = "Cuadrante II";
                break;
            case 3:
                c3 = "●";
                ubicacion = "Cuadrante III";
                break;
            case 4:
                c4 = "●";
                ubicacion = "Cuadrante IV";
                break;
            default:
                if (x == 0 && y == 0) {
                    centro = "●";
                    ubicacion = "En el origen";
                } else if (y == 0) {
                    ubicacion = "Sobre el eje X";
                    if (x > 0) {
                        derecha = "----------●--------";
                    } else {
                        izquierda = "--------●----------";
                    }
                } else {
                    ubicacion = "Sobre el eje Y";
                    if (y > 0) {
                        arriba = "●";
                    } else {
                        abajo = "●";
                    }
                }
        }

        System.out.println();
        System.out.println("  ╔==================================================╗");
        System.out.println("  ║                                                  ║");
        System.out.println("  ║                        y                         ║");
        System.out.println("  ║                        ▲                         ║");
        System.out.println("  ║            II          |          I              ║");
        System.out.println("  ║             " + c2 + "          |          " + c1 + "              ║");
        System.out.println("  ║                        " + arriba + "                         ║");
        System.out.println("  ║    ◄" + izquierda + centro + derecha + "► x   ║");
        System.out.println("  ║                        " + abajo + "                         ║");
        System.out.println("  ║             " + c3 + "          |          " + c4 + "              ║");
        System.out.println("  ║            III         |          IV             ║");
        System.out.println("  ║                        ▼                         ║");
        System.out.println("  ║                                                  ║");
        System.out.println("  ╚==================================================╝");
        System.out.println("  ► Punto: (" + x + ", " + y + ")  →  " + ubicacion);
        System.out.println("  ► Número del cuadrante: " + cuadrante);
    }

    // ═══════════════════ OPCIÓN 2: DÍGITO EN ROMANO ═══════════════════
    static void romano() {
        int numero;
        String romano;

        System.out.println();
        System.out.println("  ╔==================================================╗");
        System.out.println("  ║               ● DÍGITO EN ROMANO ●               ║");
        System.out.println("  ╠==================================================╣");
        System.out.println("  ║  Escribe un número entero del 1 al 10 y          ║");
        System.out.println("  ║  verás su equivalente en números romanos.        ║");
        System.out.println("  ╚==================================================╝");
        System.out.println("  ► Ingresa un número entero (1 a 10):");
        System.out.print("    ");
        numero = leer.nextInt();


        switch (numero) {
            case 1:
                romano = "I";
                break;
            case 2:
                romano = "II";
                break;
            case 3:
                romano = "III";
                break;
            case 4:
                romano = "IV";
                break;
            case 5:
                romano = "V";
                break;
            case 6:
                romano = "VI";
                break;
            case 7:
                romano = "VII";
                break;
            case 8:
                romano = "VIII";
                break;
            case 9:
                romano = "IX";
                break;
            case 10:
                romano = "X";
                break;
            default:
                System.out.println("  ■ Error: el número debe estar entre 1 y 10.");
                return;
        }

        System.out.println("  ► El número " + numero + " en romano es: " + romano);
    }

    // ═══════════════════ OPCIÓN 3: LEY DE OHM ═══════════════════
    static void leyDeOhm() {
        String calcular;
        double intensidad, voltaje, resistencia;

        System.out.println();
        System.out.println("  ╔==================================================╗");
        System.out.println("  ║            ● LEY DE OHM:  I = V / R ●            ║");
        System.out.println("  ╠==================================================╣");
        System.out.println("  ║  I -> Intensidad de corriente (amperios, A)      ║");
        System.out.println("  ║  V -> Diferencia de potencial (voltios, V)       ║");
        System.out.println("  ║  R -> Resistencia (ohmios, Ω)                    ║");
        System.out.println("  ╚==================================================╝");
        System.out.println("  ► ¿Qué deseas calcular? (I, V o R):");
        System.out.print("    ");
        calcular = leer.next();

        switch (calcular) {
            case "I":
            case "i":
                System.out.println("  ► Voltaje V (voltios):");
                System.out.print("    ");
                voltaje = leer.nextDouble();
                System.out.println("  ► Resistencia R (ohmios):");
                System.out.print("    ");
                resistencia = leer.nextDouble();
                if (voltaje > 0 && resistencia > 0) {
                    intensidad = voltaje / resistencia;
                    System.out.printf("  ► Intensidad I = %.2f A%n", intensidad);
                } else {
                    System.out.println("  ■ Error: los datos deben ser mayores que cero.");
                }
                break;
            case "V":
            case "v":
                System.out.println("  ► Intensidad I (amperios):");
                System.out.print("    ");
                intensidad = leer.nextDouble();
                System.out.println("  ► Resistencia R (ohmios):");
                System.out.print("    ");
                resistencia = leer.nextDouble();
                if (intensidad > 0 && resistencia > 0) {
                    voltaje = intensidad * resistencia;
                    System.out.printf("  ► Voltaje V = %.2f V%n", voltaje);
                } else {
                    System.out.println("  ■ Error: los datos deben ser mayores que cero.");
                }
                break;
            case "R":
            case "r":
                System.out.println("  ► Voltaje V (voltios):");
                System.out.print("    ");
                voltaje = leer.nextDouble();
                System.out.println("  ► Intensidad I (amperios):");
                System.out.print("    ");
                intensidad = leer.nextDouble();
                if (voltaje > 0 && intensidad > 0) {
                    resistencia = voltaje / intensidad;
                    System.out.printf("  ► Resistencia R = %.2f Ω%n", resistencia);
                } else {
                    System.out.println("  ■ Error: los datos deben ser mayores que cero.");
                }
                break;
            default:
                System.out.println("  ■ Error: opción inválida. Escribe I, V o R.");
        }
    }

    // ═══════════════════ OPCIÓN 4: NOTA ESTUDIANTE ═══════════════════
    static void notaEstudiante() {
        double n1, n2, n3, n4, menor, notaFinal;

        System.out.println();
        System.out.println("  ╔==================================================╗");
        System.out.println("  ║             ● NOTA DEL ESTUDIANTE ●              ║");
        System.out.println("  ╠==================================================╣");
        System.out.println("  ║  Nota final = promedio de las 3 más altas.       ║");
        System.out.println("  ║  Las 4 notas deben ser diferentes                ║");
        System.out.println("  ║  y estar entre 0 y 5.                            ║");
        System.out.println("  ╚==================================================╝");
        System.out.println("  ► Nota 1:");
        System.out.print("    ");
        n1 = leer.nextDouble();
        System.out.println("  ► Nota 2:");
        System.out.print("    ");
        n2 = leer.nextDouble();
        System.out.println("  ► Nota 3:");
        System.out.print("    ");
        n3 = leer.nextDouble();
        System.out.println("  ► Nota 4:");
        System.out.print("    ");
        n4 = leer.nextDouble();

        if (n1 < 0 || n1 > 5 || n2 < 0 || n2 > 5 || n3 < 0 || n3 > 5 || n4 < 0 || n4 > 5) {
            System.out.println("  ■ Error: todas las notas deben estar entre 0 y 5.");
            return;
        }


        if (n1 == n2 || n1 == n3 || n1 == n4 || n2 == n3 || n2 == n4 || n3 == n4) {
            System.out.println("  ■ Error: las cuatro notas deben ser diferentes.");
            return;
        }

        // Buscar la nota más baja (la que se descarta)
        menor = n1;
        if (n2 < menor) {
            menor = n2;
        }
        if (n3 < menor) {
            menor = n3;
        }
        if (n4 < menor) {
            menor = n4;
        }


        notaFinal = (n1 + n2 + n3 + n4 - menor) / 3;

        System.out.println();
        System.out.println("  ╔==================================================╗");
        System.out.println("  ║                    RESULTADO                     ║");
        System.out.println("  ╠==================================================╣");
        System.out.printf("  ║  %-24s%22s  ║%n", "Nota descartada:", String.format("%.2f", menor));
        System.out.printf("  ║  %-24s%22s  ║%n", "NOTA DEFINITIVA:", String.format("%.2f", notaFinal));
        System.out.println("  ╚==================================================╝");
    }

    // ═══════════════════ OPCIÓN 5: PESCADERÍA ═══════════════════
    static void pescaderia() {
        int tipo, porcentaje, porcentajeAplicado;
        double libras, precioLibra, valorCompra, descuento, totalPagar;
        String pescado;

        System.out.println();
        System.out.println("  ╔==================================================╗");
        System.out.println("  ║                  ♣ PESCADERÍA ♣                  ║");
        System.out.println("  ╠==================================================╣");
        System.out.println("  ║                                                  ║");
        System.out.println("  ║   N°  Pescado      Precio/lb   Descuento         ║");
        System.out.println("  ║   1   Pargo        $9,900      15%               ║");
        System.out.println("  ║   2   Lebranche    $7,500      25%               ║");
        System.out.println("  ║   3   Sierra       $12,500     10%               ║");
        System.out.println("  ║                                                  ║");
        System.out.println("  ║  El descuento aplica con más de 10 libras.       ║");
        System.out.println("  ╚==================================================╝");
        System.out.println("  ► Tipo de pescado (1-3):");
        System.out.print("    ");
        tipo = leer.nextInt();


        switch (tipo) {
            case 1:
                pescado = "Pargo";
                precioLibra = 9900;
                porcentaje = 15;
                break;
            case 2:
                pescado = "Lebranche";
                precioLibra = 7500;
                porcentaje = 25;
                break;
            case 3:
                pescado = "Sierra";
                precioLibra = 12500;
                porcentaje = 10;
                break;
            default:
                System.out.println("  ■ Error: tipo de pescado inválido. Debe ser 1, 2 o 3.");
                return;
        }

        System.out.println("  ► Cantidad en libras:");
        System.out.print("    ");
        libras = leer.nextDouble();

        if (libras <= 0) {
            System.out.println("  ■ Error: la cantidad de libras debe ser mayor que cero.");
            return;
        }

        valorCompra = libras * precioLibra;


        if (libras > 10) {
            porcentajeAplicado = porcentaje;
        } else {
            porcentajeAplicado = 0;
        }
        descuento = valorCompra * porcentajeAplicado / 100;

        totalPagar = valorCompra - descuento;

        System.out.println();
        System.out.println("  ╔==================================================╗");
        System.out.println("  ║                     FACTURA                      ║");
        System.out.println("  ╠==================================================╣");
        System.out.printf("  ║  %-24s%22s  ║%n", "Pescado:", pescado);
        System.out.printf("  ║  %-24s%22s  ║%n", "Libras:", String.format("%.2f", libras));
        System.out.printf("  ║  %-24s%22s  ║%n", "Precio por libra:", String.format("$%,.0f", precioLibra));
        System.out.println("  ╠==================================================╣");
        System.out.printf("  ║  %-24s%22s  ║%n", "Valor de la compra:", String.format("$%,.2f", valorCompra));
        System.out.printf("  ║  %-24s%22s  ║%n", "Porcentaje de descuento:", porcentajeAplicado + "%");
        System.out.printf("  ║  %-24s%22s  ║%n", "Valor del descuento:", String.format("-$%,.2f", descuento));
        System.out.println("  ╠==================================================╣");
        System.out.printf("  ║  %-24s%22s  ║%n", "TOTAL A PAGAR:", String.format("$%,.2f", totalPagar));
        System.out.println("  ╚==================================================╝");
    }

    // ═══════════════════ OPCIÓN 6: CINES COLOMBIA ═══════════════════
    static void cinesColombia() {
        int boletas, funcion, dia, tarjeta;
        int precio2D, precio3D, precioBoleta, descuentoBoleta;
        int subtotal, descuentoTotal, total;
        String nombreDia, nombreFuncion, tipoFuncion;

        System.out.println();
        System.out.println("  ╔==================================================╗");
        System.out.println("  ║                ♥ CINES COLOMBIA ♥                ║");
        System.out.println("  ╠==================================================╣");
        System.out.println("  ║                                                  ║");
        System.out.println("  ║   N°  Día            2D          3D              ║");
        System.out.println("  ║   1   Lunes          $12,000     $14,000         ║");
        System.out.println("  ║   2   Martes         $4,500      $9,000          ║");
        System.out.println("  ║   3   Miércoles      $4,500      $9,000          ║");
        System.out.println("  ║   4   Jueves         $12,000     $14,000         ║");
        System.out.println("  ║   5   Viernes        $15,000     $16,000         ║");
        System.out.println("  ║   6   Sábado         $15,000     $16,000         ║");
        System.out.println("  ║   7   Domingo        $15,000     $16,000         ║");
        System.out.println("  ║                                                  ║");
        System.out.println("  ║  Tarjeta de cliente: -$3,000 por boleta          ║");
        System.out.println("  ║  (no aplica martes ni miércoles).                ║");
        System.out.println("  ╚==================================================╝");
        System.out.println("  ► Cantidad de boletas:");
        System.out.print("    ");
        boletas = leer.nextInt();
        if (boletas <= 0) {
            System.out.println("  ■ Error: la cantidad de boletas debe ser mayor que cero.");
            return;
        }

        System.out.println("  ► Tipo de función (1 = 2D, 2 = 3D):");
        System.out.print("    ");
        tipoFuncion = leer.next();
        switch (tipoFuncion) {
            case "1":
            case "2D":
            case "2d":
                funcion = 1;
                break;
            case "2":
            case "3D":
            case "3d":
                funcion = 2;
                break;
            default:
                System.out.println("  ■ Error: escribe 1 o 2D para 2D, o 2 o 3D para 3D.");
                return;
        }

        System.out.println("  ► Día de la función (1-7):");
        System.out.print("    ");
        dia = leer.nextInt();


        switch (dia) {
            case 1:
                nombreDia = "Lunes";
                precio2D = 12000;
                precio3D = 14000;
                break;
            case 2:
                nombreDia = "Martes";
                precio2D = 4500;
                precio3D = 9000;
                break;
            case 3:
                nombreDia = "Miércoles";
                precio2D = 4500;
                precio3D = 9000;
                break;
            case 4:
                nombreDia = "Jueves";
                precio2D = 12000;
                precio3D = 14000;
                break;
            case 5:
                nombreDia = "Viernes";
                precio2D = 15000;
                precio3D = 16000;
                break;
            case 6:
                nombreDia = "Sábado";
                precio2D = 15000;
                precio3D = 16000;
                break;
            case 7:
                nombreDia = "Domingo";
                precio2D = 15000;
                precio3D = 16000;
                break;
            default:
                System.out.println("  ■ Error: el día debe ser un número del 1 al 7.");
                return;
        }

        System.out.println("  ► ¿Presenta tarjeta de cliente? (1 = Sí, 2 = No):");
        System.out.print("    ");
        tarjeta = leer.nextInt();
        if (tarjeta != 1 && tarjeta != 2) {
            System.out.println("  ■ Error: responde 1 (Sí) o 2 (No).");
            return;
        }


        if (funcion == 1) {
            precioBoleta = precio2D;
            nombreFuncion = "2D";
        } else {
            precioBoleta = precio3D;
            nombreFuncion = "3D";
        }

        descuentoBoleta = 0;
        if (tarjeta == 1) {
            if (dia == 2 || dia == 3) {
                System.out.println("  ► La tarjeta no da descuento los martes y miércoles.");
            } else {
                descuentoBoleta = 3000;
            }
        }

        subtotal = boletas * precioBoleta;
        descuentoTotal = boletas * descuentoBoleta;
        total = subtotal - descuentoTotal;

        System.out.println();
        System.out.println("  ╔==================================================╗");
        System.out.println("  ║                   LIQUIDACIÓN                    ║");
        System.out.println("  ╠==================================================╣");
        System.out.printf("  ║  %-24s%22s  ║%n", "Día:", nombreDia);
        System.out.printf("  ║  %-24s%22s  ║%n", "Función:", nombreFuncion);
        System.out.printf("  ║  %-24s%22s  ║%n", "Boletas:", boletas);
        System.out.printf("  ║  %-24s%22s  ║%n", "Valor por boleta:", String.format("$%,d", precioBoleta));
        System.out.println("  ╠==================================================╣");
        System.out.printf("  ║  %-24s%22s  ║%n", "Subtotal:", String.format("$%,d", subtotal));
        System.out.printf("  ║  %-24s%22s  ║%n", "Descuento cliente:", String.format("-$%,d", descuentoTotal));
        System.out.println("  ╠==================================================╣");
        System.out.printf("  ║  %-24s%22s  ║%n", "TOTAL A PAGAR:", String.format("$%,d", total));
        System.out.println("  ╚==================================================╝");
    }

    // ═══════════════════ OPCIÓN 7: LIBRE (ÚLTIMO DÍGITO) ═══════════════════
    static void ultimoDigito() {
        int numero, ultimo, parteEntera, residuo;
        double decima;

        System.out.println();
        System.out.println("  ╔==================================================╗");
        System.out.println("  ║             ● LIBRE: ÚLTIMO DÍGITO ●             ║");
        System.out.println("  ╠==================================================╣");
        System.out.println("  ║  Si termina en 4, 7 o 9 -> ¿divisible por 3?     ║");
        System.out.println("  ║  Si termina en 1 o 5    -> su décima parte       ║");
        System.out.println("  ║  Otro dígito         -> entero y residuo ÷ 17    ║");
        System.out.println("  ╚==================================================╝");
        System.out.println("  ► Ingresa un número entero mayor que 100:");
        System.out.print("    ");
        numero = leer.nextInt();

        if (numero <= 100) {
            System.out.println("  ■ Error: el número debe ser mayor que 100.");
            return;
        }

        ultimo = numero % 10; 

        switch (ultimo) {
            case 4:
            case 7:
            case 9:
                if (numero % 3 == 0) {
                    System.out.println("  ► " + numero + " es divisible por 3.");
                } else {
                    System.out.println("  ► " + numero + " no es divisible por 3.");
                }
                break;
            case 1:
            case 5:
                decima = numero / 10.0; 
                System.out.println("  ► La décima parte de " + numero + " es: " + decima);
                break;
            default:
                parteEntera = numero / 17; 
                residuo = numero % 17;
                System.out.println("  ► " + numero + " / 17 → parte entera: " + parteEntera
                        + ", residuo: " + residuo);
        }
    }

    // ═══════════════════ OPCIÓN 8: SALIR ═══════════════════
    static void salir() {
        System.out.println();
        System.out.println("  ╔==================================================╗");
        System.out.println("  ║                    ☺   ☺   ☺                     ║");
        System.out.println("  ║  Muchas gracias por utilizar nuestros servicios  ║");
        System.out.println("  ╚==================================================╝");
    }
}
