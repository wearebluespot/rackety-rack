#\ --port 4000
require 'rack/jekyll'
require './contact_form'

use ContactForm
run Rack::Jekyll.new
