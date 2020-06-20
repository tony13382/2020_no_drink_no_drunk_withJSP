<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="config.jsp" %>

<%
if(request.getParameter("email") !=null && request.getParameter("password") != null)
{

	
	String Account = request.getParameter("email");
	String Password = request.getParameter("password");
	
	if(Account.equals("10744116") && Password.equals("10744138") )//判斷是否為管理者帳號
	{
		out.print("<script>alert('管理者登入，歡迎回來!'); window.location='item.jsp' </script>");
	}
	sql = "SELECT * FROM client WHERE Email=? AND Password=?";
	PreparedStatement login = con.prepareStatement(sql);
	login.setString(1,request.getParameter("email"));
    login.setString(2,request.getParameter("password"));
	ResultSet success = login.executeQuery();
	
	if(success.next())
	{
		session.setAttribute("email",request.getParameter("email"));
		out.println("<script>alert('登入成功!'); javascript:location.href=`admin_info_center.jsp`</script>");
	}
	else
	{
		out.print("<script>alert('帳密錯誤請重新輸入!'); window.location='login.jsp' </script>");
	}
}
else
{
	out.print("<script>alert('帳密錯誤請重新輸入!'); window.location='login.jsp' </script>");
}
%>