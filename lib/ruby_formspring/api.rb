#require 'answered'
#require 'profile'

module RubyFormspring
  END_POINT       = "http://beta-api.formspring.me/"
  FORMAT_RESPONSE = "xml"

  class API
    
    def answered_count(username)
      request("answered/count/#{username}.#{FORMAT_RESPONSE}")
    end

    def answered_details(username, id)
      request("answered/details/#{username}/#{id}.#{FORMAT_RESPONSE}")
    end

    def answered_list(username)
      request("answered/count/#{username}.#{FORMAT_RESPONSE}")
    end

    def answered_remove(id)
      request("answered/remove/#{id}.#{FORMAT_RESPONSE}")
    end

    def fallow_add(username)
      request("fallow/add/#{username}.#{FORMAT_RESPONSE}")
    end

    def fallow_answers(id, type)
      case type
      when Fallow::MAX_ID
        request("follow/answers.#{FORMAT_RESPONSE}?max_id=#{id}")
      when Fallow::SINCE_ID
        request("follow/answers.#{FORMAT_RESPONSE}?since_id=#{id}")
      else
        raise "Param type not defined in constants"  
      end
    end

    def fallow_count
      request("follow/count.#{FORMAT_RESPONSE}")
    end

    def fallow_list(page = nil)
      request("follow/list.#{FORMAT_RESPONSE}"+ page.nil? ? '':"?page=#{page}")
    end

    def fallow_remove(username)
      request("follow/remove/#{username}.#{FORMAT_RESPONSE}")
    end

    def inbox_block(id, reason = nil)
      request("inbox/block/#{id}.#{FORMAT_RESPONSE}"+ reason.nil? ? '':"?reason=#{reason}")
    end

    def inbex_count
      request("inbox/count.#{FORMAT_RESPONSE}")
    end

    def inbox_list(since_id = nil, max_id = nil)
      if not since_id.nil? and not max_id.nil?
        request("inbox/list.#{FORMAT_RESPONSE}?since_id=#{since_id}&max_id=#{max_id}")
      elsif not since_id.nil?
        request("inbox/list.#{FORMAT_RESPONSE}?since_id=#{since_id}")
      elsif not max_id.nil?
        request("inbox/list.#{FORMAT_RESPONSE}?max_id=#{max_id}")
      end
    end

    def inbex_randon
      request("inbox/random.#{FORMAT_RESPONSE}")
    end

    def inbox_remove(id)
      request("inbox/remove/#{id}.#{FORMAT_RESPONSE}")
    end

    def inbox_respond(id, response, *post_to)
      url = "inbox/respond/#{id}.#{FORMAT_RESPONSE}"

      posts = []      
      post_to.each do |post|
        posts << case post
        when :POST_FACEBOOK
          "post_to_facebook=true"
        when :POST_TWITTER
          "post_to_twitter=true"
        when :POST_TUMBLR
          "post_to_tumblr=true"
        when :POST_BLOGGER
          "post_to_blogger=true"
        else
          raise "Param '#{post}' not defined post"
        end
      end
      url << "?" if not posts.empty?
      request(url+posts.join("&"))
    end

    def profile_ask(username)
      request("profile/ask/#{username}.#{FORMAT_RESPONSE}")
    end

    def profile_details(username)
      request("profile/details/#{username}.#{FORMAT_RESPONSE}")
    end

    def search_profiles(query, page = nil)
      request("search/profiles.#{FORMAT_RESPONSE}?query=#{query}"+ (page.nil? ? '':"&page=#{page}"))
    end

    private

    def request(url)
      uri = URI.parse(END_POINT+url)
      data = Net::HTTP.get_response(uri)
      XmlHate::Document.new(data.body)
    end
  end
end