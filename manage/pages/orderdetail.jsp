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
<html>

<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
        integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>編輯產品</title>
    <link rel="stylesheet" href="../assets/css/product.css" type="text/css">
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
                <li class="header_li_focus">產品專區</li>
            </a>
            <a href="order.jsp" style="float: left">
                <li class="header_li">訂單專區</li>
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
                    <h2 class="block_title" style="float: left;">
                       詳細訂單
                    </h2>
					 <%
					    String ID = request.getParameter("id");
                        sql="SELECT * FROM `order` WHERE `OrderID`='"+ID+"' ";
						ResultSet aba=con.createStatement().executeQuery(sql);
						aba.next();
						%>
						
                    <div class="cleaner"></div>
                    <div class="block_info_square">
                        <div class="block_row">
                            <form action="edit_product_submit.jsp">
                                <div class="form-group row">
                                    <label for="staticEmail" class="col-sm-2 col-form-label align-middle">訂單ID</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="GoodsName" class="form-control" placeholder="<%=aba.getString(1)%>" value="<%=aba.getString(1)%>"readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="staticEmail" class="col-sm-2 col-form-label align-middle">會員信箱</label>
                                    <div class="col-sm-10">
                                        <input type="number" name="Stock" class="form-control" min="0"
                                            placeholder="<%=aba.getString(2)%>" value="<%=aba.getString(2)%>"readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="staticEmail" class="col-sm-2 col-form-label align-middle">收件人名稱</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="Made_Area" class="form-control" placeholder="<%=aba.getString(3)%>" value="<%=aba.getString(3)%>"readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="staticEmail" class="col-sm-2 col-form-label align-middle">收件人電話</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="temperature" class="form-control" placeholder="<%=aba.getString(4)%>" value="<%=aba.getString(4)%>"readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="staticEmail" class="col-sm-2 col-form-label align-middle">收件人地址</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="density" class="form-control" placeholder="<%=aba.getString(5)%>" value="<%=aba.getString(5)%>"readonly >
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="staticEmail" class="col-sm-2 col-form-label align-middle">信用卡卡號</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="wake_time" class="form-control" placeholder="<%=aba.getString(6)%>" value="<%=aba.getString(6)%>"readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="staticEmail"
                                        class="col-sm-2 col-form-label align-middle">持卡人姓名</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="link_page" placeholder="<%=aba.getString(7)%>" value="<%=aba.getString(7)%>"readonly>
                                        <small id="emailHelp"
                                            class="form-text text-muted"></small>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="staticEmail"
                                        class="col-sm-2 col-form-label align-middle">匯入帳號後四碼</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="link_photo" placeholder="<%=aba.getString(8)%>" value="<%=aba.getString(8)%>" readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="staticEmail" class="col-sm-2 col-form-label align-middle">匯入帳號名稱</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="GoodsID" readonly class="form-control" value="<%=aba.getString(9)%>" value="<%=aba.getString(9)%>">
                                    </div>
                                </div>
                            </form>
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