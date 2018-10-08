/*
Clase Libro vista en el tema 3. 

 */
package tema3;

/**
 *
 * @author vsanz
 */
public class Libro {
   private String titulo;
   private String primerAutor; 
   private String editorial;
   private int anyoEdicion;
   private String ISBN; 
   private double precio; /*en dolars*/
     
    public String getTitulo(){
        return titulo;
    }
  
    public String getEditorial(){
        return editorial;
    }
    public int getAnyoEdicion(){
        return anyoEdicion;
    }

    public String getPrimerAutor(){
        return primerAutor;
    } 
    public String getISBN(){
        return ISBN;
    } 
    public double getPrecio(){
        return precio;
    }
   
    
    public void setTitulo(String unTitulo){
        titulo = unTitulo;
    }
 
    public void setEditorial(String unaEditorial){
         editorial = unaEditorial;
    }
    public void setAnyoEdicion(int unAnyo){
         anyoEdicion = unAnyo;
    }
  
    public void setPrimerAutor(String unPrimerAutor){
         primerAutor=unPrimerAutor;
    } 
    public void setISBN(String unISBN){
         ISBN=unISBN;
    } 
    public void setPrecio(double unPrecio){
         precio=unPrecio;
    }
   
    
   @Override
    public String toString(){
        String aux; // Variable auxiliar utilizada por el metodo. No es parte del estado
        aux=titulo + " por " + primerAutor + " - " + anyoEdicion + " - ISBN: " + ISBN;
       return ( aux);
    }
        
}
