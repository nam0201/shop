<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style>
  
   section {
      width:1000px;
      height:600px;
      margin:auto;
   }
 section input[type=text]
 {
   width:700px;
   height:30px;
 }
 section textarea{
 width:702px;
 height:100px;
 }
 </style>
 <script>
   var star_cnt=0;
   function chgstar(n)
   {
	   //class="star"의 0부터 n까지의 그림을 노란색 별로
	   for(i=0;i<=n;i++)
	   {
		   document.getElementsByClassName("star")[i].src="../resources/img/star1.png";
	   }
	   
	   //class="star"의 선택된 n인덱스 다음부터 끝까지는 회색별그림 =>star2.png
	   for(i=n+1;i<5;i++)
		{
		   document.getElementsByClassName("star")[i].src="../resources/img/star2.png";
		}
	   
	  star_cnt=n+1;
	  var msg="";
	  switch(star_cnt)
	  {
	    case 1: msg="나쁨"; break;
	    case 2: msg="별로"; break;
	    case 3: msg="보통"; break;
	    case 4: msg="좋음"; break;
	    case 5: msg="최고"; break;
	  
	  }
	  document.getElementById("msg").innerText=msg;
	  document.rform.star.value=star_cnt;
   }
   
   function check()
   {
	   if(star_cnt==0)
	   {
		   alert("별점을 선택하세요");
		   return false;
	   }	   
	   else
	   {
		  return true;   
	   }	   
   }
 </script>
</head>
<body>
   <section>
     <form name="rform" method="post" action="review_ok" onsubmit="return check()">
      <input type="hidden" name="pcode" value="${pvo.pcode}">
      <input type="hidden" name="star">
      <input type="hidden" name="guid" value="${guid}">
      <table width="1000" align="center">
         <caption> <h3> 상품리뷰 </h3></caption>
           <tr>  <!-- 상품의 그림,제목,별점 -->
               <td width="80"> <img src="../resources/pro/${pvo.pimg}" width="50" height="40"> </td>
              <td id="title">${pvo.title} <p>
                <img src="../resources/img/star2.png" onclick="chgstar(0)" class="star">
                <img src="../resources/img/star2.png" onclick="chgstar(1)" class="star">
                <img src="../resources/img/star2.png" onclick="chgstar(2)" class="star">
                <img src="../resources/img/star2.png" onclick="chgstar(3)" class="star">
                <img src="../resources/img/star2.png" onclick="chgstar(4)" class="star">
                <span id="msg">필수(*)</span>
              </td>
           </tr>
           <tr>
              <td> 한줄요약 </td>
              <td> <input type="text" name="title"> </td>
           </tr>
           <tr>
             <td>  상세후기 </td>
             <td> <textarea cols="90" rows="5" name="content" placeholder="솔직한 평가를 남겨주세요"></textarea> </td>
          </tr>
          <tr align="center">
            <td colspan="2"> <input type="submit" value="후기저장"></td>
          </tr>        
      </table>
     </form> 
   </section>
</body>
</html>