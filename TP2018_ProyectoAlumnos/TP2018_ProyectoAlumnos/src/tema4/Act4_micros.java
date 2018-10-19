package tema4;
import java.util.*;

import javax.swing.JOptionPane;

public class Act4_micros {

	public static void main(String[] args) {
		Micro micro = new Micro("ABC123","Mar Del Plata",500);
		int asiento;
		
		Scanner cin = new Scanner(System.in);
		
		System.out.print("Ingresar el numero de asiento : ");
		asiento = cin.nextInt();
				
		while(!(micro.EstaLleno()) && (asiento != -1)) {
			if (micro.AsientoValido(asiento)) {
				if(! micro.EstaOcupado(asiento)) {
					micro.OcuparAsiento(asiento);
					System.out.println("Se ha asiganado el asiento " + asiento + " correctamente.");
				}
				else {
					System.out.println("El asiento se encuentra ocupado.");
					System.out.println("El primer asiento libre es el " + micro.PrimerAsientoLibre());
				}
			}
			else 
				System.out.println("El numero de asiento ingresado es invalido, solo hay 20 asientos en el colectivo.");
			System.out.print("Ingresar el numero de asiento (-1 para finalizar) : ");
			asiento = cin.nextInt();
		}
		if (micro.EstaLleno()) 
			System.out.println("El micro se lleno.");
		System.out.println("Programa finalizado.");
		cin.close();
	}

}
