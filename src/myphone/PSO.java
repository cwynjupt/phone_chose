package myphone;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class PSO {
	/**
	 * 粒子群
	 */
	Particle[] pars;
	double global_best;// 全局最优解
	double total_money;
	int pcount;// 粒子的数量

	JDBC_connection jdbc2;
	public static String[] sql2 = new String[8];
	public static ResultSet[] rs2 = new ResultSet[8];
	public static java.sql.Statement stm2 = null;

	/**
	 * 粒子群初始化
	 * 
	 * @param n
	 *            粒子的数量
	 * @throws SQLException
	 */
	public void init(int n, double money,int flag1,int flag2,int flag3) throws SQLException {
		pcount = n;
		global_best = -1e6;
		int index = -1;
		pars = new Particle[pcount];
		// 类的静态成员的初始化
		Particle.c1 = 2;
		Particle.c2 = 2;
		Particle.w = 0.8;
		Particle.dims = 8; // 8维粒子
		for (int i = 0; i < pcount; ++i) {
			pars[i] = new Particle();

			pars[i].initial(8); // 8维的粒子

			pars[i].evaluate(flag1,flag2,flag3);
			if (global_best < pars[i].fitness && pars[i].total_price <= money) {
				global_best = pars[i].fitness;
				total_money = pars[i].total_price;
				index = i;
			}
		}
		Particle.gbest = new int[Particle.dims];
		if (index != -1) {
			for (int i = 0; i < 8; i++) {
				Particle.gbest[i] = pars[index].pos[i];
			}
		}
	}

	/**
	 * 粒子群的运行
	 * 
	 * @throws SQLException
	 */
	public void run(double money,int flag1,int flag2,int flag3) throws SQLException {
		int runtimes = 10; // 最大运行次数：500次
		int index;
		while (runtimes > 0) {
			index = -1;
			// 每个粒子更新位置和适应值
			for (int i = 0; i < pcount; ++i) {
				pars[i].updatev();
				pars[i].evaluate(flag1,flag2,flag3);
				if (global_best < pars[i].fitness
						&& pars[i].total_price <= money) {
					global_best = pars[i].fitness;
					total_money = pars[i].total_price;
					index = i;
				}
			}
			// 发现更好的解
			if (index != -1) {
				for (int i = 0; i < 8; i++) {
					Particle.gbest[i] = pars[index].pos[i];
				}
			}
			--runtimes;
		}
		this.showresult(money, flag1, flag2, flag3);
	}

	/**
	 * 将程序求解结果插入数据库
	 * 
	 * @throws SQLException
	 */
	public void showresult(double money,int flag1,int flag2,int flag3) throws SQLException {
		// System.out.println("程序求得的最高性价比指数是" + global_best + "\n" + "最高耗费的价钱"
				// + total_money);
				// System.out.println("每一类型的值是");
				// for (int i = 0; i < Particle.dims; ++i) {
				// System.out.println(Particle.gbest[i] + ",");
				// }

				Connection con = jdbc2.getConnection();
				stm2 = con.createStatement();

				sql2[0] = " select * from cpu where number= "+Particle.gbest[0]+" ";
				sql2[1] = " select * from back_camera where number= "+Particle.gbest[1]+" ";
				sql2[2] = " select * from rom where number= "+Particle.gbest[2]+" ";
				sql2[3] = " select * from ram where number= "+Particle.gbest[3]+" ";
				sql2[4] = " select * from resolution where number= "+Particle.gbest[4]+" ";
				sql2[5] = " select * from inch where number= "+Particle.gbest[5]+" ";
				sql2[6] = " select * from fore_camera where number= "+Particle.gbest[6]+" ";
				sql2[7] = " select * from cpu_number where number= "+Particle.gbest[7]+" ";

//				for (int i = 0; i < Particle.dims - 1; ++i) {
//					rs2[i] = stm2.executeQuery(sql2[i]);
					// while (rs2[i].next()) {
					// if (rs2[i].getInt("number") == Particle.gbest[i]) {
					// System.out.println(rs2[i].getString("name") + ","
					// + rs2[i].getDouble("price"));
					// }
					// }
				//}
				
				// while (rs2[7].next()) {
				// if (rs2[7].getInt("number") == Particle.gbest[7]) {
				// System.out.println("cpu核心数："+rs2[7].getInt("cpu_number"));
				// }
				// }
				PreparedStatement pstmt = con
						.prepareStatement("insert into phone values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				// =====================//
				rs2[0] = stm2.executeQuery(sql2[0]);
				while (rs2[0].next()) {
				//	if (rs2[0].getInt("number") == Particle.gbest[0])
					pstmt.setString(1,rs2[0].getString("name") );
					pstmt.setDouble(11,rs2[0].getDouble("price") );

				}
				rs2[1] = stm2.executeQuery(sql2[1]);
				while (rs2[1].next()) {
				//	if (rs2[1].getInt("number") == Particle.gbest[1])
						pstmt.setString(6,rs2[1].getString("name") );
						pstmt.setDouble(15,rs2[1].getDouble("price") );

				}
				rs2[2] = stm2.executeQuery(sql2[2]);
				while (rs2[2].next()) {
				//	if (rs2[2].getInt("number") == Particle.gbest[2])
						pstmt.setString(4,rs2[2].getString("name") );
						pstmt.setDouble(13,rs2[2].getDouble("price") );

				}
				rs2[3] = stm2.executeQuery(sql2[3]);
				while (rs2[3].next()) {
				//	if (rs2[3].getInt("number") == Particle.gbest[3])
						pstmt.setString(3,rs2[3].getString("name") );
						pstmt.setDouble(12,rs2[3].getDouble("price") );

				}
				rs2[4] = stm2.executeQuery(sql2[4]);
				while (rs2[4].next()) {
				//	if (rs2[4].getInt("number") == Particle.gbest[4])
						pstmt.setString(8,rs2[4].getString("name") );
						pstmt.setDouble(17,rs2[4].getDouble("price") );

				}
				rs2[5] = stm2.executeQuery(sql2[5]);
				while (rs2[5].next()) {
				//	if (rs2[5].getInt("number") == Particle.gbest[5])
						pstmt.setString(7,rs2[5].getString("name") );
						pstmt.setDouble(16,rs2[5].getDouble("price") );

				}
				rs2[6] = stm2.executeQuery(sql2[6]);
				while (rs2[6].next()) {
				//	if (rs2[6].getInt("number") == Particle.gbest[6])
						pstmt.setString(5,rs2[6].getString("name") );
						pstmt.setDouble(14,rs2[6].getDouble("price") );

				}
				rs2[7] = stm2.executeQuery(sql2[7]);
				while (rs2[7].next()) {
				//	if (rs2[7].getInt("number") == Particle.gbest[7])
						pstmt.setInt(2,rs2[7].getInt("cpu_number") );

				}
				pstmt.setDouble(9, money);
				pstmt.setDouble(10, total_money);
				pstmt.setInt(18, flag1);
				pstmt.setInt(19, flag2);
				pstmt.setInt(20, flag3);

				int temp=pstmt.executeUpdate();
				if(temp>0){
					System.out.println("插入成功");
				}
				jdbc2.free(rs2, con, stm2);
	}

}
