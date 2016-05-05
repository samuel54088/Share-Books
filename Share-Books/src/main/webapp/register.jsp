<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="dbapi.*" %>
<html>
<body>
<%
	DB d = new DB();
	String name = request.getParameter("userName");
	String mail = request.getParameter("email");
	String pwd = request.getParameter("password");
	String phone = request.getParameter("phone");
	
	String[] infomation = {name, mail, pwd, phone};
	if(d.Reg(infomation))
		out.print("註冊成功!!" + "<br/>");
	else
		out.print("註冊失敗!!" + "<br/>");
		
%>
<input type="button" name="goToIndexPage" onclick="javascript:location.href='index.jsp'" value="回首頁">
</body>
</html>