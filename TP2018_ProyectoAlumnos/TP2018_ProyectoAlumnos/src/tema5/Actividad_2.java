package tema5;
import java.util.*;

public class Actividad_2 {

	public static void main(String[] args) {
		
		Scanner cin = new Scanner(System.in);
		System.out.println("Jugador");
		System.out.print("Ingresar el nombre del jugador : ");
		String nombre = cin.nextLine();
		System.out.print("Ingresar el salario del jugador : ");
		double salario = cin.nextDouble();
		System.out.print("Ingresar la cantidad de goles realizadas por el jugador : ");
		int goles = cin.nextInt();
		System.out.print("Ingresar la cantidad de partidos que jugó : ");
		int partidos = cin.nextInt();
		
		Jugador jugador = new Jugador(goles,partidos,nombre,salario);
		
		System.out.println("Entrenador");
		System.out.print("Ingresar el nombre del entrenador : ");
		nombre = cin.next();
		System.out.print("Ingresar el salario del entrenador : ");
		salario = cin.nextDouble();
		System.out.print("Ingresar la cantidad de campeonatos ganados por el entrenador : ");
		int campeonatos = cin.nextInt();
		
		
		Entrenador entrenador = new Entrenador(campeonatos,nombre,salario);
		cin.close();
	}

}
