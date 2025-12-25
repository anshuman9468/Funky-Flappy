using UnityEngine;

[RequireComponent(typeof(Rigidbody2D))]
public class BirdController : MonoBehaviour
{
    [Header("Physics Settings")]
    public float JumpForce = 5f;
    public float VariableJumpForce = 7f; // Force when holding button
    public float RotationSpeed = 5f;

    private Rigidbody2D rb;
    private bool isDead = false;

    private void Start()
    {
        rb = GetComponent<Rigidbody2D>();
    }

    private void Update()
    {
        if (GameManager.Instance.IsGameOver || !GameManager.Instance.IsPlaying)
        {
            // Allow starting the game with flap
            if (!GameManager.Instance.IsPlaying && InputManager.Instance.FlapPressed())
            {
                GameManager.Instance.StartGame();
                Flap();
            }
            return;
        }

        if (InputManager.Instance.FlapPressed())
        {
            Flap();
        }

        // Variable Jump Logic (Simplified)
        // If holding, we could apply a small extra force or reduce gravity temporarily
        // For MVP, we'll just stick to impulse.
    }

    private void FixedUpdate()
    {
        if (GameManager.Instance.IsPlaying && !isDead)
        {
            RotateBird();
        }
    }

    private void Flap()
    {
        rb.velocity = Vector2.zero; // Reset vertical velocity for consistent jump height
        rb.AddForce(Vector2.up * JumpForce, ForceMode2D.Impulse);
        
        // Play Flap Sound here
    }

    private void RotateBird()
    {
        // Rotate based on velocity
        float angle = Mathf.Atan2(rb.velocity.y, 10) * Mathf.Rad2Deg * RotationSpeed;
        transform.rotation = Quaternion.Euler(0, 0, angle);
    }

    private void OnCollisionEnter2D(Collision2D collision)
    {
        if (isDead) return;

        if (collision.gameObject.CompareTag("Pipe") || collision.gameObject.CompareTag("Ground"))
        {
            Die();
        }
    }

    private void Die()
    {
        isDead = true;
        GameManager.Instance.GameOver();
        // Play Die Sound / Particle
    }
}
