<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
	  .msg{color:red;}
	</style>
  </head>
  
  <body>
    <h1><center>杭州华育OA办公系统</center></h1>
	<hr />    
	<s:fielderror />
    <form action="employee/loginAction" method="post">
      <table width="50%" border="1" align="center" cellpadding="20" cellspacing="0">
	    <tr>
	      <td align="right">用户名：</td>
	      <td><input type="text" name="employee.empName" id="txtEmpName"/></td>
	    </tr>
	    <tr>
	      <td align="right">密码：</td>
	      <td><input type="password" name="employee.password" id="txtPassword"/></td>
	    </tr>
	    <tr>
	      <td>&nbsp;</td>
	      <td><input type="submit" value="提交" />
	      <input type="reset" value="重置" /></td>
	    </tr>
	  </table>      
    </form>
    <div class="msg">${requestScope["message"] }</div>
    <p align="right">目前在线人数:${empty applicationScope.count?0:applicationScopr.count }人</p> 
  </body>
</html>
