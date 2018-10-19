package tema4;

/**
 *
 * @author Krasorx
 */
public class Micro {
    private String patente;
    private int horaSalida;         // 0000 1830 etc
    private String destino;
    private boolean asiento[];
    private int asientosOcupados;
    
    public Micro(){
        
    }
    public Micro(String unaPatente,String unDestino,int unaHora){
        this.SetPatente(unaPatente);
        this.SetDestino(unDestino);
        this.SetHoraSalida(unaHora);
        this.SetAsientos();
        asientosOcupados = this.ContarAsientos();
    }
    public void SetAsientos() {
    	asiento = new boolean[20];
    	for (int i=0;i<20;i++){
            asiento[i] = false;
        }
    }
    public void SetPatente(String unaPatente){
        patente = unaPatente;
    }
    public void SetDestino(String unDestino){
        destino = unDestino;
    }
    public void SetHoraSalida(int unaHora){
        horaSalida = unaHora;
    }
    public void SetAsiento(int unAsiento) {
    	asiento[unAsiento] = true;
    	asientosOcupados++;
    }
    public String GetPatente(){
        return patente;
    }
    public String GetDestino(){
        return destino;
    }
    public int GetHoraSalida(){
        return horaSalida;
    }
    public int ContarAsientos(){
        int contador = 0;
        for (int i = 0;i<20;i++){
            if(asiento[i]){
                contador++;
            }
        }
        return contador;
    }
    public boolean EstaLleno() {
    	if (ContarAsientos() == 20 ) {
    		return true;
    	}
    	else return false;
    }
    public boolean AsientoValido(int unAsiento) {
    	if (unAsiento >= 0 && unAsiento < 20) {
    		return true;
    	}
    	else return false;
    }
    public boolean EstaOcupado(int unAsiento) {
    	return asiento[unAsiento];			// devuelve falso si el asiento esta libre
    }
    public void OcuparAsiento(int unAsiento) {
    	asiento[unAsiento] = true;
    	asientosOcupados++;
    }
    public void LiberarAsiento(int unAsiento) {
    	asiento[unAsiento] = false;
    	asientosOcupados--;
    }
    public int PrimerAsientoLibre() {
    	 for (int i = 1;i<20;i++){
             if(! asiento[i]){
            	 return i;
             }
             }
    	 return -1; 		// si todos los asientos estan ocupados devuelve -1
    }
    
}