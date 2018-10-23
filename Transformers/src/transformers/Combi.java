/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
    nombres de los 10 destinos a los que viaja
cantidad de asientos
 */
package transformers;

/**
 *
 * @author alumnos
 */
public class Combi extends Vehiculo{
    private short cantidadAsientos;
    private final short df = 10;
    private String destinos[] = new String[df];

    public Combi(short cantidadAsientos, String[] destinos, String matricula, String marca, String modelo, Double montoPorKm) {
        super(matricula, marca, modelo, montoPorKm);
        this.cantidadAsientos = cantidadAsientos;
        this.destinos = destinos;
    }

    public short getCantidadAsientos() {
        return cantidadAsientos;
    }

    public void setCantidadAsientos(short cantidadAsientos) {
        this.cantidadAsientos = cantidadAsientos;
    }

    public String[] getDestinos() {
        return destinos;
    }

    public void setDestinos(String[] destinos) {
        this.destinos = destinos;
    }
    
    
    public boolean pasaPorCiudad(String unaCity){
        for(int i = 0;i<df;i++){
            if (destinos[i].equals(unaCity)){
                return true;
            }
        }
        return false;
    }
    
    public double CalcularMontoViaje(double kms) {
        if (this.pasaPorCiudad("Avellaneda")){
            return (kms * this.getMontoPorKm());
        }
        else if (kms <= 15){
            return (200);
        }
        else return (5000/this.getCantidadAsientos());
            
    }

    
    
    
}
