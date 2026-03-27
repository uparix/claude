# Tutorial

Anatomy of the .claude/ folder

```text
your-project/
├── CLAUDE.md/                      # team instructions, comitted
├── CLAUDE.local.md/                # personal overrides, gitignored
└── .claude/                        # the control center
    ├── settings.json               # permissions + config, comitted
    ├── settings.local.json         # personal permissions, gitignored
    ├── commands/                   # custom slash commands
    │   ├── review.md               # /project:review
    │   ├── fix-issue.md            # /project:fix-issue
    │   └── deploy.md               # /project:deploy
    ├── rules/                      # modular instruction files
    │   ├── code-style.md   
    │   ├── testing.md 
    │   └── api-conventions.md 
    ├── skills/                     # auto-invoked workflows           
    │   ├── security-review/        
    │   │   └── SKILL.md            
    │   ├── deploy/                 
    │   │   └── SKILL.md                 
    └── agents/                     # subagent personas
        ├── code-reviewer.md
        └── security-auditor.md
```
