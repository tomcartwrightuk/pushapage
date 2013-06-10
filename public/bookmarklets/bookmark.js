// spin.js minified from http://fgnass.github.com/spin.js/
(function(a,b,c){function n(a){var b={x:a.offsetLeft,y:a.offsetTop};while(a=a.offsetParent){b.x+=a.offsetLeft;b.y+=a.offsetTop}return b}function m(a){for(var b=1;b<arguments.length;b++){var d=arguments[b];for(var e in d){if(a[e]===c)a[e]=d[e]}}return a}function l(a,b){for(var c in b){a.style[k(a,c)||c]=b[c]}return a}function k(a,b){var e=a.style,f,g;if(e[b]!==c)return b;b=b.charAt(0).toUpperCase()+b.slice(1);for(g=0;g<d.length;g++){f=d[g]+b;if(e[f]!==c)return f}}function j(a,b,c,d){var g=["opacity",b,~~(a*100),c,d].join("-"),h=.01+c/d*100,j=Math.max(1-(1-a)/b*(100-h),a),k=f.substring(0,f.indexOf("Animation")).toLowerCase(),l=k&&"-"+k+"-"||"";if(!e[g]){i.insertRule("@"+l+"keyframes "+g+"{"+"0%{opacity:"+j+"}"+h+"%{opacity:"+a+"}"+(h+.01)+"%{opacity:1}"+(h+b)%100+"%{opacity:"+a+"}"+"100%{opacity:"+j+"}"+"}",0);e[g]=1}return g}function h(a,b,c){if(c&&!c.parentNode)h(a,c);a.insertBefore(b,c||null);return a}function g(a,c){var d=b.createElement(a||"div"),e;for(e in c){d[e]=c[e]}return d}var d=["webkit","Moz","ms","O"],e={},f;var i=function(){var a=g("style");h(b.getElementsByTagName("head")[0],a);return a.sheet||a.styleSheet}();var o=function r(a){if(!this.spin)return new r(a);this.opts=m(a||{},r.defaults,p)},p=o.defaults={lines:12,length:7,width:5,radius:10,color:"#000",speed:1,trail:100,opacity:1/4,fps:20},q=o.prototype={spin:function(a){this.stop();var b=this,c=b.el=l(g(),{position:"relative"}),d,e;if(a){e=n(h(a,c,a.firstChild));d=n(c);l(c,{left:(a.offsetWidth>>1)-d.x+e.x+"px",top:(a.offsetHeight>>1)-d.y+e.y+"px"})}c.setAttribute("aria-role","progressbar");b.lines(c,b.opts);if(!f){var i=b.opts,j=0,k=i.fps,m=k/i.speed,o=(1-i.opacity)/(m*i.trail/100),p=m/i.lines;(function q(){j++;for(var a=i.lines;a;a--){var d=Math.max(1-(j+a*p)%m*o,i.opacity);b.opacity(c,i.lines-a,d,i)}b.timeout=b.el&&setTimeout(q,~~(1e3/k))})()}return b},stop:function(){var a=this.el;if(a){clearTimeout(this.timeout);if(a.parentNode)a.parentNode.removeChild(a);this.el=c}return this}};q.lines=function(a,b){function e(a,d){return l(g(),{position:"absolute",width:b.length+b.width+"px",height:b.width+"px",background:a,boxShadow:d,transformOrigin:"left",transform:"rotate("+~~(360/b.lines*c)+"deg) translate("+b.radius+"px"+",0)",borderRadius:(b.width>>1)+"px"})}var c=0,d;for(;c<b.lines;c++){d=l(g(),{position:"absolute",top:1+~(b.width/2)+"px",transform:"translate3d(0,0,0)",opacity:b.opacity,animation:f&&j(b.opacity,b.trail,c,b.lines)+" "+1/b.speed+"s linear infinite"});if(b.shadow)h(d,l(e("#000","0 0 4px "+"#000"),{top:2+"px"}));h(a,h(d,e(b.color,"0 0 1px rgba(0,0,0,.1)")))}return a};q.opacity=function(a,b,c){if(b<a.childNodes.length)a.childNodes[b].style.opacity=c};(function(){var a=l(g("group"),{behavior:"url(#default#VML)"}),b;if(!k(a,"transform")&&a.adj){for(b=4;b--;)i.addRule(["group","roundrect","fill","stroke"][b],"behavior:url(#default#VML)");q.lines=function(a,b){function k(a,d,i){h(f,h(l(e(),{rotation:360/b.lines*a+"deg",left:~~d}),h(l(g("roundrect",{arcsize:1}),{width:c,height:b.width,left:b.radius,top:-b.width>>1,filter:i}),g("fill",{color:b.color,opacity:b.opacity}),g("stroke",{opacity:0}))))}function e(){return l(g("group",{coordsize:d+" "+d,coordorigin:-c+" "+ -c}),{width:d,height:d})}var c=b.length+b.width,d=2*c;var f=e(),i=~(b.length+b.radius+b.width)+"px",j;if(b.shadow){for(j=1;j<=b.lines;j++){k(j,-2,"progid:DXImageTransform.Microsoft.Blur(pixelradius=2,makeshadow=1,shadowopacity=.3)")}}for(j=1;j<=b.lines;j++){k(j)}return h(l(a,{margin:i+" 0 0 "+i,zoom:1}),f)};q.opacity=function(a,b,c,d){var e=a.firstChild;d=d.shadow&&d.lines||0;if(e&&b+d<e.childNodes.length){e=e.childNodes[b+d];e=e&&e.firstChild;e=e&&e.firstChild;if(e)e.opacity=c}}}else{f=k(a,"animation")}})();a.Spinner=o})(window,document)


