package tema2;
import java.util.*;

public class Act1_CrearPersona {

	public static void main(String[] args) {
		Persona chabon = new Persona();
		String nombre;
		int dni, edad;
		
		Scanner cin = new Scanner(System.in);
		System.out.print("Ingresar el nombre del chabon : ");
		nombre = cin.nextLine();
		System.out.print("Ingresar el DNI del chabon : ");
		dni = cin.nextInt();
		System.out.print("Ingresar la edad del chabon : ");
		edad = cin.nextInt();
		
		chabon.setNombre(nombre);
		chabon.setDNI(dni);
		chabon.setEdad(edad);
		
		System.out.println(chabon.toString());
		
		System.out.println("Ejecucion finalizada.");
		
		cin.close();

	}

}
