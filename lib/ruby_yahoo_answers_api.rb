require 'rubygems'
require 'oauth'
require 'xml_hate'

require 'ruby_yahoo_answers_api/constant'
require 'ruby_yahoo_answers_api/api'

module Kernel
  # simple (sequential) enumerated values
  def enum(*syms)
    syms.each { |s| const_set(s, s.to_s) }
    const_set(:DEFAULT, syms.first) unless syms.nil?
  end
end