/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;
import java.util.*;


public class Ej06Matrices {

    public static void main(String[] args) {
    	int df = 10, dc = 10, c = 0, i,j, n = 0;
    	int [][] matriz = new int [df][dc];
    	int [] vector = new int [dc];
    	
    	for ( i=0;i<df;i++) vector[i] = 0;
    	
    	for ( i=0;i<df;i++) {
    		for( j=0;j<df;j++) {
    			System.out.println(n);
    			matriz[i][j]= c*2;
    			c++;
    		}
    	}
    	for (i=0;i<df;i++) {
    		for(n=0;n<df;n++) System.out.print(matriz[i][n] +", ");
    		System.out.println(" ");
        		}
    		
    	int sumaFilas = 0;
    	for ( i=2;i<df;i++)  {
    		for( j=0;j<4;j++)
    			sumaFilas += matriz[i][j];
    	}
    	

    	System.out.println("La suma de todos los elementos entre las filas 2 y 9, y las columnas 0 y 3 es : " + sumaFilas);
        c = 0;
    	System.out.println("Ingrese un valor a buscar en la matriz : ");
    	Scanner cin = new Scanner(System.in);
    	c = cin.nextInt();
    	cin.close();
    	j=0;i=0; boolean halloC = false;
    	while ((i<df) && (!halloC))  
    	{ 								// buscamos si el valor ingresado se encuentra en la matriz
    		j = 0;
    		while((j<dc) && (!halloC)) 
    		{
    			if (c == matriz[i][j]) 
    			{
    				halloC = true;
    				System.out.println("El valor " + c + " se encuentra en la posicion (" +
    									i + ", " + j + ")"); // si hallo el valor, muestra su posicion en pantalla
    			}
    			
    			j++;
    		}
    		i++;
    	}
    	if(!halloC)System.out.println("No se encontro el elemento.");
    	
    	for ( i=0;i<df;i++) {
    		for ( j=0;j<df;j++) {
    			vector[i] += matriz[i][j];
    		}
    	}
    	
    	for ( i=0;i<df;i++) System.out.print(vector[i] + ",");;
 
    }
}
