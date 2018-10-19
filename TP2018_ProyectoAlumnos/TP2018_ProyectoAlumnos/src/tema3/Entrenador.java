/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author alumnos
 */
public class Entrenador {
    private String nombre;
    private double sueldoBasico;
    private int campeonatosGanados;
    
    public void Entrenador(){
        
    }
    
    public void SetNombre(String unNombre){
        nombre = unNombre;
    }
    public void SetSueldoBasico(double unSueldo){
        sueldoBasico = unSueldo;
    }
    public void SetCampeonatosGanados(int cantidad){
        campeonatosGanados = cantidad;
    }
    public String GetNombre(){
        return nombre;
    }
    public double GetSueldo(){
        return sueldoBasico;
    }
    
    public int GetCampeonato() {
        return campeonatosGanados;
    }
    
    public double CalcularSueldoAcobrar(){
        switch (campeonatosGanados){
            case 0: 
                return sueldoBasico;
            case 1:case 2: case 3: case 4:
                return (sueldoBasico + 5000);
            case 5:case 6:case 7: case 8: case 9 : case 10 :
                return (sueldoBasico + 30000);
            default:
                return (sueldoBasico + 50000);      
        }
    }
}
