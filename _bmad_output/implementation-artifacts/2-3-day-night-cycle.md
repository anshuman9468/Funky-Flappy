# Story 2.3: Day/Night Cycle

Status: review

## Story

As a **Player**,
I want **the time of day to change as I play**,
so that **the visuals feel dynamic and less repetitive**.

## Acceptance Criteria

1.  **Visual Change**: The game world darkens (Night) and lightens (Day) over time.
2.  **Smooth Transition**: The change is gradual, not abrupt.
3.  **Gameplay Impact**: None (purely visual).
4.  **Cycle Duration**: A full day/night cycle takes a reasonable amount of time (e.g., 30-60 seconds).

## Tasks / Subtasks

- [x] Create Logic (`src/levels/DayNightCycle.gd`)
    - [x] Use `CanvasModulate` to tint the screen.
    - [x] `AnimationPlayer` or `Tween` to cycle colors.
    - [x] Colors: White (Day) -> Dark Blue/Purple (Night) -> White.
- [x] Integrate (`src/levels/Main.tscn`)
    - [x] Add `CanvasModulate` node.
    - [x] Attach script.

## Dev Notes

### Architecture Compliance
-   **Pattern**: Godot `CanvasModulate`.
-   **Path**: `src/levels/`.

### References
-   [Architecture Document](file:///home/anshumandutta/Documents/Flappy%20bird/_bmad_output/game-architecture.md)

## Dev Agent Record

### Agent Model Used
Gemini 2.0 Flash

### File List
- src/levels/DayNightCycle.gd
- src/levels/Main.tscn
