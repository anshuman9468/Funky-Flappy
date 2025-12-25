# Story 1.1: Project Setup (Godot 4.x)

Status: review

## Story

As a **Developer**,
I want **to set up the Godot 4.x project with correct structure and export settings**,
so that **we have a solid foundation for development and can build for WebGL**.

## Acceptance Criteria

1.  **Engine Version**: Project is initialized using Godot 4.x (Stable).
2.  **Project Structure**: The folder structure matches the `game-architecture.md` specification (`res://src`, `res://assets`, etc.).
3.  **Render Settings**: Renderer set to **Compatibility** (OpenGL ES 3.0) for maximum WebGL support.
4.  **Resolution**: Window width/height set to **480x854** (Portrait) or **1280x720** (Landscape) - *Decision: Landscape 1280x720 for Web*. Stretch mode set to `canvas_items`.
5.  **Version Control**: Git is initialized with a Godot-appropriate `.gitignore`.
6.  **Input Map**: Basic "flap" action configured (Spacebar, Left Click, Touch).
7.  **Main Scene**: A basic `Main.tscn` is created and set as the main scene.

## Tasks / Subtasks

- [x] Initialize Godot Project
    - [x] Create `project.godot` file.
    - [x] Set renderer to Compatibility (mobile/web friendly).
- [x] Setup Project Structure
    - [x] Create folders: `assets/sprites`, `assets/audio`, `assets/fonts`.
    - [x] Create folders: `src/core`, `src/actors`, `src/objects`, `src/levels`, `src/ui`, `src/data`.
    - [x] Create `exports` folder.
- [x] Configure Project Settings
    - [x] Set Window Width/Height to 1280x720.
    - [x] Set Stretch Mode to `canvas_items`.
    - [x] Set Aspect to `keep`.
    - [x] Configure Input Map (Action: `flap`).
- [x] Version Control Setup
    - [x] Initialize Git repository.
    - [x] Add `.gitignore` (Godot specific).
    - [x] Create initial commit.

## Dev Notes

### Architecture Compliance
-   **Folder Structure**: strictly follow `game-architecture.md`.
    ```
    res://
    ├── assets/
    ├── src/
    └── exports/
    ```
-   **Tech Stack**: Godot 4.x, GDScript.

### References
-   [Architecture Document](file:///home/anshumandutta/Documents/Flappy%20bird/_bmad_output/game-architecture.md)
-   [GDD](file:///home/anshumandutta/Documents/Flappy%20bird/_bmad_output/gdd.md)

## Dev Agent Record

### Agent Model Used
Gemini 2.0 Flash

### File List
- project.godot
- .gitignore
- src/levels/Main.tscn
- assets/
- src/
- exports/
