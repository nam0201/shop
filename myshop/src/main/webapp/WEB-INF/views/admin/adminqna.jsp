<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>     
    <%@ include file="admintop.jsp" %>
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
   section #content {
     width:400px;
     height:100px;
     overflow:auto;
     border:1px solid purple;
     padding:4px;
   }
 </style>
</head>
<body>
    <section>
     <table width="900" align="center">
      <c:forEach items="${qlist}" var="qvo">
        <tr>
          <td> 
             <c:if test="${qvo.seq==0}">
               <span onclick="ansview('${qvo.content}',${qvo.grp},'${qvo.pcode}')"> 질문 </span>
             </c:if>
             <c:if test="${qvo.seq==1}">
               <span> 답변 </span>
             </c:if>
          </td>
          <td> ${qvo.userid} </td>
          <td width="200"> ${qvo.title} </td>
          <td> <div id="content"> ${qvo.content} </div></td>
          <td> ${qvo.writeday} </td>
        </tr>
      </c:forEach>
     </table>
     <div id="ans">
       <form name="aform" method="post" action="ansview_ok">
         <input type="hidden" name="pcode">
         <input type="hidden" name="grp">
         <div id="q"></div>
         <textarea name="content"  placeholder="답변쓰기"></textarea> 
         <div align="center"> <input type="submit" value="답변달기"> </div>
       </form>
     </div>
    </section>
    <script>
      function ansview(content,grp,pcode)
      {
    	  document.aform.grp.value=grp;
    	  document.aform.pcode.value=pcode;
    	  
    	  var w=document.documentElement.clientWidth;
     	  var h=document.documentElement.clientHeight;
     	  //alert(w+" "+h);
     	  w=w/2-200;
     	  h=h/2+document.documentElement.scrollTop-200;
     	 
     	  document.getElementById("ans").style.left=w+"px";
     	  document.getElementById("ans").style.top=h+"px";
     	  
     	  document.getElementById("ans").style.visibility="visible";
     	  document.getElementById("q").innerHTML=content;
      }
    </script>
    <style>
      section #ans {
         position:absolute;
         width:400px;
         height:440px;
         border:3px solid black;
         background:white;
         visibility:hidden;
      }
      section #q {
         width:400px;
         height:200px;
         overflow:auto;
         border:1px solid purple;
         padding:4px;
      }
      section #ans textarea {
         width:396px;
         height:180px;
         border:none;
         outline:none;
      }
    </style>
</body>
</html>

