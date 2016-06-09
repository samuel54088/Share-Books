<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="dbapi.*" %>

<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="icon" href="/Content/AssetsBS3/img/favicon.ico" />
    <title>註冊會員</title>
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
			<li role="presentation" class="active">
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
	DB d = new DB();
	String mail = request.getParameter("email");
	String pwd = request.getParameter("password");
	session.setAttribute("EMAIL",request.getParameter("email")); //抓使用者信箱、密碼，修改資料可以利用session去update資料庫
	session.setAttribute("PWD",request.getParameter("password"));
	String[] infomation = d.Auth(mail, pwd);
	if(infomation[1] != null) 
		out.print("<h1>Hello  " + infomation[1] + ", 趕快搜尋您有興趣的書籍吧!!" + "</h1>");
	else 
		response.sendRedirect("LoginError.html");

%>
	<form method="POST" action="searchBook.jsp">
		<h3><b>關鍵字：</b></h3>
		<input type="text" class="form-control" name="keyword" size="15"><br/>
		<input type="submit" class="btn btn-default btn-lg" value="搜尋">
	</form>
		
	<br/><br/>
	
	<form method="POST" action="Update_book_owner.html">
		<input type="submit" class="btn btn-info btn-lg" value="我要分享書籍">
	</form>
	
	<form method="POST" action="Modify.html">
		<input name="email" type="hidden"  value=" + mail + ">
		<input name="pwd" type="hidden"  value=" + pwd + ">
		<input type="submit" class="btn btn-warning" value="修改會員資料">
	</form>

	<a href="Lend.html">借書</a>
		
	<form method="GET" action="query.jsp">
		<input type="submit" class="btn btn-danger" value="我的出借記錄">
	</form>

	</div>
  </body>
</html>