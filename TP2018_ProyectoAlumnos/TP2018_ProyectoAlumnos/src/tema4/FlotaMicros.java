package tema4;

public class FlotaMicros {
	public static byte index;
	private final byte size = 15;
	private boolean enServicio;
	private Micro micros[];
	
	
	public FlotaMicros() {
		index++;
		enServicio = false;
		micros = new Micro[size];
	}
	public boolean FlotaCompleta() {
		return (index == size);
	}
	public void SetEnServicio() {
		enServicio = true;
	}
	public void AgregarMicro(Micro unMicro) {
		micros[index] = new Micro(unMicro.GetPatente(),unMicro.GetDestino(),unMicro.GetHoraSalida());
		SetEnServicio();
	}
	public void EliminarMicro(String unaPatente) {
		Micro bondi = BuscarPatente(unaPatente);
		System.out.println("El micro ha sido eliminado exitosamente.");
		bondi = null;
	}
	public Micro BuscarPatente(String unaPatente) {
		byte i;
		for(i=0;i<index;i++) {
			if (micros[i].GetPatente() == unaPatente) {
				return micros[i];
			}
		}
		System.out.println("No se encontro la patente.");
		return null;
	}
	public Micro BuscarBondiDestino(String unDestino) {
		byte i;
		for(i=0;i<index;i++) {
			if (micros[i].GetDestino() == unDestino) {
				return micros[i];
			}
		}
		return null;
	}
	
}
	
