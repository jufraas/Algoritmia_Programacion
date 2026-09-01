/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.numero_cuadratico;
import java.util.Scanner;
import static java.lang.Math.pow;
import static java.lang.Math.sqrt;
/**
 *
 * @author Belong
 */
public class Numero_cuadratico {

    public static void main(String[] args) {
        Scanner leer = new Scanner(System.in);

        System.out.println("Ingrese el valor de a");
        double a = leer.nextDouble();
        System.out.println("Ingrese el valor de b");
        double b = leer.nextDouble();
        System.out.println("Ingrese el valor de c");
        double c = leer.nextDouble();

        double discriminante = pow(b, 2) - 4 * a * c;
        double raiz = sqrt(discriminante);

        double x1 = (-b + raiz) / (2 * a);
        double x2 = (-b - raiz) / (2 * a);

        System.out.println("Discriminante: " + discriminante);
        System.out.println("Los valores de x que satisfacen la ecuacion son:");
        System.out.println("x1 = " + x1);
        System.out.println("x2 = " + x2);

        leer.close();
    }
}
