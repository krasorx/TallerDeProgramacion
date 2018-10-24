package Discografia;

public class Discografia {
	private String nombre;
	private String ciudad;
	private String nombreDueño;
	
	private final short df = 50;
	private static short indexB = 0;
	private static short indexS = 0;
	
	private Solista solista[] = new Solista[df];
	private Banda banda[] = new Banda[df];
	
	public Discografia(String unNombre,String unaCiudad, String unNombreDueño) {
		this.setNombre(nombre);
		this.setCiudad(ciudad);
		this.setNombreDueño(nombreDueño);
	}

	public String getNombre() {
		return nombre;
	}

	public String getCiudad() {
		return ciudad;
	}

	public String getNombreDueño() {
		return nombreDueño;
	}

	public Solista[] getSolista() {
		return solista;
	}

	public Banda[] getBanda() {
		return banda;
	}
	public int getCantidadBandas() {
		return indexB;
	}
	public int getCantidadSolistas() {
		return indexS;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}

	public void setNombreDueño(String nombreDueño) {
		this.nombreDueño = nombreDueño;
	}

	public void addSolista(String unNombre, String unInstrumento, int unaCantidad) {
		solista[indexS] = new Solista(unNombre,unInstrumento,unaCantidad);
		indexS++;
	}

	public void addBanda(String unNombre, String unaCiudadFormacion, short unaCantidadIntegrantes) {
		banda[indexB] = new Banda( unNombre, unaCiudadFormacion,unaCantidadIntegrantes);
		indexB++;
	}
	
	public int bandasRepresentadas() {
		return (indexB);
	}
	public int solistasRepresentados() {
		return (indexS);
	}
	public int solistasTocanInstrumento(String unInstrumento) {
		int c = 0;
		for(int i=0;i<indexS;i++) {
			c = ( (solista[i].getInstrumento().equals(unInstrumento)) ? (c++): c);
		}
		
		return c;
	}
	public String bandaConMasIntegrantes() {
		int m = 0;	//asumimos que la primera banda es la que tiene mas integrantes
		for(int i = 0; i < indexB; i++) {
			m = ( (banda[m].getCantidadIntegrantes() > banda[i].getCantidadIntegrantes()) ? m : i);
		}
		return banda[m].getNombre();
	}
	public short cantidadBandasFormadasEn() {
		short c = 0;
		for(int i=0;i<df;i++) {
			c = ( (this.getNombre().equals(banda[i].getCiudadFormacion())) ? c++ : c );
		}
		
		return c;
	}
}
