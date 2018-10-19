package tema4;
import java.util.*;

public class Actividad5b_FlotaMicros {

	public static void main(String[] args) {
		short df = 15;
		FlotaMicros micros[] = new FlotaMicros[df]; 
		
		for(int i=0;i<df;i++) {
			micros[i] = new FlotaMicros();
		}
		
		String destino;
		int hora;
		Scanner cin = new Scanner(System.in);
		System.out.print("Ingresar una patente (ZZZ000 para finalizar): ");
		String patente = cin.nextLine();
		short i = 0;
		
		while( (patente != "ZZZ000") && (micros[i].FlotaCompleta())) {
			System.out.print("Ingresar el destino : ");
			destino = cin.nextLine();
			System.out.print("Ingresar el horario de salida : ");
			hora = cin.nextInt();
			
			Micro micro = new Micro(patente,destino,hora);
			micros[i].AgregarMicro(micro);
			
			System.out.print("Ingresar una patente (ZZZ000 para finalizar): ");
			patente = cin.nextLine();
			i++;
		}
		if (micros[i].FlotaCompleta()) System.out.println("Flota completa.");
		
		System.out.print("Ingresar la patente del micro a eliminar de la flota : ");
		patente = cin.nextLine();
		micros[i].EliminarMicro(patente);
		
		System.out.print("Ingresar el destino del micro del que desea obtener informacion : ");
		destino = cin.nextLine();
		System.out.println("El micro con patente " + micros[i].BuscarBondiDestino(destino).GetPatente() + " partira a su " + 
							" destino a las " + micros[i].BuscarBondiDestino(destino).GetHoraSalida() + " horas.");
		
		System.out.println("Programa finalizado.");
		cin.close();
	}

}
