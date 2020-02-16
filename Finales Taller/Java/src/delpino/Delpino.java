/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package delpino;

import java.util.Scanner;

/**
 *
 * @author alumnos
 */
public class Delpino {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       ReproductorMP3 reprod = new ReproductorMP3();
       Scanner scan = new Scanner(System.in);
       String titulo, interprete;
       int duracion, cant;
       System.out.println("Ingrese un Titulo de cancion distinto de 'ZZZ': ");
       titulo = scan.nextLine();
       while(reprod.quedaEspacio() && !titulo.equals("ZZZ"))
       {
           System.out.println("Ingrese un Interprete: ");
           interprete = scan.nextLine();
           System.out.println("Ingrese una duracion: ");
           duracion = scan.nextInt();
           Cancion c = new Cancion(titulo, interprete, duracion);
           reprod.cargarCancion(c);
           System.out.println("Ingrese un Titulo de cancion distinto de 'ZZZ': ");
           scan.nextLine();
           titulo = scan.nextLine();
       }
       System.out.println("Ingrese la cantidad de canciones a escuchar: ");
       cant = scan.nextInt();
       reprod.iniciarReproduccion();
       for(int i = 0; i < cant; i++)
       {
           reprod.reproducir();
           reprod.avanzar();
       }
       System.out.println(reprod.calcularDuracionTotal());
    }
    
}
