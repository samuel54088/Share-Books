<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="dbapi.*" %>
<html>
<body>
<%
	DB d = new DB();
	String mail = request.getParameter("email");
	String pwd = request.getParameter("password");
	session.setAttribute("EMAIL",request.getParameter("email")); //抓使用者信箱、密碼，修改資料可以利用session去update資料庫
	session.setAttribute("PWD",request.getParameter("password"));
	String[] infomation = d.Auth(mail, pwd);
				
	if(infomation[1] != null) 
		out.print("Hello  " + infomation[1] + ", 您已經登入成功!!" + "<br/>");
	else
		out.print("登入失敗!!" + "<br/>");
		
	
%>
<input type="button" name="goToIndexPage" onclick="javascript:location.href='index.jsp'" value="回首頁">
<br/><br/>
<%
out.print("<form method=\"POST\" action=\"Modify.html\">");
out.print("<input name=\"email\" type=\"hidden\"  value=" + mail + ">");
out.print("<input name=\"pwd\" type=\"hidden\"  value=" + pwd + ">");
out.print("<input type=\"submit\" value=\"修改會員資料\">");
out.print("</form>");
%>
</body>
</html>