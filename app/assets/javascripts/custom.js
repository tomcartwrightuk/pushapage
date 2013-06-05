$(function() {
  $('#sign_in_button').click(function() {
    $('#sign_in').fadeIn(300);
  });
  $('#settings_button').click(function() {
    $("#submenu_item").toggle();
  });

  $('body').click(function(event) {
    if (!$(event.target).closest('#settings_button').length) {
    $('#submenu_item').hide();
    };
  });

  var window_height = $(window).height();
  $('.container').css('min-height', 0.8*window_height);

  $('#new_user').validate({
    rules: {
      "user[email]": {required: true, email: true, remote:"/users/check_email" },
      "user[password]": {
        required:true,
        rangelength:[6,16]
      },
      "user[password_confirmation]": {
        equalTo: '#user_password'
      }
    }, //end rules
    success: function(label) {
       label.html("<img src='/assets/tick.png'>").addClass("checked");
    },
    messages: {
      "user[email]" : {
        remote: "This address is not available"
      }
    }
  }); // end validate(),
});
