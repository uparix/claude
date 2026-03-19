# Claude

A collection of Claude AI resources, skills, and projects — including workflow guides, developer rules, and AI-assisted games.

## Structure

```text
claude/
├── dev_rules/      # Software development principles
│   └── SKILLS.md   # 11 rules for writing clean, shippable software
├── workflow/       # Claude workflow orchestration guidelines
│   └── SKILLS.md   # Plan mode, subagent strategy, task management
└── projects/       # AI-assisted project implementations
    ├── pacman/     # Pac-Man implementation
    ├── pico2/      # Pico2 card game
    ├── pongwars/   # C + Raylib territory-control Pong variant
    ├── tankbattle/ # Tank Battle fom cleancoders
    └── wumpus/     # Java implementation of Hunt the Wumpus (1973)
```

## Skills

### [dev_rules/SKILLS.md](dev_rules/SKILLS.md)

11 software development rules covering shipping discipline, code simplicity, testing, bug hygiene, and design.

### [workflow/SKILLS.md](workflow/SKILLS.md)

Claude workflow guidelines: plan mode, subagent strategy, self-improvement loops, verification, and task management.

## Projects

### [Pac-Man](projects/pacman/README.md)

A Pac-Man implementation.

### [PONGWARS](projects/pongwars/README.md)

A C + Raylib implementation of a territory-control Pong variant. Two balls (Day and Night) bounce around a 32×32 grid, flipping squares to their team's color. Features hot-reload via `dlopen`, incremental scoring, and a two-file host/game split.

### [Hunt the Wumpus](projects/wumpus/README.md)

A Java implementation of Gregory Yob's classic 1973 text-based adventure. Navigate a 20-room dodecahedral cave, avoid pits and bats, and hunt the Wumpus using only sensory clues.
