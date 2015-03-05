jQuery(document).ready(function(){
jQuery('span.newsbox').click(function(){
	
	var divid=jQuery(this).attr("id");
	var divclass=jQuery(this).attr("class");
	var hidden="div."+'newsbox';
	var block="#div"+divid;
	jQuery(hidden).css("display","none");
	jQuery(block).css("display","block");
	})
})

