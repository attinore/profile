require 'nokogiri'
require 'open-uri'

class Browser
  def fetch_content(url)
    @url = url
    html_content = open(url)
    Nokogiri::HTML(html_content).text
  end
end
