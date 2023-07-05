<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 <div class="col-md-12 test" style="background-color:white;">
 
     <form>
  	   		  <input type="hidden" value="${member.memberId }" />
		      <div class="row">
		        <div class="offset-md-3 col-md-6 test">
		        
		        <div class="form-group row">
		            <label for="input-id" class="col-sm-3 col-form-label">ID</label>
		          	<div class="form-inline col-sm-9">
		            <input type="text" class="form-control col-md-6" id="input-id" placeholder="Enter ID" value="${member.memberId }" />
						<c:if test="${member.memberId  ne ''} ">
				            <button type="button" class="form-control btn btn-primary offset-md-1 col-md-3" id="input-id">ID 체크</button>
						</c:if>
		       		</div>
				</div>
				
		        <div class="form-group row">
		          <label for="input-name" class="col-sm-3 col-form-label">이름</label>
		          <div class="col-sm-9">
		            <input type="text" class="form-control col-md-6" id="name" name="name" placeholder="이름" value="${member.name }">
		          </div>
		        </div>
		        
		        
		        <div class="form-group row">
		          	<label for="input-address" class="col-sm-3 col-form-label">주소</label>
		          	<div class="col-sm-9 form-inline">
		            	<input type="text" class="form-control col-md-6" id="input-address" placeholder="주소" name="address" value="${member.address }"/>
		            	<button type="button" class="form-control btn btn-primary offset-md-1 col-md-3"  >주소검색</button>
		            	<br/><br/><input type="text" class="form-control col-md-6" id="input-address" name="detailAddress" placeholder="상세주소" value="${member.detailAddress }"/>
					</div>
		        </div>
		        
		        
		        <div class="form-group row">
					<c:set var="phone" value="${member.phone}" />
		            <label for="input-contact" class="col-sm-3 col-form-label">연락처</label>
		            <div class="form-inline col-sm-9">
		                <input type="text" class="form-control col-sm-3" id="input-contact" placeholder="연락처" value="${fn:substring(phone, 0, 3)}"/>
		                <span class="col-md-1">-</span>
		                <input type="text" class="form-control col-sm-3" id="input-contact" placeholder="연락처" value="${fn:substring(phone, 3, 7)}"/>
		                <span class="col-md-1">-</span>
		                <input type="text" class="form-control col-sm-3" id="input-contact" placeholder="연락처" value="${fn:substring(phone, 7, 11)}"/>
		            </div>
		        </div>
		        
		        <div class="form-group row">
		          <label for="input-email" class="col-sm-3 col-form-label">이메일</label>
		          <div class="col-sm-9 form-inline">
		            <input type="email" class="col-md-3 form-control" id="input-email" placeholder="이메일"  value="${fn:split(member.email,'@')[0]}">
		            <span class="form-check">@</span>
		            <select class="form-control col-md-6" style="margin-left:1px;">
		                <option value="1" ${fn:split(member.email,'@')[1] eq '1' ? 'selected':''}>gmail.com</option>
		                <option value="2" ${fn:split(member.email,'@')[1] eq '2' ? 'selected':''}>naver.com</option>
		                <option value="3" ${fn:split(member.email,'@')[1] eq '3' ? 'selected':''}>kakao.com</option>
		            </select>
		          </div>
		        </div>
		 
		        <div class="form-group row">
		          <label for="input-memo" class="col-sm-3 col-form-label">메모</label>
		          <div class="col-sm-9">
		            <textarea class="form-control" id="input-memo" rows="3" placeholder="Enter 메모"></textarea>
		          </div>
		        </div>
		
		
		        <div class="form-group row">
		            <label for="input-department" class="col-sm-3 col-form-label">부서</label>
		            <div class="col-sm-3">
		                <select class="form-control" id="input-department">
							<option value="depart0001" ${member.departId eq 'depart0001' ? "selected":""}>영업팀</option>
							<option value="depart0002" ${member.departId eq 'depart0002' ? "selected":""}>개발팀</option>
							<option value="depart0003" ${member.departId eq 'depart0003' ? "selected":""}>인사팀</option>
							<option value="depart0004" ${member.departId eq 'depart0004' ? "selected":""}>재무팀</option>
							<option value="depart0005" ${member.departId eq 'depart0005' ? "selected":""}>마케팅팀</option>
							<option value="depart0006" ${member.departId eq 'depart0006' ? "selected":""}>물류팀</option>
							<option value="depart0007" ${member.departId eq 'depart0007' ? "selected":""}>영업1팀</option>
							<option value="depart0008" ${member.departId eq 'depart0008' ? "selected":""}>영업2팀</option>
							<option value="depart0009" ${member.departId eq 'depart0009' ? "selected":""}>개발1팀</option>
							<option value="depart0010" ${member.departId eq 'depart0010' ? "selected":""}>개발2팀</option>
							<option value="depart0011" ${member.departId eq 'depart0011' ? "selected":""}>개발3팀</option>
							<option value="depart0012" ${member.departId eq 'depart0012' ? "selected":""}>개발4팀</option>
							<option value="depart0013" ${member.departId eq 'depart0013' ? "selected":""}>인사1팀</option>
							<option value="depart0014" ${member.departId eq 'depart0014' ? "selected":""}>인사2팀</option>
							<option value="depart0015" ${member.departId eq 'depart0015' ? "selected":""}>인사3팀</option>
							<option value="depart0016" ${member.departId eq 'depart0016' ? "selected":""}>인사4팀</option>
							<option value="depart0017" ${member.departId eq 'depart0017' ? "selected":""}>인사1팀</option>
							<option value="depart0018" ${member.departId eq 'depart0018' ? "selected":""}>인사2팀</option>
							<option value="depart0019" ${member.departId eq 'depart0019' ? "selected":""}>인사3팀</option>
							<option value="depart0020" ${member.departId eq 'depart0020' ? "selected":""}>인사4팀</option>
							<option value="depart0021" ${member.departId eq 'depart0021' ? "selected":""}>마케팅1팀</option>
							<option value="depart0022" ${member.departId eq 'depart0022' ? "selected":""}>마케팅2팀</option>
							<option value="depart0023" ${member.departId eq 'depart0023' ? "selected":""}>마케팅3팀</option>
							<option value="depart0024" ${member.departId eq 'depart0024' ? "selected":""}>마케팅4팀</option>
							<option value="depart0025" ${member.departId eq 'depart0025' ? "selected":""}>물류1팀</option>
							<option value="depart0026" ${member.departId eq 'depart0026' ? "selected":""}>물류2팀</option>
							<option value="depart0027" ${member.departId eq 'depart0027' ? "selected":""}>물류3팀</option>
							<option value="depart0028" ${member.departId eq 'depart0028' ? "selected":""}>물류4팀</option>
		                </select>
		            </div>
		            <div class="form-inline row">
		            <label for="input-position" class="col-sm-6 col-form-label">직급</label>
		            <div class="col-sm-6">
		                <select class="form-control" id="input-position">
		                  <option value="DP0001" ${member.departPos eq 'DP0001' ? "selected":""}>사장</option>
						  <option value="DP0002" ${member.departPos eq 'DP0002' ? "selected":""}>부사장</option>
						  <option value="DP0003" ${member.departPos eq 'DP0003' ? "selected":""}>이사</option>
						  <option value="DP0004" ${member.departPos eq 'DP0004' ? "selected":""}>부장</option>
						  <option value="DP0005" ${member.departPos eq 'DP0005' ? "selected":""}>차장</option>
						  <option value="DP0006" ${member.departPos eq 'DP0006' ? "selected":""}>과장</option>
						  <option value="DP0007" ${member.departPos eq 'DP0007' ? "selected":""}>대리</option>
						  <option value="DP0008" ${member.departPos eq 'DP0008' ? "selected":""}>주임</option>
						  <option value="DP0009" ${member.departPos eq 'DP0009' ? "selected":""}>사원</option>
		                </select>
		            </div>
		          </div>
		        </div>
		        <br/>
		        <br/>
		        <br/>
		        
		        <div class="form-group row">
		          <div class="col-sm-12" style="text-align:center;">
		            <button type="submit" class="btn btn-success">저장</button>
		          </div>
		        </div>
    		</div>
  		</div>
    </form>
 </div>