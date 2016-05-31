<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dbapi.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>借書</title>
</head>
<body>
	<%
		DB d = new DB();
		String email = session.getAttribute("EMAIL").toString();
		System.out.println(email);
		String bid = request.getParameter("bid");
		String ownid = request.getParameter("owner_id");
		Boolean infomation = false;

		infomation = d.Lend(email, bid, ownid);

		if (infomation) {
			out.print("借閱成功!!" + "<br/>");
		} else {
			out.print("借閱失敗!!" + "<br/>");
		}
	%>

	<input type="button" name="goToIndexPage"
		onclick="javascript:location.href='index.jsp'" value="回首頁">
</body>
</html>