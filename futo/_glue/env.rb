require 'httparty'
require 'byebug'; alias :breakpoint :byebug
require 'json'

HOST = 'http://localhost:3000'
PRE = "#{HOST}/api/"

def hget(ep)
  HTTParty.get("#{PRE}#{ep}")
end

def hpost(ep, body)
  HTTParty.post("#{PRE}#{ep}", body)
end
