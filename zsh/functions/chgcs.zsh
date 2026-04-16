# Check Grand Central Station
#
# Mirrors the checks in .github/workflows/pr_checks.yml of the
# grand_central_station repository. Currently Standard Ruby only.
chgcs() {
  echo "\n---------- Running Standard ----------"
  bundle exec standardrb
  standard_status=$?

  echo "\n---------- Results ----------"
  report_result "Standard" $standard_status

  return $standard_status
}
