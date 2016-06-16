<%@page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="icon" href="/Content/AssetsBS3/img/favicon.ico" />
    <title>Share-Books</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="/Content/AssetsBS3/examples/jumbotron-narrow.css" rel="stylesheet" />
    <!--[if lt IE 9]><script src=~/Scripts/AssetsBS3/ie8-responsive-file-warning.js></script><![endif]-->
    <script src="/Scripts/AssetsBS3/ie-emulation-modes-warning.js"></script>
    <!--[if lt IE 9]><script src=https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js></script><script src=https://oss.maxcdn.com/respond/1.4.2/respond.min.js></script><![endif]-->
  </head>
  <body>
    <div class="container">
      <div class="header">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation" class="active">
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
      <div class="jumbotron">
        <h1><font face="微軟正黑體"><b>分享您喜愛的書籍</b></font></h1>
        <p class="lead">在這裡可以自由的分享書籍，您也可以在我們的網站搜尋其他人分享的書籍，並向他借閱！！</p>
        <p>
          <a class="btn btn-lg btn-success" href="identify.jsp" role="button"><font face="微軟正黑體"><b>馬上搜尋書籍</b></font></a>
        </p>
      </div>
      <div class="row marketing">
        <div class="col-lg-6">
          <h4><b>免費</b></h4>
          <p>在這裡，您可以免費的向別人借書。</p>
          <h4><b>便利</b></h4>
          <p>您可以向書的擁有者自行約定借書地點。</p>
        </div>
        <div class="col-lg-6">
          <h4><b>書友</b></h4>
          <p>您可以認識有相同閱讀喜好的朋友。</p>
          <h4><b>彈性</b></h4>
          <p>您可以向書的擁有者自行約定借閱時間。</p>
        </div>
      </div>
      <footer class="footer">
        <p>&copy; FCU SPM PROJECT BY TEAM2 2016</p>
      </footer>
    </div>
    <script src="/Scripts/AssetsBS3/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
