<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.5.1.min.js"></script>
<title>마이 페이지 메인</title>
<style type="text/css">
	
	/*웹 제목 스타일*/
	#title {
		text-align: center;
	}
	/*a태그 스타일*/
	div>a {  
		text-decoration: none;
		color: black;
		font-size : 20px;
		border: black solid; 
		border-width: 0 0 1px 0;
	 } 
	 
	div>a:visited { 
		text-decoration: none;
		color: black; 
	}
	
	div>a:hover{
		color: black;
		font-weight : bold;
		text-decoration: none;
		cursor : pointer;
	}
	/**/
	#colunm {
		width: 25%;
		height: 300px;
		padding: 30px;
		margin : 80px 0 100px 0;
	}
	
	#row:after {
		content: "";
		display: table;
	}
	
	section {
		clear: both;
		padding: 0 25px 60px 25px;
		margin : 0 60px;
	}
	
	section>div {
		text-align: center;
		border-left: 1px solid black;
		float: left;
	}
	
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>

	<section> <!-- 전체메뉴-->
		
	<h1 id="title">MY PAGE</h1>
	<br /><br />
	<hr style="width: 85%; border: solid 0.3px black;">
		
		<div id="colunm" style="border-left: none;">

			<h3>내 정보</h3>
			<br />
			<br /> 
			<br />
			<br />
			<a onclick="goUpdateInfo()">수정 하기</a>

		</div>

		<div id="colunm">
			<h3>커뮤니티</h3>
			<br />
			<br />
			<a onclick="goScrapList()">my_CLASS.zip</a> 
			<br /> <br /> 
			<a onclick="goClassList()"><%= m.getUserName() %>.CLASS</a>
			<br /> <br /> 
			<a onclick="goMyZip()"><%= m.getUserName() %>.zip</a>
		</div>

		<div id="colunm">
			<h3>내 구매내역</h3>
			<br />
			<br /> 
			<a onclick="goPayment()">결제 내역</a>
			<br /> 
			<br /> 
			<a onclick="goCanclePay()">취소 / 환불</a>
		</div>


		<div id="colunm">
			<h3>문의 내역</h3>
			<br />
			<br />
			<br />
			<br /> 
			<a onclick="goManToMan()">1 : 1 문의 내역</a>
		</div>


	<script>
		function goUpdateInfo() { // 정보 수정
			location.href = <%= request.getContextPath() %>"views/myPage/UpdateInfo.jsp"; 
		}
		function goScrapList() { // 클래스 스크랩
			location.href = <%= request.getContextPath() %>"/views/myPage/classScrap.jsp";
		}
		function goClassList() { //수강중 클래스 수정 필요
			location.href = <%= request.getContextPath() %>"/views/myPage/classScrap.jsp";
		}
		function goMyZip() { //내 zip페이지 수정필요
			location.href = <%= request.getContextPath() %>"/views/myPage/classScrap.jsp";
		}
		function goPayment() { //결제내역 수정필요
			location.href = <%= request.getContextPath() %>"/views/myPage/payment.jsp";
		}
		function goCanclePay() { //취소환불 수정필요
			location.href = <%= request.getContextPath() %>"/views/myPage/payment.jsp";
		}
		function goManToMan() { // 1:1문의
			location.href = <%= request.getContextPath() %>"/views/myPage/ManToMan.jsp";
		}
	</script>
	
	</section>
	
</body>
</html>