<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@include file="config.jsp" %>
<%
sql="SELECT * FROM shoppingcar Where `User` = '" + session.getAttribute("email") + "' ";
ResultSet record=con.createStatement().executeQuery(sql);
while(record.next())
{
    sql = "insert `order_product`(OrderID,OrderEmail,GoodsName,Price,Amount,TotalPrice,Name,Star,Info) values('0','"+session.getAttribute("email")+"','"+record.getString(3)+"','"+record.getString(4)+"','"+record.getString(5)+"','"+record.getString(6)+"','','','')";
	con.createStatement().execute(sql);
}

sql = "delete From `shoppingcar` Where  `User` = '" + session.getAttribute("email") + "' ";
con.createStatement().execute(sql);

sql = "SELECT `OrderID` from `order` ORDER BY `OrderID` ASC";
ResultSet id=con.createStatement().executeQuery(sql);
int Oldid = 0;
if(id.last())
{
    Oldid += id.getInt(1);
}
String Newid = String.valueOf(Oldid);

sql="SELECT `OrderID` FROM `order_product` Where `OrderID` = '0' ";
ResultSet zero=con.createStatement().executeQuery(sql);

while(zero.next())
{	
	sql = "Update `order_product` set `OrderID` = " + Newid + " Where `OrderID` = 0 AND `OrderEmail` = '"+ session.getAttribute("email") +"' ";
	con.createStatement().execute(sql);
	
	
}
out.print("<script>alert('購買成功，感謝您的支持！')</script>");
 response.setHeader("refresh","0;URL=products.jsp") ;
%>