<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style>
   div {
     width:380px;
     height:35px;
     margin-top:12px;
     border:1px solid #cccccc;
     padding-top:15px;
   }
    input[type=submit] {
     width:382px;
     height:50px;
     margin-top:10px;
   }
 </style>
 <script>
   function chg_ok() 
   {
	   var cla=document.pkc.cla.value;
	   var id=document.pkc.id.value;
	   //alert(cla);
	   // ajax를 통해 baesong테이블의 cla값을 변경
	   var chk=new XMLHttpRequest();
	   chk.onload=function()
	   {
		   alert(chk.responseText);
	   }
	   chk.open("get","chg_ok?cla="+cla+"&id="+id);
	   chk.send();
   }
 </script>
</head>
<body>
      <h3 align="center"> 배송 요청사항 </h3> 
    <form name="pkc">
     <input type="hidden" name="id">
     <div> <input type="radio" class="cla" name="cla" value="0"> 문 앞</div>
     <div> <input type="radio" class="cla" name="cla" value="1"> 직접 받고 부재시 문 앞</div>
     <div> <input type="radio" class="cla" name="cla" value="2"> 경비실</div>
     <div> <input type="radio" class="cla" name="cla" value="3"> 택배함</div>
      <input type="button" value="배송요청 변경" onclick="chg_ok()"> 
    </form>
</body>
</html>

