<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<script src="https://cdn.ckeditor.com/ckeditor5/37.1.0/classic/ckeditor.js"></script>


<div class="container-fluid">
	<div class="row">
		<div class="col-md-2 test">
			<jsp:include page="../../layouts/tree.jsp"/>		
		</div>
		<div class="col-md-10 test">
 			
 			<div class="row">
 				<div class="col-md-6 form-group form-inline test">
 				   <div class="col-md-9">
	 					<input type="text" id="datepicker" name="searchStDate"class="form-control col-md-4">
	 					<span class="col-md-1" style="font-size: 21pt;">~</span>
						<input type="text" id="datepicker1" name="searchEnDate"class="form-control col-md-4">
						<button class="btn btn-primary ml-2">검색</button>
					</div>
					<div class="col-md-3 mt-2 text-right">
						<button type="button" class="btn btn-primary" onclick="newPage();">등록</button>
					</div>
 				   <div class="col-md-12 mt-3">
		 				<table class="table table-striped col-md-12" style="padding-left:10px;" id="pageSettingHistoryPerMenu">
							<colgroup>
					            <col width=20%>
					            <col width=20%>
					            <col width=30%>
					            <col width=20%>
					        </colgroup>
							<thead class="thead-light">
								<tr>
									<th style="border: 1px solid;">번호</th>
									<th style="border: 1px solid;">메뉴</th>
									<th	style="border: 1px solid;">사용유무</th>
									<th	style="border: 1px solid;">수정일</th>
								</tr>
							</thead>
							<tbody id="pageTbody">
								<c:forEach var="item" items="${contentsPageList }" >
									<tr>
										<td>${item.pageContentIdx }</td>
										<td><a href="#" onclick="contentPagesDetail('${item.menuIdx}','${item.pageContentIdx}')">${item.menuNm }</a></td>
										<td>${item.pageContentEnables }</td>
										<td>${item.writeDate }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
	 				</div>		
 				</div>
 				<div class="col-md-6 test" id="contentArea">
 				<form id="pageContentFrm" method="post">
 					<label for="menuTitle" id="menuNm">
 						메뉴명:<span id="menuTitle"></span>
 					</label>
	 				<input type="hidden" name="pageContentIdx" id="pageContentIdx" value=""/>
	 				<input type="hidden" name="pageMenuContents" id="pageMenuContents" value=""/>
	 				<input type="hidden" name="pageMenuIdx" id="pageMenuIdx" value=""/>
	 				
	 				
					<div class="col-md-12 mt-3">
						<div id="editor" class="editor">
						</div>
					</div>
					<div class="col-md-12 mt-3">
						<button type="button" class="btn btn-success" id="savePage">저장</button>
					</div>
				</form>
				</div>
			</div>
		</div>
	</div>
</div>		
<script src="/js/content/page/page.js"></script>
<script src="/js/common/treeFunction.js"></script>