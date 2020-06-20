<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@include file="counter.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
        integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>成立訂單</title>
    <link rel="stylesheet" href="../assets/css/create_order.css" type="text/css">
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
    </header>
    <section>
	<%
	sql = "Select `TotalPrice` From `shoppingcar` Where `User` = '" + session.getAttribute("email") + "' ";
	ResultSet abc =con.createStatement().executeQuery(sql);	
	int sum = 0;
	int i = 0;
	while(abc.next())
	{		
		i= Integer.parseInt( abc.getString(1) );
		sum += i;		
	}
	
	%>
        <div class="bg_block">
            <div class="block_container">
                <h3 class="title_word">
                    訂單總額 $<%=sum%>
                    <!--輸出金額-->
                </h3>
                <h3 class="title_word">
                    付款方式
                </h3>
                <form name="reg"action="orderpay.jsp">
				 
				<% sql="Select * From shoppingcar Where User ='" +session.getAttribute("email")+"'" ;
					ResultSet member =  con.createStatement().executeQuery(sql);
					if(member.next()){ %>
					<input type = "hidden" name="OrderEmail" value = "<%=member.getString(1)%>"> 
				
					
				<%}%>
                    <div class="payment_choose_area">
                        <label>
                            <input type="radio" name="payment_way" value="credit_card" class="radio_btn" checked>
                            <div class="radio_img">
                                <img src="../assets/images/page_element/credit_card.png" width="100%">
                            </div>
                        </label>
                        <label>
                            <input type="radio" name="payment_way" value="credit_card" class="radio_btn">
                            <div class="radio_img">
                                <img src="../assets/images/page_element/ATM.png" width="100%">
                            </div>
                        </label>
                        <label>
                            <input type="radio" name="payment_way" value="credit_card" class="radio_btn">
                            <div class="radio_img">
                                <img src="../assets/images/page_element/line_pay.png" width="100%">
                            </div>
                        </label>
                    </div>
                    <div class="input_row">
                        <h3 class="input_title_word">
                            收件人名稱
                        </h3>
                        <input type="text" class="input_sq" name="Name">
                        <div class="cleaner"></div>
                    </div>
                    <div class="input_row">
                        <h3 class="input_title_word">
                            收件人電話
                        </h3>
                        <input type="tel" class="input_sq" name="Phone">
                        <div class="cleaner"></div>
                    </div>
                    <div class="input_row">
                        <h3 class="input_title_word">
                            收件人地址
                        </h3>
                        <input type="text" class="input_sq" name="Address">
                        <div class="cleaner"></div>
                    </div>
                    <div id="card_area">
                        <div class="input_row">
                            <h3 class="input_title_word">
                                信用卡卡號
                            </h3>
                            <input type="number" class="input_sq" name="CardNum">
                            <div class="cleaner"></div>
                        </div>
                        <div class="input_row">
                            <h3 class="input_title_word">
                                持卡人姓名
                            </h3>
                            <input type="text" class="input_sq" name="CardName">
                            <div class="cleaner"></div>
                        </div>
                        <div class="input_row">
                            <h3 class="input_title_word">
                                ＣＶＤ號碼
                            </h3>
                            <input type="text" class="input_sq" name="CVD">
                            <div class="cleaner"></div>
                        </div>
                        <div class="input_row">
                            <h3 class="input_title_word">
                                信用卡期限
                            </h3>
                            <input type="text" class="input_sq" name="GoodThru" placeholder="(月/年 ex：0122)" max="9999" min="0">
                           
                            <div class="cleaner"></div>
                        </div>
                    </div>
                    <div id="atm_area">
                       <div class="input_row">
                            <h3 style="width: 100%; text-align: center;">
                                我們的帳戶號碼
                            </h3>
                            <h3 style="width: 100%; text-align: center;">
                                <b>(822)727540281727</b>
                            </h3>
                            <br>
                            <div class="cleaner"></div>
                        </div>
                        <div class="input_row">
                            <h3 class="input_title_word">
                                匯入帳號後四碼
                            </h3>
                            <input type="text" class="input_sq" name="ATMNum">
                            <div class="cleaner"></div>
                        </div>
                        <div class="input_row">
                            <h3 class="input_title_word" >
                                匯入帳號名稱
                            </h3>
                            <input type="text" class="input_sq" name="ATMName">
                            <div class="cleaner"></div>
                        </div>
                    </div>
					
					  
					
                    <div class="submit_row">
                        <input type="submit" value="完成訂單" class="submit_btn">
                    </div>
                </form>
				
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
                        ☏ : (03)9321321
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

    <script>
        function blockchange(mode) {
            if (mode == "card") {
                document.getElementById("card_area").style.display = "block";
                document.getElementById("atm_area").style.display = "none";
            }
            if (mode == "atm") {
                document.getElementById("card_area").style.display = "none";
                document.getElementById("atm_area").style.display = "block";
            }
        }

    </script>
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
