using UnityEngine;
using UnityEngine.SceneManagement;
using TMPro; // TextMeshPro for UI

public class GameManager : MonoBehaviour
{
    public static GameManager Instance;

    [Header("Game State")]
    public bool IsPlaying = false;
    public bool IsGameOver = false;
    public float GameSpeed = 3f;
    public float SpeedMultiplier = 0.1f; // Speed increase per second (optional)

    [Header("Score")]
    public int Score = 0;
    public int HighScore = 0;

    [Header("UI References")]
    public GameObject StartScreen;
    public GameObject GameOverScreen;
    public GameObject HUD;
    public TextMeshProUGUI ScoreText;
    public TextMeshProUGUI FinalScoreText;

    private void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
        }
        else
        {
            Destroy(gameObject);
        }
    }

    private void Start()
    {
        ShowStartScreen();
    }

    private void Update()
    {
        if (IsPlaying)
        {
            // Optional: Increase difficulty over time
            // GameSpeed += SpeedMultiplier * Time.deltaTime;
        }
    }

    public void StartGame()
    {
        IsPlaying = true;
        IsGameOver = false;
        Score = 0;
        UpdateScoreUI();

        StartScreen.SetActive(false);
        GameOverScreen.SetActive(false);
        HUD.SetActive(true);

        // Notify other systems if needed
    }

    public void GameOver()
    {
        if (IsGameOver) return;

        IsPlaying = false;
        IsGameOver = true;

        HUD.SetActive(false);
        GameOverScreen.SetActive(true);
        FinalScoreText.text = "Score: " + Score.ToString();

        // Save High Score logic here
    }

    public void AddScore(int amount)
    {
        Score += amount;
        UpdateScoreUI();
    }

    private void UpdateScoreUI()
    {
        if (ScoreText != null)
            ScoreText.text = Score.ToString();
    }

    public void RestartGame()
    {
        SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex);
    }
}
