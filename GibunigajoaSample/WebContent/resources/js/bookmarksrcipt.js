
//즐겨찾기 클릭시 컨트롤러를 통해서 인서트 딜리트 계산해서 리턴값이 1이면 인서트라서 이미지가  pStar로 바뀌고 리턴값이 그외라면 bStar로 바뀐다
function bookmark(a,b){
	
	var url="bookmark.do";
	var id = "#"+b;
	var projectURL = $("#projectURL").val();
$.ajax({
	
type:"post"
,url:url
,data:"organization_id="+a
,dataType:"text"	})
.done(function(args){
   if(args==1){
	    
       $(id).attr("src",projectURL+"/resources/images/pStar.png");	
	   }
    else{  
    	 
  $(id).attr("src",projectURL+"/resources/images/bStar.png");	
   }
	 
	
	
	
	
}).fail(function(e){
	alert(e.responseText);
	
}); 
	
}

function onfocus(){
	  alert("onfocus 실행되였어요");
	$("#aaa").attr('class','mb-5');
	
	  
	
}
function onblur(){
	  alert("onblur 실행되였어요");
	
	$("#aaa").attr('class','name')
}
