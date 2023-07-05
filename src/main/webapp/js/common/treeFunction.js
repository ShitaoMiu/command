let searchType ="";
function getTreeListData(topMenuIdx,type) 
{
	const url = "/admin/site/menu/list";
    if(!topMenuIdx)topMenuIdx= $("#siteList option:selected").val();
    let param = {"topMenuIdx" : topMenuIdx};
    searchType = type;
    commonAjax(url,"get",param,function(data){
    	openTree(data.menuList,type);
	}, function(status, error) {
		console.log(status, error);
	});
}

function openTree(jsonData,type) {
	const treeData = [];
	if(type == 'menu')
	{
		jsonData.forEach((item) => {
			const obj =
			{
				  id: item.menuIdx
				, parent: item.parentMenuIdx ? item.parentMenuIdx : "#"  // 수정된 부분
				, text: item.menuNm
			}
			treeData.push(obj);
		});
	}
	else if(type!="menu")
	{
		jsonData.forEach((item) => {
			const obj =
			{
				  id: item.menuIdx
				, parent: item.parentMenuIdx ? item.parentMenuIdx : "#"  // 수정된 부분
				, text: item.menuType == type ? item.menuNm+"["+type+"]":item.menuNm
				,  state: {
				    disabled: item.menuType !=type,
				}
			};
			if (item.menuType != type) {
				if(type == 'page'){
				  obj.a_attr = { style: "color: gray" };
				}else if(type == 'post')
				{
//					  obj.a_attr = { style: "color: yellow" };
				}
			}
			treeData.push(obj);
			});	
	}
 
	
	  const treeInstance = $('#tree').jstree(true);
	  if (treeInstance) { // 트리가 이미 존재하는 경우
		  treeInstance.settings.core.data = treeData;
		    treeInstance.refresh();
		    setTimeout(function () { treeInstance.open_all(); }, 10);
	  }
	  else
	  {
		  	initTree(treeData);
		  	if(type =="menu")
		  	{
			  	$("fieldset > ul> li > input").attr("disabled",true);
				$("#upBtn").attr("disabled",true);
				$("#downBtn").attr("disabled",true);
				$("#crudBtnArea > div >  button").attr("disabled",true);
		  	}
	  }
}

$('#tree').on("activate_node.jstree", function(e, data) {
	//기존에 search된게 있는지 여부 확인해서 있으면 search 클래스 날린다 
	let activeId = $("#activeNodeId").val();
	let clickId = data.node.id;
	//존재하는거 클릭시  activeId= "" ,  clickId= 	Number(clickId) > 0
	//새로 추가할시      activeId=insert clickId="j1_1"
	
	let mode= "notInsert";
	if(activeId =="insert" && clickId.substring(0,1) == 'j')
	{
		mode="insert";
		clickId = "new";
	}
	if(mode!= 'insert')
	{
		mode="notNew";
		$('.jstree-search').removeClass('jstree-search');
	    $("#activeNodeId").val(clickId);
	}
	
	const tree = $('#tree').jstree(true);
	const allNodes = tree.get_node('#').children_d;
	const j1Count = allNodes.filter(node => node.startsWith('j1_')).length;
	const treeCmd = $("#treeCmd").val();
 	const menuId =data.node.id;
	let treeType= $("#treeType").val();
	if(j1Count > 0) 
	{
		if(treeCmd == 'c' )
		{
			const result = confirm("저장되지 않은 노드가 있습니다 계속하시겠습니까?");
			if(result)
			{
				const tree = $('#tree').jstree(true);
				const j1Nodes = tree.get_node('#').children_d.filter(node => node.startsWith('j1_'));
				tree.delete_node(j1Nodes);
				$('.jstree-search').removeClass('jstree-search');
				$("#treeCmd").val('s');
				  $('fieldset > ul  > li:eq(3)').show();
				  $('fieldset > ul  > li:eq(4)').show();
				  $('fieldset > ul  > li:eq(5)').show();
				  $('fieldset > ul  > li:eq(6)').show();
				  $("fieldset > ul> li > input").attr("disabled",true);

			}
			
		}
	}
	
	if(mode!="insert")
	{
		if(treeType == "menu")
		{
			menuDetailData(menuId);
		}
		 if(treeType=="page")
		{
			menuDetailPageData(menuId);

		}
	} 
});
function menuDetailPageData(menuId){
 	const url = "/admin/content/page/"+menuId;
 	location.href=url;
}




