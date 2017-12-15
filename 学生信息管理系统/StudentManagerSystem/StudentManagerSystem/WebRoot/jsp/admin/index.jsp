<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>操作</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript">
		function deleteStudent(){
			alert("删除信息");
			/* var txtStudentId=document.getElementById("txtStudentId");
        	//将要查询页码值设置给隐藏表单域
        	txtStudentId.value=currPageNo;*/
        	//调用表单提交，会将查询条件一起提交
        	document.getElementById("frmEmpList").submit(); 
		}
	
	
	</script>
  </head>
  
  <body>
    <div id="header">管理员:<a href="#"><s:property value="#session.loginedEmp.empName" /></a></div>
    <div id="main">
      <div id="sidebar">
      </div>
      <div id="content" align="center">
        <h1 align="center">操作界面</h1>
        <hr size="5px" color="gray "/>
        <table border="1" cellpadding="5" >
          <tr><td colspan="8" align="center">学员信息</td></tr>
          <tr bgcolor="#CCCCCC">
            <td>学号</td>
            <td>姓名</td>
            <td>性别</td>
            <td>年龄</td>
            <td>年级</td>
            <td>专业</td>
            <td>地址</td>
            <td>操作</td>
          </tr>
          
          <s:if test="#session.studentList.size()==0">
          <tr>
            <td colspan="8">没有您要查找的数据</td>
          </tr>
          </s:if>
          <s:if  test="#session.studentList.size()!=0">
          <s:iterator value="#session.studentList" var="student" status="status" >                  
          <tr <s:if test="#status.even">bgcolor="#CCCCCC"</s:if>>
            <td><s:property value="sid" /></td>
            <td><s:property value="name" /> </td>
            <td><s:property value="sex" /></td>
            <td><s:property value="age" /></td>
            <td><s:property value="grade" /></td>
            <td><s:property value="major" /></td>
            <td><s:property value="address" /></td>
            <td>
              <%-- <a href='javascript:deleteStudent(<s:property value="sid" />);'>删除</a> --%>
              <a href='employee/deletAction?student.sid=<s:property value="sid" />'>删除</a>
              <a href="employee/updateAction">更新</a>
            </td>
          </tr>    
          </s:iterator>
          </s:if>    
        
        </table>
        
        <form id="frmEmpList" action="employee/deleteAction" method="post">
			<input type="hidden" id="txtStudentId" name="student.sid" value="1" />
        
	    </form>
	    
	    
      </div>
    </div>
   <s:property value="message"/>
  </body>
</html>
