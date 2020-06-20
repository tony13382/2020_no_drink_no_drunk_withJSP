<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@include file="config.jsp" %>
<%

request.setCharacterEncoding("UTF-8");

String gdname=request.getParameter("gdname");
String orderid=request.getParameter("orderid");
String bad ="故此評論含有裸露、仇恨、暴力、廣告等不當內容，無法顯示。";



	

	sql="UPDATE `shop`.`order_product` SET Info= '"+bad+"' WHERE (`GoodsName` = '"+gdname+"')AND (`OrderID` = '"+orderid+"')";
	con.createStatement().execute(sql);
	out.print("<script>alert('刪除成功!'); window.location='message.jsp' </script>");	

	
%>