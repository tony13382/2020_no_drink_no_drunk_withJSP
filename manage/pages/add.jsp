<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@include file="config.jsp" %>

<%
request.setCharacterEncoding("UTF-8");

String goodsName=request.getParameter("name");
String classgood=request.getParameter("Class");
String stock=request.getParameter("stock");
String madearea=request.getParameter("made_area");
String temperature=request.getParameter("temperature");
String density=request.getParameter("density");
String waketime=request.getParameter("wake_time");
String price=request.getParameter("price");
String webaddress=request.getParameter("web_address");
String piclink=request.getParameter("pic_link");

if(goodsName=="" || classgood==""|| stock=="" || madearea=="" || temperature==""|| density==""|| waketime=="" || price=="" || webaddress=="" || piclink=="")//欄位是否空值
	{
		out.print("<script>alert('新增失敗，商品資料填寫未完全!'); javascript:location.href=`register.jsp` </script>");
	}
else
{
sql = "insert product(GoodsName,Class,Stock,MadeArea,Temperature,Density,WakeTime,Price,WebAddress,PicLink) values('"+goodsName+"','"+classgood+"','"+stock+"','"+madearea+"','"+temperature+"','"+density+"','"+waketime+"','"+price+"','"+webaddress+"','"
+piclink+"')";

con.createStatement().execute(sql);
out.print("<script>alert('新增成功')</script>");	
response.setHeader("refresh","0;URL=product.jsp") ;
}
%>