# Story 3.2: Fire Pipe Logic

Status: ready-for-dev

## Story

As a **Player**,
I want **Fire Pipes to be dangerous but extinguishable**,
so that **I have to choose between avoiding them or shooting them**.

## Acceptance Criteria

1.  **Visual Distinction**: Fire Pipes look clearly different from normal pipes (e.g., Red color, fire particles).
2.  **Danger**: Colliding with an active Fire Pipe causes Game Over.
3.  **Interaction**: When hit by an Ice Projectile:
    -   The Fire Pipe becomes "extinguished".
    -   Visuals change (e.g., turns Blue/Ice, fire particles stop).
    -   It is no longer lethal (acts like a normal pipe or becomes passable - *Design Decision: Let's make it safe to touch or just a normal obstacle. GDD says "extinguished", implying it's just a normal pipe now.*).
4.  **Feedback**: Sound effect and visual flair when extinguishing.

## Tasks / Subtasks

- [ ] Create `FirePipe` Scene (Inherits from Pipe or separate?)
    -   [ ] Visuals (Red tint/sprite).
    -   [ ] Script `FirePipe.gd`.
- [ ] Implement `extinguish()` method in `FirePipe.gd`
    -   [ ] Change state `is_active = false`.
    -   [ ] Change visuals.
- [ ] Update `IceProjectile.gd`
    -   [ ] Call `extinguish()` on collision.
- [ ] Verify
    -   [ ] Fire Pipe kills on touch.
    -   [ ] Ice Projectile extinguishes it.
    -   [ ] Extinguished pipe is safe(r).

## Dev Notes

### Architecture Compliance
-   **Pattern**: Inheritance or Composition. `FirePipe` could inherit from `PipePair` or be a unique scene.
-   **Path**: `src/objects/`.

### References
-   [GDD](file:///home/anshumandutta/Documents/Flappy%20bird/_bmad_output/gdd.md)
