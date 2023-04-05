<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admintop.jsp" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <style>
   section {
     width:1000px;
     margin:auto;
     margin-top:100px;
   }
   section #content {
     width:350px;
     height:100px;
     overflow:auto;
   }
   section table td {
     border-bottom:1px solid #cccccc;
     padding-top:5px;
     padding-bottom:5px;
   }
   section table tr:first-child td {
     border-bottom:1px solid #cccccc;
     padding-bottom:10px;
     padding-top:10px;
     font-size:18px;
     border-top:2px solid #cccccc;
   }
   section table tr:last-child td {
     border-bottom:2px solid #cccccc;
    }
    section table #del {
      border:1px solid purple;
      padding:3px;
      font-size:13px;
      cursor:pointer;
    }
  </style>
</head>
<body>
  <section>
     <table width="1000" align="center">
       <tr align="center">
         <td> 사용자 </td>
         <td> 상품명 </td>
         <td> 별점 </td>
         <td> 제목   내용 </td>
         <td> 작성일 </td>
         <td> 삭제 </td>
       </tr>
      <c:forEach items="${rlist}" var="rvo">
       <tr align="center">
         <td> ${rvo.userid} </td>
         <td> ${rvo.title2} </td>
         <td> ${rvo.star} </td>
         <td> <b>${rvo.title}</b> <p>  <div id="content">${rvo.content}</div> </td>
         <td> ${rvo.writeday} </td>
         <td> <span id="del" onclick="location='reviewdel?id=${rvo.id}'"> 삭제하기 </span> </td>
       </tr>
      </c:forEach>
     </table>
  </section>
</body>
</html>





