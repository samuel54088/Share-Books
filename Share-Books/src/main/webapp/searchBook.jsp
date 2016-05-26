<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
System.out.println("關鍵字：" + request.getParameter("keyword"));
out.println("關鍵字：" + request.getParameter("keyword"));
out.println("<br/>");
out.println("剩餘功能完成中....");
%>
