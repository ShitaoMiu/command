<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 
		<form name="frm" method="post" action="/admin/content/boardOption">  
		  <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
		
		<div class="col-md-12 test">
			<div class="form-group form-inline test">
				<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-info my-2 my-sm-0" type="submit">검색</button>
			</div>
		</div>
		</form>
		<div class="col-md-12 text-right test">
			<button type="button" class="btn btn-primary" onclick="location.href='/admin/content/boardOption/new'">등록</button>
		</div>
		<div class="col-md-12 test">
			<table class="table table-striped" style="padding-left:10px;">
				<colgroup>
		            <col width=5%>
		            <col width=30%>
		            <col width=20%>
		            <col width=10%>
		        </colgroup>	
				<thead class="thead-light">
					<tr>
						<th scope="col" style="border: 1px solid;">번호</th>
						<th scope="col" style="border: 1px solid;">게시판명</th>
						<th scope="col" style="border: 1px solid;">게시판아이디</th>
						<th scope="col" style="border: 1px solid;">게시판 타입</th>
						<th scope="col" style="border: 1px solid;">등록일</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="result" items="${contentsBoardList}" varStatus="status"> 
					<tr>
						<td style="border: 1px solid;">${status.count}</td>
						<td style="border: 1px solid;"><a href="/admin/content/boardOption/${result.contentsBoardOpIdx}">${result.contentsBoardOpName }</a> </td>
						<td style="border: 1px solid;">${result.contentsBoardOpId }</td>
						<td style="border: 1px solid;">
							<c:choose>
								<c:when test="${ result.contentsBoardOpType eq '0'}">
									리스트
								</c:when>
								<c:when test="${ result.contentsBoardOpType eq '1'}">
									공지사항
								</c:when>
								<c:when test="${ result.contentsBoardOpType eq '2'}">
									갤러리
								</c:when>
								<c:when test="${ result.contentsBoardOpType eq '3'}">
									문답형
								</c:when>
							</c:choose>
						</td>
						<td style="border: 1px solid;">${result.regDate }</td>
					</tr>
				</c:forEach>
				<c:if test="${fn:length(contentsBoardList) == 0}">
                      <tr>
                        <td nowrap colspan="6">없어</td>  
                      </tr>      
                     </c:if>
				</tbody>
			</table>
		</div>
		<div id="paging_div">
                   <ul class="paging_align">
                      <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="goList"  />
                   </ul>
                </div> 
		
		<script src="/js/content/board/boardOption.js"></script>