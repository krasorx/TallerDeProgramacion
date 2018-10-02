import java.util.*;

public class PatentesPar {

	public static void main(String[] args) {
		int a = 0;
		int c = 0;
		int noPasaron = 0;
		double tasaPasaron;
		System.out.println("Patentes Par.");
		System.out.print("Ingresar un numero de patente : ");
		Scanner scanner = new Scanner(System.in);
		a = scanner.nextInt();
		while (a > 0) {
			if ( (a % 2) != 0 ) {
				System.out.println("El vehiculo no tiene permitido pasar.");
				noPasaron++;
			}else System.out.println("El vehiculo tiene permitido pasar.");
			c++;
			System.out.print("Ingresar un numero de patente : ");
			a = scanner.nextInt();
		}
		if (c != 0) {
			tasaPasaron = ((100*noPasaron)/c);
			System.out.println("a un " + tasaPasaron + "% se les permitío pasar.");
		}
		else System.out.println("Debes ingresar al menos una patente !!!");
		
		scanner.close();
	}
}
