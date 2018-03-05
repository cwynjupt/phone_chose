<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page session="true"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("gb2312");
%>

	<%
		String name = request.getParameter("name");
		String pass = request.getParameter("pwd1");
		String sex = request.getParameter("sex");
		String qq = request.getParameter("qq");
		String email = request.getParameter("email");
		try {

			//装载驱动程序
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		//	out.println("链接数据库成功");

			//创建连接
			Connection con = DriverManager
					.getConnection(
							"jdbc:mysql://127.0.0.1:3306/mydb?autoReconnect=true&useSSL=false&useUnicode=true&characterEncoding=gb2312",
							"root", "123");

			//创建执行语句。
			//===========================使用PreparedStatement========//
			PreparedStatement pstmt = con
					.prepareStatement("insert into user values(?,?,?,?,?)");
			//=====================//
			pstmt.setString(1, name);
			pstmt.setString(2, pass);
			pstmt.setString(3, sex);
			pstmt.setString(4, qq);
			pstmt.setString(5, email);

			int temp = pstmt.executeUpdate();
			if (temp > 0) {
			response.sendRedirect("LogPage.jsp");
	
		} else {
		request.getRequestDispatcher("Register.jsp").forward(request,
					response);
	
		}

			//执行插入数据操作。
			pstmt.close();

			//关闭连接、释放资源
			con.close();
		//	out.println("<script>alter('用户注册成功!'); </script>");
		} catch (ClassNotFoundException e) {
		//	out.println("创建失败");
			e.printStackTrace();
		}
	%>
