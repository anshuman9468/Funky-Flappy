# Story 4.2: Main Menu & Difficulty

Status: ready-for-dev

## Story

As a **Player**,
I want to **select a difficulty level before playing**,
so that **I can play at a speed that matches my skill**.

## Acceptance Criteria

1.  **Main Menu**: A UI screen shown on launch (instead of auto-start).
2.  **Difficulty Options**: Three buttons:
    -   **Slow**: Easy speed.
    -   **Medium**: Normal speed.
    -   **Fast**: Hard speed.
3.  **Game Start**: Clicking a button sets the speed and starts the game.
4.  **Game Over**: When the bird dies, show a "Game Over" screen with a "Restart" button (or return to menu).

## Tasks / Subtasks

- [ ] Update `GameManager`
    -   [ ] Add `game_speed` variable.
    -   [ ] Add `set_difficulty(level)` function.
- [ ] Update Game Objects to use `GameManager.game_speed`
    -   [ ] `Background.gd`
    -   [ ] `PipePair.gd`
    -   [ ] `PipeSpawner.gd` (adjust interval).
- [ ] Create `MainMenu` Scene (`src/ui/MainMenu.tscn`)
    -   [ ] Title Label.
    -   [ ] 3 Buttons.
    -   [ ] Script `MainMenu.gd`.
- [ ] Create `GameOver` Scene (`src/ui/GameOver.tscn`)
    -   [ ] "Game Over" Label.
    -   [ ] "Restart" Button.
    -   [ ] "Menu" Button.
- [ ] Integrate
    -   [ ] `Main.tscn` should start with Menu visible (or load Menu scene first).

## Dev Notes

### Architecture Compliance
-   **Pattern**: UI Scenes.
-   **Path**: `src/ui/`.

### References
-   [GDD](file:///home/anshumandutta/Documents/Flappy%20bird/_bmad_output/gdd.md)
