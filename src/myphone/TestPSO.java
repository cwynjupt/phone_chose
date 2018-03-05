package myphone;

import java.sql.SQLException;
import java.util.Scanner;

public class TestPSO {
	public static void main(String []arg) throws SQLException  
    {  
		System.out.println("«Î ‰»ÎΩ∂Ó£∫");
	    Scanner sc=new Scanner(System.in);
	    double money=sc.nextDouble();
	    PSO pso1 = new PSO();
		double price=1900;
		int select1=1;
		int select2=0;
		int select3=2;
		pso1.init(8, price, select1, select2, select3);
		pso1.run(price, select1, select2, select3);
//        pso.showresult(money); 
        
    }  

}
