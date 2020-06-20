<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@include file="config.jsp" %>
<%

request.setCharacterEncoding("UTF-8");

String gdname=request.getParameter("gdname");


sql="SELECT * FROM product WHERE Goodsname='"+session.getAttribute("Goodsname")+"'";
ResultSet gd=con.createStatement().executeQuery(sql);

	

	sql="DELETE FROM `shop`.`product` WHERE (`Goodsname`='"+gdname+"')";
	con.createStatement().execute(sql);
	out.print("<script>alert('刪除成功!'); window.location='product.jsp' </script>");	

	
%>