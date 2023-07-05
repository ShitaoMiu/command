<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="col-md-12 test" style="height:80px; ">
 	<ul class="nav">
		<c:forEach var="menu" items="${topListMap}">
 		<li class="nav-item test col-md-2" style="height:60px;">
 			<a class="nav-link" href="${menu.childMenuUrl}">${menu.menuNm }</a> 
		</li>
		</c:forEach>
	</ul>
</div>