<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学生信息管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  <h1 align="center">学生信息管理系统</h1>
  <hr  color="gray" size="5px">
  <form action="employee/loginAction" method="post">
  <table width="50%" border="1" align="center" cellpadding="20" cellspacing="0">
  	<tr>
  		<td>用户名：</td>
  		<td><input type="text" name="employee.empName"/></td>
  		
  	</tr>
  	<tr>
  		<td>密码：</td>
  		<td><input type="password" name="employee.password"/></td>
  	</tr>
  	<tr align="right">
	  	<td colspan="2" >
	  		<input type="submit" value="登陆"/>
	  		<input type="reset" value="重置"> 
	  	</td>
  	</tr>
  	
  </table>
  <s:property value="message"/> 
  </form>
  </body>
</html>
