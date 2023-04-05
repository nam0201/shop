<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <style>
    section {
      width:400px;
      margin:auto;
    }
    section div {
      line-height:10px;
    }
    section .myjuso {
      width:350px;
      height:160px;
      border:1px solid #cccccc;
      padding:8px;
      margin-left:13px;
    }
    #left , #right {
      display:inline-block;
      width:40px;
      height:20px;
      border:1px solid #cccccc;
      font-size:14px;
      text-align:center;
      padding-top:6px;
    }
    #right {
      margin-left:254px;
    }
    #chuga {
      text-align:center;
      margin-top:6px;
    }
    #chuga input {
      width:367px;
      height:40px;
      border:1px solid #cccccc;
      background:white;
      margin-left:-5px;
    }
  </style>
  <script>
    function init()
    {
   	   document.getElementById("gib").style.borderColor="blue";
    }
    function gumae_move(id,n,g,j,p,c,cla)
    {
    	opener.document.gform.id.value=id; 
    	opener.document.gform.cla.value=cla; 
    	var gibon="";
    	if(g==1)
    		gibon="기본배송지";
    	
    	opener.document.getElementsByClassName("my")[0].innerText=n;
    	opener.document.getElementsByClassName("my")[1].innerText=gibon;
    	opener.document.getElementsByClassName("my")[2].innerText=j;
    	opener.document.getElementsByClassName("my")[3].innerText=p;
    	opener.document.getElementsByClassName("my")[4].innerText=c;
    	
    	close();
    }
  </script>
</head>
<body onload="init()">
  <section>
     <c:forEach items="${blist}" var="bvo">
       <c:if test="${bvo.gibon==1}">
         <c:set var="tt" value="id='gib'"/>
       </c:if>
       <c:if test="${bvo.gibon!=1}">
         <c:set var="tt" value=""/>
       </c:if>
       <div class="myjuso" ${tt}>
         ${bvo.name} <p>
         <c:if test="${bvo.gibon == 1}">
          <span> 기본배송지 </span> <p>
         </c:if>
         ${bvo.juso} ${bvo.juso_etc} <p>
         ${bvo.phone} <p>
         <!-- 배송방법 : cla =>  0:문앞, 1:직접 받고 부재시 문 앞 , 2:경비실, 3:택배함 -->
         <c:if test="${bvo.cla==0}">
           <c:set var="cla" value="문 앞"/>
           <span> 문 앞 </span>
         </c:if>
         <c:if test="${bvo.cla==1}">
           <c:set var="cla" value="직접받고 부재시 문 앞"/>
           <span> 직접 받고 부재시 문 앞 </span>
         </c:if>
         <c:if test="${bvo.cla==2}">
           <c:set var="cla" value="경비실"/>
           <span> 경비실 </span>
         </c:if>
         <c:if test="${bvo.cla==3}">
           <c:set var="cla" value="택배함"/>
           <span> 택배함 </span>
         </c:if>
         <p>
         <span id="left" onclick="bae_up(${bvo.id})">수정</span>
         <span id="right" onclick="gumae_move(${bvo.id},'${bvo.name}',${bvo.gibon},'${bvo.juso} ${bvo.juso_etc}','${bvo.phone}','${cla}',${bvo.cla})">선택</span>
       </div>
     </c:forEach>
     <div id="chuga">
       <input type="button" onclick="location='jusoadd'" value="+ 배송지추가">
     </div>
     <form name="baeup" method="post" action="baeup">
       <input type="hidden" name="id">
     </form>
  </section>
  <script>
    function bae_up(id)
    {
    	document.baeup.id.value=id;
    	document.baeup.submit();
    }
  </script>
</body>
</html>