function menuDetailData(menuId)
{
	var treeType= $("#treeType").val();
	let url="";
	if(treeType == "menu")
	{
		url = "/admin/site/menu/"+menuId;
		commonAjax(url,"get",null,function(data){
			menuDataSet(data.menu);
			if(data.menuPerAuthlist)
			{
				$("#menuAuthTitle").html(data.menu.menuNm);
				$("#authMenuNm").html(data.menu.menuNm);
				menuAuthSet(data.menuPerAuthlist);
			}
		}, function(status, error) {
			  console.log(status, error);
		});
	}
	else if(treeType =="page")
	{
		 	url = "/admin/page/menuPageSettingList/"+menuId;
		 	location.href=url;
	}
}
 


function menuAuthSet(authList)
{
	let dhtml ="";
	for(let i=0;i<authList.length;i++)
	{
		dhtml+="			<div class='form-group row'>";
		dhtml+="				<div class='col-md-2 test'>";
		dhtml+="					<span id='menuAuthMem"+i+"' class='form-control-sm'>"+authList[i].memberId+"</span>";
		dhtml+="					<input type='hidden' id='menuAuthId"+i+"' value='"+authList[i].id+"'>";
		dhtml+="				</div>";
		dhtml+="				<div class='col-md-10 test' id='row"+i+"'>";
		dhtml+="					<div class='row'>";
		dhtml+="						<div class='col-md-2'>";
		dhtml+="							<div class='form-group form-inline'>";
		if(authList[i].canRead == 1)
		{
		dhtml+="							    <input type='checkbox' class='form-form-control-lg' id='canRead"+i+"' checked />";
		}
		else
		{
		dhtml+="							    <input type='checkbox' class='form-form-control-lg' id='canRead"+i+"' />";
		}
		dhtml+="							    <label class='ml-3' for='canRead"+i+"' >읽기</label>";
		dhtml+="							</div>";
		dhtml+="						</div>";
		dhtml+="						<div class='col-md-2'>";
		dhtml+="							<div class='form-group form-inline'>";

		if(authList[i].canWrite == 1)
		{
		dhtml+="							    <input type='checkbox' class='form-form-control-lg' id='canWrite"+i+"'  checked />";
		}
		else
		{
		dhtml+="							    <input type='checkbox' class='form-form-control-lg' id='canWrite"+i+"' />";
		}
		dhtml+="							    <label class='ml-3' for='canWrite"+i+"' >쓰기</label>";
		dhtml+="							</div>";
		dhtml+="						</div>";
		dhtml+="						<div class='col-md-2'>";
		dhtml+="							 <div class='form-group form-inline'>";

		if(authList[i].canDelete ==1 )
		{
		dhtml+="							    <input type='checkbox' class='form-form-control-lg' id='canDelete"+i+"' checked />";
		}
		else
		{
		dhtml+="							    <input type='checkbox' class='form-form-control-lg' id='canDelete"+i+"' />";
		}
		dhtml+="							    <label class='ml-3' for='canDelete"+i+"'>삭제</label>";
		dhtml+="							 </div>";
		dhtml+="						</div>";
		dhtml+="						<div class='col-md-2'>";
		dhtml+="							<div class='form-group form-inline'>";
		if(authList[i].canModify ==1)
		{
		dhtml+="							    <input type='checkbox' class='form-form-control-lg' id='canModify"+i+"' checked />";
		}
		else
		{
		dhtml+="							    <input type='checkbox' class='form-form-control-lg' id='canModify"+i+"' />";
		}
		dhtml+="							    <label class='ml-3' for='canModify"+i+"'>수정</label>";
		dhtml+="							</div>";
		dhtml+="						</div>";
		dhtml+="						<div class='col-md-2'>";
		dhtml+="							<div class='form-group form-inline'>";
			
		if(authList[i].canManage ==1)
		{
		dhtml+="							 <input type='checkbox' class='form-form-control-lg' id='canManage"+i+"' checked>";
		}
		else
		{
		dhtml+="							 <input type='checkbox' class='form-form-control-lg' id='canManage"+i+"'>";
		}
		dhtml+="							    <label class='ml-3' for='canManage"+i+"'>관리</label>";
		dhtml+="							</div>";
		dhtml+="						</div>";
		dhtml+="						<div class='col-md-2'>";
		dhtml+="							<button type='button' onclick='saveAuthData(this,1)' class='btn-sm btn-primary'>저장</button";
		dhtml+="						</div>";		
		dhtml+="						</div>";		
		dhtml+="					</div>";
		dhtml+="					</div>";
		dhtml+="				</div>";
	}
	$("#menuAuthList").html(dhtml);
	    
	for(var i=0;i<$("[id^='row']").length;i++)
	{

		 let readChk = $("#canRead"+i).is(":checked");
		 let writeChk = $("#canWrite"+i).is(":checked");
		 let deleteChk = $("#canDelete"+i).is(":checked");
		 let modifyChk = $("#canModify"+i).is(":checked");
		 let manageChk = $("#canManage"+i).is(":checked");
		 if(readChk &&   writeChk && deleteChk && modifyChk)
		 {
		    $("#canManage"+i).prop('checked',true);
		 }
	
		 if(manageChk)
		 {
	        $("#canRead"+i).prop('checked',true);
	        $("#canWrite"+i).prop('checked',true);
	        $("#canDelete"+i).prop('checked',true);
	        $("#canModify"+i).prop('checked',true);
		  }
	}
}


