<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dbapi.*" %>
<html>
<head>
<meta charset="UTF-8">
</head>
<%
request.setCharacterEncoding("UTF-8");
String keyword = request.getParameter("keyword");
%>
<h1><font face="微軟正黑體"><b> 關鍵字： <% out.println(keyword); %>  </b></font></h1>
<%

DB db = new DB();
String[][] bookInfo = db.getBookInfo();

%>
<body>
<table border="1">
  <tr>
    <td align="center"><b>書名<b/></td>
    <td align="center"><b>作者<b/></td>
    <td align="center" width="80"><b>出版日期<b/></td>
    <td align="center"><b>出版商<b/></td>
  </tr>
  <%
  	for (int i = 0; i < bookInfo.length; i++) {
  		if(bookInfo[i][1].toLowerCase().lastIndexOf(keyword.toLowerCase()) != -1) {
  			out.print("<tr>");
  	  		for(int j=1 ; j< bookInfo[0].length-1; j++) { // -1是為了不顯示書籍描述
  	  			if( j==1 ) 
  	  				out.print("<td><a href='BookInfo.jsp?ID=" + bookInfo[i][0] + "'//>" + bookInfo[i][j] + "</a></td>");
  	  			else
  	  				out.print("<td>" + bookInfo[i][j] + "</td>");
  	  		}
  	  			
  	  		out.print("<tr/>");
  		}
  	}
  %>
  
</table>
<%
out.print("總共有 " + db.getBookNumber() +"本書");
%>
</body>
</html>