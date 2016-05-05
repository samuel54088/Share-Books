<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dbapi.*" %>
<html>
<body>
<%
	DB d = new DB();
				
	String obj_mail = (String) session.getAttribute("EMAIL");
	String obj_pwd = (String) session.getAttribute("PWD");
	
	String name = request.getParameter("userName");
	String mail = request.getParameter("email");
	String pwd = request.getParameter("password");
	String phone = request.getParameter("phone");
				
	String[] infomation = {name, mail, pwd, phone,obj_mail,obj_pwd};
	
	if(d.Modify(infomation)) {
		out.print("修改成功!!" + "<br/>");
		out.print("姓名修改為: " + name + "<br>");
		out.print("信箱修改為: " + mail + "<br>");
		out.print("密碼修改為: " + pwd + "<br>");
		out.print("電話修改為: " + phone + "<br>");
		//out.print("test session mail: " + obj_mail + "<br>");
		//out.print("test session pwd: " + obj_pwd + "<br>");
	}
	else
		out.print("修改失敗!!" + "<br/>");
%>
<input type="button" name="goToIndexPage" onclick="javascript:location.href='index.jsp'" value="回首頁">
<br/><br/>
</body>
</html>