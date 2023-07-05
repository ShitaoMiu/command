<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="/js/egov/EgovMultiFile.js"></script>

<div class="col-md-12 form-group text-right test">
   <button class="btn btn-primary" onclick="goWrite()" type="button">글쓰기</button>
</div> 
<div class="col-md-12 test">
<form method="post">
	<table class="table table-striped">
		<colgroup>
			<col width="10%" />
			<col width="30%" />
			<col width="20%" />
			<col width="10%" />
			<col width="10%" />
			<col width="10%" />
		</colgroup>

		<thead class="thead-light">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>팝업게시기간</th>
				<th>팝업옵션</th>
				<th>등록자</th>
				<th>등록일</th>
			</tr>
		</thead>
		<c:forEach var="popup" items="${popupList}">
			<tr>
				<td>1111</td>
				<td>
					<a href="/admin/content/popup/popupOne/${popup.popupIdx}"> 
						<c:out value="${popup.title }" />
					</a>
				</td>
				<td><c:out value="${popup.stTime } ~ ${popup.enTime }" />
				</td>
				<td>
				<c:if test="${popup.popupOptionType eq '0' }">
					팝업타입
				</c:if>
				<c:if test="${popup.popupOptionType eq '1' }">
					배너타입
				</c:if>

				</td>
				<td><c:out value="${popup.regId }" /></td>
				<td><c:out value="${popup.regDate }" /></td>
			</tr>
		</c:forEach>
	</table>
	
	<div id="paging">
          <ul class="paging">
               <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="goPage"  />
           		<form:hidden path="pageIndex" />
          </ul>
     </div> 
</form>
</div>
<script src="/js/content/popup/popup.js"></script>
<script src="/js/common/treeFunction.js"></script>