module RubyFormspring
  module Profile
    def ask(username)
      request("profile/ask/#{username}.#{FORMAT_RESPONSE}")
    end

    def details(username)
      request("profile/details/#{username}.#{FORMAT_RESPONSE}")
    end
  end
end