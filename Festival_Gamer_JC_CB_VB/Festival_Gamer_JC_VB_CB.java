/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */


import java.util.Scanner;

/**
 *
 * @author fcamachoj, valeriau, bolanocamilo
 */
public class Festival_Gamer_JC_VB_CB {

    public static void main(String[] args) {
        Scanner leer = new Scanner(System.in);

        // Variables de cada asistente (las mismas de antes)
        String nombre, estado, beneficios, textoTipo;
        int edad, tipo, horas, sorteos;
        char acomp;
        char puedeIngresar;

        // RETO 1: cantidad de asistentes y contador del ciclo
        int n, i;

        // RETO 2: contadores de cuántos ingresaron con cada tipo de entrada
        int contGeneral = 0, contVip = 0, contPremium = 0;

        // RETO 3: suma de edades y cantidad de personas por categoría de edad
        int sumaMenores12 = 0, contMenores12 = 0;
        int suma12a17 = 0, cont12a17 = 0;
        int sumaMayores18 = 0, contMayores18 = 0;
        double promedio;

        // RETO 4: acumulador de horas de todos los que ingresaron
        int totalHoras = 0;

        System.out.println("CONTROL DE ACCESO - GAMERFEST 2026");

        // RETO 1: pedir N (no se acepta 0 ni negativos)
        System.out.print("¿Cuántos asistentes se van a registrar? ");
        n = leer.nextInt();
        while (n <= 0) {
            System.out.print("Debe ser al menos 1. ¿Cuántos asistentes se van a registrar? ");
            n = leer.nextInt();
        }

        // RETO 1: repetir el registro N veces
        for (i = 1; i <= n; i++) {

            // Limpia el "Enter" que dejó el último nextInt()/next(); sin esto el nombre se salta
            leer.nextLine();

            System.out.println();
            System.out.println("ASISTENTE " + i + " DE " + n);
            System.out.print("Ingrese el nombre del asistente: ");
            nombre = leer.nextLine();
            System.out.print("Ingrese la edad: ");
            edad = leer.nextInt();
            // Tipo de entrada: acepta el número o el nombre; si no es válido, lo vuelve a pedir
            tipo = 0;
            while (tipo == 0) {
                System.out.print("Tipo de entrada (1. General  2. VIP  3. Premium): ");
                textoTipo = leer.next();
                switch (textoTipo) {
                    case "1":
                    case "General":
                    case "general":
                    case "GENERAL":
                        tipo = 1;
                        break;
                    case "2":
                    case "VIP":
                    case "Vip":
                    case "vip":
                        tipo = 2;
                        break;
                    case "3":
                    case "Premium":
                    case "premium":
                    case "PREMIUM":
                        tipo = 3;
                        break;
                    default:
                        System.out.println("No se puede colocar \"" + textoTipo + "\". Escriba 1, 2, 3, General, VIP o Premium.");
                }
            }
            System.out.print("Horas que permanecerá en el evento: ");
            horas = leer.nextInt();

            // ¿Los datos son válidos?
            if (edad <= 0 || tipo < 1 || tipo > 3 || horas < 1) {
                System.out.println("Datos inválidos: la edad debe ser mayor que 0, el tipo de entrada 1, 2 o 3 y las horas al menos 1.");
                System.out.println("Este registro no se cuenta en las estadísticas.");
            } else {

                // RETO 3: sumar la edad en su categoría (se cuentan todos los registrados válidos)
                if (edad < 12) {
                    sumaMenores12 = sumaMenores12 + edad;
                    contMenores12 = contMenores12 + 1;
                } else {
                    if (edad <= 17) {
                        suma12a17 = suma12a17 + edad;
                        cont12a17 = cont12a17 + 1;
                    } else {
                        sumaMayores18 = sumaMayores18 + edad;
                        contMayores18 = contMayores18 + 1;
                    }
                }

                // Estado de ingreso según la edad (igual que antes)
                if (edad < 12) {
                    estado = "No puede ingresar (menor de 12 años)";
                    puedeIngresar = 'N';
                } else {
                    if (edad <= 17) {
                        System.out.print("¿Viene acompañado por un adulto? (S/N): ");
                        acomp = leer.next().charAt(0);
                        if (acomp == 'S' || acomp == 's') {
                            estado = "Puede ingresar acompañado por un adulto";
                            puedeIngresar = 'S';
                        } else {
                            estado = "No puede ingresar (debe venir acompañado por un adulto)";
                            puedeIngresar = 'N';
                        }
                    } else {
                        estado = "Puede ingresar sin restricciones";
                        puedeIngresar = 'S';
                    }
                }

                // Beneficios y sorteos
                if (puedeIngresar == 'S') {

                    switch (tipo) {
                        case 1:
                            beneficios = "Acceso a zonas de juego";
                            contGeneral = contGeneral + 1;   // RETO 2
                            break;
                        case 2:
                            beneficios = "Acceso a zonas de juego y charlas tecnológicas";
                            contVip = contVip + 1;           // RETO 2
                            break;
                        case 3:
                            beneficios = "Acceso a zonas de juego, charlas tecnológicas y final del torneo profesional";
                            contPremium = contPremium + 1;   // RETO 2
                            break;
                        default:
                            beneficios = "Ninguno";
                    }

                    // RETO 4: solo suman horas los que sí entraron
                    totalHoras = totalHoras + horas;

                    if (horas <= 3) {
                        sorteos = 1;
                    } else {
                        if (horas <= 6) {
                            sorteos = 2;
                        } else {
                            sorteos = 3;
                        }
                    }

                } else {
                    beneficios = "Ninguno";
                    sorteos = 0;
                }

                // Resultado de este asistente
                System.out.println("RESULTADO DEL REGISTRO");
                System.out.println("Nombre del asistente: " + nombre);
                System.out.println("Estado de ingreso: " + estado);
                System.out.println("Beneficios asignados: " + beneficios);
                System.out.println("Participaciones en sorteos: " + sorteos);
            }
        }

        // REPORTE FINAL (después del ciclo)
        System.out.println();
        System.out.println("REPORTE FINAL DEL FESTIVAL");

        // RETO 2
        System.out.println("Asistieron con entrada General: " + contGeneral);
        System.out.println("Asistieron con entrada VIP: " + contVip);
        System.out.println("Asistieron con entrada Premium: " + contPremium);

        // RETO 3: se divide solo si hay al menos una persona (evita dividir por 0)
        if (contMenores12 > 0) {
            promedio = (double) sumaMenores12 / contMenores12;
            System.out.println("Promedio de edad de menores de 12: " + promedio);
        } else {
            System.out.println("Promedio de edad de menores de 12: no hubo registrados");
        }
        if (cont12a17 > 0) {
            promedio = (double) suma12a17 / cont12a17;
            System.out.println("Promedio de edad entre 12 y 17: " + promedio);
        } else {
            System.out.println("Promedio de edad entre 12 y 17: no hubo registrados");
        }
        if (contMayores18 > 0) {
            promedio = (double) sumaMayores18 / contMayores18;
            System.out.println("Promedio de edad de 18 o más: " + promedio);
        } else {
            System.out.println("Promedio de edad de 18 o más: no hubo registrados");
        }

        // RETO 4
        System.out.println("Total de horas de permanencia de todos los asistentes: " + totalHoras);
    }
}