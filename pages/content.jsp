<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@include file="config.jsp" %>

<%
request.setCharacterEncoding("UTF-8");

String feedback_Name=request.getParameter("name");
String feedback_Email=request.getParameter("email");
String feedback_Msg=request.getParameter("msg");


sql = "insert feedback(feedback_Name,feedback_Email,feedback_Msg) values('"+feedback_Name+"','"+feedback_Email+"','"+feedback_Msg+"')";
con.createStatement().execute(sql);
out.print("<script>alert('感謝您，我們已收到您的回饋，')</script>");	
response.setHeader("refresh","0;URL=about_us.jsp") ;
%>