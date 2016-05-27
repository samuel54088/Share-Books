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
if(true){
	out.print("obj_mail:" + obj_mail + "<br/>");
	out.print("obj_pwd:" + obj_pwd + "<br/>");
	out.print("isbn:" + isbn + "<br/>");
}

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
<input type="button" name="goToIndexPage" onclick="javascript:location.href='index.jsp'" value="回首頁">
</body>