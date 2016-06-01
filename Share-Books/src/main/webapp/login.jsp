<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="dbapi.*" %>
<html>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	DB d = new DB();
	String mail = request.getParameter("email");
	String pwd = request.getParameter("password");
	session.setAttribute("EMAIL",request.getParameter("email")); //抓使用者信箱、密碼，修改資料可以利用session去update資料庫
	session.setAttribute("PWD",request.getParameter("password"));
	String[] infomation = d.Auth(mail, pwd);
	if(infomation[1] != null) 
		out.print("<h1>Hello  " + infomation[1] + ", 您已經登入成功!!" + "</h1>");
	else 
		response.sendRedirect("LoginError.html");

%>

<h2><font face="微軟正黑體">搜尋書籍</font></h2>
<form method="POST" action="searchBook.jsp">
關鍵字：<input type="text" name="keyword" size="15"><br/>
<input type="submit" value="搜尋">
</form>

<br/><br/>
<form method="POST" action="Modify.html">
<input name="email" type="hidden"  value=" + mail + ">
<input name="pwd" type="hidden"  value=" + pwd + ">
<input type="submit" value="修改會員資料">
</form>

<form method="POST" action="Update_book_owner.html">
<input type="submit" value="分享書籍">
</form>
<<<<<<< HEAD
<a href="Lend.html">借書</a>
=======
<form method="GET" action="query.jsp">
<input type="submit" value="出借記錄">
</form>
>>>>>>> 119a2e5a20867d2c8043ff22d2a2a75190e53397
<a href="index.jsp">回首頁</a>
</body>
</html>