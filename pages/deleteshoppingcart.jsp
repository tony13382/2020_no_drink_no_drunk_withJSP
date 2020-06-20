<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@include file="counter.jsp" %>
<%
if(session.getAttribute("email")==null)
{
	out.println("<script>alert('請先登入');window.location(login.jsp);</script>");
}
else
{
request.setCharacterEncoding("UTF-8");
String productid=request.getParameter("productid");
sql="select * from `shoppingcar` Where `User` = '" + session.getAttribute("email") + "' ";
ResultSet check=con.createStatement().executeQuery(sql);
check.next();
if(check.next())
{
	sql = "delete From `shoppingcar` Where `GoodsName` = '" + productid + "' AND `User` = '" + session.getAttribute("email") + "' ";
    con.createStatement().execute(sql);
    response.setHeader("refresh","0;URL=shopping_cart_list.jsp") ;
}
else
{
	sql = "delete From `shoppingcar` Where `GoodsName` = '" + productid + "' AND `User` = '" + session.getAttribute("email") + "' ";
    con.createStatement().execute(sql);
  out.print("<script>alert('購物車空了喔，歡迎繼續選購心儀的產品!')</script>");
  response.setHeader("refresh","0;URL=products.jsp") ;
}
}
%>