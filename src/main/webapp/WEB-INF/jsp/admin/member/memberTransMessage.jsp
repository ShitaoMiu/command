<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  	<div class="col-md-2 test">
 		<div id="tree"></div>
  	</div>
  	
  	
  	
 	<div class="col-md-10 test">
 	   <form method="post">
	   	  <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
	   	  <input name="pageNo" type="hidden" value="<c:out value='${searchVO.pageNo}'/>"/>
	   </form> 
	   <div class="col-lg-12">
		   <div class="offset-lg-2 form-group  text-right mt-2">
		   		<button type="button" class="btn btn-secondary"">전체선택</button>
		   		<button type="button" class="btn btn-secondary""> 전체해제</button>
		   		<button type="button" class="btn btn-primary">메일</button>
				<button type="button" class="btn btn-secondary">문자</button>	
				
		   </div>
 	   		
 	   	   <div class="row">	
	 	       <table class="table table-bordered">
	             <colgroup>
	                 <col width="5%"></col>
	                 <col width="20%"></col>
	                 <col width="15%"></col>
	                 <col width="15%"></col>
	                 <col width="20%"></col>
	             </colgroup>
	             <thead>
	             <tr>
	                 <th>No</th>
	                 <th>부서명(직급)</th>
	                 <th>아이디</th>
	                 <th>이름</th>
	                 <th>연락처</th>
	                 <th>이메일</th>
	                 <th>가입일</th>
	                 
					</tr>
	             </thead>
	             <tbody id="memberDeptList">  
	             </tbody>
				</table>
			</div> 	 
			
		</div>
 	</div>
 	
 <div id="popupContainer" class="popup-container">
    <div class="popup-content">
      <span class="close" onclick="closePopup()">&times;</span>
      <h2>레이어 팝업</h2>
      <p>이곳에 팝업 내용을 추가하세요.</p>
      <button class="popup-close-button" onclick="closePopup()">닫기</button>
    </div>
  </div>
 	
 	
 	
 <script>
$(function(){
	const url = "/admin/member/dept/list";
    let param = '';
    commonAjax(url,"get",param,function(data){
    	openTree(data.deptList);
	}, function(status, error) {
		console.log(status, error);
	});
});
 

function openTree(jsonData)
{
	let treeData = [];
	jsonData.forEach((item) => {
		const obj =
		{
				id :item.departId
				,parent:item.parentDepartId ? item.parentDepartId : "#"
			    ,text : item.departName			
		}
		treeData.push(obj);
	});
	
  	initTree(treeData);
}

function initTree(treeData)
{
	$('#tree').jstree({
        core: {
          themes: {
            responsive: false,
          },
          check_callback: true,
          data: treeData,
        },
        types: {
          default: {
            icon: "fa fa-folder text-primary",
          },
          file: {
            icon: "fa fa-file text-primary",
          },
        },
        plugins: ["types", "search","dnd-sort"],
      }).on('ready.jstree', function () {
    	  $('#tree').jstree('open_all');
      }).on("select_node.jstree",function(e,data){
      	  viewDept(data.node.id);      
      }) 
}


function viewDept(deptId)
{
	const url = "/admin/member/dept/members";
    let param = {"deptId": deptId};
    commonAjax(url,"get",param,function(data){
    	deptPerMemberList(data.deptPerMemberList);
 	}, function(status, error) {
		console.log(status, error);
	});
}

function deptPerMemberList(jsonList)
{
	 console.log(jsonList);
	 var dhtml="";
	 var reverse = jsonList.length;
	 
	 
	 
	 var upDhtml ="<button type='button'>전체 선택</button><button type='button'>전체 해제</button>";
	 if(jsonList.length > 0)
	 {
		 
	 }
	 for(var i=0;i<jsonList.length;i++){
		  
		 dhtml+="<tr>";
		 dhtml+="<td><div class='form-check'><input type='checkbox' class='form-check-input' id='mem_"+jsonList[i].memberId+"' name='departMemberIdx'></div></td>";
		 dhtml+="<td>"+jsonList[i].departName+"("+jsonList[i].departPos+")</td>";
	     dhtml+="<td>"+jsonList[i].memberId+"</td>";
	     dhtml+="<td>"+jsonList[i].name+"</td>";
	     dhtml+="<td>"+jsonList[i].phone+"</td>";
	     dhtml+="<td>"+jsonList[i].email+"</td>";
	     dhtml+="<td>"+jsonList[i].joinDate+"</td>";
	     dhtml+="</tr>";
	     reverse--;
 	 }
	 
	$("#memberDeptList").html(dhtml);
}
function openPopup() {
  	document.getElementById('popupContainer').style.display = 'block';
}

function closePopup() {
	  document.getElementById('popupContainer').style.display = 'none';
}


</script>

<style>
.popup-container {
  display: none;
  position: fixed;
  z-index: 999;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.5);
}

.popup-content {
  background-color: #fefefe;
  margin: 10% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
  max-width: 600px;
  position: relative;
}

.close {
  color: #aaa;
  position: absolute;
  top: 10px;
  right: 20px;
  font-size: 28px;
  font-weight: bold;
  cursor: pointer;
}

.popup-close-button {
  display: block;
  margin: 0 auto;
  padding: 10px 20px;
  background-color: #ccc;
  border: none;
  border-radius: 4px;
  font-size: 16px;
  cursor: pointer;
}


</style>
 