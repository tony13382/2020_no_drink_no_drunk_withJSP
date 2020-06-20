<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	
	session.removeAttribute("email");
	out.print("<script>alert('登出成功')</script>");
	response.setHeader("refresh","0;URL=login.jsp") ;
%>