<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="dbapi.*" %>


<html>
  <head>
    <meta name="generator"
    content="HTML Tidy for HTML5 (experimental) for Windows https://github.com/w3c/tidy-html5/tree/c63cc39" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="icon" href="/Content/AssetsBS3/img/favicon.ico" />
    <title>會員登入</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="/Content/AssetsBS3/examples/signin.css" rel="stylesheet" />
    <script src="/Scripts/AssetsBS3/ie-emulation-modes-warning.js"></script>
  </head>
  <body>
  <div class="container">
      <div class="header">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation">
              <a href="index.jsp">首頁</a>
            </li>
            <li role="presentation">
              <a href="Login.html">登入</a>
            </li>
            <li role="presentation">
              <a href="Register.html">註冊</a>
            </li>
			<li role="presentation">
              <a href="#">尋找書籍</a>
            </li>
          </ul>
        </nav>
        <h1 class="text-muted"><b>Share-Books</b></h1>
      </div>
	  <hr>
	</div>
    <div class="container">
      <%
		request.setCharacterEncoding("UTF-8");
		if(session.getAttribute("EMAIL") == null) {
			String URL = "http://localhost:8080/Share-Books/Login.html";
			response.setHeader("Refresh", "3; " + URL);
	        out.println("<h1>歡迎光臨Share-Books!! 請先登入會員，3秒後進入登入頁面!!</h1>");
		}
		if(session.getAttribute("EMAIL") != null) {
			String URL = "http://localhost:8080/Share-Books/search.jsp";
			response.setHeader("Refresh", "3; " + URL);
	        out.println("<h1>Hello, " + session.getAttribute("USER") + "!! 歡迎光臨Share-Books, 3秒後進入會員頁面!!</h1>");
		}
	%>
    </div>
    <script src="/Scripts/AssetsBS3/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>