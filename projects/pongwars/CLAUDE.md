# PongWars - Project Instructions

## Test Driven Development

- Follow the laws of test driven development TDD.
- Keep basic program logic away from library and framework code
- Use the @superpowers:test-driven-development skill

## Testing

- Write tests to achieve near-total test coverage. Every public function, branch, and edge case should have a corresponding test.
- Run the full test suite and build before considering any task complete:
- All three must pass clean. Do not commit that breaks tests, lint, or build.

## Code Quality

- Write clean, well-named, modular functions and classes. Prefer small single-purpose functions over large multi-step ones.
- Keep engine code (src/engine/) free of `Raylib` imports - pure logic only.

## Git Workflow

- **Commit often**: Make small, focused commits as you complete each task or meaningful unit of work.
- **Merge to main**: Always merge your work onto main when complete. Do not leave finished work on detached branches or worktrees.

## Spec & Task Reference

- The implementation spec lives at `specs/spec.md`.
- The `Raylib` documentation lives at `specs/RAYLIB.md`.
- Font assets: `../assets/slkscr.ttf` (normal), `../assets/slkscrb.ttf` (bold).
