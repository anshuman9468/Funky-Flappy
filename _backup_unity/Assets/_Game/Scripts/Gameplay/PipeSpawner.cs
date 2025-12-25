using UnityEngine;

public class PipeSpawner : MonoBehaviour
{
    public GameObject PipePrefab;
    public float SpawnRate = 1.5f;
    public float MinHeight = -1f;
    public float MaxHeight = 3f;

    private float timer = 0f;

    private void Update()
    {
        if (!GameManager.Instance.IsPlaying) return;

        timer += Time.deltaTime;

        if (timer >= SpawnRate)
        {
            SpawnPipe();
            timer = 0f;
        }
    }

    private void SpawnPipe()
    {
        float randomY = Random.Range(MinHeight, MaxHeight);
        Vector3 spawnPos = new Vector3(transform.position.x, randomY, 0);

        GameObject pipe = Instantiate(PipePrefab, spawnPos, Quaternion.identity);
        
        // Ensure the pipe is destroyed after some time if it doesn't destroy itself
        Destroy(pipe, 10f); 
    }
}
