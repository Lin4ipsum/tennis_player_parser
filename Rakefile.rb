require 'rspec/core/rake_task'
require_relative 'run.rb'

  desc "view all player output"
  task :run do
  	Run.print_sorted_tennis_players
  end

  desc "run all tests with rspec"
  task :tests do
  	RSpec::Core::RakeTask.new(:spec)
  	Rake::Task["spec"].execute
  end
