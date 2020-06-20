<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*, java.util.*" %>
<%@include file="config.jsp" %>
<%

request.setCharacterEncoding("UTF-8");

String old_password=request.getParameter("old_password");
String new_password=request.getParameter("new_password");
String check_password=request.getParameter("check_password");
sql="SELECT password FROM client WHERE email='"+session.getAttribute("email")+"'";
ResultSet account=con.createStatement().executeQuery(sql);
if(account.next())
{
	if(old_password!=""&& new_password!=""&& check_password!="" )
	{
		if(old_password.equals(account.getString(1)))
		{
			if(new_password.equals(check_password))
			{
				sql="UPDATE `client`SET Password='"+new_password+"'WHERE email='"+session.getAttribute("email")+"'";
		        con.createStatement().execute(sql);
                out.print("<script>alert('更改密碼成功'); window.location='admin_info_center.jsp' </script>");	
			}
			else
			{
				out.print("<script>alert('再次確認失敗，請填寫相同的新密碼'); javascript:location.href=`modify.jsp` </script>");
			}
		}
		else
		{
			out.print("<script>alert('舊密碼錯誤，請重新輸入'); javascript:location.href=`modify.jsp` </script>");
		}
	}
	else
	{
		out.print("<script>alert('請將欄位確實填寫完畢'); javascript:location.href=`modify.jsp` </script>");
	}
}
%>