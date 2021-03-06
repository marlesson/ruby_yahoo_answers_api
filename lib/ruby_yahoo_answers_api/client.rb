
module RubyYahooAnswersApi
  END_POINT       = "http://answers.yahooapis.com/AnswersService/V1/"
  FORMAT_RESPONSE = "xml"

  class Client
    attr_accessor :appid, :debug

    def initialize(appid, debug = false)
      self.appid = appid
      self.debug = debug
    end

    def question_search(query, parameters = {})
      parameters[:query] = query
      params = set_params(parameters)

      request("questionSearch?#{params}")
    end

    def get_by_category_name(name, parameters = {})
      parameters[:category_name] = name
      get_by_category(parameters)
    end

    def get_by_category_id(id, parameters = {})
      parameters[:category_id] = id
      get_by_category(parameters)
    end

    def get_by_category(parameters = {})
      params      = set_params(parameters)
      request("getByCategory?#{params}")
    end

    def get_by_user(user_id, parameters = {})
      parameters[:user_id]  = user_id
      params                = set_params(parameters)

      request("getByUser?#{params}")
    end

    def get_question(question_id)
      parameters = {:question_id => question_id}
      params     = set_params(parameters)

      request("getQuestion?#{params}")
    end

    private

    def set_params(parameters = {})
      params = []
      parameters = set_default_params(parameters)
      parameters.each{|key, value| params << "#{key.to_s}=#{value}"}
      params.join("&")
    end

    def set_default_params(params = {})
      params ||= {}
      params[:appid]  = self.appid
      params[:output] = FORMAT_RESPONSE
      params
    end

    def request(url)
      uri = URI.parse(END_POINT+url)
      puts uri if debug
      data = Net::HTTP.get_response(uri)
      XmlHate::Document.new(data.body)
    end
  end
end