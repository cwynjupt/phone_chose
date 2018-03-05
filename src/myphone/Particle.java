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

	public double[] price;// 每个粒子所在位置的价格
	public int cpu_number;
	public int []length={0,0,0,0,0,0,0,0};
	public double total_price;
	public double [] weight;

	public int[] pos;// 粒子的位置，求解问题多少维，则此数组为多少维
	public int[] v;// 粒子的速度，维数同位置
	public double fitness;// 粒子的适应度
	public int[] pbest;// 粒子的历史最好位置
	public static int[] gbest;// 所有粒子找到的最好位置
	public static Random rnd;//生成随机数
	public static int dims;//粒子的维度
	public static double w;//惯性权重
	public static double c1;
	public static double c2;//学习因子
	public double pbest_fitness;// 历史最优解

	/**
	 * 返回low—uper之间的数
	 * 
	 * @param low
	 *            下限
	 * @param uper
	 *            上限
	 * @return 返回low—uper之间的数
	 */
	int rand(int low, int uper) {
		rnd = new Random();
		return rnd.nextInt(uper) + low;
	}

	/**
	 * 初始化粒子
	 * 
	 * @param dim
	 *            表示粒子的维数
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
		//计算每个表的长度
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
	 * 获取价格 
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
//					 String name = rs[i].getString("name");// 输出结果
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
	 * 评估函数值,同时记录历史最优位置 
	 * @throws SQLException 
	 */
	public void evaluate(int flag1,int flag2,int flag3) throws SQLException   {			
		//计算权重
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
		//获取价格
		this.getprice();
		//计算适应度
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
	 * 更新速度和位置
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

