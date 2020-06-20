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
    <title>新增產品</title>
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
            <a href="product.jsp" style="float: left">
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
			 <form action="add.jsp">
                <div class="block_container">
                    <h2 class="block_title" style="float: left;">
                        新增產品專區
                    </h2>
					<br>
                    <div class="cleaner"></div>
                    <div class="block_info_square">
                        <div class="block_row">
                            <form action="add.jsp">
                                <div class="form-group row">
                                    <label for="staticEmail" class="col-sm-2 col-form-label align-middle">名稱</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="name" class="form-control" placeholder="輸入名稱">
                                    </div>
                                </div>
								  <div class="form-group row">
                                    <label for="staticEmail" class="col-sm-2 col-form-label align-middle">分類</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="class" class="form-control" placeholder="輸入分類">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="staticEmail" class="col-sm-2 col-form-label align-middle">庫存</label>
                                    <div class="col-sm-10">
                                        <input type="number" name="stock" class="form-control" min="0"
                                            placeholder="輸入庫存">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="staticEmail" class="col-sm-2 col-form-label align-middle">產區</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="made_area" class="form-control" placeholder="輸入產區">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="staticEmail" class="col-sm-2 col-form-label align-middle">適合溫度</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="temperature" class="form-control" placeholder="輸入適溫">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="staticEmail" class="col-sm-2 col-form-label align-middle">酒精濃度</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="density" class="form-control" placeholder="輸入酒精濃度">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="staticEmail" class="col-sm-2 col-form-label align-middle">醒酒時間</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="wake_time" class="form-control" placeholder="輸入醒酒時間">
                                    </div>
                                </div>
                                
								<div class="form-group row">
                                    <label for="staticEmail"
                                        class="col-sm-2 col-form-label align-middle">連結介紹頁面檔案路徑</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" placeholder="輸入路徑「123.html」">
                                        <small id="emailHelp"
                                            class="form-text text-muted">需要包含附檔名，且放置位置須為pages/product/輸入之名稱</small>
                                    </div>
                                </div>
								
                                <div class="form-group row">
                                    <label for="staticEmail"
                                        class="col-sm-2 col-form-label align-middle">連結商品封面圖片</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" placeholder="輸入路徑「123.png」">
                                        <small id="emailHelp"
                                            class="form-text text-muted">需要包含附檔名，且放置位置須為assets/images/product_img/輸入之名稱「400*400
                                            px」</small>
                                    </div>
                                </div>
						
                                <div class="form-group row">
                                    <label for="staticEmail" class="col-sm-2 col-form-label align-middle">產品搭配ID</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="wake_time" class="form-control" value="<%  ResultSet rss;
								sql = "select GoodsID from product";
								rss=con.createStatement().executeQuery(sql);
								String cst="";
								while(rss.next()&&rss!=null) 

								{ 

								cst=rss.getString("GoodsID"); 

								} 

								cst=String.valueOf((Integer.parseInt(cst.substring(0))+1));
								out.print(cst);
								
							%>" 
										
										
										readonly>
                                    </div>
                                </div>
								
                                <input type="reset" value="重製">
                                <input type="submit" value="新增">
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