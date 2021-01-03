# HotVoice-ChoiceBuilder
An add-on to EvilC's HotVoice system, that allows for multiple scripts to easily call choices from a JSON file. Original here: https://github.com/evilC/HotVoice

Installation is simple, drop JSON.ahk and ChoiceBuilder.ahk into your HotVoice script's Lib folder alongside HotVoice.ahk and HotVoice.dll

## Use

To use the ChoiceBuilder, you simply need to create a JSON file with the options that you desire, for example in Setting.JSON:
```
{
  "directions": "up, down, left, right",
  "colours": "red, blue, green", 
}
```

Then, to call the choices, you only need to do this:
```
cb := new ChoiceBuilder(hv)
cb.Build("directions")
```

You can then use hv.GetChoices() to assign it to a choices object like so:
```
DirectionChoices := hv.GetChoices("directions")
```

To view the Choices available in a JSON, one merely needs to have created a ChoiceBuilder object, and then call List() like so:
```
cb := new ChoiceBuilder(hv, "SomeJSON.JSON")
cb.List()
```

## The ChoiceBuilder Class

You may have noticed that I called the ChoiceBuilder class earlier without any parameters, but it in fact accepts two in the form:
```
ChoiceBuilder(hv, settingsFile := "Setting.json")
```
This allows for the ChoiceBuilder to be used with any HotVoice Object and any JSON file you desire.
