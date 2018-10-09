package tema3;

import java.util.*;

public class Act2_Balanza {

	public static void main(String[] args) {
		double pesoEnKg,precioPorKg;
		
		Balanza balanza = new Balanza();
		Scanner cin = new Scanner(System.in);
		System.out.print("Ingresar peso en Kg : ");
		pesoEnKg = (cin.nextDouble());
		while(pesoEnKg > 0)
		{
			System.out.print("Ingresar peso por Kg del item : ");
			precioPorKg = cin.nextDouble();
			
			
			balanza.IniciarCompra();
			balanza.RegistrarProducto(pesoEnKg, precioPorKg);
			
			balanza.DevolverMontoAPagar();
			
			System.out.print("Ingresar peso en Kg : ");
			pesoEnKg = (cin.nextDouble());
		}
		balanza.DevolverResumenDeCompra();
		
		cin.close();
	}

}
