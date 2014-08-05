require 'rubygems' if RUBY_VERSION < '1.9'
require 'sinatra';
require 'sinatra/base'
require "pdfkit"

PDFKit.configure do |config|
  config.default_options = {
    :page_size    => 'Letter',
    :margin_top    => '0.2in',
    :margin_right  => '0.2in',
    :margin_bottom => '0.2in',
    :margin_left   => '0.2in',
    :orientation => 'Landscape'
  }
end

class PdfDownloader < Sinatra::Base
  use Rack::Auth::Basic, "Restricted Area" do |username, password|
    username == ENV['PDFUSERNAME'] and password == ENV["PDFPASSWD"]
  end

  get '/' do
    "HTML to PDF"
  end

  post "/" do
    file_name = params[:file_name]
    url = params[:url]

    response.headers['content_type'] = "application/pdf"
    attachment(file_name)

    kit = PDFKit.new(url)
    pdf = kit.to_pdf

    response.write pdf
  end
end
