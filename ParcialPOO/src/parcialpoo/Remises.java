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
public class Remises extends Transportes{
    private int numDeLicencia;
    private String localHab;
    private double montoMinV;
    
    
    /*Constructor*/
    public Remises (String unaMarca,String unModelo, String unaMatricula, double unMontoK, int unNumDeLicencia, String unLocalHab,double unMontoMinV){
        super(unaMarca,unModelo,unaMatricula,unMontoK);
        setnumDeLicencia (unNumDeLicencia);
        setlocalHab (unLocalHab);
        setMontokm (unMontoMinV);
    }

    public int getNumDeLicencia() {
        return numDeLicencia;
    }

    public void setNumDeLicencia(int numDeLicencia) {
        this.numDeLicencia = numDeLicencia;
    }

    public String getLocalHab() {
        return localHab;
    }

    public void setLocalHab(String localHab) {
        this.localHab = localHab;
    }

    public double getMontoMinV() {
        return montoMinV;
    }

    public void setMontoMinV(double montoMinV) {
        this.montoMinV = montoMinV;
    }

    
}
