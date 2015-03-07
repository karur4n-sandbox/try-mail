require './secrets'
require 'bundler'
Bundler.require

options = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'gmail.com',
  user_name:            USER_NAME,
  password:             PASSWORD,
  authentication:       'plain',
  enable_starttls_auto: true
}

Mail.defaults do
  delivery_method :smtp, options
end

mail = Mail.new do
  to 'karuran.f@gmail.com'
  from 'karuran@gmail.com'
  subject 'test '

  html_part do
    content_type 'text/html; charset=UTF-8 '
    body '<h1 style="border-bottom: 5px solid green;">This is HTML</h1>'
  end
end

puts mail.to_s
mail.deliver!
