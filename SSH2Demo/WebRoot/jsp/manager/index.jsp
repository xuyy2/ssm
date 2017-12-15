<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <div id="header">${loginedUser.role.roleName }:<a href="#">${sessionScope.loginedUser.empName }</a></div>
    <div id="main">
      <div id="sidebar">
        <ul>
        <!-- 遍历权限集合，显示一级权限菜单 -->
        <c:forEach items="${loginedUser.role.rights }" var="right">
        <c:if test="${empty right.parent }">
          <li>${right.rightName }
            <ul>
            <!-- 嵌套内层循环，遍历 权限集合，显示该一级权限菜单下面的二级权限菜单-->
            <c:forEach items="${loginedUser.role.rights }" var="child">
            <c:if test="${child.parent eq right and child.rightType eq 1}" >             
              <li>${child.rightName }</li>
            </c:if>  
            </c:forEach>  
            </ul>
          </li>        
        </c:if>
        </c:forEach>
        </ul>
      </div>
      <div id="content"></div>
    </div>
  </body>
</html>
