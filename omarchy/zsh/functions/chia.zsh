# Check irms-api
chia() {
  echo "\n---------- Running RSpec ----------"
  bundle exec rspec
  rspec_status=$?

  echo "\n---------- Running Rubocop ----------"
  bundle exec rubocop --display-style-guide
  rubocop_status=$?

  echo "\n---------- Running Bundler Audit ----------"
  bundle exec bundler-audit check --update
  audit_status=$?

  echo "\n---------- Running Brakeman ----------"
  bundle exec brakeman --no-pager
  brakeman_status=$?

  echo "\n---------- Results ----------"
  report_result "RSpec" $rspec_status
  report_result "Rubocop" $rubocop_status
  report_result "Bundler Audit" $audit_status
  report_result "Brakeman" $brakeman_status

  # Return overall success
  return $(( rspec_status + rubocop_status + audit_status + brakeman_status ))
}
