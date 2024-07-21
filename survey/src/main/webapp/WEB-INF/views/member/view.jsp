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
    #update{
            background-color: yellow;
            color: black;
           	font-weight: bolder;

    }
    #update:hover{
        color: white;
        background-color: orange;
        font-weight: bolder;    
    }
    #delete{
    	background-color: white;
        color: red;
        font-weight: bolder;
    }
    #delete:hover{
        background-color: red;
        color: white;
        font-weight: bolder;
    }	
</style>
<body>
<br>
<div class="form-container">
    <form name="joinForm">
        <table>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <h2>회원 정보 보기</h2>
                </td>
            </tr>
             <tr style="height: 30px;"></tr>
            <tr>
                <td class="label-text">
                    순번
                </td>
                <td>
                    <input type="text" readonly class="inputtext" name="memberName" value = "${resultDTO.memberNo }">
                </td>
            </tr>
            <tr style="height: 30px;"></tr>
            <tr>
                <td class="label-text">
                    이름
                </td>
                <td>
                    <input type="text" readonly class="inputtext" name="memberName" value = "${resultDTO.memberName }">
                </td>
            </tr>
            <tr style="height: 30px;"></tr>
            <tr>
                <td class="label-text">
                    성별
                </td>
                <td>
                    <input type="text" readonly class="inputtext" name="memberGender" value = "${resultDTO.memberGender}">
                </td>
            </tr>
            <tr style="height: 30px;"></tr>
            <tr>
                <td class="label-text">
                    아이디
                </td>
                <td>
                    <input type="text" readonly class="inputtext" name="memberId" value = "${resultDTO.memberId }">
                </td>
            </tr>
            <tr style="height: 30px;"></tr>
            <tr>
                <td class="label-text">
                    비밀번호
                </td>
                <td>
                    <input type="text" readonly class="inputtext" name="memberPasswd" value = "${resultDTO.memberPasswd }">
                </td>
            </tr>
            <tr style="height: 30px;"></tr>
            <tr>
                <td class="label-text">
                    전화번호
                </td>
                <td>
                    <input type="text" readonly class="inputtext-small" name="memberPhone2" value = "${resultDTO.memberPhone1 }">
                    -
                    <input type="text" readonly class="inputtext-small" name="memberPhone2" value = "${resultDTO.memberPhone2 }">
                    -
                    <input type="text" readonly class="inputtext-small" name="memberPhone3" value = "${resultDTO.memberPhone3 }">
                </td>
            </tr>
            <tr style="height: 30px;"></tr>
            <tr>
                <td class="label-text">
                    이메일
                </td>
                <td>
                    <input type="text" readonly class="inputtext-medium" name="memberEmail1" value = "${resultDTO.memberEmail1 }">
                    @
                    <input type="text" readonly class="inputtext-medium" name="memberEmail1" value = "${resultDTO.memberEmail2 }">
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
        </table>
        <button id = "update" type = "button" class="submit-btn" onClick = "goPage('update', '${resultDTO.memberNo }', '2' );" >수정하기</button>
        <br><br>
        <button id = "delete" type = "button" class="submit-btn" onClick = "sakje();">회원탈퇴</button>
    </form>
</div>



<script>
function goPage(value1, value2, value3){
		location.href = '${path}/member/'+value1 + '?memberNo=' + value2 + '&pageNumber__=' + value3;
	}
	
</script>

<script>
    function sakje() {
    	if(confirm('회원탈퇴 하시겠습니까?')){
    		//document.SaveForm.enctype = "multiplart/form-data";
    		document.joinForm.action = "${path}/member/deleteProc?memberNo=" + ${resultDTO.memberNo};
    		document.joinForm.method = "post"
    		document.joinForm.submit();
    	}
    }
</script>
</body>
</html>
