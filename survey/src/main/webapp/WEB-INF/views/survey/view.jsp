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
        width: calc(300px + 15px * 2); 
        background-color: #a781ee;
        color: white;
        border: none;
        height: 50px;
        font-size: 16px;
        font-weight: bolder;
        cursor: pointer;
        border-radius: 5px;
    }
    .submit-btn:hover {
            background-color: #9765f5;
    }
    #update{
            background-color: yellow;
            color: black;
           

    }
    #update:hover{
        color: white;
        background-color: orange
            
    }
    #delete{
    	background-color: white;
        color: red;
    }
    #delete:hover{
        background-color: red;
        color: white;
    }	
</style>
<body>

<br>
<div class="form-container">
    <form name="joinForm">
    <input type="hidden" placeholder="설문의 제목을 입력해주세요" class="inputtext" name="surveyNo" value = "${surveyDTO.surveyNo }">
        <table>
            <tr>
                <td colspan="2">
                    <h2>설문 상세보기</h2>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" placeholder="설문의 제목을 입력해주세요" class="inputtext" name="surveyTitle" value = "${surveyDTO.surveyTitle }">
                </td>
            </tr>
            <tr style="height: 30px;"></tr>
            <tr>
                <td>
                    <input type="text" placeholder="설문의 부제목을 입력해주세요" class="inputtext" name="surveySubTitle" value = "${surveyDTO.surveySubTitle }">
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
                    <input type="date" placeholder="이름을 입력하세요" class="inputtext" name="finalDate" value = "${surveyDTO.finalDate }">
                </td>
            </tr>
            <tr style="height: 30px;"></tr>
           
        </table>
        <button type="button" id = "update" class="submit-btn" onClick="goPage2('update', '${surveyDTO.surveyNo }', '');">수정하기</button>
        <br><br>
        <button type="button" id = "delete" class="submit-btn" onClick="sakje();">설문 삭제하기</button>
   		<br><br>
   		<button type="button" class="submit-btn" onClick="goPage3('insert', '${surveyDTO.surveyNo }');">질문등록</button>
        <br><br>
        <button type="button" class="submit-btn" onClick="goPage3('list', '${surveyDTO.surveyNo }');">질문목록</button>
    </form>
</div>

<script>
    function sakje() {
    	if(confirm('삭제하시겠습니까?')){
    		//document.DirForm.enctype = "multiplart/form-data";
    		document.joinForm.action = "${path}/survey/deleteProc";
    		document.joinForm.method = "post"
    		document.joinForm.submit();
    	}
    }
</script>
<script>
	function goPage2(value1, value2, value3){
		location.href = '${path}/survey/'+value1 + '?surveyNo=' + value2;
	}
</script>
<script>
function goPage3(value1, value2){
		location.href = '${path}/surveyQnA/'+value1 + '?surveyNo=' + value2;
	
	}
</script>
</body>
</html>
