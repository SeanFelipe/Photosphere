require 'httparty'
require 'byebug'; alias :breakpoint :byebug
require 'json'

HOST = 'http://localhost:3000'

def hget(ep)
  ep = '/' + ep unless ep.start_with? '/'
  HTTParty.get("#{HOST}#{ep}")
end

def hpost(ep, bb)
  ep = '/' + ep unless ep.start_with? '/'
  hh = { 'Content-Type' => 'application/json' }
  url = "#{HOST}#{ep}"
  HTTParty.post(url, headers: hh, body: bb.to_json)
end
