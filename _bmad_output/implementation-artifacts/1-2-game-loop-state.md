# Story 1.2: Game Loop & State Management

Status: done

## Story

As a **Developer**,
I want **to implement a GameManager with a finite state machine**,
so that **the game can handle transitions between Menu, Playing, and Game Over states correctly**.

## Acceptance Criteria

1.  **GameManager Autoload**: A `GameManager` script is created and registered as an Autoload (Singleton).
2.  **State Management**: The game tracks at least three states: `IDLE` (Menu), `PLAYING`, and `GAME_OVER`.
3.  **Signals**: The GameManager emits signals for state changes: `game_started`, `game_over`, and `score_updated`.
4.  **Score Tracking**: The GameManager tracks the current score and high score.
5.  **Restart Capability**: The game can be reset to the `IDLE` or `PLAYING` state after Game Over.
6.  **Godot 4.5**: Implementation uses Godot 4.5 syntax and patterns.

## Tasks / Subtasks

- [x] Create GameManager
    - [x] Create `src/core/GameManager.gd`.
    - [x] Register as Autoload in `project.godot`.
- [x] Implement State Machine
    - [x] Define Enum `GameState { IDLE, PLAYING, GAME_OVER }`.
    - [x] Add `current_state` variable and `change_state(new_state)` function.
    - [x] Emit signals on state changes.
- [x] Implement Score System
    - [x] Add `score` and `high_score` variables.
    - [x] Add `add_score(amount)` function.
    - [x] Emit `score_updated` signal.
- [x] Testing
    - [x] Create a test scene/script to verify state transitions and signals.

## Dev Notes

### Architecture Compliance
-   **Pattern**: Autoload (Singleton).
-   **Path**: `src/core/GameManager.gd`.

### References
-   [Architecture Document](file:///home/anshumandutta/Documents/Flappy%20bird/_bmad_output/game-architecture.md)

## Dev Agent Record

### Agent Model Used
Gemini 2.0 Flash

### File List
- src/core/GameManager.gd
- src/core/GameLoopTest.gd
- src/core/GameLoopTest.tscn
- project.godot
