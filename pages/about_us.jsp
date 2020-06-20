<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@include file="counter.jsp" %>
<html>

<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>關於我們</title>
    <link rel="stylesheet" href="../assets/css/about_us.css" type="text/css">
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
        <div class="bg_white">
            <div class="countainer_block">
                <div>
                    <div class="flip-card">
                        <div class="flip-card-inner">
                            <div class="flip-card-front">
                                <img src="../assets/images/page_element/lu01.jpg" alt="Avatar" style="width:300px;height:400px;">
                            </div>
                            <div class="flip-card-back">
                                <img src="../assets/images/page_element/lu02.jpg" alt="Avatar" style="width:300px;height:400px;">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="people_info">
                    <p class="people_info_word">
                        姓名：呂亮進
                    </p>
                    <p class="people_info_word">
                        生日：10月25日
                    </p>
                    <p class="people_info_word">
                        興趣：睡覺 看書
                    </p>
                    <p class="people_info_word">
                        專長：製圖 程式
                    </p>
                    <div class="social_media_icon_area">
                        <a target="_blank" href="https://www.facebook.com/tony13382">
                            <div class="social_icon">
                                <img src="../assets/images/page_element/fb_icon.png" width="100%">
                            </div>
                        </a>
                        <a target="_blank" href="https://www.instagram.com/liang_chin_ml/">
                            <div class="social_icon">
                                <img src="../assets/images/page_element/ig_icon.png" width="100%">
                            </div>
                        </a>
                        <div class="cleaner"></div>
                    </div>
                </div>
                <div>
                    <div class="flip-card">
                        <div class="flip-card-inner">
                            <div class="flip-card-front">
                                <img src="../assets/images/page_element/pon01.jpg" alt="Avatar" style="width:300px;height:400px;">
                            </div>
                            <div class="flip-card-back">
                                <img src="../assets/images/page_element/pon02.jpg" alt="Avatar" style="width:300px;height:400px;">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="people_info">
                    <p class="people_info_word">
                        姓名：彭冠慈
                    </p>
                    <p class="people_info_word">
                        生日：01月29日
                    </p>
                    <p class="people_info_word">
                        興趣：吃東西
                    </p>
                    <p class="people_info_word">
                        專長：睡覺
                    </p>
                    <div class="social_media_icon_area">
                        <a target="_blank" href="https://www.facebook.com/profile.php?id=100004073287605">
                            <div class="social_icon">
                                <img src="../assets/images/page_element/fb_icon.png" width="100%">
                            </div>
                        </a>
                        <a target="_blank" href="https://www.instagram.com/e55245/?hl=zh-tw">
                            <div class="social_icon">
                                <img src="../assets/images/page_element/ig_icon.png" width="100%">
                            </div>
                        </a>
                        <div class="cleaner"></div>
                    </div>
                </div>
                <div>
                    <div class="flip-card">
                        <div class="flip-card-inner">
                            <div class="flip-card-front">
                                <img src="../assets/images/page_element/hs01.jpg" alt="Avatar" style="width:300px;height:400px;">
                            </div>
                            <div class="flip-card-back">
                                <img src="../assets/images/page_element/hs02.jpg" alt="Avatar" style="width:300px;height:400px;">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="people_info">
                    <p class="people_info_word">
                        姓名：莊玉馨
                    </p>
                    <p class="people_info_word">
                        生日：12月7號
                    </p>
                    <p class="people_info_word">
                        興趣：編程、投資
                    </p>
                    <p class="people_info_word">
                        專長：吃
                    </p>
                    <div class="social_media_icon_area">
                        <a target="_blank" href="https://www.instagram.com/yu_hsin____/?hl=zh-tw">
                            <div class="social_icon">
                                <img src="../assets/images/page_element/ig_icon.png" width="100%">
                            </div>
                        </a>
                        <div class="cleaner"></div>
                    </div>
                </div>
                <div>
                    <div class="flip-card">
                        <div class="flip-card-inner">
                            <div class="flip-card-front">
                                <img src="../assets/images/page_element/ton01.jpg" alt="Avatar" style="width:300px;height:400px;">
                            </div>
                            <div class="flip-card-back">
                                <img src="../assets/images/page_element/ton02.jpg" alt="Avatar" style="width:300px;height:400px;">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="people_info">
                    <p class="people_info_word">
                        姓名：湯易鑫
                    </p>
                    <p class="people_info_word">
                        生日：10月13日
                    </p>
                    <p class="people_info_word">
                        興趣：打籃球
                    </p>
                    <p class="people_info_word">
                        專長：尋找美食
                    </p>
                    <div class="social_media_icon_area">
                        <a target="_blank" href="https://www.facebook.com/sean.young.526">
                            <div class="social_icon">
                                <img src="../assets/images/page_element/fb_icon.png" width="100%">
                            </div>
                        </a>
                        <a target="_blank" href="https://www.instagram.com/shane60704">
                            <div class="social_icon">
                                <img src="../assets/images/page_element/ig_icon.png" width="100%">
                            </div>
                        </a>
                        <div class="cleaner"></div>
                    </div>
                </div>
                <div class="cleaner"></div>
            </div>
        </div>
        <div class="bg_block">
            <div class="countainer_block">
                <div class="cleaner"></div>
                <div class="feedback_area">
                    <div class="feedback_title">
                        <h3>回饋表單</h3>
                    </div>
				<form action="content.jsp">
                    <div class="feedback_row">
                        <h4 class="feedback_input_title">姓名</h4>
                        <input type="text" class="feedback_inpt" name="name" placeholder="請填寫姓名">
                        <div class="cleaner"></div>
                    </div>
                    <div class="feedback_row">
                        <h4 class="feedback_input_title">E-MAIL</h4>
                        <input type="text" class="feedback_inpt" name="email" placeholder="請填寫E-Mail">
                        <div class="cleaner"></div>
                    </div>
                    <div class="feedback_row">
                        <h4 class="feedback_input_title">意見</h4>
                        <textarea name="msg" class="feedback_texta" placeholder="請填寫意見"></textarea>
                        <input type="submit" value="傳送" class="feedback_submit">
                </form>
						<div class="cleaner"></div>
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
