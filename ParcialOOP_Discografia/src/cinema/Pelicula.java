package cinema;

public class Pelicula {
	private String nombre;
	private String director;
	private int duracion;
	
	
	public Pelicula(String nombre, String director, int duracion) {
		this.nombre = nombre;
		this.director = director;
		this.duracion = duracion;
	}
	public String getNombre() {
		return nombre;
	}
	public String getDirector() {
		return director;
	}
	public int getDuracion() {
		return duracion;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public void setDuracion(int duracion) {
		this.duracion = duracion;
	}
	
	

}
