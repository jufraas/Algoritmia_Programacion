
import java.util.Scanner;

public class Calculadora {
    public static void main(String[] args) {
        float num1, num2, res;
        int op;
        Scanner leer = new Scanner(System.in);

        System.out.println("Porfavor ingresa el primer numero");
        num1 = leer.nextFloat();
        System.out.println("Porfavor ingresa el segundo numero");
        num2 = leer.nextFloat();
        System.out.println("Elige una operacion:"
                + "\n 1: Suma"
                + "\n 2: Resta"
                + "\n 3: Multiplicacion"
                + "\n 4: Division"
                + "\n 5: Potencia"
                + "\n 6: Raiz cuadrada"
                + "\n 7: Modulo");
        op = leer.nextInt();

        switch (op) {
            case 1:
                res = num1 + num2;
                System.out.println("El resultado es: " + res);
                break;
            case 2:
                res = num1 - num2;
                System.out.println("El resultado es: " + res);
                break;
            case 3:
                res = num1 * num2;
                System.out.println("El resultado es: " + res);
                break;
            case 4:
                if (num2 != 0) {
                    res = num1 / num2;
                    System.out.println("El resultado es: " + res);
                } else {
                    System.out.println("No se puede dividir entre 0 :(");
                }
                break;
            case 5:
                res = (float) Math.pow(num1, num2);
                System.out.println("El resultado es: " + res);
                break;
            case 6:
                if (num1 >= 0) {
                    res = (float) Math.sqrt(num1);
                    System.out.println("La raiz de " + num1 + " es: " + res);
                } else {
                    System.out.println("No existe raiz cuadrada de un numero negativo");
                }
                break;
            case 7:
                if (num2 != 0) {
                    res = num1 % num2;
                    System.out.println("El residuo es: " + res);
                } else {
                    System.out.println("No se puede sacar modulo entre 0");
                }
                break;
            case 8:
                res = Math.sin(num1 * Math.PI / 180);
                System.out.println("El seno de " + num1 + " es: " + res);
                break;
            case 9:
                res = Math.cos(num1 * Math.PI / 180);
                System.out.println("El coseno de " + num1 + " es: " + res);
                break;
            case 10:
                if (num1 % 180 == 90 || num1 % 180 == -90) {
                    System.out.println("El tangente de " + num1 + " es indefinido");
                } else {
                    res = Math.tan(num1 * Math.PI / 180);
                    System.out.println("El tangente de " + num1 + " es: " + res);
                }
                break;
            case 11:
                res = num1 * (num2 / 100);
                System.out.println(num2 + "% de " + num1 + " es: " + res);
                break;
            case 12:
                if (num1 > 0) {
                    res = Math.log10(num1);
                    System.out.println("El logaritmo de " + num1 + " es: " + res);
                } else {
                    System.out.println("El logaritmo solo existe para numeros mayores que 0");
                }
                break;
            default:
                System.out.println("La opcion no es valida");
        }
        leer.close();
    }
}