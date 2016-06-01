<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dbapi.*" %>
<html>
<head>
<meta charset="UTF-8">
</head>
<h1><font face="微軟正黑體"><b> 關鍵字： <% out.println(request.getParameter("keyword")); %>  </b></font></h1>
<%
request.setCharacterEncoding("UTF-8");
DB db = new DB();
String[][] bookInfo = db.getBookInfo();
/*out.print("所有書籍名稱：<br/>");
for( int i=0 ; i<bookInfo.length ; i++) {
	out.print(bookInfo[i][0] + "<br/>");
} */

%>
<body>
<table border="1">
  <tr>
    <td align="center"><b>書名<b/></td>
    <td align="center"><b>作者<b/></td>
    <td align="center" width="80"><b>出版日期<b/></td>
    <td align="center"><b>出版商<b/></td>
    <td align="center"><b>書籍描述<b/></td>
  </tr>
  <%
  	for (int i = 0; i < bookInfo.length; i++) {
  		out.print("<tr>");
  		for(int j=0 ; j< bookInfo[0].length; j++)
  			out.print("<td>" + bookInfo[i][j] + "</td>");
  		out.print("<tr/>");
  	}
  %>
  
</table>
</body>
</html>