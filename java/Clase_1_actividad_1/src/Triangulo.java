import java.util.*;;
public class Triangulo {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		double a,b,c;
		boolean esTriangulo = false;
		System.out.println("A continuacion ingrese 3 numeros para verificar si forman un triangulo : ");
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("Ingresa un lado : ");
		a = scanner.nextDouble();
		System.out.print("Ingresa un lado : ");
		b = scanner.nextDouble();
		System.out.print("Ingresa un lado: ");
		c = scanner.nextDouble();
		//(a < b + c) ,  (b < a + c), (c < a + b), 
		if (a< (b+c)) { esTriangulo = true; 
			if (b< (a+c)) { esTriangulo = true;
				if(c<(a+b)) {esTriangulo = true;
					System.out.println("El triangulo ingresado es valido,");
					System.out.println("y tiene un perimetro de " + (a + b + c));
				}
			}else esTriangulo = false;
		}else esTriangulo = false;
		
		if (!esTriangulo) System.out.println("El tringulo ingresado no es valido");
	    scanner.close();
	}

}
