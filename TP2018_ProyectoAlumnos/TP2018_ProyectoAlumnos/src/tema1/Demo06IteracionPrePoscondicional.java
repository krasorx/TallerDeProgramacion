/*
Programa que muestra el uso del while y do-while. 
Primero lee numeros hasta ingresar uno mayor a 10. Imprime la suma. El ultimo numero no lo incluye. 
Luego lee numeros hasta ingresar uno mayor a 10. Imprime la suma. El ultimo lo incluye. 

 */
package tema1;

import java.util.Scanner;

/**
 *
 * @author vsanz
 */
class Demo06IteracionPrePoscondicional {
    public static void main(String[] args){
        int num, suma; 
        Scanner in = new Scanner(System.in);
        
        System.out.println("Comienza a ejecutar el while. Ingrese numeros. Finaliza cuando ingresa uno mayor que 10");
        suma=0;
        num = in.nextInt(); 
        while (num <= 10) {
             suma= suma+num;
             num = in.nextInt();
        }
        System.out.println("La suma es: " + suma);
        
        System.out.println("Comienza a ejecutar el do-while. Ingrese numeros. Finaliza cuando ingresa uno mayor que 10");
        suma=0;
        do{
            num = in.nextInt();
            suma=suma+num;
        }while (num <= 10);
        System.out.println("La suma es: " + suma);
    }
}