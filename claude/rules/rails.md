---
paths:
  - "**/*.rb"
  - "**/*.erb"
  - "**/*.rake"
  - "**/Gemfile"
  - "**/Rakefile"
  - "**/config.ru"
  - "**/db/migrate/*"
---

# Rails

## Generators

When a `rails g` (or `rails generate`) generator exists for what you're creating, use it instead of hand-writing the files. This is especially important for migrations — always use `rails g migration ...` so the timestamp, file name, and skeleton are correct. The same applies to models, controllers, jobs, mailers, etc.
