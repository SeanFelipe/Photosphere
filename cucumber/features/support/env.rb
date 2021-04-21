require 'rspec'
require 'httparty'
require 'byebug'; alias :breakpoint :byebug
alias :bp :byebug # agb ignore
require 'selenium-webdriver'

class SpecNotFoundError < RuntimeError; end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :should
  end
end

HOST = 'http://localhost:9292'

def hpost(ep, body)
  ep = '/' + ep unless ep.start_with? '/'
  url = HOST + ep
  headers = { 'Content-Type' => 'application/json' }
  HTTParty.post(url, headers: headers, body: body.to_json)
end

def post_new_spec(summary, details)
  ep = '/specs'
  body = {
    summary: summary,
    description: details
  }
  hpost(ep, body)
end

def post_scenario_to_photosphere(scenario)
  title = scenario.name
  steps_arr = scenario.test_steps.collect {|ts| ts.text}
  steps = steps_arr.join "\n"
  post_new_spec(title, steps)
end

def get_spec_id_from_photosphere_by_scenario_name(scenario)
  ep = '/search'
  body = { summary: scenario.name }
  r = hpost(ep, body).parsed_response
  if r['spec_id'] == 'not found'
    raise SpecNotFoundError, "Could not find a Photosphere spec for scenario \"#{scenario.name}\""
  end
  return r['spec_id']
end

def post_test_run_record_to_photosphere(scenario)
  iid = get_spec_id_from_photosphere_by_scenario_name(scenario)
  ep = '/run_records'
  run_result = scenario.passed? ? 'pass' : 'fail'
  culled_steps = []
  cull_values = ['Before hook', 'After hook']
  scenario.test_steps.each do |ts|
    add = true
    cull_values.each do |cull_value|
      if ts.text.start_with? cull_value
        add = false
      end
    end
    culled_steps << ts if add
  end
  details = culled_steps.collect{|ss| ss.text}.join("\n")
  body = {
    spec_id: iid,
    result: run_result,
    details: details,
  }
  hpost(ep, body)
end
