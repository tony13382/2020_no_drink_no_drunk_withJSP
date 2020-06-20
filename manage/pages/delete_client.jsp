<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@include file="config.jsp" %>
<%

request.setCharacterEncoding("UTF-8");

String clname=request.getParameter("clname");


sql="SELECT * FROM client WHERE Name='"+session.getAttribute("Name")+"'";
ResultSet gd=con.createStatement().executeQuery(sql);

	

	sql="DELETE FROM `shop`.`client` WHERE (`Name`='"+clname+"')";
	con.createStatement().execute(sql);
	out.print("<script>alert('刪除成功!'); window.location='admin.jsp' </script>");	

	
%>