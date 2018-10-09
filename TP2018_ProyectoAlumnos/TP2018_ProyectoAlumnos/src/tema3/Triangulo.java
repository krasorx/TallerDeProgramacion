package tema3;

public class Triangulo {
	private double ladoA,ladoB,ladoC;
	private String colorRelleno;
	private String colorLinea;
	
	public Triangulo() {
		
	}
	
	public Triangulo(double unLadoA, double unLadoB, double unLadoC,
					 String unColorRelleno, String unColorLinea) 
	{
		ladoA = unLadoA;
		ladoB = unLadoB;
		ladoC = unLadoC;
		colorRelleno = unColorRelleno;
		colorLinea = unColorLinea;
	}
	
	public double GetLadoA() {
		return ladoA;
	}
	public double GetLadoB() {
		return ladoB;
	}
	public double GetLadoC() {
		return ladoC;
	}
	
	public void SetLados(double unLadoA, double unLadoB, double unLadoC)
	{
		ladoA = unLadoA;
		ladoB = unLadoB;
		ladoC = unLadoC;
	}
	
	public void SetColorRelleno(String unColorRelleno)
	{
		colorRelleno = unColorRelleno;
	}
	
	public void SetColorLinea(String unColorLinea)
	{
		colorLinea = unColorLinea;
	}
	
	public double CalcularArea()
	{
		double s = (ladoA + ladoB + ladoC)/2;
		double area = Math.sqrt(s*(s-ladoA)*(s-ladoB)*(s-ladoC));
		return area;
	}
	
	public double CalcularPerimetro()
	{
		double perimetro = (ladoA + ladoB + ladoC);
		return perimetro;
	}
        
    public boolean EsTriangulo()
    {
        if ((ladoA >= (ladoB + ladoC) || ladoB >= (ladoA + ladoC)) || ladoC >= (ladoA + ladoB)) {
            return true;
        } else { 
            System.out.println("Los lados NO pueden formar un triángulo");
            return false;
        }   
    }
}
