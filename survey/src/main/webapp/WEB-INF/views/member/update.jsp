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
    <form name="updateForm">
    	<input type="hidden" class="inputtext" name="memberNo" value = "${resultDTO.memberNo }">
        <table>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <h2>회원 정보 수정</h2>
                </td>
            </tr>
            <tr style="height: 30px;"></tr>
            <tr>
                <td class="label-text">
                    이름
                </td>
                <td>
                    <input type="text" placeholder="이름을 입력하세요" class="inputtext" name="memberName" value = "${resultDTO.memberName }">
                </td>
            </tr>
            <tr style="height: 30px;"></tr>
            <tr>
                <td class="label-text">
                    성별
                </td>
                <td>
                    <div class="radio-container">
                        <label><input type="radio" name="memberGender" value = "남"  <c:if test = "${resultDTO.memberGender == '남' }">checked</c:if>>남자</label>
                        <label><input type="radio" name="memberGender" value = "여"  <c:if test = "${resultDTO.memberGender == '여' }">checked</c:if>>여자</label>
                    </div>
                </td>
            </tr>
            <tr style="height: 30px;"></tr>
            <tr>
                <td class="label-text">
                    아이디
                </td>
                <td>
                    <input type="text" placeholder="아이디를 입력하세요" class="inputtext" name="memberId" value = "${resultDTO.memberId }">
                </td>
            </tr>
            <tr style="height: 30px;"></tr>
            <tr>
                <td class="label-text">
                    비밀번호
                </td>
                <td>
                    <input type="text" placeholder="비밀번호를 입력하세요" class="inputtext" name="memberPasswd" value = "${resultDTO.memberPasswd }">
                </td>
            </tr>
            <tr style="height: 30px;"></tr>
            <tr>
                <td class="label-text">
                    전화번호
                </td>
                <td>
                    <select name="memberPhone1">
                        <option value="010" <c:if test = "${resultDTO.memberPhone1 == '010' }">selected</c:if>>010</option>
                        <option value="011" <c:if test = "${resultDTO.memberPhone1 == '011' }">selected</c:if>>011</option>
                        <option value="016" <c:if test = "${resultDTO.memberPhone1 == '016' }">selected</c:if>>016</option>
                    </select>
                    -
                    <input type="text" class="inputtext-small" name="memberPhone2" value = "${resultDTO.memberPhone2 }">
                    -
                    <input type="text" class="inputtext-small" name="memberPhone3" value = "${resultDTO.memberPhone3 }">
                </td>
            </tr>
            <tr style="height: 30px;"></tr>
            <tr>
                <td class="label-text">
                    이메일
                </td>
                <td>
                    <input type="text" class="inputtext-medium" name="memberEmail1" value = "${resultDTO.memberEmail1 }">
                    @
                    <select name="memberEmail2">
                        <option value="">직적입력</option>
                        <option value="naver.com" <c:if test = "${resultDTO.memberEmail2 == 'naver.com' }">selected</c:if>>naver.com</option>
                        <option value="gmail.com" <c:if test = "${resultDTO.memberEmail2 == 'gmail.com' }">selected</c:if>>gmail.com</option>
                        <option value="hanmail.net" <c:if test = "${resultDTO.memberEmail2 == 'hanmail.net' }">selected</c:if>>hanmail.net</option>
                    </select>
                </td>
            </tr>
            <tr style="height: 30px;"></tr>
            <tr>
                <td class="label-text">
                    가입일
                </td>
                <td>
                    <input type="text" class="inputtext" name="joinDate" value = "${resultDTO.joinDate }" readonly>
                </td>
            </tr>
            <tr style="height: 30px;"></tr>
            <tr>
                <td colspan="2" align="center">
                    <button type = "button" class="submit-btn" onClick = "update();" >수정하기</button>
                </td>
            </tr>
        </table>
    </form>
</div>



<script>
    function update() {
    	if(confirm('수정하시겠습니까?')){
    		//document.DirForm.enctype = "multiplart/form-data";
    		document.updateForm.action = "${path}/member/updateProc";
    		document.updateForm.method = "post"
    		document.updateForm.submit();
    	}
    }
</script>
</body>
</html>
