<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*, java.util.*" %>
<%@include file="config.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

String name=request.getParameter("name");
String sex=request.getParameter("sex");
String birthday=request.getParameter("birthday");
String phone=request.getParameter("phone");
String email=request.getParameter("email");
String address=request.getParameter("address");
String password=request.getParameter("password");
String checkpassword=request.getParameter("checkpassword");

if(password.equals(checkpassword))//檢查密碼兩次輸入是否一致
{
	if(name=="" || sex=="" || birthday=="" || address==""|| password==""|| checkpassword=="")//欄位是否空值
	{
		out.print("<script>alert('註冊失敗，資料未填寫完全!'); javascript:location.href=`register.jsp` </script>");
	}
	else
	{
		sql="SELECT * FROM client WHERE Email='"+email+"'";
		ResultSet rs=con.createStatement( ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE ).executeQuery(sql);
		if(rs.next())//檢查帳號是否重複
		{
			out.print("<script>alert('註冊失敗，帳號重複'); javascript:location.href=`register.jsp` </script>");
		}
		else
		{
			sql = "SELECT ClientNumber from client ORDER BY ClientNumber ASC";
			ResultSet produce=con.createStatement().executeQuery(sql);
			int OldNumber = 1;
			if(produce.last())
			{
				OldNumber=produce.getInt(1)+1;
			}
			String Newnumber = String.valueOf(OldNumber);
			sql = "insert client(ClientNumber,Name,Email,Password,Sex,Birthday,Phone,address) values('"+Newnumber+"','"+name+"','"+email+"','"+password+"','"+sex+"','"+birthday+"','"+phone+"','"+address+"')";
			con.createStatement().execute(sql);	
			response.setHeader("refresh","0;URL=login.jsp") ;
			out.print("<script>alert('註冊成功，歡迎您，切換至登入頁面'); javascript:location.href=`login.jsp` </script>");
		}
	}
}
else
{
	out.print("<script>alert('註冊失敗，密碼兩次輸入不一致!'); javascript:location.href=`register.jsp` </script>");
}	
%>