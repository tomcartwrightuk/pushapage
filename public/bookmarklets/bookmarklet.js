javascript:function attach_js_file(){
	var d=document,
	jq=d.createElement('scr'+'ipt'),
	z=d.createElement('scr'+'ipt'),
	b=d.body;
	try {
	if(!b) throw(0);
	jq.setAttribute('src', 'http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js');
	z.setAttribute('src', 'http://pushapage.com/bookmark.js');
	b.appendChild(jq);
	b.appendChild(z);
	}
	catch(error){
	alert('There was a problem. Please try again in a few seconds');
	}
}
attach_js_file();
