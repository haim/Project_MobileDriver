Before do |scenario|
  @scenario_name=scenario.name
  @scenario_tags = scenario.source_tag_names

  load_data()

end


After do |scenario|
  puts 'Inside After block and Completed the execution'
end