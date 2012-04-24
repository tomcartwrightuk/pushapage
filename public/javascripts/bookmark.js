$(function() {
	var a=$(location).attr("href");
	var t=$(this).attr('title');
	$(document.body).append("<iframe id=\"pushapage\" />");
	$("iframe#pushapage").attr("src","http://localhost:3000/bookmark");
	$("iframe#pushapage").attr("style","position:fixed;top:20px;left:20px;height:185px;width:320px;border:none;z-index:16777271;");
    $.ajax({
      type: 'GET',
      url:'http://localhost:3000/addsite?auth_token=WNnpGxxmW8jQNpadYtXs',
      data: {"reference": a, "title": t },
      dataType: 'jsonp',
      crossDomain: true,
      success: function(){
       var newHTML;
       newHTML = "<div class='spinner_container'><img src='/images/tick.jpg'></div><span>Page sent!</span><br><p id='info_paragraph'>On any of your devices, just click your 'Pullapage' bookmark</p>";
       $('#content_wrapper').html(newHTML);
      },
      error: function() {
        var newHTML;
        newHTML = "<h5>Don't hate me.</h5><p>There was an error of sorts. Please try again soon.</p>";
        $('#content_wrapper').html(newHTML);
      },
    });   

	function close_iframe() {
		$('#pushapage').remove();
	}
});
