<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
	
	<div class="col-md-12 test">
 
	   <form method="post">
	   	  <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
	   	  
	   	  <input name="pageNo" type="hidden" value="<c:out value='${searchVO.pageNo}'/>"/>
	   	  
	   	  
	   </form> 
	
         <table class="table table-bordered">
             <colgroup>
                 <col width="5%"></col>
                 <col width="10%"></col>
                 <col width="10%"></col>
                 <col width="10%"></col>
                 <col width="*"></col>
                 <col width="15%"></col>
                 <col width="15%"></col>
                 <col width="10%"></col>
                 <col width="10%"></col>

             </colgroup>
             <thead>
             <tr>
                 <th>No</th>
                 <th>부서명</th>
                 <th>직급</th>
                 <th>아이디</th>
                 <th>이름</th>
                 <th>연락처</th>
                 <th>이메일</th>
                 <th>가입일</th>
                 <th>관리</th>
				</tr>
             </thead>
             <tbody>  
                 <c:forEach var="member" items="${memberList}" varStatus="status">
                     <tr>
                         <td>
							${fn:length(memberList) - status.index} 
                         </td>
                         <td>
	                         ${member.departName}
                         </td>
                         <td>
	                         ${member.departPos}
                         </td>
                          <td>
	                         <a href="#" onclick="memberDetail('${member.memberId}')">${member.memberId}</a>
                         </td>
                         <td>
	                         ${member.name}
                         </td>
                         <td>
	                         ${member.phone}
                         </td>
                         <td>${member.email}</td>
                         <td>${member.joinDate}</td>
                         <td><button type="button" class="btn btn-danger" onclick="stopBan('${member.memberId}');">삭제</button></td>
                     </tr>

                 </c:forEach>
             </tbody>
         </table>
       <div id="paging">
          <ul class="paging">
               <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="goPage"  />
          </ul>
     </div> 
 </div>
    <script src="/js/member/member.js"></script>
 