/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;
import java.util.*;
/**
 *
 * @author alumnos
 */


public class Act1_TriangMetodico {

   
    
    public void CargarDatos(double a, double b, double c, String colorRelleno,
                                                          String colorLinea)
    {
        Scanner cin = new Scanner(System.in);
        System.out.print("Ingresar un lado de un triangulo : ");
	a = cin.nextDouble();
	System.out.print("Ingresar un lado de un triangulo : ");
	b = cin.nextDouble();
        System.out.print("Ingresar un lado de un triangulo : ");
	c = cin.nextDouble();
        System.out.print("Ingresar el color de relleno del triangulo : ");
	colorRelleno = cin.nextLine();
        cin.next();
        System.out.print("Ingresar el color de relleno del triangulo : ");
	colorLinea = cin.nextLine();
        cin.next();
        cin.close();
    }
    
    public void CrearTriangulo(Triangulo triangulo)
    {
        
        
        String colorRelleno = "", colorLinea = "";
        CargarDatos(a,b,c,colorRelleno,colorLinea);
        if(triangulo.EsTriangulo())
        {
            triangulo.SetLados(a, b, c);
            triangulo.SetColorRelleno(colorRelleno);
            triangulo.SetColorLinea(colorLinea);
        }
    }
            
    public static void main(String[] args) 
    {
        Act1_TriangMetodico ads = new Act1_TriangMetodico();
        Triangulo triangulo = new Triangulo();
        ads.CrearTriangulo(triangulo);
        
        System.out.printf("El area del triangulo es %2f" , triangulo.CalcularArea());
        System.out.printf("El perimetro del triangulo es %2f", triangulo.CalcularPerimetro());
       
    }
    
}
