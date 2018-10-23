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
public class Combis extends Transportes{
    private String NomDest;
    private int CantAsi;

    
    
    /*Constructor*/
    public Combis (String unaMarca,String unModelo, String unaMatricula, double unMontoK, String unNomDest,int unCantAsi){
        super(unaMarca,unModelo,unaMatricula,unMontoK);
        setNomDest (unNomDest);
        setCantAsi (unCantAsi);
        
        
        

    
}

    public String getNomDest() {
        return NomDest;
    }

    public void setNomDest(String NomDest) {
        this.NomDest = NomDest;
    }

    public int getCantAsi() {
        return CantAsi;
    }

    public void setCantAsi(int CantAsi) {
        this.CantAsi = CantAsi;
    }
