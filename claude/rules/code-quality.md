# Code Quality

## Overview

For Ruby projects, use RubyCritic to check the structural quality of code you wrote or modified. RubyCritic wraps Reek, Flay, and Flog to surface code smells, duplication, and complexity hotspots.

## When to Run

- Ruby projects only. If no Ruby files (`.rb`) were touched, skip this step.
- Scope the analysis to files you actually touched — don't analyze the whole project.

## How to Run

Run RubyCritic against the Ruby files you added or modified:

```bash
bundle exec rubycritic --no-browser -f console <touched .rb files>
```

If the project doesn't have RubyCritic in its Gemfile, fall back to the globally installed gem:

```bash
rubycritic --no-browser -f console <touched .rb files>
```

Flags:
- `--no-browser` — don't open the HTML report
- `-f console` — print findings directly to stdout

## Responding to Findings

Evaluate each finding with the same judgment used in code reviews (see the Code Reviews guidelines): address concerns that have meaningful consequences, and skip those that don't.

Good reasons to act on a finding:
- Real duplication that will cause drift
- Methods with high complexity that genuinely are hard to follow
- Clear design smells (e.g. Feature Envy pointing at a misplaced method)

Good reasons to skip a finding:
- The recommendation would require heavy refactoring for minimal real-world benefit
- The smell reflects a deliberate design choice that fits the surrounding code
- The recommendation conflicts with Rails or project conventions

When skipping a finding, briefly note why in your report to the user so they can weigh in.

## Reporting

After running RubyCritic, tell the user:
- The overall score/rating for each touched file
- Which findings you addressed and how
- Which findings you chose to leave alone and why
