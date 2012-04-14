module RubyFormspring
  module Answered

    def count(username)
      request("answered/count/#{username}.#{FORMAT_RESPONSE}")
    end

    def details(username, id)
      request("answered/details/#{username}/#{id}.#{FORMAT_RESPONSE}")
    end

    def list
      request("answered/count/#{username}.#{FORMAT_RESPONSE}")
    end

    def remove

    end

  end
end