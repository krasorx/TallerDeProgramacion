package tema3;

public class Balanza {
	
	private double pesoEnKg;
	private double precioPorKg;
	private double monto = 0;
	private int cantidadItems = 0;
	
	public void Balanza()
	{
		
	}
	
	public void RegistrarProducto(double unPeso, double unPrecioPorKg)
	{
		pesoEnKg = unPeso;
		precioPorKg = unPrecioPorKg; 
	}
	
	public void IniciarCompra()
	{
		cantidadItems++;
		monto += (precioPorKg * pesoEnKg);	
	}
	
	public double DevolverMontoAPagar()
	{
		return monto;
	}
	
	public void DevolverResumenDeCompra()
	{
		System.out.println("Total a pagar $" + monto + " por la compra de " + cantidadItems + " productos");
	}
	
}
