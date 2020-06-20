<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@include file="counter.jsp" %>

<%

if(session.getAttribute("email")==null)
{
	out.println("<script>alert('請先登入');window.location.href='login.jsp';</script>");
}
else
{
	request.setCharacterEncoding("UTF-8");
	String GoodsName=request.getParameter("productnam");
	String Email=(String)session.getAttribute("email");
	
	
		sql = "select * FROM love_product WHERE (`GoodsName`='"+GoodsName+"') AND(Email='"+Email+"')";
		ResultSet love=con.createStatement().executeQuery(sql);
		
		if(love.next()) 
		{
			sql="DELETE FROM `shop`.`love_product` WHERE (`GoodsName`='"+GoodsName+"') AND(Email='"+Email+"')";
			con.createStatement().execute(sql);
			out.println("<script>window.location.href=document.referrer;</script>");
		}
		else
		{
			sql="insert love_product (Email,GoodsName) values ('"+Email+"','"+GoodsName+"')";
			con.createStatement().execute(sql);
			
			out.println("<script>window.location.href=document.referrer;</script>");
		}
	
		
		




	

}
%>