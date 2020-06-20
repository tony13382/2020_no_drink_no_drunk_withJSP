<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@include file="config.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String goodname=request.getParameter("productid");

sql = "Select Amount From `shoppingcar` Where `GoodsName` = '" + goodname + "' AND `User` = '" + session.getAttribute("email") + "' ";
ResultSet reduce= con.createStatement().executeQuery(sql);
reduce.next();
int aa=Integer.parseInt(reduce.getString(1));
int bb=aa-1;
if(bb<1)
{
	out.println("<script>javascript:window.location(history.back());</script>");
	return;
}
sql="UPDATE `shoppingcar` SET Amount='"+bb+"' Where `GoodsName` = '" + goodname + "' AND `User` = '" + session.getAttribute("email") + "' ";
con.createStatement().execute(sql);
con.close();
out.print("<SCRIPT>javascript:window.location=document.referrer;</SCRIPT>");
%>