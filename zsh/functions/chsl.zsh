# Check serverless
chsl() {
  echo "\n---------- Running mini-test ----------"
  minitest
  test_status=$?

  echo "\n---------- Results ----------"
  report_result "mini-test" $test_status

  return $test_status
}
