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
	<%
		DB d = new DB();
		String email = session.getAttribute("EMAIL").toString();
		System.out.println(email);
		Boolean infomation = false;
		String[][] result = null;
			result = d.query(email);
		if (result != null) {
			out.print("借閱者名稱&nbsp;&nbsp;&nbsp;書籍名稱&nbsp;&nbsp;&nbsp;借閱狀態(0:未歸還, 1:歸還)&nbsp;&nbsp;&nbsp;<br/>");
			for (int i = 0; i < result.length; i++) {
				out.print(result[i][0] + "&nbsp;&nbsp;&nbsp;" + result[i][1] + "&nbsp;&nbsp;&nbsp;" + result[i][3] + "<br/>");
			}
		} else {
			out.print("查詢失敗!!" + "<br/>");
		}
	%>

	<input type="button" name="goToIndexPage"
		onclick="javascript:location.href='index.jsp'" value="回首頁">
</body>
</html>