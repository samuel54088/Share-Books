<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dbapi.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String[] bookInfoBuf = new String[7];
	String[] OwnerInfoBuf = new String[7];

	DB d = new DB();
	bookInfoBuf = d.readBookInfo("1");
	OwnerInfoBuf = d.readUserInfo("3");

	
	if(bookInfoBuf!= null)
	{
		out.print("Product Details:" + "<br/>");
		out.print("ISBN: " + bookInfoBuf[1] + "<br>");
		out.print("Name: " + bookInfoBuf[2] + "<br>");
		out.print("Description: " + bookInfoBuf[3] + "<br>");
		out.print("Author: " + bookInfoBuf[4] + "<br>");
		out.print("Publisher: " + bookInfoBuf[5] + "<br>");
		out.print("Publish Date: " + bookInfoBuf[6] + "<br>");
	}
	else
	{
		out.print("error");
	}
	
	out.print("<br/><br/><br/>");
	
	
	if(OwnerInfoBuf!= null)
	{
		out.print("Owner Details:" + "<br/>");
		out.print("Name: " + OwnerInfoBuf[1] + "<br>");
		out.print("E-mail: " + OwnerInfoBuf[2] + "<br>");
		out.print("Phone: " + OwnerInfoBuf[3] + "<br>");
	}
	else
	{
		out.print("error");
	}
	
	
	
%>
</body>
</html>