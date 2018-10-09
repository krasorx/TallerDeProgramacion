package tema3;
import java.util.*;



public class Act1_Triangulos {

	public static void main(String[] args) {
		Triangulo triangulo = new Triangulo();
		double a,b,c;
		
		Scanner cin = new Scanner(System.in);
		System.out.print("Ingresar un lado de un triangulo : ");
		a = cin.nextDouble();
		System.out.print("Ingresar un lado de un triangulo : ");
		b = cin.nextDouble();
		System.out.print("Ingresar un lado de un triangulo : ");
		c = cin.nextDouble();
                
		triangulo.SetLados(a, b, c);
		
		System.out.print("Ingresar el color de relleno del triangulo : ");
		triangulo.SetColorRelleno(cin.nextLine());
		System.out.print("Ingresar el color de relleno del triangulo : ");
		triangulo.SetColorLinea(cin.nextLine());
		
		System.out.println("El perimetro del triangulo es : " + (triangulo.CalcularPerimetro()));
		System.out.println("El Area del triangulo es : " + (triangulo.CalcularArea()));
	}

}
