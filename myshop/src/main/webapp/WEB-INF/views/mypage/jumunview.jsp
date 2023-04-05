<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>     
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
   section {
      width:1000px;
      margin:auto;
      margin-bottom:30px;
   }
   section table {
     border-spacing:0px;
   }
   section table td {
     border-bottom:1px solid #cccccc;
     height:103px;
   }
   section table tr:first-child td {
     border-top:3px solid #cccccc;
   } 
   section table tr:nth-last-child(1)  td {
     border-bottom:3px solid #cccccc;
   }  
   section table span {
     display:block;
     width:80px;
     height:20px;
     font-size:13px;
     border:1px solid purple;
     margin-top:3px;
     cursor:pointer;
   }
  </style>
</head>
<body>       
   <section>
     <table width="1000" align="center">
       <caption> <h2> 주문 목록 </h2> </caption>
       <c:forEach items="${tmap}" var="map"> 
         <c:if test="${map.state==0}">
           <c:set var="state" value="결제완료"/>
         </c:if>
         <c:if test="${map.state==1}">
           <c:set var="state" value="배송준비"/>
         </c:if>
         <c:if test="${map.state==2}">
           <c:set var="state" value="배송중"/>
         </c:if>
         <c:if test="${map.state==3}">
           <c:set var="state" value="배송완료"/>
         </c:if>
         <c:if test="${map.state==4}">
           <c:set var="state" value="취소신청중"/>
         </c:if>
         <c:if test="${map.state==5}">
           <c:set var="state" value="취소완료"/>
         </c:if>
         <c:if test="${map.state==6}">
           <c:set var="state" value="교환신청중"/>
         </c:if>
         <c:if test="${map.state==7}">
           <c:set var="state" value="교환완료"/>
         </c:if>
         <c:if test="${map.state==8}">
           <c:set var="state" value="반품신청중"/>
         </c:if>
         <c:if test="${map.state==9}">
           <c:set var="state" value="반품완료"/>
         </c:if>
         <tr align="center">
           <td width="140"> ${map.writeday} 주문 </td>
           <td width="80"> <img src="../resources/pro/${map.pimg}" width="50" height="40"> </td>
           <td width="300"> ${map.title} </td>
           <td width="40"> ${map.su}개 </td>
           <td width="100" align="right"> <fmt:formatNumber value="${map.cprice}" pattern="#,###"/>원 </td>
           <td width="140"> ${state} </td>
           <td width="200">
           <c:if test="${map.state==0 || map.state==1}">
            <span onclick="location='chgstate?state=4&id=${map.id}'"> 취소신청 </span>
           </c:if>
           
           <c:if test="${map.state==3}">
            <span onclick="location='chgstate?state=6&id=${map.id}'"> 교환신청 </span>
           </c:if> 
           
           <c:if test="${map.state==3}">
            <span onclick="location='chgstate?state=8&id=${map.id}'"> 반품신청 </span>
           </c:if>
           
           <c:if test="${map.state==3}">
              <c:if test="${map.hugi==0}">
                 <span onclick="location='review?guid=${map.id}'"> 상품후기 </span>
              </c:if>
              <c:if test="${map.hugi==1}">
                 <span style="border-color:#cccccc"> 상품후기 </span>
              </c:if> 
           </c:if>  
           
           <c:if test="${map.state==4}">  <!-- 결제완료로 state변경 -->
            <span onclick="location='chgstate?state=0&id=${map.id}'"> 신청취소 </span>
           </c:if>
           <c:if test="${map.state==6 || map.state==8}">  <!-- 배송완료로 state변경 -->
            <span onclick="location='chgstate?state=3&id=${map.id}'"> 신청취소 </span>
           </c:if>
           
           </td>  
         </tr>
       </c:forEach>
     </table>
   </section>
</body>
</html>