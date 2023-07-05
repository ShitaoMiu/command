function commonAjax(url, method, data, successCallback, errorCallback) {
  $.ajax({
    url: url,
    type: method,
    data: data,
    success: function (response) {
      successCallback(response);
    },
    error: function (xhr, status, error) {
      errorCallback(xhr.status, error);
    }
  });
}



function commonPost(url,data,successCallback,errorCallback)
{
	$.post({
		url : url,
		data : data, 
	    contentType: "application/x-www-form-urlencoded; charset=UTF-8"
	}).done(function(response){
		successCallback(response);
	}).fail(function(xhr,status,error){
		errorCallback(error);
	});
}

function fileEachDelete(atchFileId,fileSn,parentId)
{
	var data = {"atchFileId":atchFileId, "fileSn":fileSn};
	var lid = atchFileId+'_'+fileSn;
	
	commonAjax("/deteleEachFile.do","POST", data,function(data){
		console.log(data);
		console.log($("$"+parentId));
	
	},function(status,error)
		{
		  console.log(status, error);
		});
}