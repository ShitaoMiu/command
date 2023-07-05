<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="/js/egov/EgovMultiFile.js"></script> 
<div class="col-md-12 test">
<form id="popup" enctype="multipart/form-data" method="post">
	  <div class="form-group row">
	      <input type="hidden" name="popupIdx" id="popupIdx" class="col-md-7 ml-2 form-control" value="${popupVo.popupIdx }" />
	     <label for="" class="col-md-3 form-check-label test">이름</label>  
		  	<div class="col-md-7 form-inline ml-4 test">  
	    	     <input type="text" name="title" id="title" class="col-md-7 ml-2 form-control" value="${popupVo.title }" />
			</div>
      </div>
	  <div class="form-group row">
	     <label for="" class="col-md-3 form-check-label test">유효기간</label>  
         <div class="col-md-9 form-inline">
	         <div class="col-md-4 form-group test ml-2">
	             <label for="" class="  form-check-label test">게시시간</label>  
	         	 <input type="text" class="col-md-5 form-control" id="stTime" name="stTime" value="${popupVo.stTime }" />
			 </div>
			 <div class="col-md-4 form-group test">
	             <label for="" class="  form-check-label test">종료시간</label>  
	         	 <input type="text" class="col-md-5 form-control" id="enTime" name="enTime" value="${popupVo.enTime }" />
			 </div>
		 </div>
      </div>

	  <div class="form-group row">
	     <label for="" class="col-md-3 form-check-label test">팝업내용</label>  
         <textarea class="col-md-8 form-control ml-4 test" name="content" id="content">${popupVo.content }</textarea>
      </div>

	  <div class="form-group row">
	     <label for="" class="col-md-3 form-check-label test">팝업설명</label>  
         <textarea class="col-md-8 form-control ml-4 test" name="expl" id="expl">${popupVo.expl }</textarea>
      </div>
		
	  <div class="form-group row">
	    <label for="" class="col-md-3 form-check-label test">팝업타입</label>  
	    <div class="col-md-9 form-inline">
 		    <div class="col-md-3 form-group">
			  <input type="radio" class="form-control" id="popupType1" name="popupType" value="1" ${popupVo.popupType == '1' ? 'checked':'' } />
			  <label for="popupType1" class="col-md-5 form-check-label test">팝업타입</label>  
			</div>
		    <div class="col-md-3 form-group">
			  <input type="radio" class="form-control" id="bannerType2" name="popupType" value="1" ${popupVo.popupType == '2' ? 'checked':'' } />
			  <label for="bannerType2" class="col-md-5 form-check-label test">배너타입</label>   
			</div>
		</div>
	 </div>	
		
		
		
      <div class="form-group row">
	     <label for="" class="col-md-3 form-check-label test">팝업옵션</label>
	     <div class="col-md-7 form-inline test">  
		     <div class="col-md-3 ml-2 form-inline test">
		     	<input type="radio" id="option1" class="form-control ml-8"  name="popupOptionType"   value="1"  ${popupVo.popupOptionType == '1' ? 'checked':'' } />
		     	<label for="option1" class="pl-2">오늘 하루 보이지 않기</label>
			 </div>
 			 <div class="col-md-3 form-inline test">  
		     	<input type="radio" id="option2" class="form-control ml-7" name="popupOptionType"  value="2" ${popupVo.popupOptionType == '2' ? 'checked':'' } />
		     	<label for="option2" class="pl-2">
		   		<input type="text" name="popupOptionDay" size="1"  value="${popupVo.popupOptionDay }">일 보이지 않기</label>
			 </div>
		 </div>
      </div>

      <div class="form-group row">
	    <label for="" class="col-md-3 form-check-label test">사이즈</label>  
        <div class="col-md-7 form-inline test"> 
        		<div class="col-md-3 ml-2 form-inline test">
	             	<label for="option1" class="pl-2">가로</label>
	        		<input type="text" id="option1" class="form-control ml-2" name="width" size="4"  value="${popupVo.width}" />
	        		<span class="pl-3">px</span>
        		</div>
        		<div class="col-md-3 form-inline test">
	             	<label for="option1" class="pl-2">세로</label>
	        		<input type="text" id="option1" class="form-control ml-2"   name="height" size="4"   value="${popupVo.height}" />
	        		<span class="pl-3">px</span>
				</div>
			 </div>
      </div>

 	 <div class="form-group row"> 
 	  	<div class="col-md-3 test">이미지파일</div>
	     	<div class="col-md-7 form-inline  test"> 
		   	 <label for="" class=""></label>  
      			<input type="file" name="popsFile"  id="popupImageFileUploader" class="form-control ml-md-4" value=""/>
      			<div class="" id="popupImageFileList"></div>
				<c:if test="${popupVo.atchFileId != '' }">
					<li>
						<a href="javascript:void(0);" onclick="fn_egov_downFile('${popupVo.atchFileId}','${popupVo.fileSn}')">
							${popupVo.orignFileNm}
						</a>
						<button type="button" onclick="fileEachDelete('${popupVo.atchFileId}','${popupVo.fileSn}','faviFileList');">Delete</button>
					</li>	
				</c:if>
	       	</div>
     </div>
     
     
     <div class="form-group row"> 
 	  <label class="col-md-3 form-check-label test">노출대상</label>
	     <div class="col-md-9 form-inline  test"> 
			 <div class="col-md-4 form-inline">
				 <input type="radio" name="disposeTarget" id="disposeTargetY" value="Y"  ${popupVo.disposeTarget =='Y' ? 'checked' :'' } />
				 <label for="disposeTargetY">로그인 한사람</label>  
			 </div>
			 <div class="pl-4 form-inline">
				 <input type="radio" name="disposeTarget" id="disposeTargetN" value="N" ${popupVo.disposeTarget =='N' ? 'checked' :'' } >
				 <label for="disposeTargetN">비로그인 포함</label>  
			</div>
       	 </div>
     </div>
</form>
</div>
<div class="form-group offset-md-5">
	<button class="btn btn-primary" onclick="popupSave();" type="button">저장</button>
	<c:if test="${popupVo.popupIdx !='' }">
		<button class="btn btn-danger" onclick="popupDelete();" type="button">삭제</button>
	</c:if>
	<button class="btn btn-primary" onclick="popupList();" type="button">목록</button>
</div>
<script src="/js/content/popup/popup.js"></script>