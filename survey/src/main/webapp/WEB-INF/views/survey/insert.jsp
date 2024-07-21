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
        height: 50px;
        font-size: 20px;
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
        font-weight: bolder;
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
                <td colspan="2">
                    <h2>설문등록</h2>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" placeholder="설문의 제목을 입력해주세요" class="inputtext" name="surveyTitle">
                </td>
            </tr>
            <tr style="height: 30px;"></tr>
            <tr>
                <td>
                    <input type="text" placeholder="설문의 부제목을 입력해주세요" class="inputtext" name="surveySubTitle">
                </td>
            </tr>
            <tr style="height: 30px;"></tr>
             <tr>
                <td class="label-text">
                    설문 종료일
                </td>
               
            </tr>
            <tr>
                <td>
                    <input type="date" placeholder="이름을 입력하세요" class="inputtext" name="finalDate">
                </td>
            </tr>
            <tr style="height: 30px;"></tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="button" class="submit-btn" onClick="insert();">등록하기</button>
                </td>
            </tr>
        </table>
    </form>
</div>

<script>
    function insert() {
    	if(confirm('등록하시겠습니까?')){
    		//document.DirForm.enctype = "multiplart/form-data";
    		document.joinForm.action = "${path}/survey/insertProc";
    		document.joinForm.method = "post"
    		document.joinForm.submit();
    	}
    }
</script>
</body>
</html>
