/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package delpino;

/**
 *
 * @author alumnos
 */
public class Cancion {
    private String titulo;
    private String interprete;
    private int duracion;
    
    public Cancion(String unTitulo, String unInterprete, int unaDuracion)
    {
        setDuracion(unaDuracion);
        setInterprete(unInterprete);
        setTitulo(unTitulo);
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getInterprete() {
        return interprete;
    }

    public void setInterprete(String interprete) {
        this.interprete = interprete;
    }

    public int getDuracion() {
        return duracion;
    }

    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }
    
    @Override
    public String toString() {
        return  titulo + "-"+ interprete + "-" + duracion;
    }
}
