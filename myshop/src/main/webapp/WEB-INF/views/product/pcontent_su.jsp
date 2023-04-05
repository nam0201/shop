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
      margin:auto;
   }
    section #title {
      width:1000px;
      height:500px;
      margin:auto;
    }
    section #title > #left {
      width:500px;
      height:500px;
      float:left;
    }
    section #title > #right {
      width:500px;
      height:500px;
      float:right;
    }
    section #suform {
      width:72px;
    }
    section  #suform #left {
      float:left;
    }
    section #suform #right {
      float:right;
    }
    section #suform #su {
      width:43px;
      height:30px;
      font-size:20px;
      text-align:center;
    }
    section #content {
      width:1000px;
      height:400px;
      margin:auto;
      background:yellow;
    }
    section #hugi {
      width:1000px;
      height:200px;
      margin:auto;
      background:red;
    }
    section #mun  {
      width:1000px;
      height:200px;
      margin:auto;
      background:pink;
    }
    section #etc {
      width:1000px;
      height:300px;
      margin:auto;
      background:blue;
    }
 </style>
</head>
<body>
   <section>
      <div id="title">
        <div id="left"><img src="../resources/pro/${pvo.pimg}" width="400"></div>
        <div id="right">
          <div> ${pvo.title}</div>
          <div> 별점 </div>
          <hr>
          <div> ${pvo.halin}% <fmt:formatNumber value="${pvo.price}" type="number"/>원</div>
          <div> <fmt:formatNumber value="${pvo.price-(pvo.price*(pvo.halin/100))}" pattern="#,###" type="number"/>원</div>
          <div> <fmt:formatNumber value="${pvo.price*(pvo.juk)}" pattern="#,###" type="number"/>원</div>
          <div>
             <c:if test="${pvo.baesong==0}">
                               무료배송
             </c:if>
              <c:if test="${pvo.baesong!=0}">
                <fmt:formatNumber value="${pvo.baesong}" pattern="#,###" type="number"/>원                          
             </c:if>
            </div>
            
            <c:choose>
              <c:when test="${pvo.yoil==1}">
                <c:set var="yoil2" value="일"/>
               </c:when>
                <c:when test="${pvo.yoil==2}">
                <c:set var="yoil2" value="월"/>
               </c:when>  
                <c:when test="${pvo.yoil==3}">
                <c:set var="yoil2" value="화"/>
               </c:when>  
                <c:when test="${pvo.yoil==4}">
                <c:set var="yoil2" value="수"/>
               </c:when>  
                <c:when test="${pvo.yoil==5}">
                <c:set var="yoil2" value="목"/>
               </c:when>  
                <c:when test="${pvo.yoil==6}">
                <c:set var="yoil2" value="금"/>
               </c:when>  
                <c:when test="${pvo.yoil==7}">
                <c:set var="yoil2" value="토"/>
               </c:when>  
             </c:choose>    
             <div> ${yoil2} ${pvo.bday}배송예정</div>
           <div> 제조사 : ${pvo.made}</div>
           <div id="suform"> 
              <div id="left"> <input type="text" name="su" size="2" id="su"> </div>
              <div id="right"> 
                <div><img src="../resources/img/top.png"></div>
                <div><img src="../resources/img/bottom.png"></div>
              </div>        
           </div>
           <div style="clear:both;"> wish  장바구니  구매하기 </div>
           
        </div>
        
      </div>
      <div id="content"></div>
      <div id="hugi"></div>
      <div id="mun"></div>
      <div id="etc"></div>
      
   </section>
</body>
</html>
