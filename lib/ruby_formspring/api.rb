#require 'answered'
#require 'profile'

module RubyFormspring
  END_POINT       = "http://beta-api.formspring.me/"
  FORMAT_RESPONSE = "xml"

  class API
    include Answered
    include Profile

    private

    def request(url)
      uri = URI.parse(END_POINT+url)
      data = Net::HTTP.get_response(uri)
      XmlHate::Document.new(data.body)
    end
  end
end