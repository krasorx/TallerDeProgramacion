/*
Entrada Salida de datos desde teclado y hacia consola.
Lee datos de una persona (dni, sueldo, es soltero, nombre, apellido, sexo, descripcion) y los muestra en consola
 */
package tema1;

/**
 *
 * @author vsanz
 */


import java.util.Scanner;// Paso 1: Importar funcionalidad para entrada desde teclado

public class Demo05Entrada
{
  public static void main(String[] args)
  {
    Scanner in = new Scanner(System.in); //Paso 2: declarar el scanner
    System.out.println("Ingrese datos del canino: edad, peso, tiene dueño, nombre, descripcion y luego ENTER");
    System.out.println("Use como separador el espacio o tab");   
    int edad = in.nextInt(); //Paso 3: Lectura de datos, asignación a variables
    double peso = in.nextDouble();
    boolean tieneDueño = in.nextBoolean();
    String nombre = in.next(); 
    String descripcion = in.nextLine();
    System.out.println("Mostrando lo ingresado: ");
    System.out.println(edad + " " + peso + " " + tieneDueño  + " " + nombre +  " y " + descripcion);
    in.close(); //Paso 4: cierra el scanner
  }
}

