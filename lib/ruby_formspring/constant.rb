module Kernel
  # simple (sequential) enumerated values
  def enum(*syms)
    syms.each { |s| const_set(s, s.to_s) }
    const_set(:DEFAULT, syms.first) unless syms.nil?
  end
end


module Fallow
  enum :MAX_ID, :SINCE_ID
end


module Inbox
  enum :POST_TWITTER, :POST_FACEBOOK, :POST_TUMBLR, :POST_BLOGGER
end