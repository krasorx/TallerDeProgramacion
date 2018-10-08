package tema2;
import java.util.*;
import javax.swing.JOptionPane;

public class Act1_CrearPersona {

	public static void main(String[] args) {
		Persona chabon = new Persona();
		
		Scanner cin = new Scanner(System.in);
		chabon.setNombre(JOptionPane.showInputDialog("Escribe un nombre"));
		String texto=JOptionPane.showInputDialog("Escribe el DNI");
        chabon.setDNI(Integer.parseInt(texto));
        texto=JOptionPane.showInputDialog("Escribe la edad");
        chabon.setEdad(Integer.parseInt(texto));
		
		/*
		 *  System.out.print("Ingresar el nombre del chabon : ");
		 *  chabon.setNombre(cin.nextLine());
			System.out.print("Ingresar el DNI del chabon : ");
			chabon.setDNI(cin.nextInt());
			System.out.print("Ingresar la edad del chabon : ");
			chabon.setEdad(cin.nextInt());
		*/
		
		
		System.out.println(chabon.toString());
		
		System.out.println("Ejecucion finalizada.");
		
		cin.close();

	}

}
