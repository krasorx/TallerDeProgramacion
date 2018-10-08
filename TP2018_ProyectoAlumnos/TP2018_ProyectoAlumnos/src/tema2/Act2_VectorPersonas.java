package tema2;
import java.util.*;

public class Act2_VectorPersonas {
	public static void main(String[] args) {
		//Persona chabon = new Persona();
		int df = 5, cntM65 = 0,minDni = Integer.MAX_VALUE, indexMin = 0;
		String nombre;
		int edad,dni;
		
		Persona vector [] = new Persona[df];
		
		Scanner cin = new Scanner(System.in);
		
		for(int i=0;i<df;i++)				// Cargamos los datos de las personas
		{
			
			System.out.print("Ingresar el nombre del chabon : ");
			nombre = cin.nextLine();
			System.out.print("Ingresar el DNI del chabon : ");
			dni = cin.nextInt();
			System.out.print("Ingresar la edad del chabon : ");
			edad = cin.nextInt();

			vector[i] = new Persona(nombre,dni,edad);	
			vector[0].toString();
		}
		
		for(int i=0;i<df;i++)
		{
			if(vector[i].getEdad() > 65) cntM65++;
			if(vector[i].getDNI() < minDni) 
			{
				minDni = vector[i].getDNI();
				indexMin = i;
			}
		}
		
		
		System.out.println("Se ingresaron " + cntM65 + " mayores a 65 anyos." );
		System.out.println("Datos de la persona con menor DNI : ");
		vector[indexMin].toString();		
		
		cin.close();
		
	}

}
