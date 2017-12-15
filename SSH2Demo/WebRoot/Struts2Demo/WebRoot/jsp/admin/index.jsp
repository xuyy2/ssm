<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">	
    <link rel="stylesheet" href="css/index_admin.css" type="text/css"></link>
  </head>
  
  <body>
    <div id="header">系统管理员:<a href="#">${sessionScope.loginedUser.empName }</a></div>
    <div id="main">
      <div id="sidebar">
        <ul>
          <li>报销单管理</li>
          <li>请假管理</li>
          <li>用户管理
            <ul>
              <li><a href="#">添加用户</li>
              <li><a href="employee/listAction">查询用户</a></li>
            </ul>
          </li>
          <li>角色管理</li>
        </ul>
      </div>
      <div id="content"></div>
    </div>
  </body>
</html>
