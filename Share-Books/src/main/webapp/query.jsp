<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dbapi.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查詢</title>
</head>
<body>
	<table border="1">
 	 <tr>
  	  <td align="center"><b>借閱者名稱<b/></td>
  	  <td align="center"><b>書籍名稱<b/></td>
 	  <td align="center"><b>借閱狀態(0:未歸還, 1:歸還)<b/></td>
	 </tr> 
 	
	<%
		DB d = new DB();
		String email = session.getAttribute("EMAIL").toString();
		System.out.println(email);
		Boolean infomation = false;
		String[][] result = null;
			result = d.query(email);
		if (result != null) {			
			out.print("<tr>");
			for (int i = 0; i < result.length; i++) {
				out.print("<td>" + result[i][0] + "</td><td>" + result[i][1] + "</td><td align=\"center\">" + result[i][3] + "</td><br/>");
			}
			out.print("<tr/>");
		} else {
			out.print("查詢失敗!!" + "<br/>");
		}
	%>
	
	</table>
	<input type="button" name="goToIndexPage"
		onclick="javascript:location.href='index.jsp'" value="回首頁">
</body>
</html>