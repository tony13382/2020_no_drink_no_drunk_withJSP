<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@include file="counter.jsp" %>
<!DOCTYPE html>
<html>
<%if(session.getAttribute("email")!=null)
{
	session.removeAttribute("email");
out.print("<script>alert('已登出!請重新登入。'); window.location.href='login.jsp'; </script>");
}
%>
 <head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>登入</title>
    <link rel="stylesheet" href="../assets/css/login.css" type="text/css">
    <link href="../assets/css/basic_element.css" type="text/css" rel="stylesheet">
    <meta charset="UTF-8">
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
                <li class="header_li">聯絡我們</li>
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
        <div class="page_container">
            <div class="bg_block">
                <div class="block_container">
                    <form action="check.jsp">
                    <h2 class="block_title">
                        登入會員
                    </h2>
                    <div class="block_info_square">
                        <div class="block_row">
                            <p class="block_admin_info_title">
                                信箱：
                            </p>
                            <input type="email" name="email">
                            <div class="cleaner"></div>
                            <p class="block_admin_info_title">
                                密碼：
                            </p>
                            <input type="password" name="password" οnkeyup="value=value.replace(/[\W]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
                            <div class="cleaner"></div>

                            <div class="cleaner"></div>
                        </div>
                        <div class="block_row">
                            <input type="submit" value="送出資料" class="btn_black"></input>
                            <input type="reset" value="重設" class="btn_black"></input>
							<input type="button" onclick="javascript:location.href='register.jsp'" class="btn_black" value="切換註冊"></input>
                            <div class="cleaner"></div>
                        </div>
                    </div>
					</form>
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
