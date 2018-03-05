<%@ page contentType="text/html;charset=gb2312" language="java"%>
<%@ page session="true"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("gb2312");
%>

<%
	String regName = (String) request.getParameter("username");
	regName = regName.trim();
	String regPassword = (String) request.getParameter("password");
	regPassword = regPassword.trim();
	try {

		//装载驱动程序
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		//	out.println("链接数据库成功");

		//创建连接
		Connection con = DriverManager
				.getConnection(
						"jdbc:mysql://127.0.0.1:3306/mydb?autoReconnect=true&useSSL=false&useUnicode=true&characterEncoding=gbk",
						"root", "123");
		String sql = "select * from user where name='" + regName
				+ "' and pass='" + regPassword + "'";
		Statement stmt = con.createStatement();

		ResultSet rs = stmt.executeQuery(sql);

		if (rs.next()) {
			//	out.println("您要查询的信息");
			//	out.println("姓名:" + rs.getString("name"));
			//	out.println("密码:" + rs.getString("pass"));
			//	out.println("<a href=\"ContentPage.jsp\">界面</a>");
		//	session.setAttribute("user", regName);
			response.sendRedirect("ContentPage.jsp");

		} else {
			//request.setAttribute(" ", "用户名或密码错误");
			//response.getWriter().write("<script>alert('fail')</script>");
			//request.setAttribute("login", "fail");
			//out.println("对不起，登录失败");
			request.getRequestDispatcher("LogPage.jsp").forward(request,
					response);
			
			//	out.println("<center><a href=\"LogPage.jsp\">返回</a></center>");
		}
		rs.close();
		stmt.close();
		con.close();
	} catch (ClassNotFoundException e) {
		//	out.println("创建失败");
		e.printStackTrace();
	}
%>

