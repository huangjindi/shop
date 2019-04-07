var v_checkIds = [];
	function initTable(){
		$(".colorClass").each(function(){
				var checkbox=$(this).find("input[name='checkbox']:checkbox")[0];
				for(var i =0; i < v_checkIds.length; i++){
					if(v_checkIds[i] == $(checkbox).val()){
						$(this).css({background:"gray"});
						checkbox.checked = true;
					}
				}
				$(this).bind("click",function(){
					if(this.style.background =="gray"){
						$(this).css({background:""});
						checkbox.checked = false;
						deleteArrItem($(checkbox).val());
					}else{
						$(this).css({background:"gray"});
						checkbox.checked = true;
						v_checkIds.push($(checkbox).val());
					}
				})
				$(this).bind("mouseover",function(){
					if(!checkbox.checked){
					this.style.background="#ccc";
					}
				})
				$(this).bind("mouseout",function(){
					if(!checkbox.checked){
					this.style.background="";
					}
				})
		})
	}
	function deleteArrItem(id){
		for(var i=v_checkIds.length-1;i>=0;i--){
			if(v_checkIds[i] == id){
				v_checkIds.splice(i,1);
			}
		}
	}