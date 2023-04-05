<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style>
    section {
      width:1000px;
      margin-top:50px;
      margin:auto;
   }
   section #table td{
     width:220px;
     vertical-align:top;
     height:320px;
     border:1px solid white;
     padding:3px;
   }
   section #table td div{
     width:220px;
   }
   section #table td:hover{
     border:1px solid purple; 
   }
 </style>
</head>
<body>
   <section>
     <!-- pimg, title, halin,price, 할인적용가격, 도착예정, 별점, 적립금 -->
     <table align="center" width="990" id="table">
      <tr>
     <c:forEach items="${plist}" var="pvo" varStatus="sts">
        
           <td width="220" onclick="location='pcontent?pcode=${pvo.pcode}'"> 
            <div align="center" style="height:140px"> <img src="../resources/pro/${pvo.pimg}" width="180" height="140"> </div>  
            <div> ${pvo.title}   </div>  
            <div> ${pvo.halin}%  <fmt:formatNumber value="${pvo.price}" type="number"/>원  </div>   
            <div> <fmt:formatNumber value="${pvo.price-(pvo.price*(pvo.halin/100))}" type="number"/>원  </div>  
            <div> ${pvo.bday} 도착예정  </div>  
            <div> 별점   </div>  
            <div><fmt:formatNumber value="${pvo.price*(pvo.juk/100)}" type="number"/>원 </div>  
          </td>
           <c:if test="${sts.count%4==0}">  
         </tr>
         <tr>
         </c:if>
       
     </c:forEach>
     </tr>
     <!--페이지출력 -->
     <tr>
     
       <td colspan="4" align="center">
       
       <c:if test="${pstart != 1}">
         <a href="plist?pcode=${pcode}&page=${pstart-1}"> << </a>
       </c:if>
       <c:if test="${pstart == 1}">
       <<
       </c:if>
       
       <c:if test="${page != 1}">
         <a href="plist?pcode=${pcode}&page=${page-1}"> < </a>
       </c:if>
       <c:if test="${page == 1 }">
           <
       </c:if>
       
       <c:forEach var="i" begin="${pstart }" end="${pend }">
        <c:if test="${page != i}">
         <a href="plist?pcode=${pcode}&page${i}"> ${i}  </a>
         </c:if>
         <c:if test="${page==i}">
           <span style="color:red;">${i} </span> 
          </c:if>
         </c:forEach>
         
       <c:if test="${page != chong}">
        <a href="plist?pcode=${pcode}&page=${page+1}"> > </a>
       </c:if>
       <c:if test="${page == chong}">
        >
       </c:if>
       
       <c:if test="${pend != chong}">
        <a href="plist?pcode=${pcode}&page=${pend+1}"> >> </a>
       </c:if>
       <c:if test="${pend == chong}">
        >>
       </c:if>
       
      </td>
    </tr>   
        
    </table>   
   </section>
</body>
</html>