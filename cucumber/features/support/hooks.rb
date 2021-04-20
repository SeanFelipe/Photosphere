Before do |scenario|
  if ENV['PHOTOSPHERE_POST'] == 'true'
    post_scenario_to_photosphere scenario
    skip_this_scenario
  end
end
