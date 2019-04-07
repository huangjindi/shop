function brandList(selectId,brandId){
	$.ajax({
		url:"/brand/brandList.jhtml",
		type:"post",
		success:function(data){
			var data=data.data
			for(var i=0;i<data.length;i++){
				$("#"+selectId).append("<option value='"+data[i].id+"'>"+data[i].brandName+"</option>");
			}
			if(brandId){
				$("#"+selectId).val(brandId);
			}
		},
		error:function(){
			alert(1);
		}
	})
}
