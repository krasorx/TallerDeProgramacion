/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package tema3;
import java.util.*;

/**
 *
 * @author alumnos
 */
public class DemoEntrenador {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner scanner= new Scanner(System.in);
        Entrenador entrenador= new Entrenador();
        System.out.print("Ingrese el nombre del Entrenador: ");
        entrenador.SetNombre(scanner.nextLine());
        System.out.print("Ingrese el sueldo basico del Entrenador: ");
        entrenador.SetSueldoBasico(scanner.nextDouble());
        System.out.print("Ingrese los campeonatos ganados por el Entrenador: ");
        entrenador.SetCampeonatosGanados (scanner.nextInt());
        System.out.println("El sueldo a cobrar por el entrenador es: $" + 
                            entrenador.CalcularSueldoAcobrar());
        
        
    }
    
}
