<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
<style type="text/css">
<!--
body {
	margin-left: 5px;
	margin-top: 5px;
	margin-right: 5px;
	margin-bottom: 5px;
}
.STYLE1 {font-size: 12px}
.STYLE3 {font-size: 12px; font-weight: bold; }
.STYLE4 {
	color: #03515d;
	font-size: 12px;
}
-->
</style>
<script>
	function check(form) {

		if (form.price.value == ""
				|| form.price.value<500||form.price.value>5000) {
			alert("������������");
			price.focus();
			return;
		}
		return true;
	}
</script>


</head>

<body>
<form name="sendprice" method="post" action="PSO.jsp"
					onSubmit="return check(this)">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="d5d4d4" >
  <tr>
    <td height="22" colspan="4" background="images/bg.gif" bgcolor="#FFFFFF" class="STYLE3"><div align="center">�û�ѡ����Ϣ</div></td>
  </tr>
  <tr>
  <td height="22" colspan="4" background="images/bg.gif" bgcolor="#FFFFFF" class="STYLE3"><div align="center">����*��Ϊ������</div></td>
  </tr>
  <tr>
    <td colspan="4" bgcolor="#FFFFFF" class="STYLE1"><table width="70%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="142" height="35" class="STYLE1" nowrap="nowrap"><div align="left">�ͻ�����</div></td>
        <td width="352" height="35" class="STYLE1"><div align="left">
          <input type="text" name="name"   style="width:200px; height:17px; font-size:12px; border:solid 1px #ccc; " />
        </div></td>
      </tr>
      <tr>
        <td width="142" height="35" class="STYLE1" nowrap="nowrap"><div align="left">������</div></td>
        <td height="35" colspan="3" class="STYLE1"><div align="left">
          <input type="text" name="price"   style="width:300px; height:17px; font-size:12px; border:solid 1px #ccc; " />
        *</div></td>
        </tr>
      <tr>
        <td width="142" height="35" class="STYLE1" nowrap="nowrap" colspan="2"><div align="center">������������500-5000֮��</div></td>
       
        </tr>
      <tr>
        <td width="142" height="35" class="STYLE1" nowrap="nowrap"><div align="left">��һ��������</div></td>
        <td height="35" colspan="3" class="STYLE1"><div align="left">
          <select name="select1"  style="width:200px; height:17px; font-size:12px;">
            <option value="0">��������</option>
									<option value="1">�����ߴ�</option>
									<option value="2">�����ֱ���</option>
									<option value="3">RAM����</option>
									<option value="4">ROM����</option>
									<option value="5">��������</option>
          </select>
        </div></td>
        </tr>
      <tr>
        <td width="142" height="35" class="STYLE1" nowrap="nowrap"><div align="left">�ڶ���������</div></td>
        <td height="35" colspan="3" class="STYLE1"><div align="left">
          <select name="select2"  style="width:200px; height:17px; font-size:12px;">
             <option value="0">��������</option>
									<option value="1">�����ߴ�</option>
									<option value="2">�����ֱ���</option>
									<option value="3">RAM����</option>
									<option value="4">ROM����</option>
									<option value="5">��������</option>
          </select>
        </div></td>
        </tr>
         <tr>
        <td width="142" height="35" class="STYLE1" nowrap="nowrap"><div align="left">������������</div></td>
        <td height="35" colspan="3" class="STYLE1"><div align="left">
          <select name="select3"  style="width:200px; height:17px; font-size:12px;">
             <option value="0">��������</option>
									<option value="1">�����ߴ�</option>
									<option value="2">�����ֱ���</option>
									<option value="3">RAM����</option>
									<option value="4">ROM����</option>
									<option value="5">��������</option>
          </select>
        </div></td>
        </tr>
        <tr>
        <td width="142" height="35" class="STYLE1" nowrap="nowrap" colspan="2"><div align="center">�����ѡ���������ܣ��벻Ҫѡ��������ͬ����������</div></td>
       
        </tr>
     
      <tr>
        <td height="40" class="STYLE1">&nbsp;</td>
        <td height="35" colspan="3" class="STYLE1"> <button type="submit">�ύ</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="reset">����</button></td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>