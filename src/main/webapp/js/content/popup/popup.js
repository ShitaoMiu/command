$(function() {
//	$("#stTime,#enTime").datepicker({
//	 format: 'YYYY-MM-DD HH:mm',
//	    icons: {
//	      time: 'fa fa-clock',
//	      date: 'fa fa-calendar',
//	      up: 'fa fa-chevron-up',
//	      down: 'fa fa-chevron-down',
//	      previous: 'fa fa-chevron-left',
//	      next: 'fa fa-chevron-right',
//	      today: 'fa fa-calendar-check',
//	      clear: 'fa fa-trash',
//	      close: 'fa fa-times'
//	    }
//	});

	 $("#stTime,#enTime").datetimepicker({
		    dateFormat: 'yy-mm-dd',
		    timeFormat: 'HH:mm',
		    separator: ':'
		  });

});

$("input[name='popsFile']").click(function(){
	var multiSelector = new MultiSelector(document.getElementById("popupImageFileList"),3);
	multiSelector.addElement(document.getElementById("popupImageFileUploader") ,"popup_");
});


function goPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/admin/content/popup/list'/>";
   	document.listForm.submit();
}

function popupSave() {

	if (confirm("저장하시겠습니까????")) {
		$("form").attr("action", "/admin/content/popup/save");
		$("form").submit();
	}
}


function goWrite(){
	location.href="/admin/content/popup/popupOne/-1";
}

function popupDelete()
{
	let popupIdx=  $("#popup").val();
	location.href="/admin/content/popup/popupDelete/"+popupIdx;
}

function popupList()
{
	location.href="<c:url value='/admin/content/popup/list'/>";
}

function fn_egov_downFile(atchFileId, fileSn){
	var moveUrl ="/cmm/fms/FileDown.do?atchFileId="+atchFileId+"&fileSn="+fileSn;
	window.open(moveUrl);
}