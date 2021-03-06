<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="counter.jsp" %>
<%
String searchitem = request.getParameter("search_item");
sql="SELECT * FROM `product` WHERE `GoodsName` = '"+searchitem+"' ";
ResultSet search=con.createStatement().executeQuery(sql);
if(search.next())
{%>
<!DOCTYPE html>

<html>

<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>商品頁</title><!--網頁 產品名稱輸出-->
    <link rel="stylesheet" href="../assets/css/item.css" type="text/css">
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
    <div class="bg_w">
        <div class="block_countainer">
            <div class="good_info">
                <div class="good_img">
                    <img src="../assets/images/product_img/<%=search.getString(10)%>">
                </div>
                <div class="good_text">
                    <form action="shoppingcart.jsp">
                        <h3 class="good_name">
                            <%=search.getString(1)%>
                        </h3>
                        <p class="price_text">
                            售價 $ <%=search.getString(8)%>
                        </p>
                        <p class="count_title">
                            數量：
                        </p>
                        <select name="goodcount" class="count_select">
                            <option value="1">1</option>
                            <option value="2">2</option>
                        </select>
                        <div class="cleaner"></div>
                    <input type="submit" value="加入購物車" class="add_cart_btn">
					<input type = "hidden" name="goodname" value =  "<%=search.getString(1)%>" >
					<input type = "hidden" name="goodprice" value =  <%=search.getString(8)%> >
					<input type = "hidden" name="Stock" value =  <%=search.getString(3)%> >
                    </form>
                </div>
                <div class="cleaner"></div>
            </div>
            <div class="good_introduction">
                <h4 class="good_big_title">
                    產品介紹
                </h4>
                <div class="row">
                    <div class="helf">
                        <p class="pre30">
                            名稱
                        </p>
                        <p class="pre70">
                            <%=search.getString(1)%>
                        </p>
                        <div class="cleaner"></div>
                    </div>
                    <div class="helf">
                        <p class="pre30">
                            產區
                        </p>
                        <p class="pre70">
                            <%=search.getString(4)%>
                        </p>
                        <div class="cleaner"></div>
                    </div>
                    <div class="cleaner"></div>
                </div>
                <div class="row">
                    <div class="helf">
                        <p class="pre30">
                            適合溫度
                        </p>
                        <p class="pre70">
                            <%=search.getString(5)%>
                        </p>
                        <div class="cleaner"></div>
                    </div>
                    <div class="helf">
                        <p class="pre30">
                            酒精濃度
                        </p>
                        <p class="pre70">
                            <%=search.getString(6)%>
                        </p>
                        <div class="cleaner"></div>
                    </div>
                    <div class="cleaner"></div>
                </div>
                <div class="row">
                    <div class="helf">
                        <p class="pre30">
                            醒酒時間
                        </p>
                        <p class="pre70">
                              <%=search.getString(7)%>
                        </p>
                        <div class="cleaner"></div>
                    </div>
                    <div class="cleaner"></div>
                </div>
            </div>
            <!--IMPORT HTML-->
			
			<jsp:include page="<%=search.getString(9)%>"/>

			
			
            <div class="comment_area">
                <h4 class="good_big_title">
                    評價
                </h4>
                <!--評論單一人區塊START-->
                <div class="row">
                    <div class="inrow">
                        <p class="row_title">名稱</p>
                        <p class="star">ADMIN</p>
                    </div>
                    <div class="inrow">
                        <p class="row_title">星級</p>
                        <p class="star">✩✩✩✩✩</p>
                    </div>
                    <div class="inrow">
                        <p>
                           It Just a long message.It Just a long message.It Just a long message.It Just a long message.It Just a long message. 
                        </p>
                    </div>
                </div>
                <!--評論單一人區塊END-->
                <div class="row">
                    <div class="inrow">
                        <p class="row_title">名稱</p>
                        <p class="star">ADMIN</p>
                    </div>
                    <div class="inrow">
                        <p class="row_title">星級</p>
                        <p class="star">✩✩✩✩✩</p>
                    </div>
                    <div class="inrow">
                        <p>
                           It Just a long message.It Just a long message.It Just a long message.It Just a long message.It Just a long message. 
                        </p>
                    </div>
                </div>
                <div class="row">
                    <div class="inrow">
                        <p class="row_title">名稱</p>
                        <p class="star">ADMIN</p>
                    </div>
                    <div class="inrow">
                        <p class="row_title">星級</p>
                        <p class="star">✩✩✩✩✩</p>
                    </div>
                    <div class="inrow">
                        <p>
                           It Just a long message.It Just a long message.It Just a long message.It Just a long message.It Just a long message. 
                        </p>
                    </div>
                </div>
            </div>
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
                    <a href="#網址" class="footer_info">
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
	out.println("<script>alert('查無此商品!');window.location(history.back());</script>");
}
%>