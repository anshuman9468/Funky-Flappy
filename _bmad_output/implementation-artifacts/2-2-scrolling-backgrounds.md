# Story 2.2: Scrolling Backgrounds

Status: done

## Story

As a **Player**,
I want **a moving environment**,
so that **I feel a sense of speed and progression**.

## Acceptance Criteria

1.  **Parallax Scrolling**: The background moves slower than the foreground (ground/pipes) to create depth.
2.  **Seamless Looping**: The background and ground textures repeat seamlessly.
3.  **Ground Collision**: The ground acts as a floor; hitting it triggers Game Over (already handled by bird limits, but visual alignment needed).
4.  **State Control**: Scrolling stops when the game is in `GAME_OVER` or `IDLE` (optional for Idle, but must stop on Game Over).

## Tasks / Subtasks

- [x] Create Assets
    - [x] `assets/sprites/ground.svg` (Scrolling floor).
    - [x] `assets/sprites/background.svg` (Sky/Cityscape).
- [x] Create Background Scene (`src/levels/Background.tscn`)
    - [x] `ParallaxBackground` root.
    - [x] `ParallaxLayer` for Sky (Slow speed).
    - [x] `ParallaxLayer` for Ground (Normal speed).
- [x] Implement Logic (`src/levels/Background.gd`)
    - [x] Update `scroll_offset` in `_process`.
    - [x] Check `GameManager.current_state`.

## Dev Notes

### Architecture Compliance
-   **Pattern**: Godot `ParallaxBackground`.
-   **Path**: `src/levels/`.

### References
-   [Architecture Document](file:///home/anshumandutta/Documents/Flappy%20bird/_bmad_output/game-architecture.md)

## Dev Agent Record

### Agent Model Used
Gemini 2.0 Flash

### File List
- src/levels/Background.gd
- src/levels/Background.tscn
- assets/sprites/ground.svg
- assets/sprites/background.svg
