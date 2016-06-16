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
			String obj_mail = (String) session.getAttribute("EMAIL");
			String obj_pwd = (String) session.getAttribute("PWD");
			String isbn =request.getParameter("isbn");
		
			String infomation = d.update_book_owner(isbn , obj_mail , obj_pwd);
		
				
			if(infomation.equals("insert")){
				out.print("<a href=Add_book_data.html><font face=\"微軟正黑體\" size=4><b>請先新增書籍資料!! </b></font></a>");
			}
			else if(infomation.equals("noinput")){
				out.print("<font face=\"微軟正黑體\" size=4><b>您沒有輸入任何值</b></font>" + "<br/>");
			}
			else if(infomation.equals("分享成功")){
				out.print("<font face=\"微軟正黑體\" size=4><b>分享成功!!</b></font>" + "<br/>");
			}
			else{
				
			}
		%>
	</div>
  </body>
</html>