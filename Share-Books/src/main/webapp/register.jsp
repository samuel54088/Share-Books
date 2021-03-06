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
            <li role="presentation" class="active">
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
	DB d = new DB();
	String name = request.getParameter("userName");
	String mail = request.getParameter("email");
	String pwd = request.getParameter("password");
	String phone = request.getParameter("phone");
	
	String[] infomation = {name, mail, pwd, phone};
	if(d.Reg(infomation))
		out.print("<h1><font face=\"微軟正黑體\"><b>註冊成功 </b></font></h1><br/>");
	else
		out.print("<h1><font face=\"微軟正黑體\"><b>註冊失敗 </b></font></h1><br/>");
		
%>
      <input type="button" class="btn btn-info btn-lg" name="goToIndexPage" onclick="javascript:location.href='index.jsp'" value="回首頁">
	</div>
  </body>
</html>