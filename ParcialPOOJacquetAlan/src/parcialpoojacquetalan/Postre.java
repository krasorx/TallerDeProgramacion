/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialpoojacquetalan;

/**
 *
 * @author alumnos
 */
public class Postre {
    private String nombre;
    private String fechaVenc;
    private double montoPorKg;
    
public Postre(String unNombre, String unaFecha, double unPrecio){
        nombre=unNombre;
        fechaVenc=unaFecha;
        montoPorKg=unPrecio;
    }    
        
    public Postre () {
        
    }

    public String getNombre(){
        return nombre;
    }

    public String getFechaVencimiento(){
        return fechaVenc;
    }
        
    public int getMontoPorKg(){
        return cantIntegrantes;
    }
         
    public void setNombre(String unNombre){
        nombre=unNombre;
    }
    
    public void setCiudad(String unaCiudad){
        ciudad=unaCiudad;
    }
    
    public void setCantIntegrantes(int integrantes){
        cantIntegrantes=integrantes;
    }
    
}    
    
    
}
