<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@include file="counter.jsp" %>
<html onload="location.reload()">
<%if(session.getAttribute("email")==null)
{
 out.print("<script>alert('請先登入會員'); window.location='login.jsp' </script>");
}
%>
<%sql="SELECT * FROM `shoppingcar` WHERE `User` = '"+session.getAttribute("email")+"' ";
	ResultSet car=con.createStatement().executeQuery(sql);
	if(car.next())
    {%>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>購物車</title>
    <link rel="stylesheet" href="../assets/css/shopping_cart_list.css" type="text/css">
    <link href="../assets/css/basic_element.css" type="text/css" rel="stylesheet">
    <meta charset="utf-8">
		<script>
		function add( input )
		{
			var element = document.getElementById( input );
			element.value = parseInt( element.value ) + 1;
		}
		
		function test( input )
		{
			var element = document.getElementById( input );
			if( parseInt( element.value ) <= 1 )
			{															
				element.value = 1;
			}
			else
			{
				element.value = parseInt( element.value ) - 1;
			}
		}
	</script>
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
                <li class="header_li" >商品總覽</li>
            </a>
            <a href="knowledge.jsp" style="float: left">
                <li class="header_li">知識專區</li>
            </a>
            <a href="about_us.jsp" style="float: left">
                <li class="header_li_focus">聯絡我們</li>
            </a>
        </ul>
		
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
    </header>
    <section>       
        <div class="bg_block">
		<% 
			sql= "Select * From shoppingcar Where User = '" + session.getAttribute("email") + "' ";
			ResultSet shoping =con.createStatement().executeQuery(sql);
		

			int i = 1;
			while ( shoping.next() )
			{
			%>
		     <% 
			 int ab = Integer.parseInt( shoping.getString(4) ) * Integer.parseInt( shoping.getString(5) );
			 String ans = Integer.toString(ab);
			 sql="Update `shoppingcar` set `TotalPrice` = '" + ab + "'  Where `GoodsName` = '" + shoping.getString(3) + "' AND `User` = '" + session.getAttribute("email") + "' ";
			 con.createStatement().execute(sql);
			 %>
            <!--單一商品列表START-->
            <div class="single product">
                <div class="block_container">
                    <div class="cart_image">
                        <img src="../assets/images/product_img/<%=shoping.getString(2)%>" width="200px">
                    </div>
                    <div class="cart_r_sq">
                        <p class="cart_produce_name">
                            <%=shoping.getString(3)%>
                        </p>
                        <p class="cart_product_title">
                            單價
                        </p>
                        <p class="cart_product_price">
                            $<%=shoping.getString(4)%>
                        </p>
                        <div class="cleaner"></div>
                        <p class="cart_product_title">
                            數量
                        </p>
                        <div class="cart_selector" style="width:200px; margin-top:0px;">
						
                            <form action="countamount2.jsp" style="float: left;">
                                <input type="hidden" name="productid" value="<%=shoping.getString(3)%>" > <!--減少-->
                                <input type="submit" name="count_type" value="-" class="submit_btn" onclick= "test( 'input_num<%=i%>' )" >
						    </form>
							<input type = "text" class = "submit_btn" value="<%=shoping.getString(5)%>" name = "amount" id = "input_num<%=i%>" onfocus="this.blur()" readonly="readonly" style="text-align:center;">
						    <form action="countamount.jsp"style="float: left;">
								<input type="hidden" name="productid" value="<%=shoping.getString(3)%>" >
                                <input type="submit" name="count_type" value="+" class="submit_btn"  onclick= "add( 'input_num<%=i%>' )"> <!--加上-->
						    </form>
						
                        </div>
                        <div class="cleaner"></div>
                    </div>
                    <div class="cleaner"></div>

                    <div class="del_cart_btn">
                        <form action="deleteshoppingcart.jsp">
                            <input type="hidden" name="productid" value="<%=shoping.getString(3)%>">
                            <input type="submit" class="sub_btn" value="×">
                        </form>
                    </div>
                </div>
            </div>
            <div class="cart_gap_line"></div>
			
			<%
				
			}%>
            <!--單一商品列表END-->
            
            <div class="cart_gap_line"></div>
            <div class="next_container">
                <a href="create_order.jsp" class="next_btn">下一步</a>
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

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</body></html>
	<%}
	else
	{
		out.println("<script>alert('目前沒有商品在購物車喔!');window.location(history.back());</script>");
	}
	%>
