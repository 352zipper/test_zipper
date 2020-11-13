<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.zipper.board.model.vo.*" %>

<%
   ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<script src="<%= request.getContextPath() %>/resources/js/jquery-3.5.1.min.js"></script>
<title>Zipper Guide</title>

<style>

#navi { 
    list-style-type: none; 
    height: 50px; 
    padding: 0; 
    margin: 0;
}

#navi li { 
    float: left; 
    position: relative; 
    padding: 0; 
    line-height: 40px; 
    
}

#navi li a { 
    display: block; 
    
    font-weight:600; 
    font-size:20px;
    padding: 10px 30px; 
    color:black;
    text-decoration: none; 
}

#navi li a:hover {
    color: lightskyblue; 
}

#navi li:hover ul {
    opacity: 1;
}

#navi li ul li {
    float: none;
    height: 0;
    line-height: 0;
    background: none;
}

#navi li:hover ul li {
    height: 30px; 
    line-height: 30px;
    padding:5px 0;
}

#navi li ul li a {
    background: #211b74;
    font-family:"굴림"; 
    font-weight:600; 
    font-size:14px;
    color:rgb(16, 240, 240); 
}


#navi li {
    transition : all 0.5s;
    -webkit-transition : all 0.5s;
    -ms-transition : all 0.5s;
    -o-transition : all 0.5s;
    -moz-transition : all 0.5s;
}

#navi li a {
    transition: all 0.5s;
    -webkit-transition : all 0.5s;
    -ms-transition : all 0.5s;
    -o-transition : all 0.5s;
    -moz-transition : all 0.5s;
}

#navi li ul {
    transition: all 0.5s;
    -webkit-transition : all 0.5s;
    -ms-transition : all 0.5s;
    -o-transition : all 0.5s;
    -moz-transition : all 0.5s;
}

#navi li ul li {
    transition : height 0.5s;
    -webkit-transition : all 0.5s;
    -ms-transition : all 0.5s;
    -o-transition : all 0.5s;
    -moz-transition : all 0.5s;
}

#guide1  {
    padding : 0px 35px 0px 0px;
}

#guide2  {
    padding : 0px 35px 0px 0px;
}

#guide3  {
    padding : 0px 35px 0px 0px;
}

#guide4  {
    padding : 0px 50px 0px 0px;
}

#guide5  {
    padding : 0px 35px 0px 0px;
}

#guide6  {
    padding : 0px 35px 0px 0px;
}

#guide7  {
    padding : 0px 35px 0px 0px;
}

#guide8  {
    padding : 0px 50px 0px 0px;
}

section {
    
      width: 1024px;
      margin-left:auto;
      margin-right:auto;
   }
   .top {
        height :50px;
      top:0px;
      width: 1024px;    
   }   
   .title {
      text-align: center;
   }
      
   #back{
   position : absolute;
   top : 100px;
   left : 950px;
   height : 80px;
   width: 80px;
   position:relative;
   top:-110%;
   }
   
   
   #back:hover{
      cursor: pointer;
      transform: scale(1.2);
   }
   
   .writeBtn {
      width: 80px;
      height: 40px;
      background-color: black;
      border: none;
      color: white;
      cursor: pointer;
   }

</style>

</head>
<body>
<%@ include file="/views/common/header.jsp" %>
<section>
   
      
   <div class="top" style="border-bottom: 1px solid black;">
         
      <h2 class="title" align="center">ZIPPER GUIDE</h2>            
      <!-- 뒤로가기 -->
      <img src="<%= request.getContextPath() %>/resources/images/common/backButton.png" 
         alt="class1" id="back" onclick="goGuideMain()"> 
   </div>
   
   <!-- !PAGE CONTENT! -->
   
   
    
    <!-- First Photo Grid-->    
       <div id="navi-top">
   
   <ul id="navi">

        <li>
            <a href="#"> 전체 </a>
        </li>

        <li>
            <a href="#"> 셀프 인테리어 </a>            
        </li>

        <li>
            <a href="#">리모델링</a>
        </li>
        
      <li>
            <a href="#">가구 쇼핑 가이드</a>
         
      </li>
   </ul>
   
   </div>
   
   <!-- 게시글 시작 -->
    <div class="w3-row-padding w3-padding-16 w3-center">
    
    <% for(Board board : list) { %>
       <div class="w3-quarter" >
        <input type="hidden" value="<%= board.getBno() %>"/>
         <img src="<%= request.getContextPath() %>/resources/images/fileUpload/<%= board.getBoardfile() %>" style="width:258px;height:388px;" id="guide1" >
         <div class="bookmark">     
         </div>
         <h3><%= board.getBtitle() %></h3>
         <p style="overflow : hidden; height : 100px;">[가이드]<%= board.getBcontent()%></p>
         
         <p>인테리어</p>
       </div>
      <% } %>

  </div>
              
            <div align="center" style="margin: 10px;">               
            <% if(m != null && m.getMgrd().equals("A")) { %>   <!-- 회원등급이 'A'(관리자) 일 때, -->                   
            <button class="writeBtn" onclick="location.href='<%= request.getContextPath() %>/views/writer/guideWriter.jsp'">작성하기</button>            
            <% } %>            
            </div>
  
  

      <!-- Pagination -->
   <div style="text-align : center;">
      <button class="w3-bar-item w3-button w3-hover-black"
                onclick="location.href='<%= request.getContextPath() %>/selectList.gu?currentPage=1'"><<</button>
      <% if(currentPage <= 1){ %>
         <button class="w3-bar-item w3-button" disabled><</button>
      <% } else { %>
      <button class="w3-bar-item w3-button w3-hover-black"
            onclick="location.href='<%= request.getContextPath() %>/selectList.gu?currentPage=<%=currentPage - 1 %>'"><</button>
      <% } %>
      <% for(int p = startPage; p <= endPage; p++){
            if(p == currentPage){   
      %>
         <button class="w3-bar-item w3-button" disabled><%= p %></button>
      <%      }else{ %>
         <button class="w3-bar-item w3-button w3-hover-black"
               onclick="location.href='<%= request.getContextPath() %>/selectList.gu?currentPage=<%= p %>'"><%= p %></button>
      <%      } %>
      <% } %>
         
        <%  if(currentPage >= maxPage){  %>
      <button class="w3-bar-item w3-button" disabled>></button>
      <%  }else{ %>
      <button class="w3-bar-item w3-button w3-hover-black" 
            onclick="location.href='<%= request.getContextPath() %>/selectList.gu?currentPage=<%=currentPage + 1 %>'">></button>
      <%  } %>
      <button class="w3-bar-item w3-button w3-hover-black"
            onclick="location.href='<%= request.getContextPath() %>/selectList.gu?currentPage=<%= maxPage %>'">>></button>
   </div>
   
    </section>
    
    <%@ include file="/views/common/footer.jsp" %>
    <script>
       function goGuideMain() { 
      location.href = '<%= request.getContextPath() %>/index.jsp'; 
      }
       
       $(function(){
         $('.w3-quarter').click(function(){
            var bno = $(this).find('input').val();
            location.href = '<%= request.getContextPath()%>/selectOne.gu?bno=' + bno;
         });
      });
    </script>
</body>
</html>