package myphone;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;




public class JDBC_connection {
	static String driver="com.mysql.jdbc.Driver";
	static String url="jdbc:mysql://127.0.0.1:3306/mydb?autoReconnect=true&useSSL=false&useUnicode=true&characterEncoding=gbk";
	static String user="root";
	static String pass="123";
	static {
		try{
			Class.forName(driver);
			System.out.println("创建成功");
		}catch(ClassNotFoundException e){
			System.out.println("创建失败");
			e.printStackTrace();
		}
	}
	public static Connection getConnection(){
		
		Connection con=null;
		try{
			con=DriverManager.getConnection(url, user, pass);
//			System.out.println("链接数据库成功");
		}catch(SQLException e){
//			System.out.println("数据库链接失败");
			e.printStackTrace();
		}
		return con;
	}
	public static void free(ResultSet []rs,Connection con,Statement stm){
		try{
			for(int i=0;i<rs.length;i++){
			if(rs[i]!=null){
				rs[i].close();
			}
			}
		}catch(SQLException e){
			System.out.println("关闭结果集失败");
			e.printStackTrace();
		}finally{
			try{
				if(con!=null){
					con.close();
				}
			}catch(SQLException  e){
				System.out.println("关闭链接失败");
				e.printStackTrace();
			}finally{
				try{
					if(stm!=null){
						stm.close();
					}
				}catch(SQLException e){
					System.out.println("关闭stament失败");
					e.printStackTrace();
				}
			}
		}
	}
//	public static void main(String [] args){
//		JDBC_connection.getConnection();
//	}

}
