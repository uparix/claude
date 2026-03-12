# PONGWARS

A C implementation of an abreviation of the original Pong game.

## Game Mechanics
- Screen format is a square splitted up between left and right in the middle
- Two Teams: Left side (one color) vs Right side (another color)
- Territory Control: Balls flip squares they pass over to their team's color
- Real-time Scoring: Score is based on the number of squares each team controls
- Physics: Simple velocity-based ball movement with wall bouncing
- Dynamic Grid: Adapts to screen size for optimal gameplay
- There is no user interaction and the game never finishes

## Design and Layout

- There are only two colors: Night (right side): #0F4A5A and Day (left side): #D8E7E2
- Ball and squares are of the same size usually 25 pixels in length and diameter
- At the bottom of the screen we show the current score for `day` (left side) and `night` (right side)
- Use the font `silkscreen` which is added to the assets folder as ttf font
- There is no space between the squares


## Data Models
- **Ball** - Position, velocity, color, and radius properties
- **Square** -  Grid squares with position, color, and claimed status
- **GameState** - Central game state management

## Additional Resources

- https://github.com/vnglst/pong-wars
- https://pong-wars.vercel.app/