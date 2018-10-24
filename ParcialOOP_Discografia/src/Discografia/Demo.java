package Discografia;
import java.util.*;

/* Discografia : Nombre,ciudad, nombre del dueño + info de los discos y las bandas
 *  o solistas que los representan (a lo sumo 50 de cada)
 *  un solista se representa por : nombre, instrumento, cantidad de temas
 *  una banda se caracteriza por tener un nombre, la ciudad de formación y cantidad de integrantes
 */


public class Demo {

	public static void main(String[] args) {
		Scanner cin = new Scanner(System.in);
		
		System.out.println("Ingresar el nombre de la discografia : ");
		String nombre = cin.next();
		System.out.println("Ingresar el nombre de la ciudad en la que se encuentra : ");
		String ciudad = cin.next();
		System.out.println("Ingresar el nombre del dueño de la discografia : ");
		String nombreDueño = cin.next();
		
		Discografia discografia = new Discografia(nombre,ciudad,nombreDueño);	// Creamos una discografia sin bandas ni solistas
		
		int cantidadTemas = 0;
		String instrumento = "";
		System.out.println("Ingresar el nombre del solista ('fin' para finalizar) : ");
		String nombreSolo = cin.next();
		while(nombreSolo.equals("fin") && discografia.getCantidadSolistas() < 50) {
			System.out.println("Ingresar el nombre de su instrumento de uso : ");
			instrumento = cin.next();
			System.out.println("Ingresar la cantidad de temas grabados : ");
			cantidadTemas = cin.nextInt();
			// llamo al constructor del solista
			
			discografia.addSolista(nombreSolo,instrumento,cantidadTemas);
			
			//Solista solista = new Solista(nombreSolo,instrumento,cantidadTemas);
			
			System.out.println("Ingresar el nombre del solista ('fin' para finalizar) :  ");
			nombreSolo = cin.next();
		}
		
		
		short integrantes = 0;
		String ciudadFormacion;
		System.out.println("Ingresar el nombre de la banda ('fin' para finalizar) : ");
		String nombreBanda = cin.next();
		while(nombreBanda.equals("fin") && (discografia.getCantidadBandas() < 50)) {
			System.out.println("Ingresar la ciudad de formacion : ");
			ciudadFormacion = cin.next();
			System.out.println("Ingresar la cantidad de integrantes que conforman la banda : ");
			cantidadTemas = cin.nextInt();
			// llamo al constructor de la banda
			
			discografia.addBanda(nombreBanda,ciudadFormacion,integrantes);
			
			//Banda banda = new Banda(nombreBanda,ciudadFormacion,integrantes);
			System.out.println("Ingresar el nombre de la banda ('fin' para finalizar) :  ");
			nombreBanda = cin.next();
		}
		
		System.out.println("Cantidad de bandas representadas por una discografia : " + discografia.getCantidadBandas());
		System.out.println("Ingresar el nombre del instrumento : ");
		instrumento = cin.next();
		System.out.println(discografia.solistasTocanInstrumento(instrumento) + " tocan el/la " + instrumento + ".");
		System.out.println("La banda  " + discografia.bandaConMasIntegrantes() + " es la que mas integrantes posee.");
		System.out.println("Se formaron " + discografia.cantidadBandasFormadasEn() + " bandas.");
		
		
		System.out.println("Programa finalizado.");
	}

}
