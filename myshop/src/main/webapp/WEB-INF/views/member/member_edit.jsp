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
  function juso_search()  // 우편번호 버튼 클릭시 호출 함수명
  {
    new daum.Postcode({
        oncomplete: function(data) {
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
          } else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.mem.zip.value = data.zonecode; // 우편번호
          document.mem.juso.value = addr;  // 주소
          // 커서를 상세주소 필드로 이동한다.
          document.mem.juso_etc.focus();
      }
    }).open();
  }
  
 </script>
</head>
<body>  
   <section>
      <form name="mem" method="post" action="member_edit_ok" onsubmit="return form_check()">
        <h2> 회원 정보수정 </h2>
      
        <div>
           <input type="text" name="zip" placeholder="우편번호" readonly id="zip" value="${mvo.zip}"><input type="button" value="주소검색" onclick="juso_search()" id="zipbtn">
        </div>
        <div> <input type="text" name="juso" placeholder="주소" readonly value="${mvo.juso}"> </div>
        <div> <input type="text" name="juso_etc" placeholder="상세주소" value="${mvo.juso_etc}"> </div>
        <div> <input type="text" name="phone" placeholder="전화번호" value="${mvo.phone}"> </div>
        <div> <input type="text" name="email" placeholder="이메일" value="${mvo.email}"> </div>
        <div> <input type="submit" value="회원정보수정" id="subbtn"> </div>
      </form>
   </section>
</body>
</html>










