<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*, java.util.*" %>
<%@include file="config.jsp" %>
   <%if(session.getAttribute("name")==null)
          {
            out.print("<script>alert('管理者請先登入'); window.location='../index.jsp' </script>");
          }
		  else
		  {
        %>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
        integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>訊息專區</title>
    <link rel="stylesheet" href="../assets/css/msg.css" type="text/css">
    <link href="../assets/css/basic_element.css" type="text/css" rel="stylesheet">
    <meta charset="utf-8">
</head>

<body style="background-color: #2A2A2A;">
    <header>
        <a href="#首頁網頁">
            <div class="header_logo">
                <img src="../assets/images/logo.png" style="width: 100%">
            </div>
        </a>
        <ul class="header_ul">
            <a href="product.jsp"" style=" float: left">
                <li class="header_li">產品專區</li>
            </a>
            <a href="order.jsp" style="float: left">
                <li class="header_li_focus">訂單專區</li>
            </a>
            <a href="message.jsp" style="float: left">
                <li class="header_li">訊息專區</li>
            </a>
            <a href="admin.jsp"" style=" float: left">
                <li class="header_li">會員專區</li>
            </a>
        </ul>
		<div style="float:right; display:flex;">
		      <p style="float:left; color:white; font-size:16px; padding:20px 20px; font-weight:bold;">親愛的管理者,您好!</p>
			  <a href="managelogout.jsp"; style="float:left; color:white; font-size:16px; padding:20px 20px; font-weight:bold;">登出</a>
		</div>
        <div style="clear: both;"></div>
    </header>
    <section>
        <div class="page_container">
            <div class="bg_block">
                <div class="block_container">
                    <h2 class="block_title">
                        訂單專區
                    </h2>
                    <div class="block_info_square">
                        <div class="block_row">
                            <div class="table-responsive-lg">
                                <table class="table table-hover">
								<thead>
                                        <tr>
                                            <th scope="col" style="padding-left:50px; ">功能</th>
                                            <th scope="col">訂單ID</th>
                                            <th scope="col">被購買商品</th>
                                            <th scope="col">購買數量</th>
                                        </tr>
                                    </thead>
								<%
								sql="SELECT `OrderID`,`GoodsName`,`Amount` From `order_product`";
								ResultSet manage=con.createStatement().executeQuery(sql);
								while(manage.next())
								{
								%>
                                    
                                    <tbody>
                                        <!--單一列S-->
                                        <tr>
                                            <td style="display:flex;">
                                                <form action="deleteorder.jsp" style="margin-right:10px;">
                                                    <input type="hidden" value="<%=manage.getString(1)%>" name="id">
                                                    <!-- ORDERID OUTPUT-->
                                                    <input type="hidden" value="<%=manage.getString(2)%>" name="product_id">
                                                    <!-- PRODUCT ID OUTPUT-->
                                                    <input type="submit" value="刪除">
                                                </form>
												<form action="orderdetail.jsp">
                                                    <input type="hidden" value="<%=manage.getString(1)%>" name="id">
                                                    <!-- ORDERID OUTPUT-->
                                                    <input type="submit" value="查看詳細">
                                                </form>
										
                                            </td>
											
                                            <td><%=manage.getString(1)%></td>
                                            <td><%=manage.getString(2)%></td>
                                            <td><%=manage.getString(3)%></td>
                                        </tr>
									</tbody>
								<%}%>
                                        <!--單一列E-->
                                        	
                                   
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
        integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
        integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
        crossorigin="anonymous"></script>
</body>

</html>
		  <%}%>