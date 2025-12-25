using UnityEngine;

public class PipeMover : MonoBehaviour
{
    public float Speed = 3f;
    public float DeadZone = -10f;
    private bool passedBird = false;

    private void Update()
    {
        if (!GameManager.Instance.IsPlaying) return;

        transform.position += Vector3.left * Speed * Time.deltaTime;

        if (transform.position.x < DeadZone)
        {
            Destroy(gameObject);
        }

        // Simple scoring: if pipe passes x=0 (bird position approx)
        if (!passedBird && transform.position.x < 0) // Assuming Bird is at 0 or positive
        {
            passedBird = true;
            GameManager.Instance.AddScore(1);
        }
    }
}
