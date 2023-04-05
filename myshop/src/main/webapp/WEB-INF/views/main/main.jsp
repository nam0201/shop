<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style>
   #image {
      width:1400px;
      height:300px;
      margin:auto;
   }
   
   section {
      width:1000px;
      height:800px;
      margin:auto;
   }
   section article {
      width:1000px;
      height:200px;
      margin:auto;
      text-align:center;
   }
   
   #mimage {
     width:1400px;
     height:300px;
     overflow:hidden;
     margin:auto;
   }
   #msub {
     width:7000px;
     height:300px;
     margin-left:0px;
   }
 </style>
 <script src="http://code.jquery.com/jquery-latest.js"></script>
 <script>
   $(function()
   {
	       move();
	       
		   $("#mimage").mouseover(function()
		   {
			   clearInterval(ss);
		   });
		   $("#mimage").mouseout(function()
		   {
	           move();
		   });
   });
   function move()
   {
	   ss=setInterval(function()
	   {
		   $("#msub").animate(
		   {
			   marginLeft:"-1400px"
		   },2000,function()
		          {
			           $("#msub > img").eq(0).insertAfter( $("#msub > img").eq(4) );
			           $("#msub").css("margin-left","0px");
		          });
	   },4000);
   }
 </script>
</head>
<body>

   <div id="mimage">
    <div id="msub">
     <img src="../resources/main/1.png" width="1400" height="300"><img src="../resources/main/2.png" width="1400" height="300"><img src="../resources/main/3.png" width="1400" height="300"><img src="../resources/main/4.png" width="1400" height="300"><img src="../resources/main/5.png" width="1400" height="300">
    </div> 
   </div> <!-- 슬라이드 되는 큰그림 -->
   <section>
     <article id="ar1"> 최신상품 </article>
     <article id="ar2"> 인기상품 </article>
     <article id="ar3"> 특가상품 </article>
     <article id="ar4"> 이벤트 </article>
   </section> <!-- 본문 -->
   
  
</body>
</html>