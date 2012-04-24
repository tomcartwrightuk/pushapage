$(function() {




	var a=$(location).attr("href");
	var t=$(this).attr('title');
	t = encodeURIComponent(t);
	$(document.body).append("<iframe id=\"myId\" />");
	$("iframe#myId").attr("src","http://localhost:3000");
	$("iframe#myId").attr("style","position:fixed;top:20px;left:20px;height:585px;width:920px;border:1px%20solid;z-index:16777271;");
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
});
