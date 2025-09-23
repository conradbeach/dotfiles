# Check Media API
chma() {
  echo "\n---------- Running Rubocop ----------"
  bundle exec rubocop
  rubocop_status=$?

  echo "\n---------- Check for RuboCop violations in changed files with .rubocop_todo.yml disabled ----------"
  bundle exec rake rubocop:changed_files_todo_disabled
  rubocop_no_todo_status=$?

  echo "\n---------- Running Parallel RSpec ----------"
  bundle exec parallel_rspec
  rspec_status=$?

  echo "\n---------- Results ----------"
  report_result "Rubocop" $rubocop_status
  report_result "Rubocop with Todo Disabled" $rubocop_no_todo_status
  report_result "RSpec" $rspec_status

  # Return overall success
  return $(( rubocop_status + rubocop_no_todo_status + rspec_status ))
}
