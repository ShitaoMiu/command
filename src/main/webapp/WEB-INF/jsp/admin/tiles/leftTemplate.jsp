<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <div class="leftMenuDiv" style="width:85%;height:900px;"> 
     <div class="test" style="width:100%; height:100px; ">
     	<span class="" style="font-size:30pt; text-align:center;padding: 33px;">${topMenuNm }</span>
     </div>
     <br/>
     <br/>
      <ul id="ac">
      <c:forEach var="item" items="${subList}" >
         	 <li class="menu1">
         		<c:if test="${not empty item.menuList}">
         			<a href="#">${item.menuNm }</a>
         			<c:set var="subMenuList" value="${item.menuList}" />
      					<c:forEach var="subItem" items="${subMenuList}" >
				            <ul class="menu2">
				               <li><a href="${subItem.menuUrl}">${subItem.menuNm}</a></li>
				            </ul>
				          </c:forEach>
				</c:if>
				<c:if test="${empty item.menuList}">
         			 <a href="${item.menuUrl }">${item.menuNm }</a>
				</c:if>
        	 </li>
         </c:forEach>
      </ul>
   </div>
   <script>
   $('.menu1').click(function(){
       $('.menu2').slideUp();
       if ($(this).children('.menu2').is(':hidden')){
          $(this).children('.menu2').slideDown();
       } else{
          $(this).children('.menu2').slideUp();
       }
    });
   
   </script>