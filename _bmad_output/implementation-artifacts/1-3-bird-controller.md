# Story 1.3: Bird Controller

Status: done

## Story

As a **Player**,
I want **to control the bird's flight with a flap mechanic**,
so that **I can navigate through the obstacles**.

## Acceptance Criteria

1.  **Physics Body**: Bird uses `CharacterBody2D` for physics.
2.  **Gravity**: Bird falls automatically when not flapping.
3.  **Flap Mechanic**: Pressing the "flap" action (Space/Click/Touch) applies an upward velocity.
4.  **Variable Flap**: Flap strength is consistent (classic feel).
5.  **Rotation**: Bird rotates up when flapping and down when falling.
6.  **Collision**: Bird detects collision with ground or pipes and triggers `GameManager.end_game()`.
7.  **State Integration**: Bird only moves when Game State is `PLAYING`. It hovers in `IDLE` and falls/stops in `GAME_OVER`.

## Tasks / Subtasks

- [x] Create Bird Scene
    - [x] Create `src/actors/Bird.tscn`.
    - [x] Add `CharacterBody2D` root.
    - [x] Add `Sprite2D` (placeholder or asset).
    - [x] Add `CollisionShape2D` (Circle or Capsule).
- [x] Implement Bird Logic (`Bird.gd`)
    - [x] Implement `_physics_process`.
    - [x] Apply gravity.
    - [x] Handle "flap" input.
    - [x] Implement rotation logic based on velocity.
    - [x] Handle `GameManager` state checks (only flap if PLAYING).
- [x] Collision Handling
    - [x] Detect collisions via `move_and_slide()` collisions or Area2D.
    - [x] Call `GameManager.end_game()` on collision.

## Dev Notes

### Architecture Compliance
-   **Pattern**: CharacterBody2D.
-   **Path**: `src/actors/Bird.tscn`, `src/actors/Bird.gd`.

### References
-   [Architecture Document](file:///home/anshumandutta/Documents/Flappy%20bird/_bmad_output/game-architecture.md)

## Dev Agent Record

### Agent Model Used
Gemini 2.0 Flash

### File List
- src/actors/Bird.gd
- src/actors/Bird.tscn
