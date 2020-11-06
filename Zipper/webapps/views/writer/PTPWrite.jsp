<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.min.js"></script>
<title>1 : 1 문의 글쓰기</title>
<style type="text/css">
	section {
		width: 1024px;
		margin-right: auto;
		margin-left: auto;
	}

	/*웹 제목 스타일*/
	#title {
		text-align: center;
	}
	
	.table2 tr,
	.table2 td {
		padding: 20px 0 20px 5px ;
		font-weight: bold;
		border-bottom: 1px solid black;
	}
	
	#btn{
		width : 80px;
		height : 30px;
		color : white;
		background-color : black;
		border : none;	
	}
	
	#btn:hover{
		background-color: #555;
		cursor: pointer;
	}
	textarea { 
		resize : none;
	}
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	<section>
		<div style="border-bottom : 1px solid black;">
		<h2 id="title">1 : 1 문의</h2>
		</div>
		
		<div id="textarea" align = "center">
		
			<form method = "post" action = "">
			
               			<table class = "table2" style="padding-top:10px; width : 85%;">
	                        <tr >
	                        	<td style="padding: 10px;">제목</td>
	                        	<td>
	                        		<input type = text name = title 
	                        			size=100 placeholder ="  제목을 입력해 주세요.">
	                        	</td>
	                        </tr>
	                        <tr>
	                        	<td colspan="2">
	                        		<textarea name = content cols=105 rows=15></textarea>
	                        	</td>
	                        </tr>
                        </table>

        	<div align="center" style="margin-top:50px;margin-bottom:80px;">
			<button onclick="summitPTP();" id="btn">작성</button>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button onclick="history.go(-1)" id="btn">취소</button>
			</div>
        		
        		<script>
					function summitPTP(){
						$("#uploadPTP").attr("action","<%= request.getContextPath()%>/PTPUpdate.bo");
					}
				</script>
        </form>
        
		</div>
		
	</section>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>