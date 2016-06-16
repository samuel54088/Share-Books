<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dbapi.*" %>
<html>
<head>
  <script>
    function goPost()
    {
      frm.submit();
    }
  </script>
  </head>
<body onLoad="javascript:goPost();">
<%
	DB d = new DB();
				
	String obj_mail = (String) session.getAttribute("EMAIL");
	String obj_pwd = (String) session.getAttribute("PWD");
	
				
	String[] infomation = {obj_mail,obj_pwd};
	String[] user_buffer = new String[4];
	user_buffer = d.getUserdata(infomation);
	String name = user_buffer[0];
	
%>
<form method="post" action="modify.jsp" id="frm">
    <input type="hidden" name="name" value="<%=user_buffer[0] %>">
    <input type="hidden" name="email" value="<%=user_buffer[1] %>">
    <input type="hidden" name="pw" value="<%=user_buffer[2] %>">
    <input type="hidden" name="phone" value="<%=user_buffer[3] %>">
    <input type="submit"  value="submit">
</form>
<input type="button" name="goToIndexPage" onclick="javascript:location.href='index.jsp'" value="回首頁">
<br/><br/>
</body>
</html>