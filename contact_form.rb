require 'dotenv/load'
require 'mail'
require 'sinatra/base'
require 'uri'

class ContactForm < Sinatra::Base
  configure do
    set :contact_from, ENV.fetch('CONTACT_FROM')
    set :contact_to, ENV.fetch('CONTACT_TO')

    smtp_uri = URI.parse ENV.fetch('SMTP_URI')
    Mail.defaults do
      delivery_method :smtp, port: smtp_uri.port,
                             address: smtp_uri.host,
                             user_name: URI.decode(smtp_uri.user),
                             password: URI.decode(smtp_uri.password)
    end
  end

  # if any errors occur, redirect the user to the error page
  error do
    redirect '/contact/failure.html'
  end

  # raise an error if any of the form data for the email is missing
  before('/contact') do
    %i(body reply_to subject).each do |field|
      raise "#{field} was blank" if params[field].to_s == ''
    end
  end

  # send the email, then redirect the user to a success page
  post('/contact') do
    Mail.deliver from: settings.contact_from,
                 to: settings.contact_to,
                 subject: params['subject'],
                 reply_to: params['reply_to'],
                 body: params['body']

    redirect '/contact/success.html'
  end
end
