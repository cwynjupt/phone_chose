package myphone;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;

public class Particle {
//	 public static void main(String []args) throws SQLException{
//		 Particle pl=new Particle();
//		 pl.initial(8);
//		 pl.getprice();
//	 }

	JDBC_connection jdbc;
	public static String[] sql = new String[8];
	public static ResultSet[] rs = new ResultSet[8];
	public  static java.sql.Statement stm = null;

	public double[] price;// ÿ����������λ�õļ۸�
	public int cpu_number;
	public int []length={0,0,0,0,0,0,0,0};
	public double total_price;
	public double [] weight;

	public int[] pos;// ���ӵ�λ�ã�����������ά���������Ϊ����ά
	public int[] v;// ���ӵ��ٶȣ�ά��ͬλ��
	public double fitness;// ���ӵ���Ӧ��
	public int[] pbest;// ���ӵ���ʷ���λ��
	public static int[] gbest;// ���������ҵ������λ��
	public static Random rnd;//���������
	public static int dims;//���ӵ�ά��
	public static double w;//����Ȩ��
	public static double c1;
	public static double c2;//ѧϰ����
	public double pbest_fitness;// ��ʷ���Ž�

	/**
	 * ����low��uper֮�����
	 * 
	 * @param low
	 *            ����
	 * @param uper
	 *            ����
	 * @return ����low��uper֮�����
	 */
	int rand(int low, int uper) {
		rnd = new Random();
		return rnd.nextInt(uper) + low;
	}

	/**
	 * ��ʼ������
	 * 
	 * @param dim
	 *            ��ʾ���ӵ�ά��
	 * @throws SQLException 
	 */
	public void initial(int dim) throws SQLException  {
		pos = new int[dim];
		v = new int[dim];
		pbest = new int[dim];
		fitness = -1E6;
		pbest_fitness = -1e6;
		dims = dim;
		price = new double[dim];
		cpu_number = 0;
		//����ÿ����ĳ���
		Connection con = jdbc.getConnection();
	    Statement stm = con.createStatement();	    
		sql[0] = "select * from cpu";
		sql[1] = "select * from back_camera";
		sql[2] = "select * from rom";
		sql[3] = "select * from ram";
		sql[4] = "select * from resolution";
		sql[5] = "select * from inch";
		sql[6] = "select * from fore_camera";
		sql[7] = "select * from cpu_number";	
		for (int i = 0; i < 8; i++) {
			rs[i] = stm.executeQuery(sql[i]);
				while (rs[i].next()) {
					length[i]++;
					}
		}
		jdbc.free(rs, con, stm);
		
		total_price=0;
		for (int i = 0; i < dim; ++i) {
			pos[i] = rand(1, length[i]);
			pbest[i] = pos[i];
			v[i] = rand(0, 20);
		}
		weight=new double[dim];
		for(int i=0;i<dim;i++){
			weight[i]=1;
		}
		
		
	}
	/**
	 * ��ȡ�۸� 
	 */
	public void getprice() throws SQLException{
		Connection con = jdbc.getConnection();
	    stm = con.createStatement();	    
		sql[0] = " select * from cpu where "+pos[0]+" =number";
		sql[1] = " select * from back_camera where "+pos[1]+" =number";
		sql[2] = " select * from rom where "+pos[2]+" =number";
		sql[3] = " select * from ram where "+pos[3]+" =number";
		sql[4] = " select * from resolution where "+pos[4]+" =number";
		sql[5] = " select * from inch where "+pos[5]+" =number";
		sql[6] = " select * from fore_camera where "+pos[6]+" =number";
		sql[7] = " select * from cpu_number where "+pos[7]+" =number";	
		
		for (int i = 0; i < 7; i++) {
			rs[i] = stm.executeQuery(sql[i]);
				while (rs[i].next()) {
//					 String name = rs[i].getString("name");// ������
//					 System.out.println(rs[i].getInt("number") + "\t" + name +
//					 "\t"
//					 + rs[i].getDouble("price"));

					//if (pos[i] == rs[i].getInt("number")) {
						price[i] = rs[i].getDouble("price");
					//	 System.out.println(pos[i]+","+price[i]);
				//	}
				}
			} 
		rs[7] = stm.executeQuery(sql[7]);
			while (rs[7].next()) {	
//				 System.out.println(rs[7].getInt("number") + "\t"
//				 + rs[7].getInt("cpu_number"));
				//if (pos[7] == rs[7].getInt("number")) {
					cpu_number = rs[7].getInt("cpu_number");
				//	 System.out.println(pos[7]+","+cpu_number);
				//}
			}			
				jdbc.free(rs, con, stm);		
	}
	/**
	 * ��������ֵ,ͬʱ��¼��ʷ����λ�� 
	 * @throws SQLException 
	 */
	public void evaluate(int flag1,int flag2,int flag3) throws SQLException   {			
		//����Ȩ��
		if(flag3==0)
			weight[0]=weight[7]=1.5;
		else if(flag3==1)
			weight[5]=1.5;
		else if(flag3==2)
			weight[4]=1.5;
		else if(flag3==3)
			weight[3]=1.5;
		else if(flag3==4)
			weight[2]=1.5;
		else
			weight[1]=weight[6]=1.5;
		
		if(flag2==0)
			weight[0]=weight[7]=2;
		else if(flag2==1)
			weight[5]=2;
		else if(flag2==2)
			weight[4]=2;
		else if(flag2==3)
			weight[3]=2;
		else if(flag2==4)
			weight[2]=2;
		else
			weight[1]=weight[6]=2;
		
		if(flag1==0)
			weight[0]=weight[7]=2.5;
		else if(flag1==1)
			weight[5]=2.5;
		else if(flag1==2)
			weight[4]=2.5;
		else if(flag1==3)
			weight[3]=2.5;
		else if(flag1==4)
			weight[2]=2.5;
		else
			weight[1]=weight[6]=2.5;
		//��ȡ�۸�
		this.getprice();
		//������Ӧ��
		fitness = (price[0]*weight[0] * cpu_number*weight[7] + price[1]*weight[1] + price[2]*weight[2] + price[3]*weight[3]
				+ price[4]*weight[4] + price[5]*weight[5] + price[6]*weight[6])
				/ (pos[0] + pos[1] + pos[2] + pos[3] + pos[4] + pos[5] + pos[6] + pos[7]);
		total_price=price[0] * cpu_number + price[1] + price[2] + price[3]
				+ price[4] + price[5] + price[6];
		if (fitness > pbest_fitness) {
			for (int i = 0; i < dims; ++i) {
				pbest[i] = pos[i];
			}
		}
	}

	/**
	 * �����ٶȺ�λ��
	 */
	public void updatev() {
		for (int i = 0; i < dims; ++i) {
			v[i] = (int) (w * v[i] + c1 * rnd.nextInt() * (pbest[i] - pos[i]) + c2
					* rnd.nextInt() * (gbest[i] - pos[i]));
			if (v[i] > 20) {
				v[i] = 20;
			}
			if (v[i] < 0) {
				v[i] = 0;
			}
			pos[i] = pos[i] + v[i];
			if (pos[i] > length[i]) {
				pos[i] = length[i];
			}
			if (pos[i] < 1) {
				pos[i] = 1;
			}
		}
	}
}

