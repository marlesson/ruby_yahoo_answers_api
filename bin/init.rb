# require 'rubygems'
# require 'oauth'
# require 'xml_hate'

# END_POINT = "http://beta-api.formspring.me"

# url = URI.parse(END_POINT+"/profile/details/marlessonsa.xml")

# # Chamada curta
# data = Net::HTTP.get_response(url)
# #result = JSON.parse(data.body)
# puts "#{data.body}"
# result = data.body

# # if result.has_key? 'error'
# #   raise "web service error: #{result['error']}"
# # end

# xml = XmlHate::Document.new(result)

# puts "#{result.inspect}"
# puts "#{xml.inspect}"

require 'rubygems'
require 'oauth'
require 'xml_hate'

require '../lib/ruby_formspring/profile'
require '../lib/ruby_formspring/answered'
require '../lib/ruby_formspring/api'


api = RubyFormspring::API.new

puts "#{api.details('marlessonsa').inspect}"