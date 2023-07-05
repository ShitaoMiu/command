$(function(){
	let socialArr= $("#socialType").val().length > 0 ? $("#socialType").val().split(",") : "";
	for(let i=0; i< $("input[name='socialTp']").length ;i++)
	{
		$("input[name='socialTp']").eq(i).prop("checked",false);
	}
	if(socialArr.length > 0)
	{
		$("#socialTypeArea").show();
	
	for(let i=0;i<socialArr.length;i++)
	{
		switch(socialArr[i])
		{
		case "N":
			$("#socialTpN").prop("checked",true);
			break;
		case "K":
			$("#socialTpK").prop("checked",true);
			break;
		case "G":
			$("#socialTpG").prop("checked",true);
			break;
		case "A":
			$("#socialTpA").prop("checked",true);
			break;
		}
	}
	}
});

$("input[name='faviFile']").click(function(){
	var multiSelector = new MultiSelector(document.getElementById("faviFileList"),3);
	multiSelector.addElement(document.getElementById("faviFileUploader"),"favi_");
 });


$("input[name='mainFile']").click(function(){
	var multiSelector = new MultiSelector(document.getElementById("mainImgFileList"),3);
	multiSelector.addElement(document.getElementById("mainImgFileUploader"),"main_");
 });

$("input[name='socialLoginYN']").change(function(){
	if($(this).val() === 'Y')
	{
		$("#socialTypeArea").show();
	}
	else
	{
		$("#socialTypeArea").hide();
	}

});




function addrFn(){
	new daum.Postcode({
	    oncomplete: function(data) {
	    	var address = data.address;
	    	$("input[name='siteAddr']").val(address);
	    	this.dispose();
	    }
	}).open();
}



function saveSetting()
{	
	var socialLoginArr = [];
	for(var i=0; i< $("input[name='socialTp']").length ;i++)
	{
		if($("input[name='socialTp']").eq(i).prop("checked"))
		{
			socialLoginArr.push($("input[name='socialTp']").eq(i).val());
		}
	}

	if(socialLoginArr.length > 0)
	{
		$("#socialType").val(socialLoginArr.toString());
	}
	$("form").attr("url","/admin/site/basic/save");
	$("form").submit();
}

function fn_egov_downFile(atchFileId, fileSn){
	var moveUrl ="/cmm/fms/FileDown.do?atchFileId="+atchFileId+"&fileSn="+fileSn;
	window.open(moveUrl);
}