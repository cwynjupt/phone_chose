<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ֻ�����Ż�ϵͳ_�û���¼</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	overflow:hidden;
}
.STYLE1 {
	font-size: 12px;
	color: #a1c8c6;
}
.STYLE4 {color: #FFFFFF; font-size: 12px; }
-->
</style>

<script>
	function check(form) {

		if (form.username.value == "") {
			alert("�������û���");
			username.focus();
			return;
		}
		if (from.password.value == "") {
			alert("����������");
			return;
		}
		return true;
	}
	function name(){
		var username=document.getElementById('username').value;
		return username;
	}
</script></head>

<body>
<!-- 
 <%String s = session.getId(); //��ȡsession ID�� 
  if (session.isNew()) { //�ж��Ƿ�Ϊ���û�
      String str = "document.getElementById('username').value";
      session.setAttribute("username", str); //��str ��ӵ�session������
    } %>
     -->
<form name="loguser" method="post" action="Logincof.jsp;"
		onSubmit="return check(this)">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td bgcolor="035551">&nbsp;</td>
  </tr>
  <tr>
    <td height="311" background="images/login_03.gif"><table width="758" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="210" background="images/login1.jpg��psd"><center>&nbsp;<h1 style="font-style: italic;color: #0bf;">�ֻ�����Ż�ϵͳ</h1>
        <h4 style="font-size: small;font-style: oblique;color: #0bf;">Combinatorial Optimization Platform</h4></center></td>
      </tr>
      <tr>
        <td height="101"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="446" height="101" background="images/login_06.gif">&nbsp;</td>
            <td width="156"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="29%" height="22"><span class="STYLE4">�û���</span></td>
                <td width="71" height="22"><input type="text" name="username" id="username" style="width:100px; height:16px; border:solid 1px #000000; color:#666666"></td>
              </tr>
              <tr>
                <td height="22"><span class="STYLE4">��&nbsp;��</span></td>
                <td height="22"><input type="password" name="password" style="width:100px; height:16px; border:solid 1px #000000; color:#666666"></td>
              </tr>
              <tr>
                <td height="25">&nbsp;</td>
                <td height="25" colspan="2">
                				<input type="submit" value="�� ¼" /> <input type="reset" value="�� ��" /></td>
                </td>
                </tr>
            </table></td>
            <td width="156" background="images/login_09.gif">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="1f7d78"><center style="color: #fff;font-size: small;">û���˺ţ����<a href="Register.jsp">����</a>ע�᣻��Ҳ����ѡ��<a href="ContentPage.jsp">�οͽ���</a></center></td>
  </tr>
  <tr>
    <td bgcolor="1f7d78"><div align="center"><span class="STYLE1">-- ΢����˫��    CopyRight 2016 --</span></div></td>
  </tr>
</table>
</form>
</body>
</html>