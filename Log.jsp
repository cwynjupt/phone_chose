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

			//װ����������
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		//	out.println("�������ݿ�ɹ�");

			//��������
			Connection con = DriverManager
					.getConnection(
							"jdbc:mysql://127.0.0.1:3306/mydb?autoReconnect=true&useSSL=false&useUnicode=true&characterEncoding=gb2312",
							"root", "123");

			//����ִ����䡣
			//===========================ʹ��PreparedStatement========//
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

			//ִ�в������ݲ�����
			pstmt.close();

			//�ر����ӡ��ͷ���Դ
			con.close();
		//	out.println("<script>alter('�û�ע��ɹ�!'); </script>");
		} catch (ClassNotFoundException e) {
		//	out.println("����ʧ��");
			e.printStackTrace();
		}
	%>
