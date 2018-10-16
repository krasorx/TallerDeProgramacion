/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author alumnos
 */
public class Micro {
    private String patente;
    private int horaSalida;         // 0000 1830 etc
    private String destino;
    private boolean asiento[];
    private int asientosOcupados;
    
    public void Micro(){
        
    }
    public void Micro(String unaPatente,String unDestino,int unaHora){
        this.SetPatente(unaPatente);
        this.SetDestino(unDestino);
        this.SetHoraSalida(unaHora);
        for (int i=0;i<20;i++){
            asiento[i] = false;
        }
        asientosOcupados = this.ContarAsientos();
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
        for (int i = 1;i<20;i++){
            if(asiento[i]){
                contador++;
            }
        }
        return contador;
    }
    
}
