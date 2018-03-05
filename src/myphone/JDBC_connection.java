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
			System.out.println("�����ɹ�");
		}catch(ClassNotFoundException e){
			System.out.println("����ʧ��");
			e.printStackTrace();
		}
	}
	public static Connection getConnection(){
		
		Connection con=null;
		try{
			con=DriverManager.getConnection(url, user, pass);
//			System.out.println("�������ݿ�ɹ�");
		}catch(SQLException e){
//			System.out.println("���ݿ�����ʧ��");
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
			System.out.println("�رս����ʧ��");
			e.printStackTrace();
		}finally{
			try{
				if(con!=null){
					con.close();
				}
			}catch(SQLException  e){
				System.out.println("�ر�����ʧ��");
				e.printStackTrace();
			}finally{
				try{
					if(stm!=null){
						stm.close();
					}
				}catch(SQLException e){
					System.out.println("�ر�stamentʧ��");
					e.printStackTrace();
				}
			}
		}
	}
//	public static void main(String [] args){
//		JDBC_connection.getConnection();
//	}

}