function menuDataSet(menuVo) {
	$("input[name='menuNm']").val(menuVo.menuNm);
	$("input[name='menuOrder']").val(menuVo.menuOrder);
	if(menuVo.menuType == 'menu'){
		$('input[name=menuType][value=menu]').prop('checked', true)
	}
	else if(menuVo.menuType == 'page')
	{
		$('input[name=menuType][value=page]').prop('checked', true)
			
	}
	else if(menuVo.menuType == 'program')
	{
		$('input[name=menuType][value=program]').prop('checked', true)
			
	}
	$("#activeNodeId").val(menuVo.menuIdx);
  	$("input[name='menuLevel']").val(menuVo.menuLevel);
	$("input[name='menuIdx']").val(menuVo.menuIdx);
	
 	$("input[name='menuPath']").val(menuVo.menuPath);
 	$("input[name='parentMenuIdx']").val(menuVo.parentMenuIdx);
 	$("input[name='menuDescription']").val(menuVo.menuDescription);
 	$("input[name='menuUrl']").val(menuVo.menuUrl);

 	$("fieldset > ul> li > input").attr("disabled",true);
	$("#upBtn").attr("disabled",true);
	$("#downBtn").attr("disabled",true);
	$("#crudBtnArea > div >  button").attr("disabled",false);
}
 
function searchNm(obj){
	//추가한 경우인데 저장이 안됨 
	const tree = $('#tree').jstree(true);
	const allNodes = tree.get_node('#').children_d;
	const j1Count = allNodes.filter(node => node.startsWith('j1_')).length;
	if(j1Count > 0)
	{
		const result = confirm("저장되지 않은 노드가 있습니다 계속하시겠습니까?");
		if(result){
			const tree = $('#tree').jstree(true);
			const j1Nodes = tree.get_node('#').children_d.filter(node => node.startsWith('j1_'));
			tree.delete_node(j1Nodes);
		}
	}
  const searchValue = $("input[name='searchNm']").val();
  $("#tree").jstree('search', searchValue);
  $("#treeCmd").val("s");

}

function orderChange(mode)
{
	let menuIdx = $("input[name='menuIdx']").val();
	let children = $("#tree").jstree(true).get_children_dom(menuIdx);
	let numChildren = children.length;
	
	let parentNode = $("#tree").jstree(true).get_node(menuIdx).parent;
	let childrenNode = $("#tree").jstree(true).get_node(parentNode).children;
	let currentNodeIndex = childrenNode.indexOf(menuIdx);
	
	let isLastNode = (currentNodeIndex === childrenNode.length - 1);
	let isFirstNode =(currentNodeIndex === 0);
	let prevSiblingId = childrenNode[currentNodeIndex - 1];
	let nextSiblingId = childrenNode[currentNodeIndex + 1];
	
	if(childrenNode.length == 1)
	{
		alert("앞뒤 메뉴가 없어서 순서 변경이 안됩니다.");
		return false;
	}
	
	if(isFirstNode && mode =='up')
	{
		alert("맨위입니다 더이상 이동안됩니다");
		return false;
	}

	
	if(isLastNode && mode =='down')
	{
		alert("맨아래입니다 더이상 이동안됩니다");
		return false;
	}
	const url = "/admin/site/menu/order";
	let param = {"menuIdx": menuIdx, "mode": mode};
  	
	$.post({
	    url: url,
	    data: param,
	    contentType: "application/x-www-form-urlencoded; charset=UTF-8"
	}).done(function(response) {
	   location.reload();
	}).fail(function(xhr, status, error) {
		console.log(error);
	});
}



function searchMemberGrpList()
{
	var searchText = $("input[name='searchNm']").val();
    $('#tree').jstree(true).search(searchText);
}



$("#siteList").change(function(){
	let siteType=$(this).val();
	var treeType = $("#treeType").val();
	getTreeListData(siteType,treeType);
});

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
      });
}
 