let checkedMemId ="";
$(function() {
	
	  // Hide popup when close button is clicked
	  $("#close-popup").click(function() {
	    $("#popup-container").fadeOut();
	  });
	
	$("#file").hide();
	$("#file").change(function(e) {
		var zero = '0%';
		$('#progressBar').text(zero);
		$('#progressBar').css('width', '0px');
	});
	getTreeListData('2','menu');
	 

	$("#closeBtn").click(function(){
		$("#popupContent").hide();
		location.reload();
	});
});
function go_popup() {
	$('#popup').bPopup();
};

function openPopup() {
    document.getElementById("popupBackground").style.display = "block";
    document.getElementById("popupContent").style.display = "block";
  }

  function closePopup() {
    document.getElementById("popupBackground").style.display = "none";
    document.getElementById("popupContent").style.display = "none";
  }


	function showTab(type)
	{
		const clickId = $("#activeNodeId").val();
		if(!clickId)
		{
			alert("메뉴를 클릭해주세요");
			return false;
		}
		const menuType = type;
		menuDetailData(clickId);
		if(menuType==1)
		{
		 $("#tab1").show();
		 $("#tab2").hide();
		 $("#tab3").hide();
		 $("div > .nav-tabs > li:eq(0)").addClass("active");
		 $("div > .nav-tabs > li:eq(1)").removeClass("active");
		 $("div > .nav-tabs > li:eq(2)").removeClass("active");
	 	 
		 $(".tab-content > div:eq(0)").addClass("active");
	 	 $(".tab-content > div:eq(1)").removeClass("active");
	 	 $(".tab-content > div:eq(2)").removeClass("active");
	 	 
		}
		
		else if(menuType==2)
		{
			$("#tab1").hide();
			$("#tab2").show();
			$("#tab3").hide();
		 	$("div > .nav-tabs > li:eq(0)").removeClass("active");
		 	$("div > .nav-tabs > li:eq(1)").addClass("active");
		 	$("div > .nav-tabs > li:eq(2)").removeClass("active");
		
		 	$(".tab-content > div:eq(0)").removeClass("active");
		 	$(".tab-content > div:eq(1)").addClass("active");
		 	$(".tab-content > div:eq(2)").removeClass("active");
		}

		else if(menuType==3)
		{
			$("#tab1").hide();
			$("#tab2").hide();
			$("#tab3").show();
			$("div > .nav-tabs > li:eq(0)").removeClass("active");
		 	$("div > .nav-tabs > li:eq(1)").removeClass("active");
		 	$("div > .nav-tabs > li:eq(2)").addClass("active");
		 	
		 	$(".tab-content > div:eq(0)").removeClass("active");
		 	$(".tab-content > div:eq(1)").removeClass("active");
		 	$(".tab-content > div:eq(2)").addClass("active");
			
		}
	
	
	
	}
 

 
 
$("#checkMemGrp").click(function() {
	let insertLength =$("#inserArea > div ").length;
	if(insertLength > 0 ){
	let result = confirm("추가해놓은 멤버 내역이 있습니다.취소하시겠습니까?");
		if(result){
			$("#inserArea").html('');
		}else
		{
			return false;
		}	

	}
	
	
	
	let length = $('[id^="menuAuthMem"]').length;
	const list =[];
	for(let i=0;i<length;i++)
	{
		$("#menuAuthMem"+i).html();
		list.push($("#menuAuthMem"+i).html());
	}
	selectGrpMemberList(list.toString());
});


$("#closeButton").click(function() {
	$("#popup").hide();
});

