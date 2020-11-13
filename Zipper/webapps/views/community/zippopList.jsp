<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*, com.zipper.thumb.model.vo.*, com.zipper.board.model.vo.*" %>
<%
	ArrayList<Thumbnail> list = (ArrayList<Thumbnail>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Zip Pop 목록</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css">

   section {
      width: 1024px;
         margin-left: auto;
         margin-right: auto;
         position: relative;
         top: 30px;
   }
   
   
   #back {
      position : absolute;
      left : 950px;
      height : 80px;
      width: 80px;
      position:relative;
      top: -70px;      
   }
   
   #back:hover{
      cursor: pointer;
      transform: scale(1.2);
   }
   
   #title {
      margin-top: 100px;
      text-align: center;
   }
   
   
   
   .top {
      height :170px;
      position: fixed; 
      width: 1024px;
      top: 30px;
   }
  
   .left_page {
      display: inline-block;
      margin-top: 100px;
   
   }
   .right_page {
      position: fixed;
      display: inline-block;
      rigth: 30%;
      margin-left: 20px; 
      margin-top: 100px;
       
   }
    
    .outer{
      width : 1000px;
      height : auto;      
      color : black;
      margin-left : auto;
      margin-right : auto;
      margin-top : 50px;
   }
   .thumbnailArea {
      width:950px;
      height:auto;
      margin-left:auto;
      margin-right:auto;
   }
   .thumb-list {
      width:300px;
      border:1px solid white;
      display:inline-block;
      margin:5px;
      align:center;
   }
   .thumb-list:hover {
      opacity:0.8;
      cursor:pointer;
   }    
         
   .button {
      width: 100px;
      height: 50px;
      background-color: black;
      border: none;
      color: white;
      cursor: pointer;
   }
   
   .tabcontent_wrap {
      border: 2px solid black;
      width: 650px;
   }
   
   .page_wrap {
      paddig-top: 100px;
   }
   
   /* 상단부분 */
   #pageTop {
      height:30px;
   }
   
   #reverseImg {
      width: 80px;
      height: 80px;
      border: 0px;
   }
   
   #reverseBtn {
      background: white;
      width: 50px;
      height: 50px;
      border: 0px;
      left: 90%;
      position:relative;
      top:-210%; 
   }
   
   #reverseBtn:hover{
      cursor: pointer;
      transform: scale(1.2);
   }
   
   #reverseBtn:focus {
      outline: none;
   }

</style>
<script>
	function moveMain() {
		$(this).on('click', function() {
			location.href = "index.jsp";
		});
	}
	
	function zippopWriter() {
		$(this).on('click', function() {
			location.href = "<%= request.getContextPath() %>/views/writer/zippopWriter.jsp"
		});
	}
</script>
</head>
<body>
   <%@ include file="/views/common/header.jsp"%>
   
   <section>
      <div id="pageTop">
         <h2 align="center">ZIPPOP</h2>
         <button id="reverseBtn" onclick="moveMain();">
            <img id="reverseImg" src="<%= request.getContextPath() %>/resources/images/common/backButton.png" alt="뒤로가기" />
         </button>
      </div>
      <hr style="border:1px solid black;">
      
      <div class="thumbnailArea">
       
         <% for (Thumbnail t : list) { %>
         
            <div class="thumb-list" align="center">
               <div>
                  <input type="hidden" name="bno" value="<%= t.getBno() %>"/>
                  <img src="<%= request.getContextPath() %>/resources/images/zippopUploadFiles/<%= t.getBoardfile() %>" 
                     width="250px" height="250px"/>
               </div>
               <br />
               <p style="overflow : hidden; height : 100px;">
                  <%= t.getUserId()%>
                  <br /><br />
                  <%= t.getBcontent() %>
               </p>
            </div>
         <% } %>
         <br /><br />
      </div>
    <% if(m != null) { %>
		
		<div align="center" style="margin: 50px;">	
		<button class="button" onclick="zippopWriter()">작성하기</button>		
		</div>		
		
	<% } %>	
	
      <!--  이후 작업 필요 -->   
		<div style="text-align : center;">
			<button class="w3-bar-item w3-button w3-hover-black"
	       			onclick="location.href='<%= request.getContextPath() %>/zippop.zp?currentPage=1'"><<</button>
			<% if(currentPage <= 1){ %>
				<button class="w3-bar-item w3-button" disabled><</button>
			<% } else { %>
			<button class="w3-bar-item w3-button w3-hover-black"
					onclick="location.href='<%= request.getContextPath() %>/zippop.zp?currentPage=<%=currentPage - 1 %>'"><</button>
			<% } %>
			<% for(int p = startPage; p <= endPage; p++){
					if(p == currentPage){	
			%>
				<button class="w3-bar-item w3-button" disabled><%= p %></button>
			<%      }else{ %>
				<button class="w3-bar-item w3-button w3-hover-black"
						onclick="location.href='<%= request.getContextPath() %>/zippop.zp?currentPage=<%= p %>'"><%= p %></button>
			<%      } %>
			<% } %>
	         
	        <%  if(currentPage >= maxPage){  %>
			<button class="w3-bar-item w3-button" disabled>></button>
			<%  }else{ %>
			<button class="w3-bar-item w3-button w3-hover-black" 
					onclick="location.href='<%= request.getContextPath() %>/zippop.zp?currentPage=<%=currentPage + 1 %>'">></button>
			<%  } %>
			<button class="w3-bar-item w3-button w3-hover-black"
					onclick="location.href='<%= request.getContextPath() %>/zippop.zp?currentPage=<%= maxPage %>'">>></button>
		</div>
         <br><br>

	
   </section>

   <%@ include file="/views/common/footer.jsp"%>
   <script>
   $(function () {
		$('.thumb-list').click(function () {
			var bno = $(this).find('input').val();
			location.href ='<%= request.getContextPath()%>/zippopSelectOne.zp?bno=' + bno;
			
		});
	});
   </script>
</body>
</html>