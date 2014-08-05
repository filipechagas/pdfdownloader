require 'rubygems' if RUBY_VERSION < '1.9'
require 'sinatra';
require 'sinatra/base'

class PdfDownloader < Sinatra::Base
  get '/' do
    'Hello World!'
  end
end
