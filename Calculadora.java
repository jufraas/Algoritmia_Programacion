
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
                + "\n 4: Division");
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
            default:
                System.out.println("La opcion no es valida");
        }
        leer.close();
    }
}