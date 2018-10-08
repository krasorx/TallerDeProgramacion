package tema2;
import java.util.*;

import javax.swing.JOptionPane;

public class Act4_VmensajeOculto {

	public static void main(String[] args) {
		int df = 10, n = 0;
		String vector[] = new String [df];
			
		for(int i=0;i<df;i++)
		{
			vector[i] = JOptionPane.showInputDialog("Escribe una palabra");
		}
		
		System.out.print("Mensaje secreto : ");
		for(int i=0;i<df;i++)
		{
			System.out.print(vector[i].charAt(n));
		}
		
	}

}
