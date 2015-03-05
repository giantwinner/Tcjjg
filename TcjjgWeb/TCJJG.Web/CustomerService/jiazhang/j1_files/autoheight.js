function autoResize() 
{ 
 try 
 { 
 document.all["iframe1"].style.height=iframe1.document.body.scrollHeight 
 } 
 catch(e){} 
} 

					 
							 
var h_a = "";
var h_b = "";
var h_c = "";
var h_d = "";
var h_e = "";

	 
function addifr(){
	var h_all = h_a + h_b + h_c + h_d + 400; 
	//alert(h_all);
	
	$("#iframe1").height(h_all);
	}
	
function addifr2(){
	var h_all2 = h_e + 600; 
	//alert(h_all);
	$("#iframe1").height(h_all2);
	}
//})
