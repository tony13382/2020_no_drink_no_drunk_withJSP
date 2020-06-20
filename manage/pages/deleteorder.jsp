<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@include file="config.jsp" %>

<%
String OrderID=request.getParameter("id");
String GoodsName=request.getParameter("product_id");

sql = "delete FROM `order_product` Where `OrderID` = '" +OrderID+ "' AND `GoodsName` = '" +GoodsName+ "' ";
con.createStatement().execute(sql);
response.setHeader("refresh","0;URL=order.jsp");
%>