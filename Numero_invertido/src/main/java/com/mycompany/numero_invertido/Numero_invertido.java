/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.numero_invertido;
import java.util.Scanner;
/**
 *
 * @author Belong
 */
public class Numero_invertido {

    public static void main(String[] args) {
         Scanner leer = new Scanner(System.in);

        System.out.println("Digite un numero de 4 cifras");
        int numero = leer.nextInt();

        int unidades = numero % 10;
        int decenas  = (numero / 10) % 10;
        int centenas = (numero / 100) % 10;
        int millares = numero / 1000;

        int invertido = unidades * 1000 + decenas * 100 + centenas * 10 + millares;

        System.out.println("Numero original: " + numero);
        System.out.println("Numero invertido: " + invertido);

        leer.close();
    }
}
