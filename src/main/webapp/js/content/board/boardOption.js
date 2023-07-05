$("#banAdd").click(function() {
	let contentsBoardBanword = $("input[name='contentsBoardBanword']").val();
	let dhtml = "<li>" + contentsBoardBanword + "</li>";
	$("#banLists").append(dhtml);
	$("input[name='contentsBoardBanword']").val('');
});

$("#boardHeadAdd").click(function() {
	let contentsBoardHead = $("input[name='contentsBoardHead']").val();
	let dhtml = "<li>" + contentsBoardHead + "</li>";
	$("#theadList").append(dhtml);
	$("input[name='contentsBoardHead']").val('');
});

$("#boardContentItemAdd").click(function() {
	let contentBoardItem = $("input[name='contentsBoardItem']").val();
	let dhtml = "<li>" + contentBoardItem + "</li>";
	$("#boardContents").append(dhtml);
	$("input[name='contentsBoardItem']").val('');
});



function saveBoard() {
  
	  let result = confirm("저장하시겠습니까?");	
	  if(result)
	  {
		  let contentBanArr=[];
		  let contentBoardHeadArr=[];
		  let contentBoardContentArr=[];
		  let contentsIsBoardMeCert= $("input[name='contentsIsBoardMeCert']").is(":checked");
		  let contentsIsBoardSMS= $("input[name='contentsIsBoardSMS']").is(":checked");
		
		  contentsIsBoardMeCert == true ? $("#contentsIsBoardMeCert").val('Y') : $("#contentsIsBoardMeCert").val('N');
		  contentsIsBoardSMS == true ? $("#contentsIsBoardSMS").val('Y') : $("#contentsIsBoardSMS").val('N');
		   $("#banLists >li").each(function(){
			   contentBanArr.push( $(this).html());
			});
		  $("#theadList >li").each(function(){
			  contentBoardHeadArr.push($(this).html());
			});
		  
		  $("#boardContents >li").each(function(){
			  contentBoardContentArr.push($(this).html());
			});
			$("input[name='contentBoardBanList']").val(contentBanArr.toString());
			$("input[name='contentBoardHeadList']").val(contentBoardHeadArr.toString());
			$("input[name='contentBoardContentList']").val(contentBoardContentArr.toString());
 			$("form").submit();
	 }
	 else
	 {
		 return false;  
	 }
}
function goList(pageNo)
{
    document.frm.pageIndex.value = pageNo; 
    document.frm.action = "/admin/content/boardOption";
    document.frm.submit();
}