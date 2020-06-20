<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*, java.util.*" %>
<%@include file="config.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

String GoodsName=request.getParameter("GoodsName");
String Stock=request.getParameter("Stock");
String MadeArea=request.getParameter("Made_Area");
String Temperature=request.getParameter("temperature");
String Density=request.getParameter("density");
String WakeTime=request.getParameter("wake_time");
String Price=request.getParameter("link_page");
String PicLink=request.getParameter("link_photo");
String GoodsID=request.getParameter("GoodsID");
ResultSet gd;
sql="SELECT * FROM product WHERE GoodsID";
gd=con.createStatement().executeQuery(sql);


if(gd.next())
{
	if(Stock!="" || GoodsName !="" || MadeArea !="" ){
		
		sql="UPDATE `shop`.`product` SET Stock= '"+Stock+"' WHERE (`GoodsID` = '"+GoodsID+"')";
		con.createStatement().execute(sql);
		sql="UPDATE `shop`.`product` SET GoodsName= '"+GoodsName+"' WHERE (`GoodsID` = '"+GoodsID+"')";
		con.createStatement().execute(sql);
		sql="UPDATE `shop`.`product` SET MadeArea= '"+MadeArea+"' WHERE (`GoodsID` = '"+GoodsID+"')";
		con.createStatement().execute(sql);
		sql="UPDATE `shop`.`product` SET Temperature= '"+Temperature+"' WHERE (`GoodsID` = '"+GoodsID+"')";
		con.createStatement().execute(sql);
		sql="UPDATE `shop`.`product` SET Density= '"+Density+"' WHERE (`GoodsID` = '"+GoodsID+"')";
		con.createStatement().execute(sql);
		sql="UPDATE `shop`.`product` SET WakeTime= '"+WakeTime+"' WHERE (`GoodsID` = '"+GoodsID+"')";
		con.createStatement().execute(sql);
		sql="UPDATE `shop`.`product` SET Price= '"+Price+"' WHERE (`GoodsID` = '"+GoodsID+"')";
		con.createStatement().execute(sql);
		sql="UPDATE `shop`.`product` SET PicLink= '"+PicLink+"' WHERE (`GoodsID` = '"+GoodsID+"')";
		con.createStatement().execute(sql);
		sql="UPDATE `shop`.`product` SET GoodsID= '"+GoodsID+"' WHERE (`GoodsID` = '"+GoodsID+"')";
		con.createStatement().execute(sql);
		out.print("<script>alert('資料更改成功'); window.location='product.jsp' </script>");	
	}



}

%>