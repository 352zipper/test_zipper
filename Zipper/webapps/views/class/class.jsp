<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ page import="java.util.*, com.zipper.thumb.model.vo.*" %>
    <%
    ArrayList<Thumbnail> list = (ArrayList<Thumbnail>)request.getAttribute("list");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스</title>
<style>

    .classMain_carouselBox{
        display: block;
        width: 1024px;       
        border-top: 2px solid black;
    }  

    .main{
		position: absolute;
        display: block;
        width: 1024px;
        
    }   
    
    .carousel {
        text-align: center;
        
    
    }
    
    .cover {
		position: absolute;
    	width: 1024px;
        height: 450px;
        background: black;
        opacity: 0.2;
    }
    
    .carousel_img{
        width: 1024px;
        height: 450px;
    }
    
    .carousel_btn{
    	position: absolute;
    	
        width: 100%;
        color: white;
        font-size: 4em;
        z-index: 2;
    }
    
    .btn_left{
       	position: absolute;
        width: 50px;
        left: 5px;
        top: 200px;
        border: none;
        background: none;
        cursor: pointer;
    }
    
    .btn_right{
       	position: absolute;
        width: 50px;
        right: 5px;
        top: 200px;
        border: none;
        background: none;
        cursor: pointer;
    }
    
    .carousel_txt {
	    color: white;
	    position: absolute; 
	    top: -5px; 
	    right: 15px;
	    z-index: 990;
    	
    }
    
    .generic_box{
    	position: absolute; 
    	top: 400px;
	    width: 100%;
	    text-align: center;
	    z-index: 999;
    }
    
    .dot{
	    display: inline-block;
	    margin: 0 5px;
	    width: 10px;
	    height: 10px;
	    border: 1px solid white;
	    border-radius: 100%;
    }
    
    .now{background: white;}
    
    .classMain_classBox {
       	position: relative;
       	width: 1400px;
		margin-left : auto;
		margin-right : auto;    	
		margin-top: 400px;
    	}
    	
    .class_imgBox_wrap {
       	position: absolute;       	
       	width: 1300px;
		height:auto;
    	padding-top:100px;
    	margin: 60px;
    }
    .class_imgBox {
    	width: 310px;
        display: inline-block;
        
				
    }
    
    .class_img {
    
    }
    
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	<h1>클래스 page</h1>
	<div class="classMain_carouselBox">
        <div class="main">
            <div class="carousel_btn">
                <button class="btn_left" onclick="plusDivs(-1)">&#10094;</button>
                <button class="btn_right" onclick="plusDivs(1)">&#10095;</button>
            </div>
            <div class="carousel_box"><br />
                <div class="carousel">
                	<div class="cover"></div>
                    <img class="carousel_img" src="../../resources/images/class/carouselImg/m.jpg" />
                    <div class="carousel_txt">
                    	<h2>마크라메, <br />어디까지 해봤니?</h2>
                    </div>
                </div>
                <div class="carousel">
                	<div class="cover"></div>
                    <img class="carousel_img" src="../../resources/images/class/carouselImg/t.jpg" />
                    <div class="carousel_txt">
                    	<h2>너 시트지 붙여? <br /> 난 타일 붙여!</h2>
                    </div>
                </div>
                <div class="carousel">
                	<div class="cover"></div>
                    <img class="carousel_img" src="../../resources/images/class/carouselImg/h.jpg" />
                    <div class="carousel_txt">
                    	<h2>드레스룸을 쇼룸처럼! <br />분위기 끝판왕 행거 만들기</h2>
                    </div>
                </div>
            </div>
            <!-- <div class="generic_box">
                <div class="generic">
                    <div class="dot now"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                </div>
            </div> -->
        </div>
		<hr />
	</div>
	
	
	<div class="classMain_classBox">
		
		<div class="class_imgBox_wrap" >
		
			<div class="class_imgBox" >
				<div>
					<input type="hidden" name="bno" value=""/>
					<img class="class_img" src="<%=request.getContextPath()%>/resources/images/class/classUploadFiles/>"
					width="300px" height="200px"/> <!-- 나중에 바꿔야됨 -->
				</div>
				<p>
				제목<br />
				가격
				</p>
			</div>
			
			

			
		</div>
	</div>



	<script type="text/javascript">
		$(function () {
			$('.class_imgBox').click(function () {
				var bno = $(this).find('input').val();
				location.href ='<%= request.getContextPath()%>/selectOne.tn?bno=' + bno;
			})
		})
	
	</script>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	

	<script type="text/javascript">
		var slideIndex = 1;
		showDivs(slideIndex);

		function plusDivs(n) {
			showDivs(slideIndex += n);
			
		}

		function showDivs(n) {
			var i;
			var x = document.getElementsByClassName("carousel");
			if (n > x.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = x.length
			}
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			x[slideIndex - 1].style.display = "block";
			
		}
		
		
	</script>







	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>