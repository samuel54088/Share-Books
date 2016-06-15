<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		String[] bookInfoBuf = new String[7];
		String[] OwnerInfoBuf = new String[7];
	
		DB d = new DB();
		String bookID = request.getParameter("ID");
		bookInfoBuf = d.readBookInfo(bookID);
		OwnerInfoBuf = d.readUserInfo(d.getUserID(bookID));
	
		
		if(bookInfoBuf!= null)
		{
			out.print("<h2>書籍詳細資料" + "</h1>");
			out.print("ISBN: " + bookInfoBuf[1] + "<br>");
			out.print("書籍名稱: " + bookInfoBuf[2] + "<br>");
			out.print("書籍描述: " + bookInfoBuf[3] + "<br>");
			out.print("作者: " + bookInfoBuf[4] + "<br>");
			out.print("出版商: " + bookInfoBuf[5] + "<br>");
			out.print("出版日期: " + bookInfoBuf[6] + "<br>");
		}
		else
		{
			out.print("查無此書籍");
		}
		
		out.print("<br/>");
		
		
		if(OwnerInfoBuf!= null)
		{
			out.print("<h2>書籍擁有者聯絡資料：" + "</h1>");
			out.print("姓名：" + OwnerInfoBuf[1] + "<br>");
			out.print("電子郵件：" + OwnerInfoBuf[2] + "<br>");
			out.print("連絡電話：" + OwnerInfoBuf[3] + "<br>");
		}
		else
		{
			out.print("<br/><br/>此書籍沒有主人");
		}
		
		
		
	%>
    </div>
    <script src="/Scripts/AssetsBS3/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>