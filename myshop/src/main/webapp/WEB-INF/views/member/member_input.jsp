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
      text-align:center;
   }
   section div {
     margin-top:12px;
   }
   section input[type=text] {
      width:330px;
      height:35px;
      border:1px solid purple; 
   }
   section input[type=password] {
      width:330px;
      height:35px;
      border:1px solid purple; 
   }
   section #zip {
      width:200px;
      height:35px;
   }
   section #zipbtn {
      width:130px;
      height:39px;
      vertical-align:bottom;
      background:purple;
      border:1px solid purple; 
      color:white;
   }
   section #subbtn {
      width:336px;
      height:39px;
      border:1px solid purple; 
      background:purple;
      border:1px solid purple; 
      color:white;
   }
 </style> 
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

function juso_search()   
{
  new daum.Postcode({
      oncomplete: function(data) {
          if (data.userSelectedType === 'R') {  
              addr = data.roadAddress;
          } else { 
              addr = data.jibunAddress;
          }
   
                 document.mem.juso.value=addr;
                 document.mem.zip.value=data.zonecode;   // 우편번호
                 document.mem.juso_etc.focus();
 
      }
  }).open();
}

    var uchk=0;   //userid의 중복여부에 따라 값을 변화
    function userid_check(userid)
    {
    	if(userid.length < 6)
    	{
    		alert("아이디의 길이는 6자 이상입니다..")
    	}
    	else
    	{
    	   var chk=new XMLHttpRequest();
    	   
    	   chk.onload=function()
    	   {
    		   //alert(chk.responseText.trim());
    		   if(chk.responseText=="0")
    			{
    			   document.getElementById("umsg").innerText="사용가능한 아이디";
    			   document.getElementById("umsg").style.color="blue";
    			   uchk=1;
    			}   
    		   else
    			{
    			   document.getElementById("umsg").innerText="사용불가능한 아이디";
    			   document.getElementById("umsg").style.color="red";
    			   uchk=0;
    			}   
    			   
    	   }
    	   
    	   chk.open("get","userid_check?userid="+userid);
    	   chk.send();
    	}
    }	
    	var pchk=0;
    	function pwd_check()
    	{
    		var pwd=document.mem.pwd.value;
    		var pwd2=document.mem.pwd2.value;
    		
    	   if(pwd2.length != 0)
    		{   
    		if(pwd==pwd2)
    		{
    		   document.getElementById("pmsg").innerText="비밀번호가 일치합니다";
  			   document.getElementById("pmsg").style.color="blue";
  			   pchk=1;
  			}   
  		   else
  			{
  			   document.getElementById("pmsg").innerText="비밀번호가 일치하지 않습니다";
  			   document.getElementById("pmsg").style.color="red";
  			   pchk=0;
  			}
    	  	
    	}
    }
    function form_check()
    {
    	if(uchk==0)
    	{
    		alert("중복조회를 하세요")
    		return false;
    	}
    	else if(pchk==0)
    	{
    		alert("비밀번호가 일치하지 않습니다");
    		return false;
    	}
    	else
    	  return true;
    }
  </script>
</head>
<body> <!-- member_input.jsp -->
<section>
    <form name="mem" method="post" action="member_input_ok" onsubmit="return form_check()">
       <h2> 회원가입 </h2>
       <div> <input type="text" name="userid" placeholder="아이디" onblur="userid_check(this.value)"> 
             <br> <span id="umsg" style="font-size:12px"></span> </div>
       <div> <input type="text" name="name" placeholder="이름"></div>
       <div> <input type="password" name="pwd" placeholder="비밀번호" onkeyup="pwd_check()"> </div>
       <div> <input type="password" name="pwd2" placeholder="비밀번호 확인" onkeyup="pwd_check()">
            <br> <span id="pmsg" style="font-size:12px;">
       </div>
       <div>
           <input type="text" name="zip" readonly placeholder="우편번호" id="zip"><input type="button" value="주소검색" onclick="juso_search()" id="zipbtn">
        </div>
       <div> <input type="text" name="juso" readonly placeholder="주소"></div>
       <div> <input type="text" name="juso_etc" placeholder="상세주소"></div>
       <div> <input type="text" name="phone" placeholder="전화번호"></div>
       <div> <input type="text" name="email" placeholder="이메일"></div>
       <div> <input type="submit" value="회원가입하기"> </div>
    </form>
  </section>
</body>
</html>