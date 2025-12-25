using UnityEngine;

public class InputManager : MonoBehaviour
{
    public static InputManager Instance;

    private void Awake()
    {
        if (Instance == null) Instance = this;
        else Destroy(gameObject);
    }

    public bool FlapPressed()
    {
        // Supports Space bar, Left Click, or Touch Tap
        return Input.GetKeyDown(KeyCode.Space) || Input.GetMouseButtonDown(0);
    }

    public bool FlapHeld()
    {
        return Input.GetKey(KeyCode.Space) || Input.GetMouseButton(0);
    }

    public bool ShootPressed()
    {
        return Input.GetKeyDown(KeyCode.F);
    }

    public bool RestartPressed()
    {
        return Input.GetKeyDown(KeyCode.Space) || Input.GetMouseButtonDown(0);
    }
}
