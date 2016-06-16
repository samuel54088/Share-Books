<%@ page contentType="text/html; charset=UTF-8" %>
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
              <a href="identify.jsp">尋找書籍</a>
            </li>
          </ul>
        </nav>
        <h1 class="text-muted"><b>Share-Books</b></h1>
      </div>
	  <hr>
	</div>
	<div class="container">
		<form method="POST" action="checkModify.jsp">
		<font face="微軟正黑體" size=4><b>將姓名更改為： </b></font>
		<input type="text" class="form-control" name="userName" placeholder=<%=request.getParameter("name") %> size="15"><br/>
		<font face="微軟正黑體" size=4><b>將帳號(e-mail)更改為： </b></font>
		<input type="text" class="form-control" name="email" placeholder=<%=request.getParameter("email") %> size="30"><br/>
		<font face="微軟正黑體" size=4><b>將密碼更改為： </b></font>
		<input type="password" class="form-control" name="password" size="15"><br/>
		<font face="微軟正黑體" size=4><b>將連絡電話更改為： </b></font>
		<input type="text" class="form-control" name="phone" placeholder=<%=request.getParameter("phone") %> size="15"><br/>
		<input type="submit" class="btn btn-info btn-lg" value="確定修改">
		</form>
	</div>
  </body>
</html>