//그룹리스트
function selectGrpMemberList(obj)
{
	checkedMemId = obj;
	
	const url ="/admin/site/member/ajaxGrpList";
 	commonAjax(url,"get",null,function(data){
 	 let dhtml="";
 	 if(data.groupList != null ){
		for(var i=0;i<data.groupList.length;i++)
		{
			let memGrpId = data.groupList[i].memGrpId;
			
			dhtml+="<li id='"+memGrpId+"'class='form-group'>";
			dhtml+='<a href="javascript:void(0);" class="btn btn-link" onclick="selectGroupId(\'' + memGrpId + '\');">' + data.groupList[i].memGrpNm +'</a>';
			dhtml+='&nbsp;&nbsp;<button type="button" class="btn btn-info" onclick="checkSameAuth(\'' + memGrpId + '\')">그룹 일괄 추가 (동일 권한)</button>';
			dhtml+='&nbsp;&nbsp;<button type="button" class="btn btn-info" onclick="allGrpPerMemcheck(\'' + memGrpId + '\')">전체 체크</button>';
		
		
		}
 	 }
 	 
	$("#grpList").html(dhtml);
	$("#popup-container").fadeIn();
	
 	}, function(status, error) {
		  console.log(status, error);
	});
}


//그룹별 멤버 
function selectGroupId(memGrpId)
{
	console.log("그룹 아디디"+memGrpId);
 	let dhtml="";
 	let str="";
	const url ="/admin/site/member/ajaxGrpPerMemList";
	const param = {"memGrpId" : memGrpId};
 	commonAjax(url,"get",param,function(data){
 	const checkedMemArr = checkedMemId.split(",");
 	dhtml += '<ul class="ulList" id="grpPermem_' + memGrpId + '">';
 	for(let i=0;i<data.groupPerMemList.length;i++)
	{
			
			dhtml+="<li>";
			const isIncluded = checkedMemArr.includes(data.groupPerMemList[i].memberId);
			if(isIncluded)
			{
				dhtml+=data.groupPerMemList[i].name+"("+data.groupPerMemList[i].memberId+")[이미 추가]";

			}else
			{		
				dhtml+="<div class='form-inline form-group'>";
				dhtml+="<label for='popupMemId"+i+"'>"+data.groupPerMemList[i].name +"("+data.groupPerMemList[i].memberId +")</label>";
				dhtml+='<input type="checkbox" class="form-group ml-2" id="popupMemId' + i + '" name="popupMemId" value="' + data.groupPerMemList[i].memberId + '">';
				dhtml+="</div>";
			}
 			dhtml+="</li>";
	 }
 	dhtml+="</ul>";
	$("#grpPerMemList").html(dhtml);

 	}, function(status, error) {
		  console.log(status, error);
	});

}
 

function uploadFile() {
	var file = $('#file').get(0).files[0];
	var formData = new FormData();
	formData.append('file', file);
	$.ajax({
		url: '/upload.do',
		method: 'POST',
		data: formData,
		processData: false,
		contentType: false,
		xhr: function() {
			var xhr = $.ajaxSettings.xhr();
			xhr.upload.onprogress = function(e) {  //progress 이벤트 리스너 추가
				var percent = e.loaded * 100 / e.total;
				var width = percent / 100 * 300;
				width = width + "px";
				$('#progressBar').text(percent + '%');
				$('#progressBar').css('width', width);
			}
			return xhr;
		},
		success: function(response) {
			$('#progressBar').text('100%');
			alert('File uploaded successfully');
		},
		error: function(request, status, error) {

			alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);

		}
	});
}

$("#fileInput").click(function() {
	$("#file").click();
});





