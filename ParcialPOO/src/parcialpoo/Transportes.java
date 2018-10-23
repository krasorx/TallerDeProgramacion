/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialpoo;

/**
 *
 * @author alumnos
 */
public abstract class Transportes {
 private String marca;
 private String modelo;
 private String matricula;
 private Double montoK;


 public Transportes (String unaMarca ,String unModelo, String unaMatricula, double unMontoK){
        
        setMarca(unaMarca);
        setModelo(unModelo);
        setMatricula (unaMatricula);
        setMontok(unMontoK);
    }

    public String getMarca(){
        return marca;
    }
    
    public void setMarca (){
        this.marca = marca;
    }
    
    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public Double getMontoK() {
        return montoK;
    }

    public void setMontoK(Double montoK) {
        this.montoK = montoK;
    }

   
    }
}

