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

		//װ����������
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		//	out.println("�������ݿ�ɹ�");

		//��������
		Connection con = DriverManager
				.getConnection(
						"jdbc:mysql://127.0.0.1:3306/mydb?autoReconnect=true&useSSL=false&useUnicode=true&characterEncoding=gbk",
						"root", "123");
		String sql = "select * from user where name='" + regName
				+ "' and pass='" + regPassword + "'";
		Statement stmt = con.createStatement();

		ResultSet rs = stmt.executeQuery(sql);

		if (rs.next()) {
			//	out.println("��Ҫ��ѯ����Ϣ");
			//	out.println("����:" + rs.getString("name"));
			//	out.println("����:" + rs.getString("pass"));
			//	out.println("<a href=\"ContentPage.jsp\">����</a>");
		//	session.setAttribute("user", regName);
			response.sendRedirect("ContentPage.jsp");

		} else {
			//request.setAttribute(" ", "�û������������");
			//response.getWriter().write("<script>alert('fail')</script>");
			//request.setAttribute("login", "fail");
			//out.println("�Բ��𣬵�¼ʧ��");
			request.getRequestDispatcher("LogPage.jsp").forward(request,
					response);
			
			//	out.println("<center><a href=\"LogPage.jsp\">����</a></center>");
		}
		rs.close();
		stmt.close();
		con.close();
	} catch (ClassNotFoundException e) {
		//	out.println("����ʧ��");
		e.printStackTrace();
	}
%>