$("#addMemberIdx").click(function(){
	let checkedValues = [];
	$("#grpPerMemList > ul > li > div > input:checked").each(function() {
	  checkedValues.push($(this).val());
	});
	let dhtml="";
	for(let i=0;i<checkedValues.length;i++)
	{
		dhtml+="<div class='form-group row' id='ins"+i+"'>";
		dhtml+="<div class='col-md-2 test'>";
		dhtml+="	<input type='text' id='menuOwner_"+i+"' class='form-control-sm' size='21' value='"+checkedValues[i]+"'/>";
		dhtml+="</div>";
		dhtml+="<div class='col-md-10 test'>";
		dhtml+="<div class='row'>";
		dhtml+="	<div class='col-md-2'>";
		dhtml+="			<div class='form-group form-inline'>";
		dhtml+="			    <input type='checkbox' class='form-form-control-lg' id='insCanRead"+i+"'>";
		dhtml+="			    <label class='ml-3' for='insCanRead"+i+"'>읽기</label>";
		dhtml+="			</div>";
		dhtml+="		</div>";
		dhtml+="	<div class='col-md-2'>";
		dhtml+="		<div class='form-group form-inline'>";
		dhtml+="		    <input type='checkbox' class='form-form-control-lg' id='insCanWrite"+i+"'>";
		dhtml+="		    <label class='ml-3' for='insCanWrite"+i+"'>쓰기</label>";
		dhtml+="		</div>";
		dhtml+="	</div>";
		dhtml+="	<div class='col-md-2'>";
		dhtml+="		<div class='form-group form-inline'>";
		dhtml+="	    <input type='checkbox' class='form-form-control-lg' id='insCanDelete"+i+"'>";
		dhtml+="	    <label class='ml-3' for='insCanDelete"+i+"'>삭제</label>";
		dhtml+="		 </div>";
		dhtml+="	</div>";
		dhtml+="	<div class='col-md-2'>";
		dhtml+="			<div class='form-group form-inline'>";
		dhtml+="		    <input type='checkbox' class='form-form-control-lg' id='insCanModify"+i+"'>";
		dhtml+="		    <label class='ml-3' for='insCanModify"+i+"'>수정</label>";
		dhtml+="		</div>";
		dhtml+="	</div>";
		dhtml+="	<div class='col-md-2'>";
		dhtml+="		<div class='form-group form-inline'>";
		dhtml+="	    <input type='checkbox' class='form-form-control-lg' id='insCanManage"+i+"'>";
		dhtml+="		    <label class='ml-3' for='insCanManage"+i+"'>관리</label>";
		dhtml+="	</div>";
		dhtml+="		</div>";
		dhtml+="	<div class='col-md-2'>";
		dhtml+='		 <button type="button" class="btn-sm btn-primary" onclick="saveAuthData(this,0);">';
		dhtml+="			저장";
		dhtml+="			</button>";
		dhtml+="		</div>";
		dhtml+="	</div>";
		dhtml+="	</div>";
		dhtml+="</div>";
	}
	$("#inserArea").html(dhtml);
	$("#popup-container").fadeOut();
});
 
	
 function saveAuthData(obj,type)
 {
	 let $this = $(obj);
	 let memberId = "";
	 let id = "";
	 if(type == 0 )
	 {
		  rowId = $this.parent().parent().parent().parent().attr("id");
		  idx = rowId.replace("ins","");
		 
		  canRead = $("#insCanRead"+idx).is(":checked")?1:0;
		  canWrite = $("#insCanWrite"+idx).is(":checked")?1:0;
		  canDelete = $("#insCanDelete"+idx).is(":checked")?1:0;
		  canModify = $("#insCanModify"+idx).is(":checked")?1:0;
		  canManage = $("#insCanManage"+idx).is(":checked")?1:0;
		  memberId = $("#menuOwner_"+idx).val();	 
	 }
	 else
	 {
		 rowId =$this.parent().parent().parent().parent().children(0).children(0).html();
		 idx = $this.parent().parent().parent().attr("id").replace("row","");
		 
		 canRead = $("#canRead"+idx).is(":checked")?1:0;
		 canWrite = $("#canWrite"+idx).is(":checked")?1:0;
		 canDelete = $("#canDelete"+idx).is(":checked")?1:0;
		 canModify = $("#canModify"+idx).is(":checked")?1:0;
		 canManage = $("#canManage"+idx).is(":checked")?1:0;
		 memberId = $("#menuAuthMem"+idx).text();
		 id = $("#menuAuthId"+idx).val();
		 
	 }
	 
	
	let menuIdx = $("#menuIdx").val();
	const url ="/admin/site/member/ajaxMemAuth";
	const param = {"id":id,"memberId":memberId, "menuIdx":menuIdx,"canRead" : canRead,  "canWrite":canWrite,  "canDelete":canDelete,   "canModify":canModify,  "canManage":canManage};
 	commonAjax(url,"get",param,function(data){
 	 //던져라
 		alert("작업완료 되었습니다");
 		location.reload();
 	}, function(status, error) {
		  console.log(status, error);
	});
 }
 
