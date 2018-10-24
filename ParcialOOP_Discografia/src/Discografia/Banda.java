package Discografia;

public class Banda {
	private String nombre;
	private String ciudadFormacion;
	private short cantidadIntegrantes;
	
	
	public Banda(String nombre, String ciudadFormacion, short cantidadIntegrantes) {
		this.setNombre(nombre);
		this.setCiudadFormacion(ciudadFormacion);
		this.setCantidadIntegrantes(cantidadIntegrantes);
	}
	public String getNombre() {
		return nombre;
	}
	public String getCiudadFormacion() {
		return ciudadFormacion;
	}
	public short getCantidadIntegrantes() {
		return cantidadIntegrantes;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public void setCiudadFormacion(String ciudadFormacion) {
		this.ciudadFormacion = ciudadFormacion;
	}
	public void setCantidadIntegrantes(short cantidadIntegrantes) {
		this.cantidadIntegrantes = cantidadIntegrantes;
	}
	
	
	
}
