using UnityEngine;
using UnityEditor;
using NUnit.Framework;
using System.IO;

public class ProjectSetupTests
{
    [Test]
    public void FolderStructure_IsCorrect()
    {
        Assert.IsTrue(Directory.Exists("Assets/_Game"), "_Game folder missing");
        Assert.IsTrue(Directory.Exists("Assets/_Game/Scripts/Core"), "Core scripts folder missing");
        Assert.IsTrue(Directory.Exists("Assets/_Game/Scripts/Gameplay"), "Gameplay scripts folder missing");
    }

    [Test]
    public void Packages_AreInstalled()
    {
        string manifest = File.ReadAllText("Packages/manifest.json");
        Assert.IsTrue(manifest.Contains("com.unity.inputsystem"), "Input System not in manifest");
        Assert.IsTrue(manifest.Contains("com.unity.render-pipelines.universal"), "URP not in manifest");
    }

    [Test]
    public void Version_IsCorrect()
    {
        string version = File.ReadAllText("ProjectSettings/ProjectVersion.txt");
        Assert.IsTrue(version.Contains("2022.3"), "Wrong Unity version");
    }
}
