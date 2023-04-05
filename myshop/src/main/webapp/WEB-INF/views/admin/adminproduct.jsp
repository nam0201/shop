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
   section table tr {
     height:70px;
   }
   section #title {
     width:350px;
     height:30px;
     outline:none;
   }
   section #price {
     width:110px;
     height:30px;
     text-align:right;
   }
   #halin, #juk, #baesong, #su {
     width:60px;
     height:30px;
     outline:none;
     text-align:right;
   }
  </style>
  <script>
  function check(my,id)
  {
	   document.uform.id.value=id;
	   // 상품명을 전송폼으로 옮기기
	   document.uform.title.value=my.title.value;
	   
	   // 가격에 , 원 없애기
	   var price=my.price.value.replace(/,/g,"");
	   price=price.replace("원","");
	   document.uform.price.value=price;
	   
	   // 할인율에 %없애기
	   var halin=my.halin.value.replace("%","");
	   document.uform.halin.value=halin;
	   
	   // 적립률에 %없애기
	   var juk=my.juk.value.replace("%","");
	   document.uform.juk.value=juk;
	   
	   // 배송비에 원 없애기
	   var baesong=my.baesong.value.replace("원","");
	   baesong=baesong.replace(/,/g,"");
	   document.uform.baesong.value=baesong;
	   
	   // 재고에 개 없애기
	   var su=my.su.value.replace("개","");
	   document.uform.su.value=su;
	   
	   document.uform.submit();	   
	  // alert(document.uform.price.value);
  }
  
  function chgimage(img1,img2,id)
  {
	   // 2개의 그림을 보이게 하기
	   document.getElementsByClassName("img")[0].src="../resources/pro/"+img1;
	   document.getElementsByClassName("img")[1].src="../resources/pro/"+img2;
	   
	   var w=document.documentElement.clientWidth;
      var h=document.documentElement.clientHeight;
  	   //alert(w+" "+h);
  	   w=w/2-90;
  	   h=h/2+document.documentElement.scrollTop-150;
  	 
  	   document.getElementById("uimg").style.visibility="visible";
  	   document.getElementById("uimg").style.left=w+"px";
  	   document.getElementById("uimg").style.top=h+"px";
  	   
  	   // 바꿀 이미지에 해당하는 레코드의 id를 폼태그에 전달
  	   document.fform.id.value=id;
  	   
  	   image1=img1;
  	   image2=img2;
  }
  // 변수를 활용하여 지금 작업이 되는 창의 그림이름을 저장
  var image1=""
  var image2="";
  function file(n,my) //n=0:pimg, n=1:cimg
  {
	   //alert(image1+" "+image2);
	   //alert(my.checked);
	   if(my.checked)
	   {
		   document.getElementsByClassName("fimg")[n].style.visibility="visible";
		   
		   if(n==0)
		      document.fform.delpimg.value=image1;
		   else
		      document.fform.delcimg.value=image2;
	   }
	   else
	   {
		   document.getElementsByClassName("fimg")[n].style.visibility="hidden"; if(n==0)
		   if(n==0)   
			  document.fform.delpimg.value="";
		   else
		      document.fform.delcimg.value="";
	   }
	  // alert("메인"+document.fform.delpimg.value+" : 상세"+document.fform.delcimg.value);
  }
  function filecheck(my) //그림수정이 클릭되면
  {
	  var plen=my.pimg.value.length; // pimg 파일업로드폼
	  var clen=my.cimg.value.length; // cimg 파일업로드폼
	  
	  if(document.getElementsByClassName("ck")[0].checked)  //pimg 체크박스
	  {
		  if(plen==0)
		  {
			  alert("메인이미지 그림을 선택하세요");
			  return false;
		  }	  
	  }
	  
	  if(document.getElementsByClassName("ck")[1].checked)  //cimg체크박스
	  {
		  if(clen==0)
		  {
			  alert("상세이미지 그림을 선택하세요")
			  return false;
		  }	  
	  }
	  return true;
  }
  function fcancel() // 수정레이어 숨김
  {
	   document.getElementById("uimg").style.visibility="hidden";
  }
  </script>
  <style>
   section #uimg {
       position:absolute;
       width:200px;
       height:300px;
       border:1px solid purple;
       background:white;
       visibility:hidden;
       padding:15px;
    }
    section #uimg span {
       font-size:12px;
    }
    section .fimg {
       visibility:hidden;
    }
  </style>
