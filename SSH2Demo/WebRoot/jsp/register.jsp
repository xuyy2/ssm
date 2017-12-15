<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
  String path = request.getContextPath();	//获取的是上下文路径，即"/news"
  String basePath = request.getScheme()+"://"
  	+request.getServerName()+":"
    +request.getServerPort()+path+"/";
  //System.out.println("basePath: "+basePath);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <base href="<%=basePath%>">
  <%--<base href="http://localhost:8080/news/" />
  --%><meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>杭州华育——免费注册</title>
  <style type="text/css">  
    .errSpan{ font:bold 12px 宋体; color:#F00;}
    .errRegister{color:red;}
  </style>
  <%--<script type="text/javascript" src="js/register.js"></script>--%>
</head>

<body>
<h1><center>免费注册</center></h1>
<hr />
<form action="servlet/registerServlet" method="post" name="register" id="frmRegister">
  <table width="60%" border="1" align="center" cellpadding="10" cellspacing="0">
    <tr>
      <td align="right">用户名：</td>
      <td><input type="text" name="userName" id="txtUserName" onblur="checkUserName();" /><font color="#FF0000">*</font><span id="msgUserName">用户名必须以字母和下划线开头</span></td>
    </tr>
    <tr>
      <td align="right">密码：</td>
      <td><input type="password" name="password" id="txtPassword" onblur="checkPassword();" /><font color="#FF0000">*</font><span id="msgPassword">必填</span></td>
    </tr>
    <tr>
      <td align="right">确认密码：</td>
      <td><input type="password" name="repassword" id="txtRepassword" onblur="checkRepassword();" /><font color="#FF0000">*</font><span id="msgRepassword">必填</span></td>
    </tr>
    <tr>
      <td align="right">性别：</td>
      <td>
        <input name="gender" type="radio" id="rdoMale" value="1" checked="checked" />男
        <input type="radio" name="gender" id="rdoFemale" value="0" />女
      </td>
    </tr>
    <tr>
      <td align="right">出生日期：</td>
      <td><input type="text" name="birthday" />（yyyy-mm-dd） </td>
    </tr>
    <tr>
      <td align="right">角色：</td>
      <td>
        <select name="roleId">
          <option>--请选择--</option>
          <option value="1">系统管理员</option>
          <option value="2">员工</option>
          <option value="3">部门经理</option>
          <option value="4">财务经理</option>
          <option value="5">总经理</option>
        </select>
      </td>
    </tr>
    <tr>
      <td align="right">状态：</td>
      <td>
        <select name="status">
          <option>--请选择--</option>
          <option value="1">正常</option>
          <option value="0">禁用</option>
        </select>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" value="提交" />
      <input type="reset" value="重置" /></td>
    </tr>
  </table>
</form>
</body>
</html>
