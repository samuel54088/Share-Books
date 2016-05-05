<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ page import ="p2.TEST" %>
<%
TEST t = new TEST();
String h = t.m1();
out.print(h);
%>