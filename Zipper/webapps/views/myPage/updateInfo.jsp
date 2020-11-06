<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<body>

<%@ include file="../common/header.jsp" %>

<section>
	<h1 align="center">회원 정보 수정</h1>
	<hr />
	<br /><br />
	<form action="<%= request.getContextPath() %>/mUpdate.me" id="updateForm" method="post">
		<table align="center">
			<tr>
				<td style="width : 150px;">
					<h4>아이디</h4>
				</td>
				<td style="width : 150px;">
					&nbsp;<h4><%= m.getMid() %></h4>
				</td>
				<td style="width : 100px;">
					
				</td>
			</tr>
			<tr>
				<td>
					<h4>비밀번호</h4>
				</td>
				<td>
					<input type="password" size="20" name="userPwd_join" id="userPwd_join" class="form-control" placeholder="비밀번호" required="required" onchange="validate(this)">
				</td>
			</tr>
			<tr>
				<td>
					<h4>비밀번호 확인</h4>
				</td>
				<td>
					<input type="password" size="20" name="userPwd2" id="userPwd2" class="form-control" placeholder="비밀번호 확인" onchange="chkPwd()" required="required">
				</td>
			</tr>
			<tr>
				<td>
					<h4>닉네임</h4>
				</td>
				<td>
					<input type="text" size="20" name="userName" id="userName" class="form-control" placeholder="닉네임" required="required" value="<%= m.getMnick() %>">
				</td>
				<td></td>
			</tr>
			<tr>
				<td>
					<h4>연락처</h4>
				</td>
				<td>
					<input type="text" name="tel" id="tel" class="form-control" placeholder="010-0000-0000" onchange="validate(this)" value="<%= m.getMcontact() %>">
				</td>
			</tr>
			<tr>
				<td rowspan="3">
					<h4>주소</h4>
				</td>
				<td>
					<input type="text" size="20" name="zipCode" id="zipCode" class="form-control" placeholder="우편번호">
				</td>
				<td>
					&nbsp;<button type="button" class="btn btn-default" onclick="addrSearch();">주소검색</button>
				</td>
			</tr>
			<tr>
				
				<td colspan="2">
					<input type="text" size="20" name="address1" id="address1" class="form-control" placeholder="주소">
				</td>
			</tr>
			<tr>
				
				<td colspan="2">
					<input type="text" size="20" name="address2" id="address2" class="form-control" placeholder="상세주소">
				</td>
			</tr>
			<tr>
				<td>
					<h4>이메일</h4>
				</td>
				<td>
					&nbsp;<h4><%= m.getMemail() %></h4>					
				</td>
				<td>
				</td>
			</tr>
			<tr>
				<td>
					<h4>한줄 소개</h4>
				</td>
				<td colspan="2">
					<textarea class="form-control" name="intro" id="" cols="30" rows="10" style="resize: none;"><%= m.getIntro() %></textarea>
				</td>
			</tr>
		</table>
		<br />
		<div style="text-align: center;">
		<button type="button" class="btn btn-default" onclick="updateMember()">수정하기</button>
		<button type="button" class="btn btn-default" onclick="cancelUpdate()">수정취소</button>
		</div>
	</form>
		<br />
		<br />
		<br />
</section>
<script>
	$(function(){
		var addressArr = '<%= m.getAddress() %>'.split(', ');
		
		$('#zipCode').val(addressArr[0]);
		$('#address1').val(addressArr[1]);
		$('#address2').val(addressArr[2]);
		
	});
	
	/* 수정취소 */
	function cancelUpdate() {
		if(confirm("마이페이지로 돌아가시겠습니까?")){
			location.href='<%= request.getContextPath() %>/index.jsp';			
		}
	}
	
	/* 수정 */
	function updateMember() {
		if(confirm("수정하시겠습니까?")){
			$("#updateForm").submit();
		}
	}
	
	$("#updateForm").submit(function(event){
		if($("#userPwd_join").val() == "" ) alert("비밀번호는 필수 값입니다.");
		else if($('#userPwd_join').val() != $('#userPwd2').val()) alert("비밀번호 확인 값과 다릅니다.");
		else return;
		event.preventDefault();
	});

	/* 유효성체크 */
	function validate(obj){
	
		var validate = '';
		var valiMessage = '';
		var idChk = /^[a-z][a-z0-9_-]{3,11}$/; // (영문소문자+숫자 4~12자리, 영문소문자로 시작)
		var pwChk = /^[A-Za-z0-9_-]{4,18}$/; // (영문대소문자+숫자 6~18자리)
		var telChk = /^\d{2,3}-\d{3,4}-\d{4}$/;
		var emailChk = /^\w{4,12}$/; // \w = [a-zA-Z0-9_]
		
		var inputValue = $(obj).val(); 
		
		switch($(obj).attr('id')) {
		case 'userId_join':
			validate = /^[a-z][a-z0-9_-]{3,11}$/;
			valiMessage = '영문소문자+숫자 4~12자리, 영문소문자로 시작';
			break;
		case 'userPwd_join':
			validate = /^[A-Za-z0-9_-]{4,18}$/;
			valiMessage = '영문대소문자+숫자 6~18자리';
			break;
		case 'tel':
			validate = /^\d{2,3}-\d{3,4}-\d{4}$/;
			valiMessage = '전화번호 양식을 확인해주세요';
			break;
		case 'email':
			validate = /^\w{4,12}$/;
			valiMessage = '영문대소문자+숫자 4~12자리';
			break;
			
		}
			if(validate.test(inputValue)){
				console.log(11111);
			} else {
				console.log(valiMessage);
				$(obj).focus();
			}
	}
	
	/* 비밀번호 확인 */
	function chkPwd() {
		var pwd1 = $('#userPwd_join').val();
		var pwd2 = $('#userPwd2').val();
		
		if(!(pwd1 == pwd2)) {
			alert("비번이 다릅니다");
		}
	}
	
	// 참조 API : http://postcode.map.daum.net/guide
	function addrSearch() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $('#zipCode').val(data.zonecode); //5자리 새우편번호 사용
                
                $('#address1').val(fullAddr);

                // 커서를 상세주소 필드로 이동한다.
                $('#address2').focus();
            }
        }).open();
    };
    
</script>
</body>
</html>