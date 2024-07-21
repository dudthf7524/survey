<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../_include/inc_header.jsp" %>

<style>
	 ul {
            list-style: none;
            padding: 0;
        }
        li {
            background: #eee;
            margin: 0.5em 0;
            padding: 1em;
            border-radius: 5px;
        }
        li:hover {
            background: #cac9c9;
        }
</style>
<h2>설문조사의 종류</h2>
       <ul>
        <c:forEach var = "dto" items = "${list}">
        
        <a href = "${path }/participate/surveystart?surveyNo=${dto.surveyNo}">
            <li>
                <h3>${dto.surveyTitle }</h3>
                <p>${dto.surveySubTitle }</p>
            </li>
         </a>   
        </c:forEach>		    
       </ul>
