<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>     
    
<%@ include file="admintop.jsp" %>
 <style>
   section {
     width:1000px;
     margin:auto;
     margin-top:100px;
   }
   section table td {
     font-size:13px;
     text-align:center;
     height:30px;
   }
   section table #pr {
     text-align:right;
   }
   section table td span {
     border:1px solid purple;
     padding:2px;
     cursor:pointer;
   }
 </style> 
  <!-- admingumae.jsp -->
  <section>
     <table width="1000" align="center">
       <tr align="center">
      
         <td width="100"> 아이디 </td>
         <td width="300"> 상품명 </td>
         <td width="60"> 구매수량 </td>
         <td width="100"> 결제수단 </td>    
         <td width="80"> 결제금액 </td>  
         <td width="100"> 배송지역 </td>
         <td width="80"> 진행상태 </td>
         <td> 진행상태변경 </td>
       </tr>
      <c:forEach items="${glist}" var="map">
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
         <c:choose>
             <c:when test="${map.pay==0}">
               <c:set var="pay" value="계좌이체"/>
             </c:when>
             <c:when test="${map.pay==1}">
               <c:set var="pay" value="쿠페이머니"/>
             </c:when>
             <c:when test="${map.pay==2}">
               <c:set var="pay" value="신용/체크카드"/>
             </c:when>
             <c:when test="${map.pay==3}">
               <c:set var="pay" value="법인카드"/>
             </c:when>
             <c:when test="${map.pay==4}">
               <c:set var="pay" value="휴대폰"/>
             </c:when>
             <c:when test="${map.pay==5}">
               <c:set var="pay" value="무통장입금"/>
             </c:when>
           </c:choose>
       <tr>
         
         <td> ${map.userid} </td>
         <td> ${map.title} </td>
         <td> ${map.su}개 </td>
         <td> ${pay} </td>
         <td id="pr"> <fmt:formatNumber value="${map.cprice}" pattern="#,###"/>원 </td>
         <td> ${map.juso} </td>
         <td> ${state} </td>
         <td> 
            <!-- state에 따른 관리자의 변경 동작 -->
            <c:if test="${map.state == 0}">
              <span onclick="location='chgstate?state=1&id=${map.id}'"> 배송준비 </span>
            </c:if>
            <c:if test="${map.state == 1}">
              <span onclick="location='chgstate?state=2&id=${map.id}'"> 배송중 </span>
            </c:if>
            <c:if test="${map.state == 2}">
              <span onclick="location='chgstate?userid=${map.userid}&price=${map.price}&juk=${map.juk}&su=${map.su}&state=3&id=${map.id}'"> 배송완료 </span>
            </c:if>
            <c:if test="${map.state == 4}">
              <span onclick="location='chgstate?state=5&id=${map.id}'"> 취소완료 </span>
            </c:if>
           <c:if test="${map.state == 8}">
              <span onclick="location='chgstate?userid=${map.userid}&price=${map.price}&juk=${map.juk}&su=${map.su}&state=9&id=${map.id}'"> 반품완료 </span>
            </c:if>
            <c:if test="${map.state == 6}">
              <span onclick="location='chgstate?userid=${map.userid}&price=${map.price}&juk=${map.juk}&su=${map.su}&state=7&id=${map.id}'"> 교환완료 </span>
            </c:if>
         </td>
       </tr>
      </c:forEach> 
       
     </table>
      
  
  </section>   

</body>
</html>