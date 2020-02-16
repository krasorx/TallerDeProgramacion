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
public class ReproductorMP3 {
    private Cancion[] almacenamiento;
    private int cancionEnReproduccion;
    //profe utilize Diml para ayudarme a solucionar
    private int Diml=0;
    
    public ReproductorMP3()
    {
        almacenamiento = new Cancion[100];
    }
    
    public boolean quedaEspacio()
    {
        return (Diml+1) < almacenamiento.length;
    }
    
    public void cargarCancion(Cancion c)
    {
        
        almacenamiento[Diml] = c;
        Diml++;
        
        
    }
    
    public void iniciarReproduccion()
    {
        cancionEnReproduccion = 0;
    }
    
    public void reproducir()
    {
        System.out.println(almacenamiento[cancionEnReproduccion].toString());
    }
    
    public void avanzar()
    {
        if((cancionEnReproduccion + 1) < Diml)
        {
            cancionEnReproduccion++;
        }
        else
        {
            cancionEnReproduccion = 0;
        }
    }
    
    public int calcularDuracionTotal()
    {
        int tot = 0;
        for(int i = 0; i < Diml; i++)
        {
            tot += almacenamiento[i].getDuracion();
        }
        return tot;
    }
    
    
    
}
