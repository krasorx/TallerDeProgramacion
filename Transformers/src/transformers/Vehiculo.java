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
public abstract class Vehiculo {
    private String matricula;
    private String marca;
    private String modelo;
    private Double montoPorKm;

    public Vehiculo(String matricula, String marca, String modelo, Double montoPorKm) {
        this.setMarca(marca);
        this.setMatricula(matricula);
        this.setModelo(modelo);
        this.setMontoPorKm(montoPorKm);
    }

    
    
    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }
    public void setMontoPorKm(Double montoPorKm) {
        this.montoPorKm = montoPorKm;
    }

    public String getMatricula() {
        return matricula;
    }

    public String getMarca() {
        return marca;
    }

    public String getModelo() {
        return modelo;
    }

    public Double getMontoPorKm() {
        return montoPorKm;
    }
    
    
    
    
    public abstract double CalcularMontoViaje(double kms);
    
    
}
