/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialpoojacquetalan;

import java.util.Scanner;
/**
 *
 * @author alumnos
 */
public class ParcialPOOJacquetAlan {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner in = new Scanner (System.in);
        Postre p = new Postre ();
        System.out.println("Ingrese nombre de producto: ");
        p.setNombre(in.next());
        System.out.println("Ingrese la fecha de vencimiento: ");
        p.setFechaVenc(in.next());
        System.out.println("Ingrese el monto por Kg: ");
        p.setMontoPorKg(in.nextDouble());
        System.out.println("Ingrese tipo de producto: ");
        p.setTipoPoroducto(in.next());
        System.out.println("Ingrese cantidad de Calorías: ");
        p.setCalorias(in.nextInt());
        System.out.println("Ingrese la cantidad de unidades: ");
        p.setCantUnidades(in.nextInt());
        
        p.getNombre();
        p.getFechaVencimiento();
        p.getMontoPorKg();
        p.getTipoProducto();
        p.getCantCalorias();
        p.getCantUnidades();
        p.calcularMontoProducto(0.500);
        
        Balde b = new Balde ();
        System.out.println("Ingrese nombre de producto: ");
        b.setNombre(in.next());
        System.out.println("Ingrese la fecha de vencimiento: ");
        b.setFechaVenc(in.next());
        System.out.println("Ingrese el monto por Kg: ");
        b.setMontoPorKg(in.nextDouble());
        System.out.println("Ingrese a base de que está hecho el producto: ");
        b.setABaseDe(in.next());
        
        
        b.getNombre();
        b.getFechaVencimiento();
        b.getMontoPorKg();
        b.calcularMontoProducto(0.500);
    }
    
}
