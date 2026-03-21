# Claude

A collection of Claude AI resources, skills, and projects — including workflow guides, developer rules, and AI-assisted games.

## Structure

```text
claude/
├── others/ 
│   └── bias-game.md                 # BIAS Game
├── projects/                        # AI-assisted project implementations
│   ├── pacman/                      # Pac-Man implementation
│   ├── pico2/                       # Pico2 card game (1996)
│   ├── pongwars/                    # Territory Control Pong variant
│   ├── tankbattle/                  # Tank Battle from CleanCoders
│   └── wumpus/                      # Java implementation of Hunt the Wumpus (1973)
└── skills/                            
    ├── ai-writing/                  # AI Writing guidelines
    ├── software-development-rules/  # Software development rules
    ├── test-driven-development/     # Test Driven Software Development (TDD)
    └── workflow/                    # Claude workflow orchestration guidelines
```

## Skills

### [dsoftware-development-rules/SKILL.md](software-development-rules/SKILLS.md)

11 software development rules covering shipping discipline, code simplicity, testing, bug hygiene, and design.

### [workflow/SKILL.md](workflow/SKILLS.md)

Claude workflow guidelines: plan mode, subagent strategy, self-improvement loops, verification, and task management.

## Projects

### [Pac-Man](projects/pacman/README.md)

A Pac-Man implementation.

### [PONGWARS](projects/pongwars/README.md)

An implementation of a territory-control Pong variant. Two balls (Day and Night) bounce around a 32×32 grid, flipping squares to their team's color. Features hot-reload via `dlopen`, incremental scoring, and a two-file host/game split.

### [Hunt the Wumpus](projects/wumpus/README.md)

A Java implementation of Gregory Yob's classic 1973 text-based adventure. Navigate a 20-room dodecahedral cave, avoid pits and bats, and hunt the Wumpus using only sensory clues.
