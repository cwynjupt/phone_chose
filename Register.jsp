<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>�û�ע��</title>
<meta http-equiv="content-type" content="text/html;charset=gb2312">
<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"%>

<script language="javascript">
	function check(form) {

		if (form.name.value == null || form.name.value == "") {
			alert('�Բ����˺Ų���Ϊ�գ�');
			return false;
		} else if (form.pwd1.value == null || form.pwd1.value == "") {
			alert('�Բ������������룡');
			return false;
		} else if (form.pwd2.value == "" || form.pwd2.value == null) {
			alert('�Բ������ٴ��������룡');
			return false;
		} else if (form.pwd1.value != form.pwd2.value) {
			alert('�Բ���������������벻һ����');
			return false;
		} else if (form.email.value == "" || form.email.value == null
				|| form.email.value.indexOf("@") == -1
				|| form.email.value.indexOf(".") == -1) {
			alert("���䲻��Ϊ�ջ��ʽ����ȷ!");
			return false;
		} else {
			return true;
		}
	}
</script>
</head>
<body bgcolor="1f7d78">
	<center>
		<br /> <br /> <br /> <br />

		<form action="Log.jsp" method="post" name="adduser"
			onsubmit="return check(this)">
			<table border="0" align="center" width="600" height="100%"
				style="background-image: url('topdao.jpg');">
				<tr>
					<th colspan="2"><h2>�û�ע��</h2></th>
				</tr>
				<tr>
					<td><br /></td>
				</tr>

				<tr>
					<td>&nbsp;�û�����</td>
					<td>&nbsp;<input type="text" size="20" name="name"></td>
				</tr>
				<tr>
					<td><br /></td>
				</tr>
				<tr>
					<td>&nbsp;���룺</td>
					<td>&nbsp;<input type="password" size="20" name="pwd1"
						id="pwd1"></td>
				</tr>
				<tr>
					<td><br /></td>
				</tr>
				<tr>
					<td>&nbsp;�ٴ�ȷ�����룺</td>
					<td>&nbsp;<input type="password" size="20" name="pwd2"
						id="pwd2"></td>
				</tr>
				<tr>
					<td><br /></td>
				</tr>
				<tr>
					<td>&nbsp;�Ա�</td>
					<td>&nbsp;<input type="radio" checked="checked" value="0"
						name=sex>�� &nbsp; &nbsp;&nbsp; <input type="radio"
						value="1" name="sex"> Ů
					</td>
				</tr>
				<tr>
					<td><br /></td>
				</tr>
				<tr>
					<td>&nbsp;QQ��</td>
					<td>&nbsp;<input type="text" size="50" name="qq"></td>
				</tr>
				<tr>
					<td><br /></td>
				</tr>
				<tr>
					<td>&nbsp;Email��</td>
					<td>&nbsp;<input type="text" size="50" name="email"></td>
				</tr>
				<tr>
					<td><br /></td>
				</tr>
				<tr>
					<td><br></td>
					<td>&nbsp;<input type="submit" value="ȷ��" name="submit"
						>&nbsp;&nbsp;<input
						type="reset" value="����" name="reset"></td>
				</tr>
			</table>
		</form>
	</center>

</body>
</html>