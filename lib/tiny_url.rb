require "rainbow"
require "httparty"

class TinyUrlService
  attr_accessor :url

  def initialize url
    @url = url
  end

  def call
    response = HTTParty.get "http://tinyurl.com/api-create.php?url=#{url}"
    puts "The shortened url is: " + Rainbow(response).color(:blue)
  end

end

print "Enter a url to shorten: " + Rainbow("http://").color(:green)
TinyUrlService.new("http://#{gets.strip}").call