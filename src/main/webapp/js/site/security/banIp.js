$("#banTypeSelect").change(function(){
    if($(this).val() == 0)
    {
        $("#ipBanEach").show();
        $("#ipBanNation").hide();
    }
    else
    {
        $("#ipBanEach").hide();
        $("#ipBanNation").show();
   
    }
});


$("#banNationList").change(function(){
	$("input[name='banIpNation']").val($(this).val());	
});

function saveBan()
{
	let choiceType= $("#banReason option:selected").val();
	let type= choiceType == "0" ? "nation" : "ip";
	
	
    if(confirm("저장하시겠습니까?"))
    {
        
       if( type =='nation')
       {
            if($("#banNationList option:selected").val() == "")
            {
                alert("나라를 선택해주세요");
                return false;
            } 
            
        }
        else if(type =="ip")
        {
            if(!$("input[name='banIp']").val())
            {   
                alert("아이피를 입력해주세요");
                return false;
            }
        } 
        $("#banType").val(type);
        $("form").attr("action","/admin/site/security/banIp/save");
        $("form").submit();
    }
}

function resetBan(ip)
{
	if(confirm(ip+"를 차단 해제하시겠습니까?"))
	{
		let param ={"ip":ip};
		//던져라
		commonAjax("/admin/site/security/banIp/notBan","post",param,function(data){
		 		alert("작업완료 되었습니다");
		 		location.reload();
		 	}, function(status, error) {
				  console.log(status, error);
			});
	}
}
function goPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/admin/site/security/banIp'/>";
   	document.listForm.submit();
}
