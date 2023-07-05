<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2 test">
			<jsp:include page="../../layouts/tree.jsp"/>		
		</div>
		<div class="col-md-10 test">
		
			<div class="row">
				<div class="col-md-12">
					<div class="tabbable" id="menuTab">
						<ul class="nav nav-tabs">
						    <li class="nav-item active"> 
						      <a class="nav-link"  href="javascript:void(0);" onclick="showTab(1);">메뉴정보</a>
						    </li>
						    <li class="nav-item">
						      <a class="nav-link"  href="javascript:void(0);" onclick="showTab(2);">메뉴권한</a>
						    </li>
						</ul>
						<form id="menuForm">
							<input type="hidden" id="activeNodeId" value=""/>
							<input type="hidden" id="treeCmd" value="" />
							<input type="hidden" name="parentMenuIdx" value="${menu.parentMenuIdx }"/>
							<input type="hidden" id="menuIdx" name="menuIdx" value="${menu.menuIdx}"/>
							<div class="tab-content">
								<div class="tab-pane active" id="tab1">
								    <h5>메뉴 상세화면</h5>
								    <div class="row">
										<div class="col-md-12">
										</div>
									</div>
									<div class="row">
										<div class="col-md-12" id="crudBtnArea">
											<div class="row">
												<div class="col-md-8 ml-3">
													<button type="button" class="btn btn-success btn-md" onclick="addMenu();">추가</button>
													<button type="button" class="btn btn-warning btn-md" onclick="modMenu();">수정</button>
													<button type="button" class="btn btn-danger btn-md"  onclick="deleteMenu();">삭제</button>
												</div>
											</div>
											<br/>
										</div>
									</div>
									<div class="row">
											<div class="col-md-12">
												
											    <fieldset class="form-group ml-3">
					 								<ul>
														<li>
															<label for="" class="col-sm-2 form-control-sm test">메뉴명</label>
													     	<input class="col-sm-6 form-control-sm" type="text" name="menuNm" size="40" value="${menu.menuNm }" />
													     </li>
													   	 <li class="row">
													    	  <label for="" class="col-sm-2 form-control-sm test" style="text-align:left;margin-left: 15px;">메뉴타입</label>
															  <div class="form-inline col-sm-6 test">
																    <div class="form-check mr-2">
																      <input type="radio" id="menuTp1" name="menuType" value="menu" class="form-control" disabled="disabled"/>
																      <label for="menuTp1" class="form-check-label ml-2">메뉴</label>
																    </div>
																    <div class="form-check mr-2">
																      <input type="radio" id="menuTp2" name="menuType" value="page" class="form-control" disabled="disabled"/>
																      <label for="menuTp2" class="form-check-label ml-2">페이지</label>
																    </div>
																    <div class="form-check">
																      <input type="radio" id="menuTp3" name="menuType" value="program" class="form-control" disabled="disabled"/>
																      <label for="menuTp3" class="form-check-label ml-2">프로그램</label>
																    </div>
															  </div>
														</li>
													     
													     <li> 
													        <label for="" class="col-sm-2 form-control-sm test">메뉴설명</label>
													     	<input class="col-sm-6 form-control-sm" type="text" name="menuDescription" size="40" value="${menu.menuDescription }"/>
													     </li>
													      
													     
													     
													     <li> 
													        <label for="" class="col-sm-2 form-control-sm test">메뉴레벨</label>
													     	<input class="col-sm-6 form-control-sm" type="text" name="menuLevel" size="40" value="${menu.menuLevel }"/>
													     </li>
													     
													     
														<li>
													     <label for="" class="col-sm-2 form-control-sm test">메뉴URL</label>
													     	<input class="col-sm-6 form-control-sm" type="text" name="menuUrl"  size="40" value="${menu.menuUrl }"/>
													     </li>
								
								
													     <li>
													 
													     <label for="" class="col-sm-2 form-control-sm test">메뉴순서</label>
													     	<input class="col-sm-6 form-control-sm" type="text" name="menuOrder"  size="40" value="${menu.menuOrder }"/>
													     </li>
					
													     <li>
													     <label for="" class="col-sm-2 form-control-sm test">메뉴패스</label>
													     	<input class="col-sm-6 form-control-sm" type="text" name="menuPath"  size="40" value="${menu.menuPath }"/>
													     </li>
				 										 <li>
													     	<label for="" class="col-sm-2 form-control-sm test">순서변경</label>
													     	<button type="button" class="btn btn-outline-secondary" id="upBtn" onclick="orderChange('up');">
														  		<i class="bi bi-arrow-up"></i>
															</button>
															<button type="button" class="btn btn-outline-secondary" id="downBtn" onclick="orderChange('down');">
															  <i class="bi bi-arrow-down"></i>
															</button>
													     </li>
													</ul> 
												</fieldset>
												</div>
											</div>
											<div class="offset-md-2 col-md-6" style="display: flex; justify-content: center;">
												<button type="button" class="btn btn-primary btn-md" onclick="saveMenu();">저장</button>
											</div>	
								</div>
									
							</div>
								
						
						</form>
									
						<div class="tab-pane" id="tab2" style="display:none; ">
							<div class="container-fluid">
								<div class="row">
									<div class="col-md-12">
										<h3 class="text-warning">
										</h3>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12 test">
										<div class="row">
											<div class="col-md-12 test">
												<div class="row">
													<div class="col-md-12 test">
													</div>
													 
												</div>
											</div>
										</div>
									 
											
										<div class="row">
											<div class="col-md-12 test">
												<button type="button" class="btn btn-success" id="checkMemGrp">
													그룹 및 멤버검색
												</button>
											</div>
										</div>

										<div class="row" >
											<div class="col-md-12" id="inserArea">
											</div>
										</div>
	 										
										<div class="row">
											<div class="col-md-12 test" style="">
												<span class="" id="authMenuNm" style="height:80px;">${menu.menuNm }</span> 권한 리스트
											</div>
										</div>	
										<div class="row">
											<div class="col-md-12 test" id="menuAuthList">
											</div>
										</div>	
										</div>
									</div>
								</div>
							</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
 
 
			 <div id="popup-container" class="col-md-12  popup-container">
				  <div class="popup-content" id="popupContent" style="width:1000px;height:600px;">
				 		<div class="row mainPopup">
						  	<div class="col-md-6 test leftPopup">
						     	<ul id="grpList"></ul>
						   	</div>
				   		  	<div class="col-md-6 test rightPopup"   id="grpPerMemList">
						  	</div>
						
						 	<div class="col-md-12 test form-group text-center">
						 	 	<button type="button" class="btn btn btn-primary mx-auto" id="addMemberIdx">추가</button>
						 	 	<button type="button" class="btn btn-secondary mx-auto" id="closeBtn">닫기</button>
							</div>
						</div>
				  </div>
			</div>
<script src="/js/site/menu/menu.js"></script>
<script src="/js/common/treeFunction.js"></script>