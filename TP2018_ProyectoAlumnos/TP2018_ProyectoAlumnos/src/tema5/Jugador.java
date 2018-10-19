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
public class Jugador extends Empleado {
    private int partidosJugados;
    private int golesRealizados;
    
    public Jugador(int goles,int partidos,String unNombre,double unSueldo){
        super(unNombre,unSueldo);
        SetPartidosJugados(partidos);
        SetGolesRealizados(goles);
    }
    
    public void SetPartidosJugados(int unosPartidos){
        partidosJugados = unosPartidos;
    }
    public void SetGolesRealizados(int unosGole){
        golesRealizados = unosGole;
    }
    
    public double CalcularSueldoACobrar(){
        return (this.GetSalarioBasico() + ((this.golesRealizados / this.partidosJugados) > 0.5 ? this.GetSalarioBasico(): 0));
    }
    
}
