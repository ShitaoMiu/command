<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
 <script src="https://cdn.ckeditor.com/ckeditor5/37.1.0/classic/ckeditor.js"></script>
 
		<div class="col-md-2 test" style="min-height:800px;">
		  		  <input type="hidden" name="menuIdx" 		value="${menuIdx} " id="menuIdx"/>
				  <input type="hidden" name="menuType" 	 	value="page" id="menuType"/>
				  <input type="hidden" name="pageSettingIdx"  value="${pageSettingIdx }" id="pageSettingIdx"/>

			<div class="row">
				<div class="col-md-12 test">
				<select id="siteList" name="siteList" class="form-control" >
					<option value="1" >서비스사이트</option>
					<option value="2" selected="selected">관리자 사이트</option>
				</select>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 test">
					<div class="row">
						<div class="col-md-8 test">
						<input type="text" name="searchNm" value="" placeholder="메뉴명"  class="form-control"/>   
						</div>
						<div class="col-md-4 test">
							<button type="button" class="btn btn-info btn-md" onclick="searchMemberGrpList();" >검색</button>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 test">
					<div id="tree"></div>
				</div>
			</div>
		</div>
		<div class="col-md-10 test" style="min-height:800px; ">
			<div class="row">
				<div class="col-md-12">
					<div id="editor" class="editor">
					</div>
				</div>
			</div>
		</div>
 <script src="/js/content/page/pagePerListDetail.js"></script>
<script src="/js/common/treeFunction.js"></script>