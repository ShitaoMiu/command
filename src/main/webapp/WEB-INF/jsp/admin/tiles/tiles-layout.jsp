<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!-- 공통변수 처리 -->
<!DOCTYPE html>
<html>
  <head>
	<tiles:insertAttribute name="header" />
  </head>
  <body>
  <div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-12 test">
					</div>
				</div>
				<div class="row">
					<div class="col-md-2 test">
					   	<tiles:insertAttribute name="leftmenu" />
					</div>
					<div class="col-md-10">
						<div class="row">
							<div class="col-md-12 test">
								<tiles:insertAttribute name="topmenu"/>
							</div>
						</div>
						<div class="row">
							 <tiles:insertAttribute name="body"/>
						</div>
					</div>
				</div>
				<div class="row">
			   <tiles:insertAttribute name="footer"/>
				</div>
			</div>
		</div>
	</div>
	</body>
</html>