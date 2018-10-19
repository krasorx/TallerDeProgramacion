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
public abstract class Empleado {
    private String nombre;
    private double sueldoBasico;
    
    public Empleado(String aName, double aSalary){
        SetNombre(aName);
        SetSueldoBasico(aSalary);
    }
    public void SetNombre(String unNombre){
        nombre = unNombre;
    }
    public void SetSueldoBasico(double unSueldoBasico){
        sueldoBasico = unSueldoBasico;
    }
    public String GetNombre(){
        return nombre;
    }
    public double GetSalarioBasico(){
        return sueldoBasico;
    }
    public abstract double CalcularSueldoACobrar();
    public String ToString(){
        return ("El empleado " + nombre + " debe cobrar $" + CalcularSueldoACobrar());
    }
}