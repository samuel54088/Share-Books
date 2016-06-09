<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		String keyword = request.getParameter("keyword");
	%>
	<h1><font face="微軟正黑體"><b> 關鍵字： <% out.println(keyword); %>  </b></font></h1>
	<%
	
	DB db = new DB();
	String[][] bookInfo = db.getBookInfo();
	
	%>
	<table border="1" class="table table-bordered">
	  <tr class="info">
	    <td align="center"><b>書名</b></td>
	    <td align="center"><b>作者</b></td>
	    <td align="center" width="80"><b>出版日期</b></td>
	    <td align="center"><b>出版商</b></td>
	  </tr>
	  <%
	  	for (int i = 0; i < bookInfo.length; i++) {
	  		if(bookInfo[i][1].toLowerCase().lastIndexOf(keyword.toLowerCase()) != -1) {
	  			out.print("<tr>");
	  	  		for(int j=1 ; j< bookInfo[0].length-1; j++) { // -1是為了不顯示書籍描述
	  	  			if( j==1 ) 
	  	  				out.print("<td><a href='BookInfo.jsp?ID=" + bookInfo[i][0] + "'//>" + bookInfo[i][j] + "</a></td>");
	  	  			else
	  	  				out.print("<td>" + bookInfo[i][j] + "</td>");
	  	  		}
	  	  			
	  	  		out.print("<tr/>");
	  		}
	  	}
	  %>
	  
	</table>

	</div>
  </body>
</html>