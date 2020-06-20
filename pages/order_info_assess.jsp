<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@include file="counter.jsp" %>



<%
request.setCharacterEncoding("UTF-8");

String Info=request.getParameter("Info");
String orderid=request.getParameter("orderid");
String showname=request.getParameter("showname");
String GoodsName=request.getParameter("GoodsName");
String star = request.getParameter("star");
String OrderEmail = request.getParameter("OrderEmail");
ResultSet zero;
sql="SELECT * FROM `order_product` Where `OrderID` = '"+orderid+"'";
zero=con.createStatement().executeQuery(sql);

	if(Info==""||showname=="")//欄位是否空值
	{
		out.print("<script>alert('請填寫姓名、留言，讓我們收到回覆!'); javascript:location.href=`products.jsp` </script>");
	}
	else
	{
		sql = "Update `order_product` set `Name` = '" + showname + "' WHERE (`GoodsName` = '"+GoodsName+"')AND(`OrderEmail` = '"+OrderEmail+"') AND (`OrderID` = '"+orderid+"')";
		con.createStatement().execute(sql);
		sql = "UPDATE `shop`.`order_product` SET `Info` = '"+Info+"' WHERE (`GoodsName` = '"+GoodsName+"')AND(`OrderEmail` = '"+OrderEmail+"') AND (`OrderID` = '"+orderid+"')";
		con.createStatement().execute(sql);
		sql = "Update `order_product` set `Star` = '" + star + "' WHERE (`GoodsName` = '"+GoodsName+"')AND(`OrderEmail` = '"+OrderEmail+"') AND (`OrderID` = '"+orderid+"')";
		con.createStatement().execute(sql);
		out.print("<script>alert('收到評價，感謝您的支持！')</script>");
		response.setHeader("refresh","0;URL=admin_info_center.jsp") ;
	}


%>