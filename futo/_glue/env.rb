require 'httparty'
require 'byebug'; alias :breakpoint :byebug
require 'json'

HOST = 'http://localhost:3000'

def hget(ep)
  HTTParty.get("#{HOST}#{ep}")
end

def hpost(ep, bb)
  hh = { 'Content-Type' => 'application/json' }
  url = "#{HOST}#{ep}"
  HTTParty.post(url, headers: hh, body: bb.to_json)
end
