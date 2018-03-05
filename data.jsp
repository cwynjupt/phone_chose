<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>手机优化组合平台</title>
<meta http-equiv="content-type" content="text/html;charset=gb2312"></meta>
<link rel="stylesheet" media="all" type="text/css" href="page.css" />
<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gbk"%>
<%@ page import="myphone.*"%>
<%@ page import="java.sql.*,java.util.*"%>
<%
	request.setCharacterEncoding("gb2312");
%>
<style type="text/css">
<!--
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}

.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}

.STYLE6 {
	color: #000000;
	font-size: 12;
}

.STYLE10 {
	color: #000000;
	font-size: 12px;
}

.STYLE19 {
	color: #344b50;
	font-size: 12px;
}

.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}

.STYLE22 {
	font-size: 12px;
	color: #295568;
}
-->
</style>
<script src="page.js" type="text/javascript"></script>
<script>
var  highlightcolor='#d5f4fe';
var  clickcolor='#51b2f6';
function  changeto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=highlightcolor;
}
}

function  changeback(){
if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
return
if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}

function  clickto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=clickcolor;
}
else
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}
</script>
</head>
<body>
	<table width="100%" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td height="30"><table width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td height="24" bgcolor="#a8c7ce"><table width="100%"
								border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td><table width="100%" border="0" cellspacing="0"
											cellpadding="0">
											<tr>
												<td width="6%" height="19" valign="bottom"><div
														align="center">
														<img src="images/tb_2.gif" width="14" height="14" />
													</div></td>
												<td width="94%" valign="bottom"><span class="STYLE1">
														手机配置 数据表 </span></td>
											</tr>
										</table></td>

								</tr>
							</table></td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td><table width="100%" border="0" cellpadding="0"
					cellspacing="1" bgcolor="#a8c7ce" onmouseover="changeto()"
					onmouseout="changeback()">
					<tr>
					<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">用户金额</span>
							</div></td>
						<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">cpu型号</span>
							</div></td>
						<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">cpu核心数</span>
							</div></td>
						<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">rom</span>
							</div></td>
							<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">ram</span>
							</div></td>
							<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">主屏尺寸</span>
							</div></td>
							<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">主屏分辨率</span>
							</div></td>
							<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">摄像头（后）</span>
							</div></td>
							<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">摄像头（前）</span>
							</div></td>
							<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">总价</span>
							</div></td>
					</tr>
					<%
						JDBC_connection jdbc = null;
						Connection conn = jdbc.getConnection();
						String sql1 = "SELECT * from phone";
						Statement statement = (Statement) conn.createStatement();
						ResultSet rs1;
						for (rs1 = statement.executeQuery(sql1); rs1.next(); ) {
					%>
					<tr>
						
						<td height="20" bgcolor="#FFFFFF" class="STYLE6"><div
								align="center">
								<span class="STYLE19"> <%
 	out.print(rs1.getDouble("max_money"));
 %>
								</span>
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">
								<%
									out.print(rs1.getString("cpu"));
								%>
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">
								<%
									out.print(rs1.getInt("cpu_number"));
								%>
							</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">
								<%
									out.print(rs1.getString("rom"));
								%>
							</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">
								<%
									out.print(rs1.getString("ram"));
								%>
							</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">
								<%
									out.print(rs1.getString("inch"));
								%>
							</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">
								<%
									out.print(rs1.getString("resolution"));
								%>
							</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">
								<%
									out.print(rs1.getString("back_camera"));
								%>
							</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">
								<%
									out.print(rs1.getString("fore_camera"));
								%>
							</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">
								<%
									out.print(rs1.getDouble("total_money"));
								%>
							</div></td>
					</tr>
					<%
						}
						statement.close();
						rs1.close();
						conn.close();
					%>



				</table></td>
		</tr>
	</table>
