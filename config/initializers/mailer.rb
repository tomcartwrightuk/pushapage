# config/initializers/mailer.rb
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.raise_delivery_errors = true
 
ActionMailer::Base.smtp_settings = {
:enable_starttls_auto => true,
:address => 'smtp.gmail.com',
:port => 587,
:domain => "gmail.com",
:user_name => "tecartwright@gmail.com",
:password => 'd3cision.3',
:authentication => 'plain'
}

