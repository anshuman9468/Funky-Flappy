using UnityEngine;

public class EnvironmentManager : MonoBehaviour
{
    public Camera MainCamera;
    public Color DayColor = new Color(0.53f, 0.81f, 0.92f); // Sky Blue
    public Color NightColor = new Color(0.1f, 0.1f, 0.44f); // Midnight Blue
    public float CycleDuration = 20f; // Seconds for full cycle

    private float timer = 0f;

    private void Update()
    {
        if (!GameManager.Instance.IsPlaying) return;

        timer += Time.deltaTime;

        // PingPong for smooth transition Day -> Night -> Day
        float t = Mathf.PingPong(timer / CycleDuration, 1f);
        MainCamera.backgroundColor = Color.Lerp(DayColor, NightColor, t);
    }
}
