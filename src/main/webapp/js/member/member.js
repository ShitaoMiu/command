$(function() {

})
function memberDetail(memberId) {
	location.href="/admin/member/member/"+memberId;
}

function stopBan(menuIdx) {
}



function goPage(pageNo)
{
 
	$("input[name='pageIndex']").val(pageNo);
	$("form").action = "<c:url value='/admin/member/members'/>";
	$("form").submit();
}