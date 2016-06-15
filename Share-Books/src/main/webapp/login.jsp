<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="dbapi.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	DB d = new DB();
	String mail = request.getParameter("email");
	String pwd = request.getParameter("password");
	session.setAttribute("EMAIL",request.getParameter("email")); //抓使用者信箱、密碼，修改資料可以利用session去update資料庫
	session.setAttribute("PWD",request.getParameter("password"));
	String[] infomation = d.Auth(mail, pwd);
	session.setAttribute("USER", infomation[1]);
	if(infomation[1] != null) 
		response.sendRedirect("search.jsp");
	else 
		response.sendRedirect("LoginError.html");

%>