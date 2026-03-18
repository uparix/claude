# Hunt the Wumpus

A Java impementation of Gregory Yob's classic 1973 text-based adventure game.

## The Game

You are a hunter exploring a dark cave system , armed with crooked arrows.
Somewhere in the cave lurks the Wumpus - a dangerous beast you must kill to
win. But the caves hold other dangers: bottomless pits and giant bats that will
carry you to random locations.

You can't see anything in the dark. You must rely on your senses - smell,
sound, and feel - to deduce what lies in adjacent caves and plan your moves
carefully.

## Map

The cave systems consist of 20 rooms arranged as the vertices of a
dodecahedron. Each room connects to exactly 3 other rooms.

## Hazards

- **The Wumpus** - If you walk into its room, it eats you. If you startle it (by shooting and missing), it may move to an adjacent room - possibly yours.
- **Bottomless Pits** (2) - Walk into one and you fall to your death.
- **Giant Bats** (2) - Walk into a bat room and they carry you to a random room (which may itself contain a hazard)

## Sensory Warnings

Each turn you receive wanrings about adjacent rooms:

| Warning | Meaning |
|---|---|
| "You smell something terrible nearby." | The Wumpus is in an adjacent room. |
|"You feel a cold wind blowing from a nearby cavern." | A pit is in an adjacent room. |
| "You hear rustling nearby. | Bats are in adjacent room. |

## Player Actions

Each turn the game display your currnet room and its connections, then prompts you with `Move or Shoot (M/S)?``

### Move

Type `M`followed by the room number. It must be one of the adjacent rooms.

````
M 5
````

### Shoot

Type `S`followed by the room numbers (1-5) along the arrow's path, separated by spaces or commas. If a room in the path is not connected to the previous one, the arrow flies in a random direction instead.

````
S 5 12 3
````

or
````
S 5,12,3
````

If the arrow hits the Wumpus, you win. If it hits you, you lose. If it misses, the Wumpus may move.

## Win and Loss Conditions

- **Win:** Your arrow strikes the Wumpus
- **Lose:** You enter a room with the Wumpus, fall into a pit, or are hit by your own arrow.

## Building and Running

```bash
mvn compile
mvn exec:java
````

## TEsting

```bash
mvn test
````




