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
   section #inner {
     width:480px;
     height:100px;
     overflow:auto;
   }
   section table {
     border-spacing:0px;
   }
   section table td {
     border-bottom:1px solid #cccccc;
     padding-top:5px;
     padding-bottom:5px;
   }
   section table tr:first-child td {
     border-bottom:1px solid #cccccc;
     padding-bottom:10px;
     padding-top:10px;
     font-size:18px;
     border-top:2px solid #cccccc;
   }
   section table tr:last-child td {
     border-bottom:2px solid #cccccc;
    }
 </style> 
  
  <section>
     <div id="main">
      <table width="1000" align="center">
       <tr align="center">
         <td width="120"> 작성자 </td>
         <td width="300"> 제 목 </td>
         <td width="480"> 내 용 </td>
         <td width="100"> 작성일 </td>
       </tr>
       <c:forEach items="${mlist}" var="mvo">
       <c:if test="${mvo.state==0}">
           <tr align="center" onclick="viewform(this,${mvo.id})" class="tr">
       </c:if>
       <c:if test="${mvo.state==1}">          
           <tr align="center" onclick="hideform()" class="tr">
       </c:if>
       
         <td> ${mvo.userid} </td>
         <td> ${mvo.title} </td>
         <td> 
           <c:if test="${mvo.state==0}">
             <div id="inner"> ${mvo.content} </div>
           </c:if>
           <c:if test="${mvo.state==1}">          
            <div id="inner" style="color:blue;font-size:30px;"> 답변완료 </div>
           </c:if>
         </td>
         <td> ${mvo.writeday} </td>
       </tr> 
      </c:forEach>
      </table>
     </div>              
     
     <div id="vform">
       <form name="aform" method="post" action="amtm">
         <input type="hidden" name="mid">
         <textarea name="content" id="content"></textarea>
         <input type="submit" value="답변달기">
         <input type="button" onclick="hideform()" value="취소">
       </form>
     </div>
  </section>   
  <script>
    function hideform()
    {
    	document.getElementById("vform").style.visibility="hidden";
    }
    function viewform(my,id)
    {
    	// 클릭된 tr의 배경색을 변경한다.
    	  // 모든 tr의 배경을 white
    	var tr=document.getElementsByClassName("tr");
    	for(i=0;i<tr.length;i++)
    		tr[i].style.background="white";
    	
    	  // 선택된 tr의 색을 변경
    	my.style.background="#eeeeee";
    	// 폼을 보이게 한다..
    	document.getElementById("vform").style.visibility="visible";
    	// mtm테이블의 id를 name="mid"인 폼에 값을 전달
    	document.aform.mid.value=id; 
    	// 폼의 위치를 적절하게
    	var w=document.documentElement.clientWidth;
    	var h=document.documentElement.clientHeight;
    	//alert(w+" "+h);
    	w=w/2-150;
    	h=h/2+document.documentElement.scrollTop-100;
    	 
    	document.getElementById("vform").style.left=w+"px";
    	document.getElementById("vform").style.top=h+"px";
    }
  </script>
  <style>
    section #vform {
       position:absolute;
       width:300px;
       height:200px;
       border:1px solid purple;
       background:white;
       visibility:hidden;
    }
    section #vform textarea {
       width:294px;
       height:148px;
       border:none;
       outline:none;
       border-bottom:1px solid purple;
    }
    section #vform input[type=submit] {
       width:145px;
       height:48px;
     
    }
     section #vform input[type=button] {
       width:145px;
       height:48px;
     
    }
  </style>
</body>
</html>