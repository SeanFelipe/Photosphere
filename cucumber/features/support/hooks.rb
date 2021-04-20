Before do |scenario|
  if ENV['PHOTOSPHERE_POST_SPECS_FROM_CUCUMBER'] == 'true'
    post_scenario_to_photosphere scenario
    skip_this_scenario
  end
end

After do |scenario|
  unless ENV['PHOTOSPHERE_POST_SPECS_FROM_CUCUMBER'] == 'true'
    post_test_run_record_to_photosphere(scenario)
  end
end
