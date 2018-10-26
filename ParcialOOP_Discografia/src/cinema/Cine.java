package cinema;

public class Cine {
	private String nombre;
	private String direccion;
	private String nombreDue�o;
	
	private short df = 5; 
	private Sala[] sala = new Sala[df];
	
	
	public String getNombre() {
		return nombre;
	}
	public String getDireccion() {
		return direccion;
	}
	public String getNombreDue�o() {
		return nombreDue�o;
	}
	public Sala[] getSala() {
		return sala;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public void setNombreDue�o(String nombreDue�o) {
		this.nombreDue�o = nombreDue�o;
	}
	public void setSala(int i,int unCupo) {
		sala[i] = new Sala(i,unCupo);
	}
	public void comprarEntrada(int i) {
		sala[i].comprarTicket();
	}
	public void devolverEntrada(int i) {
		sala[i].devolverTicket();
	}
	
	
	
}