$(function() {
	var a=$(location).attr("href");
	var t=$(this).attr('title');


  if ($('#pushapage').length === 0) {
    $(document.body).append("<div id=\"pushapage\" />");
    $("#pushapage").attr("style","position:fixed;border:none; z-index: 2147483647; left: 0px; top: 0px; width: 100%; height: 100%; -webkit-transition-property: opacity; -webkit-transition-duration: 0.25s; -webkit-transition-timing-function: linear; -webkit-transition-delay: initial; text-align: center; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; background-color: rgb(0, 0, 0); color: rgb(204, 204, 204); -webkit-text-size-adjust: none; font-family: Helvetica, Arial, sans-serif; font-weight: bold; line-height: 1; letter-spacing: normal; font-variant: normal; font-style: normal; font-size: 24px; padding-top: 112px; opacity: 0.9;");

    $("#pushapage").append("<div id=\"spinner\" />");
    $("#spinner").attr("style","-webkit-text-size-adjust: none; font-family: Helvetica, Arial, sans-serif; font-weight: bold; line-height: 1.0; letter-spacing: normal; font-variant: normal; font-style: normal;margin-left: auto;margin-right: auto;margin-bottom:20px;");
    $("#pushapage").append("<span id=\"saving\" />");
    $("#saving").attr("style","-webkit-text-size-adjust: none; font-family: Helvetica, Arial, sans-serif; font-weight: bold; line-height: 1.0; letter-spacing: normal; font-variant: normal; font-style: normal;margin-top:20px;");
    $("#saving").text("Sending page");
    $("#pushapage").append("<br />");
    $("#pushapage").append("<div id=\"instapaper\" />");
  };

  $.ajax({
    type: 'GET',
    dataType: 'jsonp',
    url:domain+'/insta_check',
    jsonpCallback: 'insta_call',
    success: function(data, textStatus, jqXHR) {
      if (data) {
        $("#instapaper").attr("style","-webkit-text-size-adjust: none; font-family: Helvetica, Arial, sans-serif; font-weight: bold; line-height: 1.0; letter-spacing: normal; font-variant: normal; font-style: normal;cursor: pointer;cursor: hand;background-color: #181a5a;padding: 3px;width: 120px;display: inline-block;margin-left: auto;margin-right: auto;margin-top:20px;font-size:0.9em;opacity:1;");
        $("#instapaper").text("Send to instapaper");
      }
    },
    error: function(jqXHR, textStatus, errorThrown) {
    }
  })

  var opts = {
    lines: 10, // The number of lines to draw
    length: 5, // The length of each line
    width: 4, // The line thickness
    radius: 6, // The radius of the inner circle
    color: '#FFF', // #rgb or #rrggbb
    speed: 1, // Rounds per second
    trail: 60, // Afterglow percentage
    shadow: false // Whether to render a shadow
  };
  var target = document.getElementById('spinner');
  var spinner = new Spinner(opts).spin(target);

  $.ajax({
    type: 'GET',
    url:domain+'/addsite?',
    data: {"reference": a, "title": t},
    dataType: 'jsonp',
    jsonpCallback: 'alertResponse',
    crossDomain: true,
    success: function(data) {
      $("#spinner").hide();
      $("#saving").html("Saved!");
      setTimeout(hide_iframe, 5000);
    },
    error: function() {
      $("#spinner").hide();
      $("#saving").html("<a href='http://pushapage.com/sign_in' target='_blank'>Please sign in</a> - Then try again");
      setTimeout(hide_iframe, 6000);
    }
  });

  $("#instapaper").click(function() {
    newHTML = "Sending..";
    $('#instapaper').html(newHTML);
    $.ajax({
      type: 'GET',
      dataType: 'jsonp',
      url:'http://localhost:3000/to_instapaper',
      data: {"reference": a, "title": t},
      jsonpCallback: 'insta_call',
      success: function(data, textStatus, jqXHR) {
        var newHTML;
        if (data == 201) {
          newHTML = "Done";
          $('#instapaper').html(newHTML);
        } else if (data == 403) {
          newHTML = "Invalid username/ password";
          $('#instapaper').html(newHTML);
        } else {
          newHTML = "Service probem.";
          $('#instapaper').html(newHTML);
        }
       },
      error: function(jqXHR, textStatus, errorThrown) {
        newHTML = "Service error.";
        $('#instapaper').html(newHTML);
      }
    })
  });

  function hide_iframe() {
    $('#pushapage').hide();
  };
});
