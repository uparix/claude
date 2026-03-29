# Matrix Digital Rain

A recreation of the Digital Rain sequence from The Matrix, built with [p5.js](https://p5js.org/). Original by Emily Xie, as demonstrated on the [Coding Train](https://www.youtube.com/watch?v=S1TQCi9axzg) YouTube channel.

![alt tag](green_rain.gif)

## How it works

The animation is built from two classes — `Symbol` and `Stream` — rendered in a p5.js sketch.

### Symbol

Each `Symbol` holds a single character at a position `(x, y)`, a fall speed, an opacity, and a `first` flag marking it as the leading (bright white-green) character.

- Every few frames (a random `switchInterval`), the character randomly switches to either a **Katakana character** (`U+30A0`–`U+30F3`) or a **digit** (0–9).
- On each frame, `rain()` advances `y` downward by `speed`. When `y` exceeds the canvas height it wraps back to `0`.

### Stream

A `Stream` is a vertical column of `Symbol` objects stacked upward from a starting `y` position.

- `totalSymbols` is random (5–35); `speed` is random (5–22 px/frame).
- Opacity decreases linearly from 255 (top/leading symbol) to 0 (tail), creating the fade trail. The fade rate is controlled by `fadeInterval = 1.6`.
- The leading symbol (`first = true`) renders in a lighter green (`140, 255, 170`); all others use `(0, 255, 70)`.

### Sketch setup

1. The canvas fills the browser window (`window.innerWidth × window.innerHeight`).
2. One `Stream` is created per column (`width / symbolSize`), with each stream given a random negative starting `y` so streams begin off-screen at staggered heights.
3. `symbolSize = 14` sets both the column width and the p5.js `textSize`. Font is **Consolas**.
4. On each `draw()` call, a semi-transparent black rectangle (`background(0, 150)`) is painted over the canvas — this produces the motion-blur fading trail rather than a hard erase.

## Project structure

```text
index.html   — loads p5.js from CDN and sketch.js
sketch.js    — all animation logic (Symbol, Stream, setup, draw)
```

## Running locally

Open `index.html` directly in a browser. No build step required — p5.js is loaded from CDN.

## References

Follow the video tutorial here: <https://www.youtube.com/watch?v=S1TQCi9axzg>

My final version deployed here: <http://xie-emily.com/generative_art/green_rain.html>
