/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.suma_2numeros;
import java.util.Scanner;
/**
 *
 * @author Juan Francisco Camacho Posso
 */
public class Suma_2numeros {
    public static void main (String[] args) {
        int num1, num2;
        Scanner leer = new Scanner(System.in);
        
        System.out.println("Digite el primer numero:");
        num1 = leer.nextInt();
        
        System.out.println("Digite el segundo numero:");
        num2 = leer.nextInt();
        
        int sum = num1 + num2;
        System.out.println("La suma es: " + sum);
        
        leer.close();
        
    }
}
