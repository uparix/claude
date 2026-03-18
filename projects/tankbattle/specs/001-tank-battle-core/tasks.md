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

## Phase 1: Project Foundation

> **Goal**: Scaffold project, define all types, build core engine modules with tests. All 4 tracks work independently after T001-T002 complete.

- [] T001 [A] [US1] Initialize Vite + React + Typescript project, configure Vitest, ESLint, tsconfig strict mode ìn project root`
- [] T002 [A] [US1] Define all TypeScript interfaces and type enums (GamePhase, TankState, TerrainData, Projectile, WeaponType, WeaponC , GameState, StoredPlayerProfile) in `src/types/game.ts` → T001

**After T002, all tracks begin in parallel:**

- [] T003 [B] [P] [US6] Implmenent terrain generation (midpoint displacement algorithm, seeded RNG, height interpolation, terrain size config) produces valid heights, interpolation accuracy, all 5 terrain sizes. `in src/engine/terrain.ts + terrain.test.ts` → T002
- [] T004 [C] [P] [US6] Implement physics engine (velocity from power/angle, projectile position at time t, coordinate conversion world↔screen) callibration, angle conversion UI↔physics). Write tests for: trajectory symmetry, known angle/power outcomes, coordinate conversion round `src/engine/physics.ts + physics.test.ts` → T002
- [] T005 [D] [P] [US3] Implement weapon configurations (3 weapon definitions with damage/blast/cost/speed/colors, damage calculation for difficulty multipliers). Write tests for: correct damage values, blast radius checks, economy math. `in src/engine/weapons.ts + weapons.test.ts`

## Phase 2: Engine Completion

> **Goal**: Complete all pure engine modules. Every module has tests. Tracks some corss-dependencies but maximize parallelism.

- [] T006 [C] [P] [US6] Implement wind system (initial wind from normal distribution, per-turn regression-to-mean update, ±30m/s clamping bounds, regression toward zero over many turns. `in src/engine/wind.ts + wind.test.ts` → T004
- [] T007 [B] [P] [US1] Implmenet tank engine (tank placemanet on terrain at even spacing, tank dimensions/rendering constants, name pool ??? avoiding player color). Write tests for: tanks placed at acorrect terrain heights, even spacing, no duplicate colors. ìn src/engine/tank.t ???
- [] T007 [C] [P] [US5] Implement AI system (ideal shot calculation accounting for gravity+wind, difficulty variance tables, target selection ??? clamping). Write tests for: ideal shot hits target in zero wind, variance increases with lower difficulty, target persistence works. `in src/engine ??? T004, T003
- [] T009 [D] [P] [US6] Implement projectile system (projectile creation from tank+angle+power+weapon, animation step function, terrain ?? detectio, out-of-bounds check). Write tests for: collision withterrain at correct height, blast radius proximity check, OOB detection. `in src. ??? projectile.test.ts` → T004, T003, T005
- [] T010 [A] [P] [US1] Implement explosion system (state machine: growing → peak → fading → done, particle generation with physics, weapon animation state with debris pieces). Write tests for: state transisitions, duration timing, particle count within bounds. `in src/engine/explsion.ts explosion.test.ts` → T005

## ===== CHECKPOINT 1: Engine Verification =====

> **All engine modules complete with passing tests.**
>
> ### What to test
>
> ```bash
>   npm test
> ````
>
> - All tests green accross: terrain, physics, wind, weapons, tank, ai, projectile, explosion
> Coverage >80% on engine modules
> `npm run build` compiles without errors
> `npm run lint` passes
>
> ### What you'll see
>
> - No UI yet - this is pure logic verification
> - Confirm physics feel right by inspecting test outputs (trajectory distances, damage values)
> - Review AI accuracy spread at each difficulty level in test output
>
> ### Go/No-Go
>
> - [] All engine tests pass
> - [] Build succeeds
> - [] Lint passes
> - [] Physics constants feel calibrated (review test assertions)

## Phase 3: State Management & UI Screens

> **Goal**: Build React contexts, persistence, and all non-canvas screens. After this phase, the full menu flow is clickable end-to-end.

- [] T011 [A] [P] [US7] Implement LocalStorage service (save/load/clear player profile, JSON serialization, hadnle missing/corrupted data gracefully). Write tests for: save/load round-trip, default values on missing data. `in src/services/storage.ts` → T002
- [] T012 [B] [P] [US7] Implement UserContext (player name, balance, stats, weapon inventory; oads from storage on mount, saves on change; provides earnings calculation with difficulty multiplier). `in src/context/UserContext.tsx` → T011, T005
- [] T013 [C] [US1] Implement GameContext (game phase state machine, terrain/tank/wind state, turn management, selected weapon tracking, winner detection; provides phase transaction functions: startConfig, startShop, startBattle, endGame, playAgain). `in src/context/GameContext.tsx` → T002, T003, T007, T006
