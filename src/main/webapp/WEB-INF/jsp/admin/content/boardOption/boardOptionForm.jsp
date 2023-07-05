<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="p-5 offset-md-1 col-md-10 form-group test">
	 <form id="boardSet" name="boardSet" action="/admin/content/boardOption/save" method="post" enctype="application/x-www-form-urlencoded">  
		 <input type="hidden" name="contentsBoardOpIdx" id="contentsBoardOpIdx" value="${contentsBoardOptionVo.contentsBoardOpIdx }" />
		 <div class="form-group row">
            <label for="" class="col-md-3 form-check-label">게시판 이름</label>
            <input type="text" class="form-control col-md-4" name="contentsBoardOpName" value="${contentsBoardOptionVo.contentsBoardOpName }" />
          </div>
         <input type="hidden" class="form-control col-md-4" name="contentsBoardOpId" value="${contentsBoardOptionVo.contentsBoardOpId}"/>

         <div class="form-group row">
              <label for="" class="col-md-3 form-check-label">게시판타입</label>  
              <div class="col-md-9 form-group form-inline test">
                    <div class="form-inline col-md-3">
                      <input type="radio" id="boardList" name="contentsBoardOpType" class="form-check-input" value="0"  ${contentsBoardOptionVo.contentsBoardOpType eq 0 ? "checked" : ""}/>
                      <label for="boardList" class="form-check-label big-labe">리스트</label>
                    </div>  
                    
                    <div class="form-inline col-md-3">
                      <input type="radio" id="boardNotice" name="contentsBoardOpType" class="form-check-input" value="1" ${contentsBoardOptionVo.contentsBoardOpType eq '1' ? "checked":""} />
                      <label for="boardNotice" class="form-check-label big-labe">공지사항</label>
                    </div>
                    
                    <div class="form-inline col-md-3">
                      <input type="radio" id="boardGallery" name="contentsBoardOpType" class="form-check-input" value="2" ${contentsBoardOptionVo.contentsBoardOpType eq '2' ? "checked":""}>
                      <label for="boardGallery" class="form-check-label">갤러리</label>
                    </div>
                    
                    <div class="form-inline col-md-3">
                      <input type="radio" id="boardQa" name="contentsBoardOpType" class="form-check-input" value="3" ${contentsBoardOptionVo.contentsBoardOpType eq '3' ? "checked":""}>
                      <label for="boardQa" class="form-check-label">문답형</label>
                    </div>
              </div>  
          </div>

         <div class="form-group row">
            <label for="" class="col-md-3 form-check-label">게시판추가옵션</label>  
            <div class="col-md-9 form-inline test">
              <div class="form-inline col-md-4">
                <input type="checkbox" id="contentsIsBoardMeCert" name="contentsIsBoardMeCert" class="form-check-input" ${contentsBoardVo.contentsIsBoardMeCert == 'Y' ? "checked":""} />
                <label for="contentsIsBoardMeCert" class="form-check-label">본인인증</label>
              </div>
              <div class="form-inline col-md-4">
                <input type="checkbox" id="contentsIsBoardSMS" name="contentsIsBoardSMS" class="form-check-input" ${contentsBoardVo.contentsIsBoardMeCert == 'Y' ? "checked":""} />
                <label for="contentsIsBoardSMS" class="form-check-label">SMS알람</label>
              </div>
            </div>
          </div>

         <div class="form-group row">
            <div class="offset-md-3 col-md-9 form-inline test">
             <div class="col-md-6 form-inline test">
                <label for="" class="col-md-3 form-check-label test">댓글갯수</label>
                <select  class="offset-md-1 col-md-3 form-control" name="contentsBoardCommentNum">
                  <option value="0"  ${contentsBoardOptionVo.contentsBoardCommentNum == 0 ? "selected":""} >없음</option>
                  <option value="1" ${contentsBoardOptionVo.contentsBoardCommentNum == 1 ? "selected":""}>1개</option>
                  <option value="2" ${contentsBoardOptionVo.contentsBoardCommentNum ==2 ? "selected":""}>2개</option>
                  <option value="3" ${contentsBoardOptionVo.contentsBoardCommentNum == 3? "selected":""}>3개</option>
                  <option value="4" ${contentsBoardOptionVo.contentsBoardCommentNum == 4 ? "selected":""}>4개</option>
                </select>  
              </div>  

              <div class="col-md-6 form-inline test">  
                <label for="" class="col-md-3 form-check-label test">공지글수</label>  
                <select  class="offset-md-1 col-md-3 form-control" name="contentsBoardNoticeNum">
                  <option value="0"  ${contentsBoardOptionVo.contentsBoardNoticeNum == 0 ? "selected":""} >없음</option>
                  <option value="1"  ${contentsBoardOptionVo.contentsBoardNoticeNum == 1 ? "selected":""}  >1개</option>
                  <option value="2"  ${contentsBoardOptionVo.contentsBoardNoticeNum == 2 ? "selected":""}	>2개</option>
                  <option value="3"  ${contentsBoardOptionVo.contentsBoardNoticeNum == 3 ? "selected":""}	>3개</option>
                  <option value="4"  ${contentsBoardOptionVo.contentsBoardNoticeNum == 4 ? "selected":""}	>4개</option>
                </select>  
              </div>  
            </div>
          </div>


         <div class="form-group row">
            <label for="" class="col-md-3 form-check-label">금칙어</label>  
            <div class="col-md-9 form-inline test">
                <div class="col-md-4 form-inline test">
	                  <input type="text" name="contentsBoardBanword" value="" class="form-control"/>
	                  <button type="button" class="btn btn-primary" id="banAdd">추가</button>
                </div>
                <div class="ml-3 col-md-6 form-inline test">
                   <ul id="banLists" class="col-md-12 test">
 					<c:forEach var="item" items="${contentsBoardOptionVo.banwordList}">                   
		                  <li>${item.contentsBoardBanword }</li>
		             </c:forEach>
                    </ul>
                </div>
             </div>
          </div>

         <div class="form-group row">
            <label for="" class="col-md-3 form-check-label">게시판(head) 항목</label>  
            <div class="col-md-9 form-inline test">
                 <div class="col-md-4 form-inline test">
	                  <input type="text" name="contentsBoardHead" value="" class="form-control"/>
	                  <button type="button" class="btn btn-primary" id="boardHeadAdd">추가</button>
                </div>
                <div class="ml-3 col-md-6 form-inline test">
                   <ul id="theadList" class="col-md-12 test">
                   
                   		<c:if test="${fn:length(contentsBoardOptionVo.boardHeadList) != 0}">
		                   	  <c:forEach var="item" items="${contentsBoardOptionVo.boardHeadList}" varStatus="index">
		                   		<li>${item.contentsBoardColumnName }</li>
		                   </c:forEach>
	                   </c:if>
                   </ul>
                </div>
             </div>
          </div>

         <div class="form-group row">
            <label for="" class="col-md-3 form-check-label">게시판(상세입력) 항목</label>  
            <div class="col-md-9 form-inline test">
                 <div class="col-md-4 form-inline test">
	                  <input type="text" name="contentsBoardItem" value="" class="form-control"/>
	                  <button type="button" class="btn btn-primary" id="boardContentItemAdd">추가</button>
                </div>
                <div class="ml-3 col-md-6 form-inline test">
                   <ul id="boardContents" class="col-md-12 test">
                   
                   <c:if test="${fn:length(contentsBoardOptionVo.boardContentList) != 0}">
	                   	  <c:forEach var="item" items="${contentsBoardOptionVo.boardContentList}" varStatus="index">
		                   		<li>${item.contentsBoardColumnName }</li>
		                   </c:forEach>
                   </c:if>
                   </ul>
                </div>
             </div>
          </div>
          
         <input type="hidden" name="contentsIsBoardMeCert" id="contentsIsBoardMeCert" value=""/>
         <input type="hidden" name="contentsIsBoardSMS" id="contentsIsBoardSMS" value=""/>
         <input type="hidden" name="contentBoardBanList" value=""/>
         <input type="hidden" name="contentBoardHeadList" value=""/>
         <input type="hidden" name="contentBoardContentList" value=""/>
 	</form>
          
          <br/>
          <br/>
          <br/>
          
          <div class="form-group row">
            <div class="col-sm-12" style="text-align:center;">
              <button type="button" class="btn btn-success" onclick="saveBoard();">저장</button>
            </div>
          </div>
			 
		</div>
		<script src="/js/content/board/boardOption.js"></script>