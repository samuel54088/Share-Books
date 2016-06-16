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
		<%
			request.setCharacterEncoding("UTF-8");
			DB d = new DB();
			String[] info=new String[6];
			info[0]=request.getParameter("isbn");
			info[1]=request.getParameter("bookname");
			info[2]=request.getParameter("description");
			info[3]=request.getParameter("author");
			info[4]=request.getParameter("publisher");
			info[5]=request.getParameter("publish_date");
			
			if(d.add_book_data(info))
				out.print("<h1><font face=\"微軟正黑體\"><b>新增成功!!</b></font></h1>" + "<br/>");
			else
				out.print("<h1><font face=\"微軟正黑體\"><b>新增失敗!!</b></font></h1>" + "<br/>");
				
		%>
	</div>
  </body>
</html>