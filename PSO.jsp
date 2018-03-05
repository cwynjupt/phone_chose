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
	<%
		String getPrice = request.getParameter("price");
		double price = Double.parseDouble(getPrice);
		String getSelect1 = request.getParameter("select1");
		int select1 = Integer.parseInt(getSelect1);
		int select2 = Integer.parseInt(request.getParameter("select2"));
		int select3 = Integer.parseInt(request.getParameter("select3"));
		String username=(String)request.getParameter("name");
		username=username.trim();

		JDBC_connection jdbc = null;
		Connection conn = jdbc.getConnection();
		String sql1 = "SELECT * from phone where max_money='" + price
				+ "'and weight1='" + select1 + "'and weight2='" + select2
				+ "'and weight3='" + select3 + "'";
		Statement statement = (Statement) conn.createStatement();
		ResultSet rs1 = statement.executeQuery(sql1);
		if (rs1.next()) {
	%>
	<div id="gallery">
		<div align="center" class="on" title="result1">
			<img src="images/mini_icons_046.gif" width="10" height="10" /> <span
				class="STYLE1">[1] 方案1</span>
		</div>
		<div align="center" class="off" title="result2">
			<img src="images/mini_icons_046.gif" width="10" height="10" /> <span
				class="STYLE1">[2] 方案2</span>
		</div>
		<div align="center" class="off" title="result3">
			<img src="images/mini_icons_046.gif" width="10" height="10" /> <span
				class="STYLE1">[3] 方案3</span>
		</div>
	</div>

	<div id="result1" class="show">
		<%
			rs1.first();
		%>
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
															您输入的金额为：<%
														out.print(request.getParameter("price"));
													%>元
													</span></td>
												</tr>
											</table></td>
										<td><div align="right">
												<span class="STYLE1"> <input type="checkbox"
													name="checkbox11" id="checkbox11" /> 全选 &nbsp;&nbsp;<img
													src="images/add.gif" width="10" height="10" /> 添加 &nbsp; <img
													src="images/del_2.gif" width="10" height="10" /> 删除
													&nbsp;&nbsp;<img src="images/edit.gif" width="10"
													height="10" /> 编辑 &nbsp;
												</span><span class="STYLE1"> &nbsp;</span>
											</div></td>
									</tr>
								</table></td>
						</tr>


						</tr>

						<tr>
							<td height="24" bgcolor="#a8c7ce"><table width="100%"
									border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td><table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="94%" valign="bottom"><span class="STYLE1">
															&nbsp;&nbsp;&nbsp;您选择的权重分别为：<%
														if (select1 == 0){
																out.print("1.计算优先\t");}
															else if (select1 == 1){
																out.print("1.主屏尺寸优先\t");}
															else if (select1 == 2){
																out.print("1.主屏分辨率优先\t");}
															else if (select1 == 3){
																out.print("1.RAM容量优先\t");}
															else if (select1 == 4){
																out.print("1.ROM容量优先\t");}
															else
																out.print("1.像素优先\t");
																out.print("\t");

															if (select2 == 0){
																out.print("2.计算优先\t");}
															else if (select2 == 1){
																out.print("2.主屏尺寸优先\t");}
															else if (select2 == 2){
																out.print("2.主屏分辨率优先\t");}
															else if (select2 == 3){
																out.print("2.RAM容量优先\t");}
															else if (select2 == 4){
																out.print("2.ROM容量优先\t");}
															else
																out.print("2.像素优先\t");
																out.print("\t");
															if (select3 == 0){
																out.print("3.计算优先\t");}
															else if (select3 == 1){
																out.print("3.主屏尺寸优先\t");}
															else if (select3 == 2){
																out.print("3.主屏分辨率优先\t");}
															else if (select3 == 3){
																out.print("3.RAM容量优先\t");}
															else if (select3 == 4){
																out.print("3.ROM容量优先\t");}
															else
																out.print("3.像素优先\t");
													%>
													</td>
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
							<td width="10%" height="20" bgcolor="d3eaef" class="STYLE10"><div
									align="center">
									<input type="checkbox" name="checkbox" id="checkbox" />
								</div></td>
							<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">用户名</span>
								</div></td>
							<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">手机配件</span>
								</div></td>
							<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">配件型号</span>
								</div></td>
							<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">配件单价</span>
								</div></td>
							<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">总价</span>
								</div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									<input type="checkbox" name="checkbox2" id="checkbox2" />
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE6" rowspan="8"><div
									align="center">
									<span class="STYLE19"> <%
 	out.print(request.getParameter("name"));
 %>
									</span>
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">CPU型号</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("cpu")%></div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("cpu_money")%>元
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19" rowspan="8"><div
									align="center" style="vertical-align: middle;"><%=rs1.getString("total_money")%>元
								</div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									<input type="checkbox" name="checkbox3" id="checkbox3" />
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">主屏尺寸</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("inch")%></div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("inch_money")%>元
								</div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									<input type="checkbox" name="checkbox4" id="checkbox4" />
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">主屏分辨率</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("resolution")%></div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("resolution_money")%>元
								</div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									<input type="checkbox" name="checkbox5" id="checkbox5" />
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">RAM容量</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("ram")%></div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("ram_money")%>元
								</div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									<input type="checkbox" name="checkbox6" id="checkbox6" />
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">ROM容量</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("rom")%></div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("rom_money")%>元
								</div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									<input type="checkbox" name="checkbox7" id="checkbox7" />
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">摄像头（后）</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("back_camera")%></div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("back_camera_money")%>元
								</div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									<input type="checkbox" name="checkbox8" id="checkbox8" />
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">核心数</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getInt("cpu_number")%>核
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">null</div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									<input type="checkbox" name="checkbox9" id="checkbox9" />
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">摄像头（前）</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("fore_camera")%></div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("fore_camera_money")%>元
								</div></td>
						</tr>

					</table></td>
			</tr>
		</table>

	</div>
	<%
		rs1.next();
	%>
	<div id="result2" class="hide">
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
															您输入的金额为：<%
														out.print(request.getParameter("price"));
													%>元
													</span></td>
												</tr>
											</table></td>
										<td><div align="right">
												<span class="STYLE1"> <input type="checkbox"
													name="checkbox11" id="checkbox11" /> 全选 &nbsp;&nbsp;<img
													src="images/add.gif" width="10" height="10" /> 添加 &nbsp; <img
													src="images/del_2.gif" width="10" height="10" /> 删除
													&nbsp;&nbsp;<img src="images/edit.gif" width="10"
													height="10" /> 编辑 &nbsp;
												</span><span class="STYLE1"> &nbsp;</span>
											</div></td>
									</tr>
								</table></td>
						</tr>
						<tr>
							<td height="24" bgcolor="#a8c7ce"><table width="100%"
									border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td><table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="94%" valign="bottom"><span class="STYLE1">
															&nbsp;&nbsp;&nbsp;您选择的权重分别为：<%
														if (select1 == 0){
																out.print("1.计算优先\t");}
															else if (select1 == 1){
																out.print("1.主屏尺寸优先\t");}
															else if (select1 == 2){
																out.print("1.主屏分辨率优先\t");}
															else if (select1 == 3){
																out.print("1.RAM容量优先\t");}
															else if (select1 == 4){
																out.print("1.ROM容量优先\t");}
															else
																out.print("1.像素优先\t");
																out.print("\t");

															if (select2 == 0){
																out.print("2.计算优先\t");}
															else if (select2 == 1){
																out.print("2.主屏尺寸优先\t");}
															else if (select2 == 2){
																out.print("2.主屏分辨率优先\t");}
															else if (select2 == 3){
																out.print("2.RAM容量优先\t");}
															else if (select2 == 4){
																out.print("2.ROM容量优先\t");}
															else
																out.print("2.像素优先\t");
																out.print("\t");
															if (select3 == 0){
																out.print("3.计算优先\t");}
															else if (select3 == 1){
																out.print("3.主屏尺寸优先\t");}
															else if (select3 == 2){
																out.print("3.主屏分辨率优先\t");}
															else if (select3 == 3){
																out.print("3.RAM容量优先\t");}
															else if (select3 == 4){
																out.print("3.ROM容量优先\t");}
															else
																out.print("3.像素优先\t");
													%>
													</td>
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
							<td width="10%" height="20" bgcolor="d3eaef" class="STYLE10"><div
									align="center">
									<input type="checkbox" name="checkbox" id="checkbox" />
								</div></td>
							<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">用户名</span>
								</div></td>
							<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">手机配件</span>
								</div></td>
							<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">配件型号</span>
								</div></td>
							<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">配件单价</span>
								</div></td>
							<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">总价</span>
								</div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									<input type="checkbox" name="checkbox2" id="checkbox2" />
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE6" rowspan="8"><div
									align="center">
									<span class="STYLE19"> <%
 	out.print(request.getParameter("name"));
 %>
									</span>
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">CPU型号</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("cpu")%></div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("cpu_money")%>元
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19" rowspan="8"><div
									align="center" style="vertical-align: middle;"><%=rs1.getString("total_money")%>元
								</div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									<input type="checkbox" name="checkbox3" id="checkbox3" />
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">主屏尺寸</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("inch")%></div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("inch_money")%>元
								</div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									<input type="checkbox" name="checkbox4" id="checkbox4" />
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">主屏分辨率</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("resolution")%></div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("resolution_money")%>元
								</div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									<input type="checkbox" name="checkbox5" id="checkbox5" />
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">RAM容量</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("ram")%></div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("ram_money")%>元
								</div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									<input type="checkbox" name="checkbox6" id="checkbox6" />
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">ROM容量</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("rom")%></div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("rom_money")%>元
								</div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									<input type="checkbox" name="checkbox7" id="checkbox7" />
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">摄像头（后）</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("back_camera")%></div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("back_camera_money")%>元
								</div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									<input type="checkbox" name="checkbox8" id="checkbox8" />
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">核心数</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getInt("cpu_number")%>核
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">null</div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									<input type="checkbox" name="checkbox9" id="checkbox9" />
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">摄像头（前）</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("fore_camera")%></div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("fore_camera_money")%>元
								</div></td>
						</tr>

					</table></td>
			</tr>
		</table>
	</div>
	<div id="result3" class="hide">
		<%
			rs1.next();
		%>
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
															您输入的金额为：<%
														out.print(request.getParameter("price"));
													%>元
													</span></td>
												</tr>
											</table></td>
										<td><div align="right">
												<span class="STYLE1"> <input type="checkbox"
													name="checkbox11" id="checkbox11" /> 全选 &nbsp;&nbsp;<img
													src="images/add.gif" width="10" height="10" /> 添加 &nbsp; <img
													src="images/del_2.gif" width="10" height="10" /> 删除
													&nbsp;&nbsp;<img src="images/edit.gif" width="10"
													height="10" /> 编辑 &nbsp;
												</span><span class="STYLE1"> &nbsp;</span>
											</div></td>
									</tr>
								</table></td>
						</tr>
						<tr>
							<td height="24" bgcolor="#a8c7ce"><table width="100%"
									border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td><table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="94%" valign="bottom"><span class="STYLE1">
															&nbsp;&nbsp;&nbsp;您选择的权重分别为：<%
														if (select1 == 0){
																out.print("1.计算优先\t");}
															else if (select1 == 1){
																out.print("1.主屏尺寸优先\t");}
															else if (select1 == 2){
																out.print("1.主屏分辨率优先\t");}
															else if (select1 == 3){
																out.print("1.RAM容量优先\t");}
															else if (select1 == 4){
																out.print("1.ROM容量优先\t");}
															else
																out.print("1.像素优先\t");
																out.print("\t");

															if (select2 == 0){
																out.print("2.计算优先\t");}
															else if (select2 == 1){
																out.print("2.主屏尺寸优先\t");}
															else if (select2 == 2){
																out.print("2.主屏分辨率优先\t");}
															else if (select2 == 3){
																out.print("2.RAM容量优先\t");}
															else if (select2 == 4){
																out.print("2.ROM容量优先\t");}
															else
																out.print("2.像素优先\t");
																out.print("\t");
															if (select3 == 0){
																out.print("3.计算优先\t");}
															else if (select3 == 1){
																out.print("3.主屏尺寸优先\t");}
															else if (select3 == 2){
																out.print("3.主屏分辨率优先\t");}
															else if (select3 == 3){
																out.print("3.RAM容量优先\t");}
															else if (select3 == 4){
																out.print("3.ROM容量优先\t");}
															else
																out.print("3.像素优先\t");
													%>
													</td>
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
							<td width="10%" height="20" bgcolor="d3eaef" class="STYLE10"><div
									align="center">
									<input type="checkbox" name="checkbox" id="checkbox" />
								</div></td>
							<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">用户名</span>
								</div></td>
							<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">手机配件</span>
								</div></td>
							<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">配件型号</span>
								</div></td>
							<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">配件单价</span>
								</div></td>
							<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">总价</span>
								</div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									<input type="checkbox" name="checkbox2" id="checkbox2" />
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE6" rowspan="8"><div
									align="center">
									<span class="STYLE19"> <%
 	out.print(request.getParameter("name"));
 %>
									</span>
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">CPU型号</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("cpu")%></div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("cpu_money")%>元
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19" rowspan="8"><div
									align="center" style="vertical-align: middle;"><%=rs1.getString("total_money")%>元
								</div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									<input type="checkbox" name="checkbox3" id="checkbox3" />
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">主屏尺寸</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("inch")%></div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("inch_money")%>元
								</div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									<input type="checkbox" name="checkbox4" id="checkbox4" />
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">主屏分辨率</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("resolution")%></div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("resolution_money")%>元
								</div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									<input type="checkbox" name="checkbox5" id="checkbox5" />
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">RAM容量</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("ram")%></div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("ram_money")%>元
								</div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									<input type="checkbox" name="checkbox6" id="checkbox6" />
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">ROM容量</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("rom")%></div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("rom_money")%>元
								</div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									<input type="checkbox" name="checkbox7" id="checkbox7" />
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">摄像头（后）</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("back_camera")%></div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("back_camera_money")%>元
								</div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									<input type="checkbox" name="checkbox8" id="checkbox8" />
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">核心数</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getInt("cpu_number")%>核
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">null</div></td>
						</tr>
						<tr>
							<td height="20" bgcolor="#FFFFFF"><div align="center">
									<input type="checkbox" name="checkbox9" id="checkbox9" />
								</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center">摄像头（前）</div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("fore_camera")%></div></td>
							<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
									align="center"><%=rs1.getString("fore_camera_money")%>元
								</div></td>
						</tr>

					</table></td>
			</tr>
		</table>

	</div>

</body>
</html>
<%
	rs1.close();
		statement.close();
		conn.close();
	} else {
		PSO pso1 = new PSO();
		pso1.init(8, price, select1, select2, select3);
		pso1.run(price, select1, select2, select3);

		PSO pso2 = new PSO();
		pso2.init(8, price, select1, select2, select3);
		pso2.run(price, select1, select2, select3);

		PSO pso3 = new PSO();
		pso3.init(8, price, select1, select2, select3);
		pso3.run(price, select1, select2, select3);
		conn = jdbc.getConnection();
		//			String sql1 = "SELECT * from phone where max_money='" + price + "'";
		statement = (Statement) conn.createStatement();
		rs1 = statement.executeQuery(sql1);
		if (rs1.next()) {
%>
<div id="gallery">
	<div align="center" class="on" title="result1">
		<img src="images/mini_icons_046.gif" width="10" height="10" /> <span
			class="STYLE1">[1] 方案1</span>
	</div>
	<div align="center" class="off" title="result2">
		<img src="images/mini_icons_046.gif" width="10" height="10" /> <span
			class="STYLE1">[2] 方案2</span>
	</div>
	<div align="center" class="off" title="result3">
		<img src="images/mini_icons_046.gif" width="10" height="10" /> <span
			class="STYLE1">[3] 方案3</span>
	</div>
</div>


<div id="result1" class="show">
	<%
		rs1.first();
	%>
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
														您输入的金额为：<%
													out.print(request.getParameter("price"));
												%>元
												</span></td>
											</tr>
										</table></td>
									<td><div align="right">
											<span class="STYLE1"> <input type="checkbox"
												name="checkbox11" id="checkbox11" /> 全选 &nbsp;&nbsp;<img
												src="images/add.gif" width="10" height="10" /> 添加 &nbsp; <img
												src="images/del_2.gif" width="10" height="10" /> 删除
												&nbsp;&nbsp;<img src="images/edit.gif" width="10"
												height="10" /> 编辑 &nbsp;
											</span><span class="STYLE1"> &nbsp;</span>
										</div></td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td height="24" bgcolor="#a8c7ce"><table width="100%"
								border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td><table width="100%" border="0" cellspacing="0"
											cellpadding="0">
											<tr>
												<td width="94%" valign="bottom"><span class="STYLE1">
														&nbsp;&nbsp;&nbsp;您选择的权重分别为：<%
														if (select1 == 0){
																out.print("1.计算优先\t");}
															else if (select1 == 1){
																out.print("1.主屏尺寸优先\t");}
															else if (select1 == 2){
																out.print("1.主屏分辨率优先\t");}
															else if (select1 == 3){
																out.print("1.RAM容量优先\t");}
															else if (select1 == 4){
																out.print("1.ROM容量优先\t");}
															else
																out.print("1.像素优先\t");
																out.print("\t");

															if (select2 == 0){
																out.print("2.计算优先\t");}
															else if (select2 == 1){
																out.print("2.主屏尺寸优先\t");}
															else if (select2 == 2){
																out.print("2.主屏分辨率优先\t");}
															else if (select2 == 3){
																out.print("2.RAM容量优先\t");}
															else if (select2 == 4){
																out.print("2.ROM容量优先\t");}
															else
																out.print("2.像素优先\t");
																out.print("\t");
															if (select3 == 0){
																out.print("3.计算优先\t");}
															else if (select3 == 1){
																out.print("3.主屏尺寸优先\t");}
															else if (select3 == 2){
																out.print("3.主屏分辨率优先\t");}
															else if (select3 == 3){
																out.print("3.RAM容量优先\t");}
															else if (select3 == 4){
																out.print("3.ROM容量优先\t");}
															else
																out.print("3.像素优先\t");
												%>
												</td>
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
						<td width="10%" height="20" bgcolor="d3eaef" class="STYLE10"><div
								align="center">
								<input type="checkbox" name="checkbox" id="checkbox" />
							</div></td>
						<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">用户名</span>
							</div></td>
						<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">手机配件</span>
							</div></td>
						<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">配件型号</span>
							</div></td>
						<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">配件单价</span>
							</div></td>
						<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">总价</span>
							</div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								<input type="checkbox" name="checkbox2" id="checkbox2" />
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE6" rowspan="8"><div
								align="center">
								<span class="STYLE19"> <%
 	out.print(request.getParameter("name"));
 %>
								</span>
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">CPU型号</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("cpu")%></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("cpu_money")%>元
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19" rowspan="8"><div
								align="center" style="vertical-align: middle;"><%=rs1.getString("total_money")%>元
							</div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								<input type="checkbox" name="checkbox3" id="checkbox3" />
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">主屏尺寸</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("inch")%></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("inch_money")%>元
							</div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								<input type="checkbox" name="checkbox4" id="checkbox4" />
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">主屏分辨率</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("resolution")%></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("resolution_money")%>元
							</div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								<input type="checkbox" name="checkbox5" id="checkbox5" />
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">RAM容量</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("ram")%></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("ram_money")%>元
							</div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								<input type="checkbox" name="checkbox6" id="checkbox6" />
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">ROM容量</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("rom")%></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("rom_money")%>元
							</div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								<input type="checkbox" name="checkbox7" id="checkbox7" />
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">摄像头（后）</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("back_camera")%></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("back_camera_money")%>元
							</div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								<input type="checkbox" name="checkbox8" id="checkbox8" />
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">核心数</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getInt("cpu_number")%>核
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">null</div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								<input type="checkbox" name="checkbox9" id="checkbox9" />
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">摄像头（前）</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("fore_camera")%></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("fore_camera_money")%>元
							</div></td>
					</tr>

				</table></td>
		</tr>


	</table>


</div>
<%
	rs1.next();
%>
<div id="result2" class="hide">
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
														您输入的金额为：<%
													out.print(request.getParameter("price"));
												%>元
												</span></td>
											</tr>
										</table></td>
									<td><div align="right">
											<span class="STYLE1"> <input type="checkbox"
												name="checkbox11" id="checkbox11" /> 全选 &nbsp;&nbsp;<img
												src="images/add.gif" width="10" height="10" /> 添加 &nbsp; <img
												src="images/del_2.gif" width="10" height="10" /> 删除
												&nbsp;&nbsp;<img src="images/edit.gif" width="10"
												height="10" /> 编辑 &nbsp;
											</span><span class="STYLE1"> &nbsp;</span>
										</div></td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td height="24" bgcolor="#a8c7ce"><table width="100%"
								border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td><table width="100%" border="0" cellspacing="0"
											cellpadding="0">
											<tr>
												<td width="94%" valign="bottom"><span class="STYLE1">
														&nbsp;&nbsp;&nbsp;您选择的权重分别为：<%
														if (select1 == 0){
																out.print("1.计算优先\t");}
															else if (select1 == 1){
																out.print("1.主屏尺寸优先\t");}
															else if (select1 == 2){
																out.print("1.主屏分辨率优先\t");}
															else if (select1 == 3){
																out.print("1.RAM容量优先\t");}
															else if (select1 == 4){
																out.print("1.ROM容量优先\t");}
															else
																out.print("1.像素优先\t");
																out.print("\t");

															if (select2 == 0){
																out.print("2.计算优先\t");}
															else if (select2 == 1){
																out.print("2.主屏尺寸优先\t");}
															else if (select2 == 2){
																out.print("2.主屏分辨率优先\t");}
															else if (select2 == 3){
																out.print("2.RAM容量优先\t");}
															else if (select2 == 4){
																out.print("2.ROM容量优先\t");}
															else
																out.print("2.像素优先\t");
																out.print("\t");
															if (select3 == 0){
																out.print("3.计算优先\t");}
															else if (select3 == 1){
																out.print("3.主屏尺寸优先\t");}
															else if (select3 == 2){
																out.print("3.主屏分辨率优先\t");}
															else if (select3 == 3){
																out.print("3.RAM容量优先\t");}
															else if (select3 == 4){
																out.print("3.ROM容量优先\t");}
															else
																out.print("3.像素优先\t");
												%>
												</td>
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
						<td width="10%" height="20" bgcolor="d3eaef" class="STYLE10"><div
								align="center">
								<input type="checkbox" name="checkbox" id="checkbox" />
							</div></td>
						<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">用户名</span>
							</div></td>
						<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">手机配件</span>
							</div></td>
						<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">配件型号</span>
							</div></td>
						<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">配件单价</span>
							</div></td>
						<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">总价</span>
							</div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								<input type="checkbox" name="checkbox2" id="checkbox2" />
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE6" rowspan="8"><div
								align="center">
								<span class="STYLE19"> <%
 	out.print(request.getParameter("name"));
 %>
								</span>
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">CPU型号</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("cpu")%></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("cpu_money")%>元
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19" rowspan="8"><div
								align="center" style="vertical-align: middle;"><%=rs1.getString("total_money")%>元
							</div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								<input type="checkbox" name="checkbox3" id="checkbox3" />
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">主屏尺寸</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("inch")%></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("inch_money")%>元
							</div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								<input type="checkbox" name="checkbox4" id="checkbox4" />
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">主屏分辨率</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("resolution")%></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("resolution_money")%>元
							</div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								<input type="checkbox" name="checkbox5" id="checkbox5" />
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">RAM容量</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("ram")%></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("ram_money")%>元
							</div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								<input type="checkbox" name="checkbox6" id="checkbox6" />
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">ROM容量</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("rom")%></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("rom_money")%>元
							</div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								<input type="checkbox" name="checkbox7" id="checkbox7" />
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">摄像头（后）</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("back_camera")%></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("back_camera_money")%>元
							</div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								<input type="checkbox" name="checkbox8" id="checkbox8" />
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">核心数</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getInt("cpu_number")%>核
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">null</div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								<input type="checkbox" name="checkbox9" id="checkbox9" />
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">摄像头（前）</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("fore_camera")%></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("fore_camera_money")%>元
							</div></td>
					</tr>

				</table></td>
		</tr>
	</table>
</div>
<div id="result3" class="hide">
	<%
		rs1.next();
	%>
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
														您输入的金额为：<%
													out.print(request.getParameter("price"));
												%>元
												</span></td>
											</tr>
										</table></td>
									<td><div align="right">
											<span class="STYLE1"> <input type="checkbox"
												name="checkbox11" id="checkbox11" /> 全选 &nbsp;&nbsp;<img
												src="images/add.gif" width="10" height="10" /> 添加 &nbsp; <img
												src="images/del_2.gif" width="10" height="10" /> 删除
												&nbsp;&nbsp;<img src="images/edit.gif" width="10"
												height="10" /> 编辑 &nbsp;
											</span><span class="STYLE1"> &nbsp;</span>
										</div></td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td height="24" bgcolor="#a8c7ce"><table width="100%"
								border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td><table width="100%" border="0" cellspacing="0"
											cellpadding="0">
											<tr>
												<td width="94%" valign="bottom"><span class="STYLE1">
														&nbsp;&nbsp;&nbsp;您选择的权重分别为：<%
														if (select1 == 0){
																out.print("1.计算优先\t");}
															else if (select1 == 1){
																out.print("1.主屏尺寸优先\t");}
															else if (select1 == 2){
																out.print("1.主屏分辨率优先\t");}
															else if (select1 == 3){
																out.print("1.RAM容量优先\t");}
															else if (select1 == 4){
																out.print("1.ROM容量优先\t");}
															else
																out.print("1.像素优先\t");
																out.print("\t");

															if (select2 == 0){
																out.print("2.计算优先\t");}
															else if (select2 == 1){
																out.print("2.主屏尺寸优先\t");}
															else if (select2 == 2){
																out.print("2.主屏分辨率优先\t");}
															else if (select2 == 3){
																out.print("2.RAM容量优先\t");}
															else if (select2 == 4){
																out.print("2.ROM容量优先\t");}
															else
																out.print("2.像素优先\t");
																out.print("\t");
															if (select3 == 0){
																out.print("3.计算优先\t");}
															else if (select3 == 1){
																out.print("3.主屏尺寸优先\t");}
															else if (select3 == 2){
																out.print("3.主屏分辨率优先\t");}
															else if (select3 == 3){
																out.print("3.RAM容量优先\t");}
															else if (select3 == 4){
																out.print("3.ROM容量优先\t");}
															else
																out.print("3.像素优先\t");
												%>
												</td>
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
						<td width="10%" height="20" bgcolor="d3eaef" class="STYLE10"><div
								align="center">
								<input type="checkbox" name="checkbox" id="checkbox" />
							</div></td>
						<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">用户名</span>
							</div></td>
						<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">手机配件</span>
							</div></td>
						<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">配件型号</span>
							</div></td>
						<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">配件单价</span>
							</div></td>
						<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div
								align="center">
								<span class="STYLE10">总价</span>
							</div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								<input type="checkbox" name="checkbox2" id="checkbox2" />
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE6" rowspan="8"><div
								align="center">
								<span class="STYLE19"> <%
 	out.print(username);
 %>
								</span>
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">CPU型号</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("cpu")%></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("cpu_money")%>元
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19" rowspan="8"><div
								align="center" style="vertical-align: middle;"><%=rs1.getString("total_money")%>元
							</div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								<input type="checkbox" name="checkbox3" id="checkbox3" />
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">主屏尺寸</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("inch")%></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("inch_money")%>元
							</div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								<input type="checkbox" name="checkbox4" id="checkbox4" />
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">主屏分辨率</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("resolution")%></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("resolution_money")%>元
							</div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								<input type="checkbox" name="checkbox5" id="checkbox5" />
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">RAM容量</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("ram")%></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("ram_money")%>元
							</div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								<input type="checkbox" name="checkbox6" id="checkbox6" />
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">ROM容量</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("rom")%></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("rom_money")%>元
							</div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								<input type="checkbox" name="checkbox7" id="checkbox7" />
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">摄像头（后）</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("back_camera")%></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("back_camera_money")%>元
							</div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								<input type="checkbox" name="checkbox8" id="checkbox8" />
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">核心数</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getInt("cpu_number")%>核
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">null</div></td>
					</tr>
					<tr>
						<td height="20" bgcolor="#FFFFFF"><div align="center">
								<input type="checkbox" name="checkbox9" id="checkbox9" />
							</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center">摄像头（前）</div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("fore_camera")%></div></td>
						<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
								align="center"><%=rs1.getString("fore_camera_money")%>元
							</div></td>
					</tr>

				</table></td>
		</tr>
	</table>

</div>

</body>
</html>
<% }
	
		rs1.close();
		statement.close();
		conn.close();
		}
	
%>


