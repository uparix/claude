# PONGWARS

PONGWARS is a C implementation of a territory-control **Pong** variant using Raylib for graphics. Two balls (Day and Night) bounce around a grid, flipping squares to their team's color. The game runs continuously with no user interaction.

https://github.com/uparix/claude/tree/main/projects/pongwars/pongwars.mov


## Game Mechanics
- Screen format is a square splitted up between left and right in the middle
- Two Teams: Left side (one color) vs Right side (another color)
- Territory Control: Balls flip squares they pass over to their team's color
- Real-time Scoring: Score is based on the number of squares each team controls
- Physics: Simple velocity-based ball movement with wall bouncing
- Dynamic Grid: Adapts to screen size for optimal gameplay
- There is no user interaction and the game never finishes
- In the status bar show the total amount of squares for each side like this `day 512 | night 512` at the bottom center
- Scores are updated incrementally on each square flip, not recomputed each frame.
- The speed of the balls should hava a slight variation 

## Design
- There are only two colors: Night (right side): #0F4A5A and Day (left side): #D8E7E2
- Ball and squares are of the same size usually 25 pixels in length and diameter
- At the bottom center of the screen show the current score for `day` (left side) and `night` (right side)
- Use the font `silkscreen` which is added to the assets folder as ttf font
- There is no space between the squares

## Screen Layout
````
+----------------------+
| day      | night     |
|          |           |
|          |           |
|          |           |
|          |           |
|          |           |
|          |           |
|          |           |
+----------------------+
|   DAY 10 | NIGHT 10  |
+----------------------+
````

The background for the bottom status bar should be transparent

## Building & Running
The build should be done in a `Makefile`

```sh
make build      # build → target/pongwars
make run        # build + run
make clean      # remove target/
make hotreload  # reload application after each compilation step
```

Raylib 5.5 is installed via Homebrew. The Makefile links against `/opt/homebrew/Cellar/raylib/5.5/` with the required macOS frameworks (`OpenGL`, `Cocoa`, `IOKit`, `CoreVideo`).

## Architecture

**Two-file split:** `src/main.c` (host) and `src/game.c` (game logic, compiled as `target/libgame.dylib`).

**Hot reload system:** The host loads `libgame.dylib` via `dlopen` at startup and polls its mtime every frame. When `make hotreload` rebuilds the lib while the app is running, the host copies it to a versioned `target/libgame_live_N.dylib` (to bypass macOS dyld path caching), then `dlclose`s the old handle and `dlopen`s the new one. If `game_state_size()` returns a different size (struct layout changed), the host re-allocates and re-inits state; otherwise state is preserved across reloads.

**Exported game API** (`game.h`):
- `game_state_size()` — returns `sizeof(GameState)` so the host can alloc without knowing the struct
- `game_init(gs)` — initialise/reset state
- `game_update(gs, dt)` — advance physics one frame
- `game_draw(gs, font)` — render everything

**Core data models** (`game.h`):
- `Square` — just a `Team` tag; grid is `Square grid[GRID_ROWS][GRID_COLS]`
- `Ball` — `pos`, `vel`, `team`, plus `speedScale`/`speedTarget`/`speedTimer` for speed variation
- `GameState` — grid + two balls + incremental scores

**Grid constants** (`game.h`): `SQUARE_SIZE=25`, `GRID_COLS=GRID_ROWS=32`, `BALL_RADIUS=SQUARE_SIZE*0.5`, `BALL_SPEED=800`. Screen is `800×825` (grid + 25px status bar).

**Physics:** velocity-based, bounce off walls. Screen split left (Day: `#D8E7E2`) / right (Night: `#0F4A5A`). Scores are updated incrementally on each square flip, not recomputed each frame.

## Reference

- Raylib API reference: `docs/RAYLIB.md`
- Font assets: `assets/slkscr.ttf` (normal), `assets/slkscrb.ttf` (bold)
- Original JS version: https://github.com/vnglst/pong-wars


## Additional Resources

- https://github.com/vnglst/pong-wars
- https://pong-wars.vercel.app/