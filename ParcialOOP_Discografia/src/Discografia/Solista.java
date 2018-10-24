package Discografia;

public class Solista {
	private String nombre;
	private String instrumento;
	private int cantidadTemas;
	
	public Solista(String nombre, String instrumento, int cantidadTemas) {
		this.setNombre(nombre);
		this.setInstrumento(instrumento);
		this.setCantidadTemas(cantidadTemas);
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getInstrumento() {
		return instrumento;
	}

	public void setInstrumento(String instrumento) {
		this.instrumento = instrumento;
	}

	public int getCantidadTemas() {
		return cantidadTemas;
	}

	public void setCantidadTemas(int cantidadTemas) {
		this.cantidadTemas = cantidadTemas;
	}
	
	
	

}
