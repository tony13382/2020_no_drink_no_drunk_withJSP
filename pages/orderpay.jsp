<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@include file="counter.jsp" %>



<%
request.setCharacterEncoding("UTF-8");

String MemberEmail=request.getParameter("OrderEmail");
String Name=request.getParameter("Name");
String Phone=request.getParameter("Phone");
String Address=request.getParameter("Address");
String CardNum=request.getParameter("CardNum");
String CardName=request.getParameter("CardName");
String CVD=request.getParameter("CVD");
String GoodThru=request.getParameter("GoodThru");
String ATMNum=request.getParameter("ATMNum");
String ATMName=request.getParameter("ATMName");

java.sql.Date new_date =new java.sql.Date(System.currentTimeMillis());
java.util.Date now=new java.util.Date();
String day = now.toString();


///////////////
String GoodsName=request.getParameter("GoodsName");
String Price=request.getParameter("Price");
String Amount=request.getParameter("Amount");
String TotalPrice=request.getParameter("TotalPrice");

//  || CardNum=="" || CardName==""|| CVD==""|| GoodThru=="" || ATMName=="" || ATMNum==""

if(Name=="" || Phone==""|| Address=="")//欄位是否空值
	{
		out.print("<script>alert('購買失敗，商品資料填寫未完全!'); javascript:location.href=`products.jsp` </script>");
	}
else
{
sql = "insert shop.order(MemberEmail,Name,Phone,Address,CardNum,CardName,CVD,GoodThru,ATMNum,ATMName,Date) values('"+MemberEmail+"','"+Name+"','"+Phone+"','"+Address+"','"+CardNum+"','"+CardName+"','"+CVD+"','"+GoodThru+"','"+ATMNum+"','"+ATMName+"','"+day+"')";
con.createStatement().execute(sql);
%>
<jsp:forward page="bill.jsp"/>
<%}%>

/////// 

 
 
