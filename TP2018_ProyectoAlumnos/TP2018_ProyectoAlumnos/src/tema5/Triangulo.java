/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

/**
 *
 * @author alumnos
 */
public class Triangulo extends Figura{
    private double ladoA;
    private double ladoB;
    private double ladoC;
    
    public Triangulo(double unLadoA, double unLadoB, double unLadoC,String unCR,String unCL){
        super(unCR,unCL);
        SetLados(unLadoA,unLadoB,unLadoC);
    }
    
    public void SetLados(double unLadoA, double unLadoB, double unLadoC){
	ladoA = unLadoA;
	ladoB = unLadoB;		
        ladoC = unLadoC;
    }
    
    public double calcularArea(){
        double s = (ladoA + ladoB + ladoC)/2;
	double area = Math.sqrt(s*(s-ladoA)*(s-ladoB)*(s-ladoC));
	return area;
    }
    public double calcularPerimetro(){
        double perimetro = (ladoA + ladoB + ladoC);
	return perimetro;
    }
    
}
