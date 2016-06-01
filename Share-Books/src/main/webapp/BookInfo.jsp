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
	String bookID = request.getParameter("ID");
	bookInfoBuf = d.readBookInfo(bookID);
	OwnerInfoBuf = d.readUserInfo(d.getUserID(bookID));

	
	if(bookInfoBuf!= null)
	{
		out.print("<h2>書籍詳細資料" + "</h1>");
		out.print("ISBN: " + bookInfoBuf[1] + "<br>");
		out.print("書籍名稱: " + bookInfoBuf[2] + "<br>");
		out.print("書籍描述: " + bookInfoBuf[3] + "<br>");
		out.print("作者: " + bookInfoBuf[4] + "<br>");
		out.print("出版商: " + bookInfoBuf[5] + "<br>");
		out.print("出版日期: " + bookInfoBuf[6] + "<br>");
	}
	else
	{
		out.print("查無此書籍");
	}
	
	out.print("<br/>");
	
	
	if(OwnerInfoBuf!= null)
	{
		out.print("<h2>書籍擁有者聯絡資料：" + "</h1>");
		out.print("姓名：" + OwnerInfoBuf[1] + "<br>");
		out.print("電子郵件：" + OwnerInfoBuf[2] + "<br>");
		out.print("連絡電話：" + OwnerInfoBuf[3] + "<br>");
	}
	else
	{
		out.print("此書籍沒有主人");
	}
	
	
	
%>
</body>
</html>