<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
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
        <a href="">
            <div class="header_logo">
                <img src="../assets/images/logo.png" style="width: 100%">
            </div>
        </a>
        <ul class="header_ul">
            <a href="product.jsp"" style=" float: left">
                <li class="header_li">產品專區</li>
            </a>
            <a href="order.jsp" style="float: left">
                <li class="header_li">訂單專區</li>
            </a>
            <a href="message.jsp" style="float: left">
                <li class="header_li_focus">訊息專區</li>
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
                        訊息專區
                    </h2>
                    <div class="block_info_square">
                        <div class="block_row">
                            <div class="table-responsive-lg">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th style ="text-align:center;"scope="col"><p>功能</p></th>
                                            <th style ="text-align:center;"scope="col"><p>訂單ID</p></th>
                                            <th scope="col"><p>被評論商品</p></th>
                                            <th scope="col"><p>評論內容</p></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!--單一列S-->
										
                                        
										<%   ResultSet rss;
										String aa="";
													sql = "select * from order_product";
													rss=con.createStatement().executeQuery(sql);
													 while(rss.next())
											 {%>
										 <tr>
                                            <td width="10%" style ="text-align:center;">
                                                <form action="delete_message.jsp">
                                                    <input type="hidden" name="gdname" value="<%=rss.getString(3)%>">
													 <input type="hidden" name="orderid" value="<%=rss.getString(1)%>">
                                                    <!-- MSGID OUTPUT-->
                                                    <input type="submit" value="移除不當內容">
                                                </form>
                                            </td>
                                            <td width="15%" style ="text-align:center;"><p><%=rss.getString(1)%></p></td>
                                            <td width="30%"><p><%=rss.getString(3)%></p></td>
                                            <td width="45%">
                                                <p class="long_word">
												<% if(aa.equals(rss.getString(9))){%>
                                                   暫無評論
												<%}else{%>
												<%=rss.getString(9)%>
													
                                                </p>
                                            </td>
										
                                        </tr>
												<%}}%>
							
                                        <!--單一列E-->

                                    </tbody>
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