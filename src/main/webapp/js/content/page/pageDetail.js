 $(function(){
	 getTreeListData('1','page');
	 var menuIdx = $("#menuIdx").val();
	 var interval_id =setInterval(function(){
	     if($("li#"+menuIdx).length != 0){
	         clearInterval(interval_id)
	         $("#tree").jstree("select_node", $("li#"+menuIdx))
	      }
	}, 5);
}); 
 