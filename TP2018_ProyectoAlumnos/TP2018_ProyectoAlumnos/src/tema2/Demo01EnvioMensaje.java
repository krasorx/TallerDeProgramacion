/*
Demo Envio de mensaje a un objeto string
 */
package tema2;

/**
 *
 * @author vsanz
 */
public class Demo01EnvioMensaje {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String saludo1 = "CIAO";
        /*Envio al objeto string el mensaje length, provoca que se ejecute el m�todo length - 
        devuelve la longitud - la cual se imprime */
        System.out.println(saludo1.length());    //Imprime 4
        /*Envio al objeto string el mensaje charAt(0), provoca que se ejecute el m�todo charAt - 
        devuelve el caracter en la posici�n recibida - el cual se imprime */
        System.out.println(saludo1.charAt(0));   //Imprime h
        System.out.println(saludo1.toUpperCase().equals("HOLA")); // Imprime true

    }
    
}
