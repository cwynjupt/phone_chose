<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.STYLE1 {
	font-size: 12px
}

.STYLE2 {
	color: #03515d;
	font-size: 12px;
}

-->
a:link {
	font-size: 12px;
	text-decoration: none;
	color: #000000;
}

a:visited {
	font-size: 12px;
	text-decoration: none;
	color: #000000;
}

a:hover {
	font-size: 12px;
	text-decoration: none;
	color: #FF0000;
}

a.v1:link {
	font-size: 12px;
	text-decoration: none;
	color: #03515d;
}

a.v1:visited {
	font-size: 12px;
	text-decoration: none;
	color: #03515d;
}
</style>

</head>

<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="26" background="images/main_03.gif"><table
					width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="227" height="26" background="images/main_01.gif">&nbsp;</td>
						<td>&nbsp;</td>
						<td width="60"><img src="images/main_05.gif" width="60"
							height="26" /></td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td height="64"><table width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td width="227" height="64" background="images/main_06.gif"
							nowrap="nowrap">&nbsp;</td>
						<td><table width="100%" border="0" cellspacing="0"
								cellpadding="0">
								<tr>
									<td height="26" background="images/main_07.gif"><table
											width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td height="26"><table width="100%" border="0"
														cellspacing="0" cellpadding="0">
														<tr>
															<td width="640" height="26"><table width="100%"
																	border="0" cellspacing="0" cellpadding="0">
																	<tr>
																		<td width="30"><div align="center">
																				<img src="images/top_1.gif" width="14" height="14" />
																			</div></td>
																		<td nowrap="nowrap" class="STYLE1">
																			<!--  当前登录用户：
                        <%if (session.getAttribute("username") != null) {
				out.print(session.getAttribute("username"));
			} else
				out.print("游客");%>-->您好！
																		</td>
																	</tr>
																</table></td>
															<td width="19"><img src="images/main_09.gif"
																width="19" height="26" /></td>
															<td width="352"><table width="46%" border="0"
																	align="right" cellpadding="0" cellspacing="0">
																	<tr>
																		<td width="56"><table width="45" border="0"
																				cellspacing="0" cellpadding="0">
																				<tr>
																					<td width="21"><div align="center">
																							<img src="images/top_2.gif" width="14"
																								height="14" />
																						</div></td>
																					<td width="35"><div align="center"
																							class="STYLE1">
																							<a href="LogPage.jsp" target="_top">首页</a>
																						</div></td>
																				</tr>
																			</table></td>
																		<td width="10"><img src="images/main_11.gif"
																			width="6" height="26" /></td>
																		<td width="56"><table width="45" border="0"
																				cellspacing="0" cellpadding="0">
																				<tr>
																					<td width="21"><div align="center">
																							<img src="images/top_3.gif" width="14"
																								height="14" />
																						</div></td>
																					<td width="24"><div align="center"
																							class="STYLE1">
																							<a href="#">后退</a>
																						</div></td>
																				</tr>
																			</table></td>
																		<td width="10"><img src="images/main_11.gif"
																			width="6" height="26" /></td>
																		<td width="56"><table width="45" border="0"
																				cellspacing="0" cellpadding="0">
																				<tr>
																					<td width="21"><div align="center">
																							<img src="images/top_4.gif" width="14"
																								height="14" />
																						</div></td>
																					<td width="24"><div align="center"
																							class="STYLE1">
																							<a href="#">前进</a>
																						</div></td>
																				</tr>
																			</table></td>
																		<td width="10"><img src="images/main_11.gif"
																			width="6" height="26" /></td>
																		<td width="56"><table width="45" border="0"
																				cellspacing="0" cellpadding="0">
																				<tr>
																					<td width="21"><div align="center">
																							<img src="images/top_5.gif" width="14"
																								height="14" />
																						</div></td>
																					<td width="24"><div align="center"
																							class="STYLE1">
																							<a href="#">刷新</a>
																						</div></td>
																				</tr>
																			</table></td>
																		<td width="10"><img src="images/main_11.gif"
																			width="6" height="26" /></td>
																		<td width="102"><table width="102" border="0"
																				cellspacing="0" cellpadding="0">
																				<tr>
																					<td width="22"><div align="center">
																							<img src="images/top_6.gif" width="14"
																								height="14" />
																						</div></td>
																					<td width="80"><div align="center"
																							class="STYLE1">
																							<a href="Register.jsp" target="_top">个人信息修改</a>
																						</div></td>
																				</tr>
																			</table></td>
																		<td width="10"><img src="images/main_11.gif"
																			width="6" height="26" /></td>
																		<td width="56"><table width="45" border="0"
																				cellspacing="0" cellpadding="0">
																				<tr>
																					<td width="21"><div align="center">
																							<img src="images/top_7.gif" width="14"
																								height="14" />
																						</div></td>
																					<td width="24"><div align="center"
																							class="STYLE1">
																							<a href="LogPage.jsp" target="_top">退出</a>
																						</div></td>
																				</tr>
																			</table></td>
																	</tr>
																</table></td>
														</tr>
													</table></td>
												<td width="12"><img src="images/main_13.gif" width="12"
													height="26" /></td>
											</tr>
										</table></td>
								</tr>
								<tr>
									<td height="38" background="images/main_15.gif"><table
											width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td height="38"><table border="0" cellspacing="0"
														cellpadding="0">
														<tr>
															<td width="100" height="26" style="cursor:hand"
																onMouseOver="this.style.backgroundImage='url(images/main_18.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><table
																	width="100%" border="0" cellpadding="0" cellspacing="0">
																	<tr>
																		<td><div align="center">
																				<img src="images/top_8.gif" width="16" height="16" />
																			</div></td>
																		<td><div align="center">
																				<span class="STYLE2"><a
																					href="information.jsp" class="v1"
																					target="rightFrame">手机配置信息</a></span>
																			</div></td>
																	</tr>
																</table></td>
															<td width="100" style="cursor:hand"
																onMouseOver="this.style.backgroundImage='url(images/main_18.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><table
																	width="100%" border="0" cellpadding="0" cellspacing="0">
																	<tr>
																		<td><div align="center">
																				<img src="images/top_10.gif" width="20" height="20" />
																			</div></td>
																		<td><div align="center">
																				<span class="STYLE2"><a href="user.jsp"
																					class="v1" target="rightFrame">系统用户信息</a></span>
																			</div></td>
																	</tr>
																</table></td>
															<td width="100" style="cursor:hand"
																onMouseOver="this.style.backgroundImage='url(images/main_18.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><table
																	width="100%" border="0" cellpadding="0" cellspacing="0">
																	<tr>
																		<td><div align="center">
																				<img src="images/top_14.gif" width="20" height="20" />
																			</div></td>
																		<td><div align="center">
																				<span class="STYLE2"><a href="data.jsp"
																					class="v1" target="rightFrame">手机配置数据</a></span>
																			</div></td>
																	</tr>
																</table></td>
															<td width="100" style="cursor:hand"
																onMouseOver="this.style.backgroundImage='url(images/main_18.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><table
																	width="100%" border="0" cellpadding="0" cellspacing="0">
																	<tr>
																		<td><div align="center">
																				<img src="images/top_13.gif" width="20" height="20" />
																			</div></td>
																		<td><div align="center">
																				<span class="STYLE2"><a href="notfound.jsp"
																					class="v1" target="rightFrame">系统设置</a></span>
																			</div></td>
																	</tr>
																</table></td>
														</tr>
													</table></td>
												<td width="60"><div align="right">
														<img src="images/main_17.gif" width="60" height="38" />
													</div></td>
											</tr>
										</table></td>
								</tr>
							</table></td>
					</tr>
				</table></td>
		</tr>
	</table>
</body>
</html>