# Story 3.1: Ice Projectile System

Status: ready-for-dev

## Story

As a **Player**,
I want to **shoot ice projectiles**,
so that **I can extinguish Fire Pipes and survive**.

## Acceptance Criteria

1.  **Projectile Creation**: Pressing 'F' (or button) spawns an Ice Projectile from the Bird's position.
2.  **Movement**: Projectile travels forward (right) in a straight line.
3.  **Visuals**: Projectile looks like an ice shard/ball.
4.  **Cleanup**: Projectiles destroy themselves after leaving the screen or hitting a target.
5.  **Cooldown**: There is a cooldown between shots (e.g., 0.5s) to prevent spamming.

## Tasks / Subtasks

- [ ] Create `IceProjectile` Scene (`src/objects/IceProjectile.tscn`)
    - [ ] Sprite/Visuals.
    - [ ] Area2D for collision.
    - [ ] Script (`src/objects/IceProjectile.gd`) for movement.
- [ ] Update `Bird.gd`
    - [ ] Instantiate projectile on input.
    - [ ] Implement cooldown timer.
- [ ] Verify
    - [ ] Projectile spawns correctly.
    - [ ] Projectile moves correctly.
    - [ ] Cooldown works.

## Dev Notes

### Architecture Compliance
-   **Pattern**: Scene-based object.
-   **Path**: `src/objects/`.

### References
-   [GDD](file:///home/anshumandutta/Documents/Flappy%20bird/_bmad_output/gdd.md)