function allGrpPerMemcheck(obj)
{
	let groupId =obj;
	groupId ="grpPermem_"+groupId;
	$("#"+groupId+ "> li > div > input").prop("checked", true);
}


function checkSameAuth(memGrpId)
{
	
	

}

function addMenu()
{
  const result = confirm("메뉴를 추가 하시겠습니까?");
  if(result)
  {
	  $("#activeNodeId").val('insert');  
	  $('fieldset > ul  > li:eq(3)').hide();
	  $('fieldset > ul  > li:eq(4)').show();
	  $("input[name='menuType']").prop("disabled",false);
	  $('fieldset > ul  > li:eq(5)').hide();
	  $('fieldset > ul  > li:eq(6)').hide();
	  const sel = $('#tree').jstree(true).get_selected();
	   if(!sel.length) {
	     alert('노드를 선택해주세요.');
	     return false;
	   }
	   const selectedNode = sel[0];
	   const new_node = $('#tree').jstree(true).create_node(selectedNode, {'text': ''});
	   $('#tree').jstree(true).activate_node(new_node);
	   // 노드를 생성한 후, 해당 노드를 검색하여 처리합니다.
 	   const selected_node_id = $('#tree').jstree(true).get_selected()[0];
	   const selected_node_depth = $('#tree').jstree(true).get_node(selected_node_id).parents.length;
	   $("fieldset > ul> li > input:eq(0)").removeAttr("disabled");
	   $("fieldset > ul> li > input:eq(1)").removeAttr("disabled");
	   $("#treeCmd").val("c");
	   
	   $("input[name='menuNm']").val('');
	   $("input[name='parentMenuIdx']").val($("input[name='menuIdx']").val());
	   $("input[name='menuIdx']").val(-1);
	   
	   //menuUrl 보이기
	   $("input[name='menuUrl']").removeAttr("disabled");
	   $("input[name='menuUrl']").val("");
	   $("input[name='menuDescription']").val("");
  }
}

function modMenu()
{
	  const menuIdx = $("#activeNodeId").val();
	  const menuNm = $("input[name='menuNm']").val();
	  const result = confirm(menuNm+"메뉴를 수정 하시겠습니까?");
	  if(result)
	  {
		  $("fieldset > ul> li > input:eq(0)").removeAttr("disabled");
		  $("fieldset > ul> li > input:eq(1)").removeAttr("disabled");
		  $("input[name='menuType']").removeAttr("disabled");
		  $("fieldset > ul > li:eq(5)").hide();
		  $("fieldset > ul > li:eq(6)").hide();
		  $("#upBtn").attr("disabled",false);
		  $("#downBtn").attr("disabled",false);
		  $("input[name='menuUrl']").removeAttr("disabled");

	  }
}

function deleteMenu()
{
  const menuIdx = $("#activeNodeId").val();
  const menuNm = $("input[name='menuNm']").val();
  const result = confirm(menuNm+"메뉴를 삭제하시겠습니까??");
  if(result)
  {
	  console.log(menuIdx);
	  
	  let url ="/admin/site/menu/delMenus/"+menuIdx;
	  $.post({
		    url: url,
		    data: "",
		    contentType: "application/x-www-form-urlencoded; charset=UTF-8"
		}).done(function(response) {
			alert("삭제 완료 되었습니다");
			location.reload();
		}).fail(function(xhr, status, error) {
			console.log(error);
		});
	  
  }
}


function saveMenu()
{
	$("input[name='menuLevel']").removeAttr("disabled");
	$("input[name='menuOrder']").removeAttr("disabled");
	$.post({
	    url: "/admin/site/menu/menus",
	    data: $("#menuForm").serialize(),
	    contentType: "application/x-www-form-urlencoded; charset=UTF-8"
	}).done(function(response) {
	   location.reload();
	}).fail(function(xhr, status, error) {
		console.log(error);
	});
}
