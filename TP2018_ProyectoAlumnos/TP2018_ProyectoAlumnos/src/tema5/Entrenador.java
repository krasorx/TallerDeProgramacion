/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

/**
 *
 * @author alumnos
 */
public class Entrenador extends Empleado{
    private int campeonatosGanados;
    
    public Entrenador(int cantCampeonatos,String aName,double aSalary){
        super(aName,aSalary);
        SetCampeonatosGanados(cantCampeonatos);
    }
    public void SetCampeonatosGanados(int cantCamp){
        campeonatosGanados = cantCamp;
    }
    public int GetCampeonatosGanados(){
        return campeonatosGanados;
    }
    
    public double CalcularSueldoACobrar(){
        double salarioTot = this.GetSalarioBasico();
        double c = campeonatosGanados;
        if ( c >= 1 ) {
            if (c <= 4){
                salarioTot += 5000;
            }
            else {
                if (c <= 10){
                    salarioTot += 30000;
                }
                else salarioTot += 50000;
            }
        }
        return salarioTot;
    }
    

}
