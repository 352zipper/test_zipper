<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 상세보기</title>

<style type="text/css">

	.left_page {
		display: inline-block;
		margin-left: 60px;	
	
	}
	.right_page {
		 position: fixed;
		 display: inline-block;
		 rigth: 30%
	}
 	.ac a {
        display: block;
        color : black;
        text-decoration: none;
        margin: 0;
		padding: 10px;
		border-radius: 5px;
        }
        
	.ac p {
          padding: 0 10px;
          margin: 0;
          height: 0;
          overflow: hidden;
          transition: height 0.5s ease-in;
        }

	.ac:target p {
          overflow: auto;
          height: 100px;            
        }
        
	.pay {
	
		
	}
	
	button {
		width: 100px;
		height: 50px;
		background-color: black;
		border: none;
		color: white;
	}

</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	<div>
	<div class="left_page">
		<div><img src="../../resources/images/class/carouselImg/h.jpg" alt="" width="650px" height="650px"/></div>
		<h3>분위기 끝판왕 행거 만들기</h3>
	</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<div class="right_page">
		<h3>분위기 끝판왕 행거 만들기</h3> <br /><br />
		<table>
			<tr>
				<td width="200px">클래스 </td>
				<td> + 원</td>
			</tr>
			
			<tr>
				<td width="300px">
					<div class="ac" id="p1">
			        	<a href="#p1">재료</a>
			        	<p>노목 공+8 <br /> 몽키스페너 공+130 <br /> 안전모 방+200</p>
			    	</div>
				</td>
				<td style="vertical-align:top"> + 원</td>
			</tr>
		</table>
		
		<div  class="pay">
			<table>
			<tr>
				<td width="200px" height="400px">결제금액 </br> <h1>170000원</h1> </td>
				<td><br /><button onclick="goPayment();">결제</button><img onclick="" alt="" /> </td>
			</tr>
		</table>
		</div>
		
		
	</div>
	</div>
	
	
	<%@ include file="/views/common/footer.jsp"%>



	<script>
		function goPayment() {
			location.href = "<%= request.getContextPath() %>/views/payment/payment.jsp";
		};
		
	</script>
	
</body>
</html>