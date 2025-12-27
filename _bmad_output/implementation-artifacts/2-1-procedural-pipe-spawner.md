# Story 2.1: Procedural Pipe Spawner

Status: done

## Story

As a **Player**,
I want **pipes to spawn endlessly and move towards me**,
so that **the game provides a continuous challenge**.

## Acceptance Criteria

1.  **Pipe Scene**: A `Pipe.tscn` exists containing a top pipe, a bottom pipe, and a score zone (Area2D) in between.
2.  **Collision**: Pipes have `StaticBody2D` or `Area2D` collision shapes that trigger game over on contact with the bird.
3.  **Spawning**: A `PipeSpawner` node instantiates pipes at regular intervals (e.g., every 1.5 - 2.0 seconds).
4.  **Randomization**: Pipe vertical position is randomized within a playable range.
5.  **Movement**: Pipes move to the left at a constant speed defined by `GameManager` or a global constant.
6.  **Cleanup**: Pipes are freed from memory when they exit the screen to the left.
7.  **Game State**: Spawning and movement only occur when `GameManager.current_state` is `PLAYING`.

## Tasks / Subtasks

- [x] Create Pipe Assets
    - [x] Create `assets/sprites/pipe.svg` (placeholder).
- [x] Create Pipe Scene (`src/objects/PipePair.tscn`)
    - [x] Root Node2D.
    - [x] Top Pipe (Sprite + Collision).
    - [x] Bottom Pipe (Sprite + Collision).
    - [x] Score Zone (Area2D between pipes).
    - [x] `VisibleOnScreenNotifier2D` for cleanup.
- [x] Implement Pipe Logic (`src/objects/PipePair.gd`)
    - [x] Move left in `_physics_process`.
    - [x] Signal `bird_entered` (Game Over) and `score_entered` (Add Score).
    - [x] `queue_free()` when off-screen.
- [x] Create Spawner (`src/levels/PipeSpawner.gd`)
    - [x] Timer for spawn intervals.
    - [x] Instantiate `PipePair`.
    - [x] Randomize Y position.
    - [x] Add to scene tree.

## Dev Notes

### Architecture Compliance
-   **Pattern**: Object Pooling (optional, but `queue_free` is fine for MVP).
-   **Path**: `src/objects/`.

### References
-   [Architecture Document](file:///home/anshumandutta/Documents/Flappy%20bird/_bmad_output/game-architecture.md)

## Dev Agent Record

### Agent Model Used
Gemini 2.0 Flash

### File List
- src/objects/PipePair.gd
- src/objects/PipePair.tscn
- src/levels/PipeSpawner.gd
- src/levels/Main.tscn
- assets/sprites/pipe.svg
