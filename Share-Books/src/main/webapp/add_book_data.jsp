<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="dbapi.*" %>
<html>
<body>
<%
	DB d = new DB();
	String[] info=new String[6];
	info[0]=request.getParameter("isbn");
	info[1]=request.getParameter("bookname");
	info[2]=request.getParameter("description");
	info[3]=request.getParameter("author");
	info[4]=request.getParameter("publisher");
	info[5]=request.getParameter("publish_date");
	
	if(d.add_book_data(info))
		out.print("新增成功!!" + "<br/>");
	else
		out.print("新增失敗!!" + "<br/>");
		
%>
<input type="button" name="goToIndexPage" onclick="javascript:location.href='index.jsp'" value="回首頁">
</body>
</html>