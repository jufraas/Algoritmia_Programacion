import java.util.Scanner;

public class Entrenamiento {

    public static void main (String[] args) {
        Scanner leer = new Scanner(System.in);

        int cant;
        double precioUnidad,compra, desc, totalPagar;

        System.out.println("Ingrese la cantidad de camisas: ");
        cant = leer.nextInt();
        System.out.println("Precio Unitario: ");
        precioUnidad = leer.nextDouble();
        compra = cant * precioUnidad;

        if (cant >= 3) {
            desc = compra * 0.20;
        } else {
            desc = compra * 0.10;
        }
        totalPagar = compra - desc;
        System.out.println("Total a pagar: " + totalPagar);
        leer.close();
    }
}
