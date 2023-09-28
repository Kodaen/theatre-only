using System;
using System.Collections.Generic;
using extOSC;
using Ink.Runtime;
using UnityEngine;
using UnityEngine.UI;

// This is a super bare bones example of how to play and display a ink story in Unity.
public class BasicInkExample : MonoBehaviour
{
    [Header("OSC Settings")]
    public OSCTransmitter Transmitter;

    public static event Action<Story> OnCreateStory;

    private AudioSource audioSource;

    public Dictionary<string, AudioClip> audioClips =
    new Dictionary<string, AudioClip>();

    public List<AudioClip> audioClipsList;

    void Awake()
    {
        audioSource = GetComponent<AudioSource>();

        foreach (var clip in audioClipsList)
        {
            audioClips.Add(clip.name, clip);
        }

        // Remove the default message
        RemoveChildren();
        StartStory();
    }

    // Creates a new Story object with the compiled story which we can then play!
    void StartStory()
    {
        story = new Story(inkJSONAsset.text);
        if (OnCreateStory != null) OnCreateStory(story);
        RefreshView();
    }

    string[] ParseTag(string tag)
    {
        return tag.Split('|');
    }

    // This is the main function called every time the story changes. It does a few things:
    // Destroys all the old content and choices.
    // Continues over all the lines of text, then displays all the choices. If there are no choices, the story is finished!
    void RefreshView()
    {
        // Remove all the UI on screen
        RemoveChildren();

        // Read all the content until we can't continue any more
        while (story.canContinue)
        {
            // Continue gets the next line of the story
            string text = story.Continue();
            // This removes any white space from the text.
            text = text.Trim();
            // Display the text on screen!
            CreateContentView(text);
        }

        if (story.currentTags.Count > 0)
        {
            string[] tagData = story.currentTags?[0].Split(' ');
            string eventType = tagData[0];
            if (eventType == "audio")
            {
                // Assume there is just one tag per choice and the second splitted value is the file to play.
                string audioClipName = tagData[1];
                PlaySoundForChoice(audioClipName);
                Debug.Log(audioClipName);
            }
        }

        // Display all the choices, if there are any!
        if (story.currentChoices.Count > 0)
        {
            for (int i = 0; i < story.currentChoices.Count; i++)
            {
                Choice choice = story.currentChoices[i];
                Button button = CreateChoiceView(choice.text.Trim());
                // Tell the button what to do when we press it
                button.onClick.AddListener(delegate
                {
                    OnClickChoiceButton(choice);
                });
            }
        }
        // If we've read all the content and there's no choices, the story is finished!
        else
        {
            Button choice = CreateChoiceView("End of story.\nRestart?");
            choice.onClick.AddListener(delegate
            {
                StartStory();
            });
        }
    }

    // When we click the choice button, tell the story to choose that choice!
    void OnClickChoiceButton(Choice choice)
    {
        story.ChooseChoiceIndex(choice.index);
        RefreshView();

        // TODO: Add all 200+ tags.
        if (choice.tags == null)
        {
            return;
        }

        string[] tagData = choice.tags?[0].Split(' ');
        string eventType = tagData[0];
        if (eventType == "audio")
        {
            // Assume there is just one tag per choice and the second splitted value is the file to play.
            string audioClipName = tagData[1];
            PlaySoundForChoice(audioClipName);
        }
        else if (eventType == "DMX")
        {
            string channel = tagData[1];
            int brightness = int.Parse(tagData[2]);
            SendDMXMessage(channel, brightness);

            if (!string.IsNullOrWhiteSpace(choice.tags[1]))
            {
                // More than one tag per choice when we need to send messages to two light bulbs (and maybe the fog machine? TODO:).
                // TODO: Test with the DMX setup.
                string[] tagData2 = choice.tags?[1].Split(' ');
                string channel2 = tagData2[1];
                int brightness2 = int.Parse(tagData2[2]);

                // blink should be set to true, skip value check
                // not possible to have optional parameters but we should only blink once at the end.
                bool blink = tagData2.Length == 4;
                if (blink)
                {
                    // TODO: Test if 30 is too much / not enough.
                    // TODO: Replace DMX with audio at the begining after test.
                    for (int i = 0; i < 30; i++)
                    {
                        SendDMXMessage(i % 2 == 0 ? "/1" : "/3", i % 2 == 0 ? 255 : 0);
                        SendDMXMessage(i % 2 == 0 ? "/3" : "/1", i % 2 == 0 ? 0 : 255);
                    }
                }
                else
                {
                    SendDMXMessage(channel2, brightness2);
                }
            }
        }
    }

    void PlaySoundForChoice(string audioClipName)
    {
        //Ensure voices don't overlap if the player decides to click before previous voice line is playing.
        audioSource.Stop();

        AudioClip value = null;
        if (audioClips.TryGetValue(audioClipName, out value))
        {
            audioSource.PlayOneShot(audioClips[audioClipName]);
        }
        else
        {
            Debug.Log("Audio clip with Key = \"" + audioClipName + "\" is not found.");
        }
    }

    void SendDMXMessage(string channel, int brightness)
    {
        var message = new OSCMessage(channel);
        message.AddValue(OSCValue.Int(brightness));

        Transmitter.Send(message);
    }

    // Creates a textbox showing the the line of text
    void CreateContentView(string text)
    {
        Text storyText = Instantiate(textPrefab) as Text;
        storyText.text = text;
        storyText.transform.SetParent(canvas.transform, false);
    }

    // Creates a button showing the choice text
    Button CreateChoiceView(string text)
    {
        // Creates the button from a prefab
        Button choice = Instantiate(buttonPrefab) as Button;
        choice.transform.SetParent(canvas.transform, false);

        // Gets the text from the button prefab
        Text choiceText = choice.GetComponentInChildren<Text>();
        choiceText.text = text;

        // Make the button expand to fit the text
        HorizontalLayoutGroup layoutGroup = choice.GetComponent<HorizontalLayoutGroup>();
        layoutGroup.childForceExpandHeight = false;

        return choice;
    }

    // Destroys all the children of this gameobject (all the UI)
    void RemoveChildren()
    {
        int childCount = canvas.transform.childCount;
        for (int i = childCount - 1; i >= 0; --i)
        {
            Destroy(canvas.transform.GetChild(i).gameObject);
        }
    }

    [SerializeField]
    private TextAsset inkJSONAsset = null;
    public Story story;

    [SerializeField]
    private Canvas canvas = null;

    // UI Prefabs
    [SerializeField]
    private Text textPrefab = null;
    [SerializeField]
    private Button buttonPrefab = null;
}
