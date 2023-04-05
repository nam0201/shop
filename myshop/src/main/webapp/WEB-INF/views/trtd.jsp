<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- trtd.jsp -->
 <!-- 1행에 td를 4개 출력하기 -->
   <table width="500" height="400" align="center" border="1">
   
     <tr>
       <c:forEach items="${list}" var="str" varStatus="sts">
           <td>${str}</td>
         <c:if test="${sts.count%4==0}">  
         </tr>
         <tr>
         </c:if>
       </c:forEach>
       </tr>
   </table>
 
 
 <hr>
 
   <table width="500" height="400" align="center" border="1">
   
     <tr>
       <c:forEach begin="1" end="24" var="i">
           <td> </td>
         <c:if test="${i%4 ==0}">  
         </tr>
         <tr>
         </c:if>
       </c:forEach>
       </tr>
   </table>
   
   <!-- format관련 -->
   100000<br>
   <fmt:formatNumber value="100000" type="number"/><br>
   <fmt:formatNumber vlaue="100000" type="currency" currencySymbol="$"/><br>
   <fmt:formatNumber value="0.11" type="percent"/> <br>
   <fmt:formatNumber value="123.4949942" pattern=".000"/>
</body>
</html>