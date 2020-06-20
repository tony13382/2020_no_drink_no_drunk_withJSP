<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="config.jsp" %>
<%
if(request.getParameter("name") !=null && request.getParameter("password") != null)
{
String Account = request.getParameter("name");
String Password = request.getParameter("password");
if(Account.equals("10744116@gmail.com") && Password.equals("10744138") )//判斷是否為管理者帳號
	{
		session.setAttribute("name",request.getParameter("name"));
		out.print("<script>alert('管理者登入，歡迎回來!'); window.location='product.jsp' </script>");
	}
	else
	{
		out.print("<script>alert('帳密錯誤請重新輸入!'); window.location='../index.jsp' </script>");
	}
}
else
{
	out.print("<script>alert('帳密錯誤請重新輸入!'); window.location='../index.jsp' </script>");
}
%>