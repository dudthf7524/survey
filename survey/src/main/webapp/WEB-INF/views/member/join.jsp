<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../_include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .form-container {
       
        padding: 20px;
        border-radius: 10px;
       
    }
    .inputtext {
        height: 20px;
        font-size: 15px;
        width: 300px;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.05);
        border: none;
    }
    .inputtext-small {
        width: 50px;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.05);
        border: none;
    }
    .inputtext-medium {
        width: 100px;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.05);
        border: none;
    }
    select {
        height: 28px;
        font-size: 15px;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.05);
        border: none;
    }
    .label-text {
        color: #555555;
        font-weight: bold;
    }
    .radio-container {
        display: flex;
        justify-content: space-between;
        width: 300px;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.05);
    }
    td {
        padding: 5px 15px;
    }
    td:first-child {
        padding-right: 30px;
    }
    .submit-btn {
        width: calc(400px + 15px * 2); 
        background-color: #a781ee;
        color: white;
        border: none;
        
        height: 50px;
        font-size: 16px;
        cursor: pointer;
        border-radius: 5px;
    }
</style>
<body>

<br>
<div class="form-container">
    <form name="joinForm">
        <table>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <h2>회원가입</h2>
                </td>
            </tr>
            <tr>
                <td class="label-text">
                    이름
                </td>
                <td>
                    <input type="text" placeholder="이름을 입력하세요" class="inputtext" name="memberName">
                </td>
            </tr>
             <tr>
            	<td></td>
            	<td><span id="resultName" style="color: red;"></span></td>
            </tr>
            <tr style="height: 30px;"></tr>
            <tr>
                <td class="label-text">
                    성별
                </td>
                <td>
                    <div class="radio-container">
                        <label><input type="radio" name="memberGender" value = "남">남자</label>
                        <label><input type="radio" name="memberGender" value = "여">여자</label>
                    </div>
                </td>
            </tr>
             <tr>
            	<td></td>
            	<td><span id="resultGender" style="color: red;"></span></td>
            </tr>
            <tr style="height: 30px;"></tr>
            <tr>
                <td class="label-text">
                    아이디
                </td>
                <td>
                    <input type="text" placeholder="아이디를 입력하세요" class="inputtext" name="memberId">
                </td>
                
            </tr>
            <tr>
            	<td></td>
            	<td><span id="resultId" style="color: red;"></span></td>
            </tr>
            <tr style="height: 30px;"></tr>
            <tr>
                <td class="label-text">
                    비밀번호
                </td>
                <td>
                    <input type="text" placeholder="비밀번호를 입력하세요" class="inputtext" name="memberPasswd">
                </td>
            </tr>
            <tr>
            	<td></td>
            	<td><span id="resultPasswd" style="color: red;"></span></td>
            </tr>
            <tr style="height: 30px;"></tr>
            <tr>
                <td class="label-text">
                    재확인
                </td>
                <td>
                    <input type="text" placeholder="비밀번호를 다시 한번 입력하세요" class="inputtext" name="memberPasswdChk">
                </td>
            </tr>
            <tr>
            	<td></td>
            	<td><span id="resultPasswdChk" style="color: red;"></span></td>
            </tr>
            <tr style="height: 30px;"></tr>
            <tr>
                <td class="label-text">
                    전화번호
                </td>
                <td>
                    <select name="memberPhone1">
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                    </select>
                    -
                    <input type="text" class="inputtext-small" name="memberPhone2">
                    -
                    <input type="text" class="inputtext-small" name="memberPhone3">
                </td>
            </tr>
             <tr>
            	<td></td>
            	<td><span id="resultPhone" style="color: red;"></span></td>
            </tr>
            <tr style="height: 30px;"></tr>
            <tr>
                <td class="label-text">
                    이메일
                </td>
                <td>
                    <input type="text" class="inputtext-medium" name="memberEmail1">
                    @
                    <select name="memberEmail2">
                        <option value="">직적입력</option>
                        <option value="naver.com">naver.com</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                    </select>
                </td>
            </tr>
            <tr>
            	<td></td>
            	<td><span id="resultEmail" style="color: red;"></span></td>
            </tr>
            <tr style="height: 30px;"></tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="button" class="submit-btn" onClick="join();">가입하기</button>
                </td>
            </tr>
            
        </table>
    </form>
</div>

<script>
    function join() {
    	
    	if (document.joinForm.memberName.value == '') {
            document.getElementById("resultName").innerHTML = "이름을 입력해주세요";
            document.joinForm.memberName.focus();
            return;
        }
    	
    	var genderChecked = false;
        var genderRadios = document.getElementsByName('memberGender');         
        for (var i = 0; i < genderRadios.length; i++) {
            if (genderRadios[i].checked) {
                genderChecked = true;
                break;
            }
        }

        if (!genderChecked) {
            document.getElementById("resultGender").innerHTML = "성별을 선택해주세요";
            return;
        }
    	
    	if (document.joinForm.memberId.value == '') {
            document.getElementById("resultId").innerHTML = "아이디를 입력해주세요";
            document.joinForm.memberId.focus();
            return;
        }
    	
    	if (document.joinForm.memberPasswd.value == '') {
            document.getElementById("resultPasswd").innerHTML = "비밀번호를 입력해주세요";
            document.joinForm.memberPasswd.focus();
            return;
        }
    	
    	if (document.joinForm.memberPasswdChk.value == '') {
            document.getElementById("resultPasswdChk").innerHTML = "비밀번호 확인을 입력해주세요";
            document.joinForm.memberPasswdChk.focus();
            return;
        }
    	
    	if (document.joinForm.memberPasswdChk.value != document.joinForm.memberPasswd.value) {
            document.getElementById("resultPasswdChk").innerHTML = "비밀번호가 서로 일치하지 않습니다.";
            document.joinForm.memberPasswdChk.focus();
            return;
        }
    	
    	if (document.joinForm.memberPhone1.value == '' || document.joinForm.memberPhone2.value == '' || document.joinForm.memberPhone3.value == '') {
            document.getElementById("resultPhone").innerHTML = "전화번호를 입력해주세요";
            document.joinForm.memberPhone1.focus();
            return;
        }
    	
    	if (document.joinForm.memberEmail1.value == '') {
            document.getElementById("resultEmail").innerHTML = "이메일을 입력해주세요";
            document.joinForm.memberEmail1.focus();
            return;
        }
    	
    	if (document.joinForm.memberEmail2.value == '') {
            document.getElementById("resultEmail").innerHTML = "이메일을 입력해주세요";
            document.joinForm.memberEmail2.focus();
            return;
        }
    	
    	if(confirm('회원가입을 진행하시겠습니까?')){
    		//document.DirForm.enctype = "multiplart/form-data";
    		document.joinForm.action = "${path}/member/joinProc";
    		document.joinForm.method = "post"
    		document.joinForm.submit();
    	}
    }
</script>
</body>
</html>
