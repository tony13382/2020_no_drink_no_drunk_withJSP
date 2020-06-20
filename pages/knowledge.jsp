<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@include file="counter.jsp" %>
<html>

<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>品酒小知識</title>
    <link rel="stylesheet" href="../assets/css/knowledge.css" type="text/css">
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
                <li class="header_li_focus">知識專區</li>
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
        <div class="bg_block">
            <div class="choose_row">
                <div class="ballon_list">
                    <div class="ballon_block">
                        <img src="../assets/images/page_element/ballon1.png" width="100%" alt="">
                    </div>
                    <h4 class="ballon_title">
                        <a href="#save" class="ballon_title">如何保存紅酒</a>
                    </h4>
                </div>
                <div class="ballon_list">
                    <div class="ballon_block">
                        <img src="../assets/images/page_element/ballon1.png" width="100%" alt="">
                    </div>
                    <h4 class="ballon_title">
                        <a href="#wakeup" class="ballon_title">紅酒醒酒的奧祕與技巧</a>
                    </h4>
                </div>
                <div class="ballon_list">
                    <div class="ballon_block">
                        <img src="../assets/images/page_element/ballon1.png" width="100%" alt="">
                    </div>
                    <h4 class="ballon_title">
                        <a href="#point" class="ballon_title">紅酒的12特點</a>
                    </h4>
                </div>
                <div class="cleaner"></div>
            </div>
        </div>
        <div class="bg_white">
            <div class="article_countainer">
                <h3 class="art_title" id="save">如何保存紅酒</h3>
                <img src="../assets/images/page_element/wine_point01.jpg" alt="" width="100%">
                <p class="art_text">
                    每倒完酒後，就將瓶塞塞回，酒瓶朝上（減少與空氣接觸面積）存放在18~20度的環境中，同時也盡量避免劇烈的溫度變化。如果有冰箱，就放冰箱吧！低溫會讓氧化過程減慢，使塞好的葡萄酒壽命延長3~5天。
                </p>
                <p class="art_text">
                    儲藏開過紅酒的三不：
                </p>
                <ol class="art_ol">
                    <li><a>別把酒瓶平放，這會讓和空氣接觸的面積增加。</a></li>
                    <li><a>別把酒放在窗戶旁 – 陽光的曝曬會加速氧化。</a></li>
                    <li><a>別把酒放在超過21度的環境 – 放在冰箱的冷藏庫吧！(千萬別放到冷凍庫)。</a></li>
                </ol>
                <a target="_blank" href="https://www.winentaste.com/magazine/tutorial_storing" class="art_readmore_btn">
                    更多資訊
                </a>
            </div>
            <div class="article_countainer">
                <h3 class="art_title" id="wakeup">紅酒醒酒的奧祕與技巧</h3>
                <img src="../assets/images/page_element/wine_point02.jpg" alt="" width="100%">

                <p class="art_text">
                    醒酒，其實就是讓酒與空氣接觸。隨著酒與氧氣的接觸面積／時間增加，加速葡萄酒中香氣綻放，也讓單寧軟化，創造柔順的口感。單寧是一種酚類物質，它存在於許多植物中，在茶葉也十分常見。它無色無香，但若你將泡完的茶葉放到舌頭上，在與唾液中的蛋白質反應後，會馬上感受到單寧的風味——嗯，又酸又澀...
                </p>
                <p class="art_text">
                    醒酒方式：
                </p>
                <ol class="art_ol">
                    <li><a>使用醒酒瓶換瓶（Decant）</a></li>
                    <li><a>杯中醒酒</a></li>
                </ol>
                <p class="art_text">
                    醒酒瓶的形狀非常多種，市面上最常見的醒酒瓶款式瓶身設計特別寬，以讓酒液與空氣的接觸面積到最大，有效地增加葡萄酒與空氣的接觸，能讓葡萄酒快速的綻開，但也有過度氧化的風險。若你不想特別花錢購買醒酒瓶，也可用空的透明瓶子將就使用。<br>要提醒你的是，換瓶（Decant）與醒酒並不是100%相同的概念。換瓶，將酒瓶中的酒倒入另外一個容器，多半是醒酒瓶，但目的可能有兩種。一種是醒酒，另外一個目的是減少沉澱物。若你看過波爾多的老酒，會發現底部常有許多的沉澱物，來自於色素、多醣與蛋白質。這些沉澱物未必對健康有害，但會影響酒的風味，讓它嚐起來又酸又澀。而通過換瓶，就能避開這些沉澱物了。
                </p>
                <p class="art_text">
                    杯中醒酒是最普遍醒酒的方法。就算只是放著，酒液也會與空氣接觸，最後拿到醒酒的效果。這個方法雖然沒有醒酒器來的快，但卻是我最建議的醒酒方法。杯中醒酒除了能自己掌握時間，降低過度氧化的風險外，一瓶真正的好酒，隨著時間的演進，能嚐到有數種不同的風味變化。一開始可能是草本味，30分鐘後是果香味，兩個鐘頭後是巧克力味…隨著時間的演變去喝，是享受葡萄酒的最大樂趣。
                </p>
                <a target="_blank" href="https://www.winentaste.com/magazine/tutorial_decant_wine" class="art_readmore_btn">
                    更多資訊
                </a>
            </div>
            <div class="article_countainer">
                <h3 class="art_title" id="point">紅酒的12特點</h3>
                <ol class="art_ol">
                    <li><a>
                            適量的飲用紅酒，比什麼都不喝來得更健康！
                        </a></li>
                    <li><a>
                            紅酒對身體的益處來自於單寧
                        </a></li>
                    <li><a>
                            某些紅酒比其他紅酒更健康
                        </a></li>
                    <li><a>
                            年輕的酒比陳年老酒來得健康
                        </a></li>
                    <li><a>
                            紅酒的顏色來自於葡萄皮
                        </a></li>
                    <li><a>
                            紅酒陳年後，顏色會越來越淡
                        </a></li>
                    <li><a>
                            幾乎所有的紅酒都來自於同一種類的葡萄
                        </a></li>
                    <li><a>
                            紅酒比白酒來得更古老
                        </a></li>
                    <li><a>
                            紅葡萄酒的亞硫酸鹽含量比白酒低
                        </a></li>
                    <li><a>
                            紅酒比白酒的陳年潛力更長
                        </a></li>
                    <li><a>
                            紅葡萄也能釀出白葡萄酒
                        </a></li>
                    <li><a>
                            葡萄可以產生數百種紅葡萄酒的氣味！
                        </a></li>
                </ol>
                <a target="_blank" href="https://www.winentaste.com/magazine/tutorial_redwine_secreat" class="art_readmore_btn">
                    更多資訊
                </a>
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
