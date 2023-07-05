let editor;
$(function(){
	 getTreeListData('1','page');
	 var menuIdx = $("#menuIdx").val().trim();
	 $("#siteList").val("1");
	 if(menuIdx)
	 {
		 var interval_id =setInterval(function(){
		     if($("li#"+menuIdx).length != 0){
		         clearInterval(interval_id)
		         $("#tree").jstree("select_node", $("li#"+menuIdx))
		      }
		}, 5); 
	 }
	 ClassicEditor
	    .create( document.querySelector( '#editor' ),{
	    	
	    })
	    .then(newEditor => {
	    	editor = newEditor;
	    })
	    .catch( error => {
	        console.error( error );
	    } );
	 
	    $("#datepicker,#datepicker1").datepicker({
	        dateFormat: "yy-mm-dd"
	      });

}); 
function contentPagesDetail(menuIdx,pageContentIdx)
{
	 let url = "/admin/content/page/detail";
	 let param ={"menuIdx": menuIdx ,"pageContentIdx":pageContentIdx};
	 commonAjax(url,"get",param,function(data){
		 editor.setData(data.pageContent.pageMenuContents);
		 $("#pageContentIdx").val(pageContentIdx);
		 $("#menuIdx").val(menuIdx);
		 $("#menuTitle").text(data.pageContent.menuNm);
		 
	});
}
//새로 등록
function newPage()
{
	 editor.setData('');
	 $("#pageContentIdx").val('');
}
 
 $("#savePage").click(function(){
	 if(confirm("저장하시겠습니까?"))
	 {
		$("#pageContentFrm").attr("action","/admin/content/page/save");
		$("#pageMenuContents").val(editor.getData());
		$("#pageMenuIdx").val($("#menuIdx").val());
		$("#pageContentFrm").submit();
	}
	 
 
 
 
 
 
 });