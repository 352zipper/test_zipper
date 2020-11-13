<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.5.1.min.js"></script>
<title>GUIDE UPLOAD</title>
<style>
	
	section {
		width: 1024px;
		margin-right: auto;
		margin-left: auto;
	}
	
	.writeBox {
		width: 700px;
		margin-top: 50px;
	}
	
	.imgBox {
		width:260px;
		height:220px;
		border:1px solid black;
		display: inline-block;
	}
	
	.imgBox:hover{
		cursor: pointer;
		background-color : black;
		
	}
	
	.input {
		text-align: right;
	
	}
		
	img{
		width:100%;
		height:100%;
	}
	
	
	
	/* ---------------------------------- */
	
	
	button {
		position: relative;
		margin-top: 600px;
		width: 100px;
		height: 50px;
		background-color: black;
		border: none;
		color: white;
		cursor: pointer;
	}
	
	
	
	
</style>
</head>
<body>
<%@ include file="/views/common/header.jsp"%>
	<section>
		<div class="titleBox" style="border-bottom: 1px solid black;">
			<h2 id="title" align="center">GUIDE</h2>
		</div>
		
		<form action="<%= request.getContextPath() %>/gInsert.gu?mno=<%= m.getMno() %>" method="post" enctype="multipart/form-data">
			 <table class="writeBox" align="center"> 
				<tr>
					<td>
						<div class="imgBox">
							<img class="titleImg" />
						</div>
					</td>
					
					<td>
						<div class="input">
							가이드 제목 : <input size="50" name="btitle"></input> <br />
							<br /><br />
							
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<br /><br />
						가이드 내용 : <br />
						<textarea name = "bcontent" cols="100" rows="5"></textarea>
				 	</td>
				 	<td></td>
				</tr>
			
				<tr>
					<td colspan="2" align="center">
					<br /><br />
						<button style="color: white;" type="submit" id="upload">작성</button>&nbsp;&nbsp;&nbsp;&nbsp;
						<button style="color: white;" onclick="cancel();" id="cancle">취소</button>
					</td>
					<td></td>
				</tr>
				
			</table>
				
				
				
				<div class="fileArea" id="fileArea">
					<input type="file" name="selectImg" id="selectImg" onchange="loadImg(this);" />
				</div>

        			
       		<script>

       			function cancel() {
					location.href = "<%= request.getContextPath() %>/community/guide.jsp";
				};
				
				// 사진 미리보기 기능
				$(function(){
					$('.imgBox').click(function(){
						$('#selectImg').click();
					});
					$('#fileArea').hide();
				});
			
				
				// 사진 db로 보내기
				function loadImg(img){
					if(img.files && img.files[0]) {
						
						var reader = new FileReader();
						
						reader.onload = function(e){
							
							$('.titleImg').attr('src', e.target.result);
						}
					}
					reader.readAsDataURL(img.files[0]);
				}

			</script>
		</form>
	</section>
</body>
</html>