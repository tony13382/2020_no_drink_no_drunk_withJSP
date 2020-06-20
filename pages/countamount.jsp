<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@include file="config.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String goodname=request.getParameter("productid");

sql = "Select Amount From `shoppingcar` Where `GoodsName` = '" + goodname + "' AND `User` = '" + session.getAttribute("email") + "' ";
ResultSet plus= con.createStatement().executeQuery(sql);
plus.next();

sql="SELECT Stock FROM product WHERE GoodsName='"+goodname+"'";
ResultSet stocka= con.createStatement().executeQuery(sql);
stocka.next();

int aa=Integer.parseInt(plus.getString(1));
int cc=Integer.parseInt(stocka.getString(1));
int bb=aa+1;
if(bb>cc)
{
	out.println("<script>alert('庫存不足，請選購其他產品!');window.location(history.back());</script>");
	return;
}
else
{
sql="UPDATE `shoppingcar` SET Amount='"+bb+"' Where `GoodsName` = '" + goodname + "' AND `User` = '" + session.getAttribute("email") + "' ";
con.createStatement().execute(sql);
con.close();
response.setHeader("refresh","0;URL=shopping_cart_list.jsp");
}
%>