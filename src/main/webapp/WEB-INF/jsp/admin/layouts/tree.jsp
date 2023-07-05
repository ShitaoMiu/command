<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="col-md-12 test">
		<input type="hidden" name="menuIdx" value="${menuIdx} " id="menuIdx"/>
		<input type="hidden" name="treeType" value="${treeType }" id="treeType"/>
		<div class="row">
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