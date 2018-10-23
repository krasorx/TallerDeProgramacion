/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package transformers;
import java.util.*;

/**
 *
 * @author alumnos
 */
public class Transformers {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int i;
        final short df = 10;
        String destinos[] = new String[df];
        Scanner scanner = new Scanner(System.in);
        System.out.println("Remis");
		System.out.print("Ingresar el número de licencia del remis: ");
		int licencia = scanner.nextInt();
		System.out.print("Ingresar la localidad de habilitacion: ");
		String localidadH = scanner.nextLine();
		System.out.print("Ingresar el monto mínimo de viaje: ");
		int montoMin = scanner.nextInt();
                System.out.print("Ingresar la matrícula: ");
		String matricula = scanner.nextLine();
                System.out.print("Ingresar la marca: ");
		String marca = scanner.nextLine();
                System.out.print("Ingresar el modelo: ");
		String modelo = scanner.nextLine();
                System.out.print("Ingresar el monto por kilómetro: ");
		double montoPorKm = scanner.nextDouble();
                        
                
                Remis remis = new Remis(licencia, localidadH, montoMin, matricula, marca, modelo, montoPorKm);
                
                System.out.println("Combi");
		for (i=0; i<df; i++){
                    System.out.print("Ingresar la localidad " + (i+1) + " por la que pasa la combi: ");
                    destinos[i] = scanner.nextLine();
                }
                System.out.print("Ingresar la cantidad de asientos de la combi: ");
		short asientos = scanner.nextShort();
                
                Combi combi = new Combi (asientos, destinos, matricula, marca, modelo, montoPorKm);
                
		
	
		
		
        
    }

    public Transformers() {
    }
    
}
