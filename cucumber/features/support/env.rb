require 'httparty'
require 'byebug'; alias :breakpoint :byebug
require 'selenium-webdriver'

HOST = 'http://localhost:9292'

def post_new_spec(summary, details)
  ep = '/specs'
  url = HOST + ep
  headers = { 'Content-Type' => 'application/json' }
  body = {
    summary: summary,
    description: details
  }.to_json
  HTTParty.post(url, headers: headers, body: body)
end

def post_scenario_to_photosphere(scenario)
  title = scenario.name
  steps_arr = scenario.test_steps.collect {|ts| ts.text}
  steps = steps_arr.join "\n"
  post_new_spec(title, steps)
end

