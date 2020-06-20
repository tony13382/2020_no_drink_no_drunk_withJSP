<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@include file="counter.jsp" %>
<html>

<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>訂單資料</title>
    <link rel="stylesheet" href="../assets/css/order_info.css" type="text/css">
    <link href="../assets/css/basic_element.css" type="text/css" rel="stylesheet">
    <meta charset="utf-8">
</head>

<body>
    <header>
       <a href="../index.jsp">
            <div class="header_logo">
                <img src="../assets/images/page_element/logo.png" style="width: 100%">
            </div>
        </a>
        <ul class="header_ul">
            <a href="products.jsp" style="float: left">
                <li class="header_li">商品總覽</li>
            </a>
            <a href="knowledge.jsp" style="float: left">
                <li class="header_li">知識專區</li>
            </a>
            <a href="about_us.jsp" style="float: left">
                <li class="header_li_focus">聯絡我們</li>
            </a>
        </ul>
		<%if(session.getAttribute("email")==null)
		{%>
        <div class="header_btn_area">
            <div class="header_member_logo">
                <a href="admin_info_center.jsp">
                    <img src="../assets/images/page_element/peoeple_whi.png" style="width: 100%;">
                </a>
            </div>
            <div class="header_cart_logo">
                <a href="shopping_cart_list.jsp">
                    <img src="../assets/images/page_element/cart.png" style="width: 100%;">
                </a>
            </div>
        </div>
        <div style="clear: both;"></div>
		<%} 
		else
		{%>
	    <div class="header_btn_area">
		    <div style="float:left; display:flex;">
			<p style="float:left; color:white; font-size:16px; padding:20px 20px; font-weight:bold;">
			  <%sql="SELECT Name FROM client WHERE Email='" +session.getAttribute("email")+"'" ;
					ResultSet name =  con.createStatement().executeQuery(sql);
					if(name.next()){
						out.print( "親愛的 "+name.getString("name")+",您好!");
					}%>
			</p>
			<a href="loginout.jsp"; style="float:left; color:white; font-size:16px; padding:20px 20px; font-weight:bold;">登出</a>
			</div>
            <div class="header_member_logo">
                <a href="admin_info_center.jsp">
                    <img src="../assets/images/page_element/peoeple_whi.png" style="width: 100%;">
                </a>
            </div>
            <div class="header_cart_logo">
                <a href="shopping_cart_list.jsp">
                    <img src="../assets/images/page_element/cart.png" style="width: 100%;">
                </a>
            </div>
        </div>
        <div style="clear: both;"></div>      
		<%}%>
    </header>
    <section>
        <div class="bg_block">
		
            <div class="block_container">
            	<% ResultSet gd;
				String orderidd=request.getParameter("orderid");
				sql = "select * from shop.order WHERE MemberEmail = '"+session.getAttribute("email")+"'";
				gd=con.createStatement().executeQuery(sql);
					
				while(gd.next())
				{
					if (orderidd.equals(gd.getString(1))){
				%>    
				<div class="block_row">
                    <div class="order_number">
                        <h2 class="block_title">
                            訂單編號：<%=gd.getString(1)%>
                        </h2>
                    </div>
                    <div class="order_date">
                        <h2 class="block_title" style="font-size:20px ;text-align:center";>
                            訂單日期：<%=gd.getString(13)%>
                        </h2>
                    </div>
                    <div class="cleaner"></div>
                    <hr class="order_line">
                </div>
				<%}}%>
                <!--訂單物品輸出START-->
				  
                <div class="block_info_square">
				<% ResultSet gdd;
				String orderiddd=request.getParameter("orderid");
				sql = "select * from order_product WHERE OrderEmail = '"+session.getAttribute("email")+"'";
				gdd=con.createStatement().executeQuery(sql);
				
				
				while(gdd.next())
				{
					if (orderiddd.equals(gdd.getString(1))){
						
						String na =gdd.getString(3);
					ResultSet pic;
					sql = "select * from product where GoodsName ='"+na+"'";
					pic=con.createStatement().executeQuery(sql);
				 
					if(pic.next()){
					%>
					
                    <div class="order_img">
                        <img src="../assets/images/product_img/<%=pic.getString(10)%>" width="100%" alt="">
                    </div>
					<%}%>
                    <div class="order_r_sq">
                        <div class="block_row">
                            <p class="block_admin_info">
                                <%=gdd.getString(3)%>
                            </p>
                            <div class="cleaner"></div>
                        </div>
                        <div class="block_row">
                            <p class="block_admin_info_title">
                                單價
                            </p>
                            <p class="block_admin_info">
                                <%=gdd.getString(4)%>
                                <!--輸出價格-->
                            </p>
                            <div class="cleaner"></div>
                        </div>
                        <div class="block_row">
                            <p class="block_admin_info_title">
                                數量
                            </p>
                            <p class="block_admin_info">
                                <%=gdd.getString(5)%>
                                <!--輸出數量-->
                            </p>
				
                            <div class="cleaner"></div>
							<%String aaa = gdd.getString (8); 
									if(aaa.equals("")){%>
                            <button class="block_info_msg_btn">留下評論</button>
                            <div class="panel">
                                <form action="order_info_assess.jsp">
								 <p class="star_title">暱稱：
								 <input type="text" name="showname"  style="font-size:13px "placeholder="輸入暱稱" value="<%=gdd.getString(7)%>" >
                                    </p>
									<div>
                                        <p class="star_title">&ensp;星級</p>
                                        <select name="star">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                        </select>
                                        <div class="cleaner"></div>
                                    </div>
									<textarea name="Info"  class="block_info_msg_te" placeholder="<%=gdd.getString(9)%>" value="<%=gdd.getString(9)%>"></textarea>
                                    <input type="hidden" name="orderid" value="<%=gdd.getString(1)%>">
                                    <input type="hidden" name="GoodsName" value="<%=gdd.getString(3)%>">
									<input type="hidden" name="OrderEmail" value="<%=gdd.getString(2)%>">
                                    <input type="submit" value="留言" class="block_info_msg_smt">
									<%}else{%>
							<div class="cleaner"></div>
											<button class="block_info_msg_btn">查看評論</button>
												<div class="panel">
														
														  <p class="star_title"><b>暱稱：</b><%=gdd.getString(7)%> </p>
															<div>
															
															<p class="star_title"><b>&ensp;星級：</b></p>
															
															<% String show=gdd.getString(8);
															
																int st = Integer.parseInt(show);
																while(st != 0){
																	
																out.print("✩");
																st=st-1;
																}
															
															%>
															
															<div class="cleaner"></div>
														</div>
											<textarea name=""  class="block_info_msg_te" placeholder="<%=gdd.getString(9)%>" readonly="readonly" value="<%=gdd.getString(9)%>"></textarea>
											<input type="hidden" name="" value="<%=gdd.getString(1)%>">
											<input type="hidden" name="" value="<%=gdd.getString(3)%>">
									<%}%>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="cleaner"></div>
                    <hr class="order_line">
					<%}}%>
                </div>
                <!--訂單物品輸出END-->


                <button onclick="history.back()" class="back_btn">  <p> ＜回到上一頁</P></button>
				
                <div class="order_total">
				<%
				String orderidddd=request.getParameter("orderid");
				sql = "Select `TotalPrice` From `order_product` Where `OrderEmail` = '" + session.getAttribute("email") + "'  AND `OrderID` ='"+orderidddd+"'" ;
				ResultSet tol =con.createStatement().executeQuery(sql);	
				int sum = 0;
				int i = 0;
				while(tol.next())
				{		
					i= Integer.parseInt( tol.getString(1) );
					sum += i;		
				}
				
				%>
                    <p>總價 $ <%=sum%></p>
                </div>
                <div class="cleaner"></div>
            </div>
        </div>
    </section>
    <footer>
        <div>
            <p class="footer_slogen">
                飲酒過量有礙健康，未成年請勿飲酒，禁止酒駕
            </p>
        </div>
        <div class="footer_block">
            <div class="footer25per">
                <div class="footer_block_s">
                    <p class="footer_minititle">
                        訪客人數
                    </p>
                    <hr class="footer_titleline">
                    <p class="footer_info">
                         <%out.print(count);%>
                    </p>
                </div>
                <div class="footer_block_s">
                    <p class="footer_minititle">
                        酒種分類
                    </p>
                    <hr class="footer_titleline">
                    <a href="products.jsp" class="footer_info">
                        全部
                    </a>
                    <a href="productsclass.jsp?classname=果實酒" class="footer_info">
                        果實酒
                    </a>
                    <a href="productsclass.jsp?classname=紅酒" class="footer_info">
                        紅酒
                    </a>
                    <a href="productsclass.jsp?classname=氣泡酒" class="footer_info">
                        氣泡酒
                    </a>
                </div>
            </div>
            <div class="footer25per">
                <div class="footer_block_s">
                    <p class="footer_minititle">
                        會員功能
                    </p>
                    <hr class="footer_titleline">
                    <a href="admin_info_center.jsp" class="footer_info">
                        修改資料
                    </a>
                </div>
                <div class="footer_block_s">
                    <p class="footer_minititle">
                        聯絡資訊
                    </p>
                    <hr class="footer_titleline">
                    <p class="footer_info">
                        ☏ : (03)039321321
                    </p>
                    <p class="footer_info">
                        No. 200, Zhongshan Rd.,
                    </p>
                    <p class="footer_info">
                        Zhongli Dist.,
                    </p>
                    <p class="footer_info">
                        Taoyuan City 320,
                    </p>
                    <p class="footer_info">
                        Taiwan (R.O.C.)
                    </p>
                </div>
            </div>
            <div class="footer50per">
                <div class="footer_ad_area">
                    <p class="footer_ad_up">
                        NO DRINK
                    </p>
                    <p class="footer_ad_down">
                        NO DRUNK
                    </p>
                </div>
            </div>

            <div style="clear: both;"></div>
        </div>
    </footer>
    <!--PANAL CONTRAL-->
    <script>
        var acc = document.getElementsByClassName("block_info_msg_btn");
        var i;

        for (i = 0; i < acc.length; i++) {
            acc[i].addEventListener("click", function() {
                this.classList.toggle("active");
                var panel = this.nextElementSibling;
                if (panel.style.maxHeight) {
                    panel.style.maxHeight = null;
                } else {
                    panel.style.maxHeight = panel.scrollHeight + "px";
                }
            });
        }
    </script>
    <!--BOOTSTRAP USE-->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</body></html>
