/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package transformers;

/**
 *
 * @author alumnos
 */
public class Remis extends Vehiculo{
        private int numeroLicencia;
        private String localidadHabilitacion;
        private double montoMinimo;

    public Remis(int numeroLicencia, String localidadHabilitacion, double montoMinimo, String matricula, String marca, String modelo, Double montoPorKm) {
        super(matricula, marca, modelo, montoPorKm);
        this.setNumeroLicencia(numeroLicencia);
        this.setLocalidadHabilitacion(localidadHabilitacion);
        this.setMontoMinimo(montoMinimo);
    }

    public int getNumeroLicencia() {
        return numeroLicencia;
    }

    public void setNumeroLicencia(int numeroLicencia) {
        this.numeroLicencia = numeroLicencia;
    }

    public String getLocalidadHabilitacion() {
        return localidadHabilitacion;
    }

    public void setLocalidadHabilitacion(String localidadHabilitacion) {
        this.localidadHabilitacion = localidadHabilitacion;
    }

    public double getMontoMinimo() {
        return montoMinimo;
    }

    public void setMontoMinimo(double montoMinimo) {
        this.montoMinimo = montoMinimo;
    }
    
     public double CalcularMontoViaje(double kms) {
         double monto = (kms * this.getMontoPorKm());
        if( monto > this.getMontoMinimo() ) {
            return monto;
        }  
        else return this.getMontoMinimo();
     }
    

        
    
}
