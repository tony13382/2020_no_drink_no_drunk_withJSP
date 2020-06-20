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

sql="SELECT * FROM client WHERE email='"+session.getAttribute("email")+"'";
ResultSet member=con.createStatement().executeQuery(sql);
if(member.next())
{
	if(name!=""&& sex!=""&& birthday!=""&& phone!=""&& email!=""&& address!="")
	{
		sql="UPDATE `client` SET Name='"+name+"' WHERE email='"+session.getAttribute("email")+"'";
		con.createStatement().execute(sql);
        sql="UPDATE `client` SET Sex='"+sex+"' WHERE email='"+session.getAttribute("email")+"'";
		con.createStatement().execute(sql);
		sql="UPDATE `client` SET Birthday='"+birthday+"' WHERE email='"+session.getAttribute("email")+"'";
		con.createStatement().execute(sql);
		sql="UPDATE `client` SET Phone='"+phone+"' WHERE email='"+session.getAttribute("email")+"'";
		con.createStatement().execute(sql);
		sql="UPDATE `client` SET Email='"+email+"' WHERE email='"+session.getAttribute("email")+"'";
		con.createStatement().execute(sql);
		sql="UPDATE `client` SET Address='"+address+"' WHERE email='"+session.getAttribute("email")+"'";
		con.createStatement().execute(sql);
		session.removeAttribute("email");
        out.print("<script>alert('資料更改成功,請重新登入!'); window.location='login.jsp' </script>");	
	}
	else
	{
		out.print("<script>alert('更改失敗，資料請填寫完整!'); window.location='detailmodify.jsp' </script>");
	}
}

%>