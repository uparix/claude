# Demo Scene Test Scroller

Create a text scroller that scrolls the message "Hello World" from the right to left over the screen.
Use only the `/assets/fonts/megadeth.png` font from the assets folder.

## Application behaviour

- Pause when `space` bar is pressed, continue when `space` pressed again
- Repeat again from left when text is outside the screen.

## Assets

```text
assets/fonts
├── cebit.png        # Knight font from the lost boys.   `320x200 pixels`
├── knight.png       # Knight font from the lost boys.   `320x200 pixels`
├── lostboys.png     # Snake font from the lost boys.    `320x200 pixels`
└── megadeth.png     # MegaDeth font from the lost boys. `320x200 pixels`
```

### Megadeth Font

Each character is 32x32 pixel and is lined up as follows in the image:

```text
ABCDEFGHI
JKLMNOPQR
STUVWXYZ.
,"-+!?()'
:;0123456
789
```

## Building & Running

The build should be done in a `Makefile`

```sh
make build      # build → target/pongwars
make run        # build + run
make clean      # remove target/
```

Raylib 5.5 is installed via Homebrew. The Makefile links against `/opt/homebrew/Cellar/raylib/5.5/` with the required macOS frameworks (`OpenGL`, `Cocoa`, `IOKit`, `CoreVideo`).

## Architecture

The application be implement in plain C using TDD patterns.
