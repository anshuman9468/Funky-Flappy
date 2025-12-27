# Story 5.3: Audio Manager

## Description
Implement a centralized `AudioManager` to handle background music (BGM) and sound effects (SFX). The system should allow for easy playback of sounds from anywhere in the game code.

## Requirements
-   **Singleton**: Create an `AudioManager` autoload singleton.
-   **Channels**: Separate channels (AudioStreamPlayers) for Music and SFX to allow independent volume control.
-   **Assets**: Support for:
    -   BGM (Looping)
    -   Flap SFX
    -   Score SFX
    -   Crash/Die SFX
    -   Shoot SFX
    -   Extinguish SFX
-   **Integration**:
    -   Play BGM on game start.
    -   Play Flap SFX on input.
    -   Play Score SFX on point gain.
    -   Play Crash SFX on game over.
    -   Play Shoot SFX on fire.

## Acceptance Criteria
-   [ ] `AudioManager` exists as an Autoload.
-   [ ] Background music plays and loops during gameplay.
-   [ ] Sound effects play correctly when triggered.
-   [ ] No errors if audio files are missing (graceful fallback).