</head>
<body>
   
   <section>
   <div id="uimg">
    <form name="fform" method="post" onsubmit="return filecheck(this)" action="changeimage" enctype="multipart/form-data">
     <input type="hidden" name="id">
     <input type="hidden" name="delpimg">
     <input type="hidden" name="delcimg">
     <div>
        <span> 메인이미지 </span> <br>
        <img class="img" width="100" height="80"><input class="ck" type="checkbox" onclick="file(0,this)"><span> 삭제시 체크 </span>
        <input type="file" name="pimg" class="fimg"> 
     </div>
     <hr>
     <div>
        <span> 상세이미지 </span> <br>
        <img class="img" width="100" height="80"><input class="ck" type="checkbox" onclick="file(1,this)"> <span> 삭제시 체크 </span>
        <input type="file" name="cimg" class="fimg">  
     </div>
     <hr>
     <input type="submit" value="그림 수정"> <input type="button" onclick="fcancel()" value="취소">
    </form>
   </div>
    <form method="post" name="uform" action="productUp">
      <input type="hidden" name="id">
      <input type="hidden" name="title">
      <input type="hidden" name="price">
      <input type="hidden" name="halin">
      <input type="hidden" name="juk">
      <input type="hidden" name="baesong">
      <input type="hidden" name="su">
    </form>
    <table width="1000" align="center">
       <tr align="center">
         <td width="100"> 상품사진 </td>
         <td> 상품명 </td>
         <td width="100"> 상품가격 </td>
         <td width="60"> 할인율 </td>
         <td width="60"> 적립률 </td>
         <td width="100"> 배송비 </td>
         <td width="60"> 재 고 </td>
         <td width="100"> 수정 </td>
       </tr>
      <c:forEach items="${plist}" var="pvo">
       <form>
       <tr>
         <td align="center"> <img onclick="chgimage('${pvo.pimg}','${pvo.cimg}',${pvo.id})" src="../resources/pro/${pvo.pimg}" width="50" height="40"> </td>
         <td> <input id="title" type="text" name="title" value="${pvo.title}"></td>
         <td align="right"> <input type="text" name="price" id="price" value="<fmt:formatNumber value="${pvo.price}" pattern="#,###"/>원 "></td>
         <td align="right"> <input type="text" name="halin" id="halin" value="${pvo.halin}%"> </td>
         <td align="right"> <input type="text" name="juk" id="juk" value="${pvo.juk}%"> </td>
         <td align="right"> <input type="text" name="baesong" id="baesong" value="<fmt:formatNumber value="${pvo.baesong}" pattern="#,###"/>원"> </td>
         <td align="right"> <input type="text" name="su" id="su" value="${pvo.su}개"></td>
         <td align="center"> <input type="button" onclick="check(this.form,${pvo.id})" value="수정하기"> </td>
       </tr>
       </form>
      </c:forEach>
      <tr class="link">
      <td colspan="8" align="center">
      <!-- 페이지 이동, 현재페이지 링크의 색을 다르게 -->
       <!-- 10페이지 단위 이전 이동 시작-->
         <c:if test="${pstart != 1}">
          <a href="adminproduct?page=${pstart-1}"> << </a>
         </c:if>
         <c:if test="${pstart == 1}">
          <a href="#"> << </a>
         </c:if>
       <!-- 10페이지 단위 이전 이동 끝 -->
      
       <!-- 1페이지 단위 이전 이동 시작-->
         <c:if test="${page != 1}">
          <a href="adminproduct?page=${page-1}"> < </a>
         </c:if>
         <c:if test="${page == 1}">
          <a href="#"> < </a>
         </c:if>
       <!-- 1페이지 단위 이전 이동 끝 -->
      
        <c:forEach begin="${pstart}" end="${pend}" var="i">
         <c:if test="${page == i}">
           <a href="adminproduct?page=${i}" style="border-color:red;"> ${i} </a>
         </c:if>
         <c:if test="${page != i}">  
           <a href="adminproduct?page=${i}"> ${i} </a>
         </c:if>
        </c:forEach>
        
       <!-- 1페이지 단위 다음 이동 시작-->
         <c:if test="${page != chong}">
          <a href="adminproduct?page=${page+1}"> > </a>
         </c:if>
         <c:if test="${page == chong}">
          <a href="#"> > </a>
         </c:if>
       <!-- 1페이지 단위 다음 이동 끝 --> 
        
       <!-- 10페이지 단위 다음 이동 시작-->
         <c:if test="${pend != chong}">
          <a href="adminproduct?page=${pend+1}"> >> </a>
         </c:if>
         <c:if test="${pend == chong}">
          <a href="#"> >> </a>
         </c:if>
       <!-- 10페이지 단위 다음 이동 끝 -->
      </td>
    </tr>  
    </table>
   </section>
</body>
</html>



