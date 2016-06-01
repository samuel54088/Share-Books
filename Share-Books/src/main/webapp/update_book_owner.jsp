<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="dbapi.*" %>
<html>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	DB d = new DB();
	String obj_mail = (String) session.getAttribute("EMAIL");
	String obj_pwd = (String) session.getAttribute("PWD");
	String isbn =request.getParameter("isbn");

	String infomation = d.update_book_owner(isbn , obj_mail , obj_pwd);

		
	if(infomation.equals("insert")){
		out.print("<a href=Add_book_data.html>請先新增書籍資料</a>");
	}
	else if(infomation.equals("noinput")){
		out.print("使用者未輸入值" + "<br/>");
	}
	else if(infomation.equals("分享成功")){
		out.print("分享成功!!" + "<br/>");
	}
	else{
		
	}
		
	
%>
<br/>
<input type="button" name="goToIndexPage" onclick="javascript:location.href='login.jsp'" value="回首頁">
</body>