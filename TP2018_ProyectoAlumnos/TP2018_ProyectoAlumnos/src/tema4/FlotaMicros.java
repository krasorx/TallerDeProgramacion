package tema4;

public class FlotaMicros {
	public static byte index = 0;
	private final byte size = 15;
	private boolean enServicio;
	private Micro micros[] = new Micro[size];
	
	
	public FlotaMicros() {
		//index++;
		enServicio = false;	
	}
	public boolean EstaCompleta() {
		return (index == size);
	}
	public void SetEnServicio() {
		enServicio = true;
	}
	public void AgregarMicro(Micro unMicro) {
		micros[index] = new Micro(unMicro.GetPatente(),unMicro.GetDestino(),unMicro.GetHoraSalida());
                index++;
		SetEnServicio();
	}
	public void EliminarMicro(String unaPatente) {
		Micro bondi = BuscarPatente(unaPatente);
		bondi = null;   // no lo elimina, hay que hacer un acomodamiento de vectores y no tengo ganas
	}
	public Micro BuscarPatente(String unaPatente) {
		byte i;
                    for(i=0;i<index;i++) {
                            if (micros[i].GetPatente().equals(unaPatente)) {
                                    return micros[i];
                            }
                    }
		System.out.println("No se encontro la patente.");
		return null;
	}
	public Micro BuscarBondiDestino(String unDestino) {
		byte i;
		for(i=0;i<index;i++) {
			if (micros[i].GetDestino().equals(unDestino)) {
				return micros[i];
			}
		}
		return null;
	}
	
}
	
