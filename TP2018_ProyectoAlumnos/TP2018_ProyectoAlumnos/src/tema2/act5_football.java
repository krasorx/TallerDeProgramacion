package tema2;
import java.util.*;

public class act5_football {

	public static void main(String[] args) {
		int df = 60;				// df = cantidad de partidos
		int empates = 0, golBocaLocal = 0, cntWinsRiver = 0;
		Partido partidos [] = new Partido[df];
		
		Scanner cin = new Scanner(System.in);
		
		for(int i=0;i<df;i++)
		{
			partidos[i] = new Partido();		//Creamos un partido con valores por defecto
			
			System.out.print("Ingresar nombre del equipo local : ");
			partidos[i].setLocal(cin.nextLine());
			System.out.print("Ingresar nombre del equipo visitante : ");
			partidos[i].setVisitante(cin.nextLine());
			System.out.print("Ingresar la cantidad de goles realizados por el equipo Local : ");
			partidos[i].setGolesLocal(cin.nextInt());
			System.out.print("Ingresar la cantidad de goles realizados por el equipo Visitante : ");
			partidos[i].setGolesVisitante(cin.nextInt());
		}
		
		for(int i=0;i<df;i++)
		{
			if (partidos[i].getGolesVisitante() == partidos[i].getGolesLocal()) empates++;
			// Si el partido finalizo con igual cantidad de goles de ambos lados, declaramos un empate.
			if(partidos[i].getGanador() == "River") cntWinsRiver++;
			if (partidos[i].getLocal() == "Boca")
				golBocaLocal += (partidos[i].getGolesLocal());
		}
		
		System.out.println("Un %" + (double)Math.round(((double)empates*100)/df) + " de los partidos resulto en empate.");
		System.out.printf("River gano un total de %s partidos. \n",cntWinsRiver);
		System.out.printf("Boca realizo %s goles como local. \n",golBocaLocal);
		
		
		cin.close();

	}

}
