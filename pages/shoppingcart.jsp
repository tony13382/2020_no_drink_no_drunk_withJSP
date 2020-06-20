<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@include file="config.jsp" %>

<%
if(session.getAttribute("email")==null)
{
	out.print("<script>alert('請先登入');window.location='login.jsp';</script>");
}
else
{
	request.setCharacterEncoding("UTF-8");
	
	String goodname=request.getParameter("goodname");
	String goodprice=request.getParameter("goodprice");
	String goodcount=request.getParameter("goodcount");
	
	int low=1;
	
	sql="SELECT Stock FROM product WHERE GoodsName='"+goodname+"'";
	ResultSet GoodsStock=con.createStatement().executeQuery(sql);
	GoodsStock.next();
	int aa = Integer.parseInt(GoodsStock.getString(1));
	
	
	if(aa<low)
	{
		out.println("<script>alert('庫存不足，請選購其他產品!');window.location(history.back());</script>");
	}
	else
	{  
		sql="SELECT PicLink FROM product WHERE GoodsName='"+goodname+"'";
        ResultSet GoodsPic=con.createStatement().executeQuery(sql);
		GoodsPic.next();
		
		
		sql = "Select * From `shoppingcar` Where `GoodsName` = '" + goodname + "' AND `User` = '" + session.getAttribute("email") + "' ";
		ResultSet rs =con.createStatement().executeQuery(sql);
	
		if( rs.next() )
		{
			int count = Integer.parseInt( goodcount ) + Integer.parseInt( rs.getString(5) );
			if( count > aa )
			{
				out.println("<script>alert('庫存不足，請選購其他產品!');window.location(history.back());</script>");
				return;
			}
			else 
				sql = "Update `shoppingcar` set `Amount` = '" + count + "'  Where `GoodsName` = '" + goodname + "' AND `User` = '" + session.getAttribute("email") + "' ";
		}
		else
			sql="insert shoppingcar (User,Picture,GoodsName,Price,Amount) values ('"+session.getAttribute("email")+"','"+GoodsPic.getString(1)+"','"+goodname+"','"+goodprice+"','"+goodcount+"')";
		con.createStatement().execute(sql);
		out.println("<script>alert('加入購物車成功!');window.location(history.back());</script>");
	}
}
%>