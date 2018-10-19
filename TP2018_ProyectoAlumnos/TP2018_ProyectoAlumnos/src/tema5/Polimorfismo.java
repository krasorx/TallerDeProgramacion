
package tema5;

public class Polimorfismo {

    public static void main(String[] args) {
        Figura [] figus = new Figura[4];                  //figus puede contener objetos instancia de cualquier subclase de Figura
        figus[0]= new Cuadrado(10,"Violeta","Rosa");      //posición 0 tiene un cuadrado   
        figus[1]= new Rectangulo(20,10,"Azul","Celeste"); //posición 1 tiene un rectangulo
        figus[2]= new Cuadrado(30,"Rojo","Naranja");      //posición 2 tiene un cuadrado
        figus[3]= new Triangulo(3,4,5,"Amarillo","cyan"); //posición 3 tiene un triangulo
        double tot=0; int i;                              //calculo el area total
        for (i=0; i<4; i++){
            tot= tot + figus[i].calcularArea();  //Polimorfismo: los cuadrados, rectángulos, círculos, etc responden
            System.out.println("El area de la figura " + 
                    i + " es = " + figus[i].calcularArea());       
            System.out.println("El perimetro de la figura " + 
                    i + " es = " + figus[i].calcularPerimetro());  
                                                // al mensaje "calcularArea" pero de diferente manera
                                                 //Binding dinámico: antes de la ejecución no se conoce qué tipo de objeto 
                                                 //habrá en cada posición de figus. El código para responder al mensaje "calcularArea"
                                                 //se determina en tiempo de ejecución.
        }
        System.out.println("Area total: " + tot); 
                
    }
}
