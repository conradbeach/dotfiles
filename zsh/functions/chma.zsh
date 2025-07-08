# Check Media API
chma() {
  echo "\n---------- Running Rubocop ----------"
  bundle exec rubocop
  rubocop_status=$?

  echo "\n---------- Running Parallel RSpec ----------"
  bundle exec parallel_rspec
  rspec_status=$?

  echo "\n---------- Results ----------"
  report_result "Rubocop" $rubocop_status
  report_result "RSpec" $rspec_status

  # Return overall success
  return $(( rubocop_status + cucumber_status + rspec_status ))
}
