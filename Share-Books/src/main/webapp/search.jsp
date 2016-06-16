<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="dbapi.*"%>

<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="icon" href="/Content/AssetsBS3/img/favicon.ico" />
<title>Share-Books</title>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="/Content/AssetsBS3/examples/signin.css" rel="stylesheet" />
<script src="/Scripts/AssetsBS3/ie-emulation-modes-warning.js"></script>
</head>
<body>
	<div class="container">
		<div class="header">
			<nav>
				<ul class="nav nav-pills pull-right">
					<li role="presentation"><a href="index.jsp">首頁</a></li>
					<li role="presentation"><a href="Login.html">登入</a></li>
					<li role="presentation"><a href="Register.html">註冊</a></li>
					<li role="presentation" class="active"><a href="#">尋找書籍</a></li>
				</ul>
			</nav>
			<h1 class="text-muted">
				<b>Share-Books</b>
			</h1>
		</div>
		<hr>
	</div>
	<div class="container">
		<%
			request.setCharacterEncoding("UTF-8");

			if (session.getAttribute("USER") == null) {
				response.sendRedirect("http://localhost:8080/Share-Books/identify.jsp");
			} else {
				out.print("<h1>Hello  " + session.getAttribute("USER") + ", 趕快搜尋您有興趣的書籍吧!!" + "</h1>");
			}
		%>
		<form method="POST" action="searchBook.jsp">
			<h3>
				<b>關鍵字：</b>
			</h3>
			<input type="text" class="form-control" name="keyword" size="15"><br />
			<input type="submit" class="btn btn-default btn-lg" value="搜尋">
		</form>

		<br />
		<br />

		<form method="POST" action="Update_book_owner.html">
			<input type="submit" class="btn btn-info btn-lg" value="我要分享書籍">
		</form>

		<form method="POST" action="GetUserData.jsp">
			<input name="email" type="hidden" value=" + mail + "> <input
				name="pwd" type="hidden" value=" + pwd + "> <input
				type="submit" class="btn btn-warning" value="修改會員資料">
		</form>

		<form method="GET" action="query.jsp">
			<input type="submit" class="btn btn-danger" value="我的出借記錄">
		</form>

	</div>
</body>
</html>