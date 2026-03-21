---
name: uparix:test-driven-development
description: >
  Writes test-driven development (TDD) cases for any feature before
  implementation code exists. Trigger on phrases like "write tests for",
  "tests before code", "help me TDD this", or when a user describes a
  feature and asks how to approach it.
---

# Test Driven Development



## What NOT to do

- Don't write implementation code. If you find yourself writing the
  actual feature, stop.
- Don't write tests that always pass (e.g. `assert True`).
- Don't mock everything — only mock at system boundaries.
  