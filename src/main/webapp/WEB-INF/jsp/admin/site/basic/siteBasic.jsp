<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="/js/egov/EgovMultiFile.js"></script> 
		<div class="col-md-12 test">
		<form name="frm" method="post" action="/admin/site/basic/save" enctype="multipart/form-data">
	 	<input type="hidden" name="siteBasicIdx" value="${siteBasicVo.siteBasicIdx }" />
		<div class="col-md-12 test">
			<div class="form-group form-inline test">
				<label for="" class="col-md-1 test">사이트 이름</label>
				<input class="form-control ml-md-4" type="text" name="siteNm" value="${siteBasicVo.siteNm}" />
			</div>
		</div>
		
 		<div class="col-md-12 test">
			<div class="form-group form-inline test">
				<label for="" class="col-md-1 test">사이트 주소</label>
				<ul>
				<li>
					<input class="form-control ml-4" type="text" name="siteAddr" value="${siteBasicVo.siteAddr}" size="50"/> 
					<button type="button" onclick="addrFn()" class="btn btn-primary">주소검색</button>
 				</li>
 				<li>
	 				<input class="form-control ml-4" type="text" name="siteSubAddr" value="${siteBasicVo.siteSubAddr}" size="50"/>
				</li>
				</ul>
			</div>
		</div>
		
		  
		

		<div class="col-md-12 test">
			<div class="form-group form-inline test">
				<label for="" class="col-md-1 test">사이트 설명</label>
				<textarea id="siteExpl"  class="form-control ml-md-4" cols="100" rows="6" name="siteExpl" >${siteBasicVo.siteExpl}</textarea>
			</div>
		</div>

		<div class="col-md-12 test">
			<div class="form-group form-inline test">
				<label for="" class="col-md-1 test">파비콘</label>
				<input type="file" name="faviFile"  id="faviFileUploader" class="form-control ml-md-4" value=""/>
				<div id="faviFileList" class="test">
					<c:if test="${fn:length(siteBasicVo.faviFileList) > 0 }">
						<ul>
						<c:forEach var="item" items="${siteBasicVo.faviFileList }">
							<c:set var="lid" value="${item.atchFileId}'_'${item.fileSn}"/>
							<li id='${lid}'>
								<a href="javascript:void(0);" onclick="fn_egov_downFile('${item.atchFileId}','${item.fileSn}')">
									${item.orignlFileNm}
								</a>
									<button type="button" onclick="fileEachDelete('${item.atchFileId}','${item.fileSn}','faviFileList');">Delete</button>
							</li>			
						</c:forEach>
						</ul>
					</c:if>
				</div>
			</div>
		</div>
		
		
		
		<div class="col-md-12 test">
			<div class="form-group form-inline test">
				<label for="" class="col-md-1 test">대표 이미지</label>
				<input type="file" name="mainFile" id="mainImgFileUploader" class="form-control ml-md-4" value=""/>
 
				<div id="mainImgFileList" class="test">
				 	<c:if test="${fn:length(siteBasicVo.mainFileList) > 0 }">
						<ul>
						<c:forEach var="item" items="${siteBasicVo.mainFileList }">
						<c:set var="lid" value="${item.atchFileId}_${item.fileSn}"/>
							<li id='${lid}'>
								<a href="javascript:void(0);" onclick="fn_egov_downFile('${item.atchFileId}','${item.fileSn }')">
									${item.orignlFileNm}	
								</a>
									<button type="button" onclick="fileEachDelete('${item.atchFileId}','${item.fileSn}','faviFileList');">Delete</button>
							</li>			
						</c:forEach>
						</ul>
					</c:if>
				</div>
			</div>
		</div>


		<div class="col-md-12 test">
			<div class="form-group form-inline test">
				<label for="" class="col-md-1 test">사이트 <br/>공개상태</label>
				<input class="form-control ml-md-4" type="radio" name="siteOpenYN" id="siteOpenY" value="Y" ${siteBasicVo.siteOpenYN eq 'Y' ? 'checked' : ''} />
				<label for="siteOpenY" style="margin-left:10px;">예</label>
				<input class="form-control ml-md-4" type="radio" name="siteOpenYN" id="siteOpenN" value="N" ${siteBasicVo.siteOpenYN eq 'N' ? 'checked' : ''} />
				<label for="siteOpenN" style="margin-left:10px;">아니오</label>
			</div>
		</div>


		<div class="col-md-12 test">
			<div class="form-group form-inline test">
				<label for="" class="col-md-1 test">로그인 상태</label>
				<input class="form-control ml-md-4" type="radio" name="loginStatusYN" id="loginStatusY" value="Y" ${siteBasicVo.loginStatusYN eq 'Y' ? 'checked':''} />
				<label for="loginStatusY" style="margin-left:10px;">예</label>
				<input class="form-control ml-md-4" type="radio" name="loginStatusYN" id="loginStatusN" value="N" ${siteBasicVo.loginStatusYN eq 'N' ? 'checked':''} />
				<label for="loginStatusN" style="margin-left:10px;">아니오</label>
			</div>
		</div>
		
		 
		<div class="col-md-12 test">
			<div class="form-group form-inline test">
				<label for="" class="col-md-1 test">소셜 로그인 설정</label>
				<input class="form-control ml-md-4" type="radio" name="socialLoginYN" id="socialLoginY" value="Y" ${siteBasicVo.socialLoginYN eq 'Y' ? 'checked':''} />
				<label for="socialLoginY" style="margin-left:10px;">예</label>
				<input class="form-control ml-md-4" type="radio" name="socialLoginYN" id="socialLoginN" value="N" ${siteBasicVo.socialLoginYN eq 'N' ? 'checked':''} />
				<label for="socialLoginN" style="margin-left:10px;">아니오</label>
			</div>
			<div class="form-group form-inline test" id="socialTypeArea" style="display:none;">
				<input class="form-control ml-md-4" type="hidden" name="socialType" id="socialType" value="${siteBasicVo.socialType }" />
				
				<input class="form-control ml-md-4" type="checkbox" name="socialTp" id="socialTpN" value="N" ${siteBasicVo.socialType eq 'N' ? 'checked':''} />
				<label for="socialTpN" style="margin-left:10px;">네이버</label>
				
				<input class="form-control ml-md-4" type="checkbox" name="socialTp" id="socialTpK" value="K" ${siteBasicVo.socialType eq 'K' ? 'checked':''} />
				<label for="socialTpK" style="margin-left:10px;">카카오</label>
				
				<input class="form-control ml-md-4" type="checkbox" name="socialTp" id="socialTpG" value="G" ${siteBasicVo.socialType eq 'G' ? 'checked':''} />
				<label for="socialTpG" style="margin-left:10px;">구글</label>
				
				<input class="form-control ml-md-4" type="checkbox" name="socialTp" id="socialTpA" value="A" ${siteBasicVo.socialType eq 'A' ? 'checked':''} />
				<label for="socialTpA" style="margin-left:10px;">애플</label>
			</div>
		</div>

		<div class="form-group row">
            <div class="col-sm-12" style="text-align:center;">
              <button type="button" class="btn btn-success" onclick="saveSetting();">저장</button>
            </div>
          </div>
	</form>
	</div>
   <script src="/js/site/basic/siteBasic.js"></script>
		