<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
	<div class="col-md-12 test">
 
	   <form method="post">
	   		<div class="form-group form-inline">
	         	<div class="col-md-3 card-body form-group test">
                      <input type="hidden" id="banType" name="banType" value=""/>
                      <label for="" class="form-group">차단 유형</label>
                      <select id="banTypeSelect" class="col-md-4 ml-5 form-control test">
                          <option value="0">아이피</option>
                      </select>
			          <input type="hidden" name="banIpNation" value=""/>
			    </div>
	                   		 
                <div class="col-md-3 card-body form-group test" id="ipBanEach"> 
                 	 <label for="" class="form-group">아이피
                    	<input type="text" name="banIp" class="form-control ml-3" placeholder="000.000.000.000"/>
                    </label>
           	 	</div>
           	 	
           	 	
		                     
		 
                <div class="col-md-4 card-body form-group test">
					  <label for="" class="form-group mr-4">차단사유</label>
                     <input type="text" name="banMsg" class="col-md-9 form-control  ml-1" value=""/>
                </div>
                  
                  <div class="col-md-2 card-body form-group test">
                   	  <button class="btn btn-primary text-center ml-2 mb-2" onclick="saveBan();">저장</button>	
                  </div>
              </div>
		</form> 
	
         <table class="table table-bordered">
             <colgroup>
                 <col width="5%"></col>
                 <col width="10%"></col>
                 <col width="10%"></col>
                 <col width="40%"></col>
                 <col width="10%"></col>
                 <col width="10%"></col>
                 <col width="*"></col>

             </colgroup>
             <thead>
             	<tr>
                 <th>No</th>
                 <th>Ip</th>
                 <th>국가</th>
                 <th>차단사유</th>
                 <th>등록자</th>
                 <th>등록일</th>
                 <th>차단해제</th>
				</tr>                 
             </thead>
             <tbody>
                 <c:forEach var="item" items="${securityIpList}" varStatus="status">
                     <tr>
                         <td>${fn:length(securityIpList) - status.index}</td>
                         
                         <td>${item.banIp}</td>
                         <td>${item.country}</td>
                         <td>
	                          <ul>
		                          <c:forEach var="ban" items="${item.banMsgs }" >
									<li>${ban}</li>		                            
		                          </c:forEach>
	                          </ul>
                         </td> 
                         <td>${item.regId}</td>
                         <td>${item.regDate}</td>
                         <td><button type="button" class="btn btn-danger" onclick="resetBan('${item.banIp}');">차단해제</button></td>
                     </tr>
                 </c:forEach>
                 <c:if test="${empty securityIpList}">
					<tr>
						<td colspan="7" class="" style="text-align:center; ">데이터가없습니다</td>
					</tr>
                 </c:if>
                 
                 
             </tbody>
         </table>
      	<div id="paging">
          <ul class="paging">
               <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="goPage"  />
           		<form:hidden path="pageIndex" />
          </ul>
     </div> 
 </div>
 
   <script src="/js/site/security/banIp.js"></script>
		