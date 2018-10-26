package cinema;

public class Sala {
	private int numeroSala;
	private int cupoSalas;
	private int cuposVendidos;
	private Pelicula peliculaProyectada;
	
	
	public Sala(int numeroSala, int cupoSalas) {
		this.numeroSala = numeroSala;
		this.cupoSalas = cupoSalas;
		this.cuposVendidos = 0;
	}

	public void setPelicula(String unNombre, String unDirector, int unaDuracion) {
		peliculaProyectada = new Pelicula(unNombre,unDirector,unaDuracion);
	}
	
	public int getNumeroSala() {
		return numeroSala;
	}
	public int getCupoSalas() {
		return cupoSalas;
	}
	public int getCuposVendidos() {
		return cuposVendidos;
	}
	public void setNumeroSala(int numeroSala) {
		this.numeroSala = numeroSala;
	}
	public void setCupoSalas(int cupoSalas) {
		this.cupoSalas = cupoSalas;
	}
	public void setCuposVendidos(int cuposVendidos) {
		this.cuposVendidos = cuposVendidos;
	}
	public void comprarTicket() {
		cuposVendidos++;
	}
	public void devolverTicket() {
		cuposVendidos--;
	}
	
}
