# Story 4.1: HUD (Score & Coins)

Status: ready-for-dev

## Story

As a **Player**,
I want to **see my score while playing**,
so that **I know how well I am doing**.

## Acceptance Criteria

1.  **Visibility**: Score is always visible during gameplay (State: PLAYING).
2.  **Placement**: Top-center of the screen.
3.  **Updates**: Updates immediately when passing a pipe.
4.  **Style**: Clear, readable font.

## Tasks / Subtasks

- [ ] Create `HUD` Scene (`src/ui/HUD.tscn`)
    -   [ ] `CanvasLayer` root.
    -   [ ] `Label` for score.
    -   [ ] Script `HUD.gd`.
- [ ] Integrate
    -   [ ] Connect to `GameManager.score_updated` signal.
    -   [ ] Add to `Main.tscn`.

## Dev Notes

### Architecture Compliance
-   **Pattern**: UI / Observer.
-   **Path**: `src/ui/`.

### References
-   [GDD](file:///home/anshumandutta/Documents/Flappy%20bird/_bmad_output/gdd.md)
