# Story 1.4: Input System

Status: done

## Story

As a **Player**,
I want **responsive controls on both PC and Mobile**,
so that **I can play the game using my preferred input method**.

## Acceptance Criteria

1.  **Input Actions**: `flap` and `pause` actions are defined in the Input Map.
2.  **Multi-Platform Support**:
    -   **PC**: Spacebar, Left Mouse Button.
    -   **Mobile**: Touchscreen Tap.
    -   **Pause**: Escape Key (PC), Back Button (Android/Web).
3.  **Responsiveness**: Inputs are detected immediately (using `_unhandled_input` or `_physics_process` as appropriate).
4.  **Deadzone**: Touch inputs have appropriate sensitivity (handled by Godot default, but verified).

## Tasks / Subtasks

- [x] Configure Input Map
    - [x] Verify `flap` action (Space, Mouse Left).
    - [x] Add `pause` action (Escape).
- [x] Verify Input Handling
    - [x] Create `InputTest.gd` to log input events for verification.
    - [x] Ensure `Bird.gd` uses the correct action name.

## Dev Notes

### Architecture Compliance
-   **Pattern**: Godot InputMap.
-   **Path**: `project.godot`.

### References
-   [Architecture Document](file:///home/anshumandutta/Documents/Flappy%20bird/_bmad_output/game-architecture.md)

## Dev Agent Record

### Agent Model Used
Gemini 2.0 Flash

### File List
- src/core/InputTest.gd
- src/core/InputTest.tscn
- project.godot
