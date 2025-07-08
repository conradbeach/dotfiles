# Check Grand Central Station
chgcs() {
  echo "\n---------- Running RSpec ----------"
  bundle exec rspec
  rspec_status=$?

  echo "\n---------- Running minitest ----------"
  rails test
  minitest_status=$?

  echo "\n---------- Running Standard ----------"
  bundle exec standardrb
  standard_status=$?

  echo "\n---------- Running Bundler Audit ----------"
  bundler-audit check --update
  audit_status=$?

  echo "\n---------- Running Brakeman ----------"
  brakeman --no-pager
  brakeman_status=$?


  echo "\n---------- Results ----------"
  report_result "RSpec" $rspec_status
  report_result "Minitest" $minitest_status
  report_result "Standard" $standard_status
  report_result "Bundler Audit" $audit_status
  report_result "Brakeman" $brakeman_status

  # Return overall success
  return $(( rspec_status + minitest_status + standard_status + audit_status + brakeman_status ))
}
