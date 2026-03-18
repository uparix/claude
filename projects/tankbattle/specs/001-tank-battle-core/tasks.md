# Implementation Tasks: Tank Battle Core Game

**Spec**: `spec.md`
**Created**: 2026-03-01
**Parallel Tracks**: 4 (A, B, C, D)
**Checkpoints**: 4 (user testing gates between phases)

## Track Legend

| Track | Focus Area                             |  Color |
|-------|----------------------------------------|--------|
| A     | Foundaction, State Management, Economy |    Red |
| B     | Terrain, Tanks, Visual Effects         |   Blue |
| C     | Physics, AI, Turn Resolutionts         |  Green |
| D     | Weapons, UI Components, Controls       | Yellow |

## Dependency Notation

- [A] = Track assignment
- [P] = Can run in parallel with other tasks in same place
- [US1] = Maps to User Story 1
- → T### - Depends on task completing first
- [GATE] - Checkpoint - all prior tasks must complete before proceeding

# Phase 1: Project Foundation

> **Goal**: Scaffold project, define all types, build core engine modules with tests. All 4 tracks work independently after T001-T002 complete.

- [] T001 [A] [US1] Initialize Vite + React + Typescript project, configure Vitest, ESLint, tsconfig strict mode ìn project root`
- [] T002 [A] [US1] Define all TypeScript interfaces and type enums (GamePhase, TankState, TerrainData, Projectile, WeaponType, WeaponC , GameState, StoredPlayerProfile) in `src/types/game.ts` → T001

** After T002, all tracks begin in parallel:**

- [] T003 [B] [P] [US6] Implmenent terrain generation (midpoint displacement algorithm, seeded RNG, height interpolation, terrain size config) produces valid heights, interpolation accuracy, all 5 terrain sizes. `in src/engine/terrain.ts + terrain.test.ts` → T002
- [] T004 [C] [P] [US6] Implement physics engine (velocity from power/angle, projectile position at time t, coordinate conversion world↔screen) callibration, angle conversion UI↔physics). Write tests for: trajectory symmetry, known angle/power outcomes, coordinate conversion round `src/engine/physics.ts + physics.test.ts` → T002
- [] T005 [D] [P] [US3] Implement weapon configurations (3 weapon definitions with damage/blast/cost/speed/colors, damage calculation for difficulty multipliers). Write tests for: correct damage values, blast radius checks, economy math. `in src/engine/weapons.ts + weapons.test.ts`

# Phase 2: Engine Completion
> **Goal**: Complete all pure engine modules. Every module has tests. Tracks some corss-dependencies but maximize parallelism.

- [] T006 [C] [P] [US6] Implement wind system (initial wind from normal distribution, per-turn regression-to-mean update, ±30m/s clamping bounds, regression toward zero over many turns. `in src/engine/wind.ts + wind.test.ts` → T004


