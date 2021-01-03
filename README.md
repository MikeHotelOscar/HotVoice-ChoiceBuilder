# HotVoice-ChoiceBuilder
An add-on to EvilC's HotVoice system, that allows for multiple scripts to easily call choices from a JSON file. Find it here: https://github.com/evilC/HotVoice

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
SomeGrammar := cb.Build("directions")
```
 
To view the Choices available in a JSON, one merely needs to have created a ChoiceBuilder object, and then call List() like so:
```
cb := new ChoiceBuilder(hv, "SomeJSON.JSON")
cb.List()
```

You can add an entry to your JSON file using Add() like so:
```
cb.Add("ChoiceName", "Choices")
```

You can also remove them using Delete():
```
cb.Delete("ChoiceName")
```

## The ChoiceBuilder Class

You may have noticed that I called the ChoiceBuilder class earlier without any parameters, but it in fact accepts two in the form:
```
ChoiceBuilder(hv, settingsFile)
```
where hv is a HotVoice Object, and settingsFile is a JSON file.

This allows for the ChoiceBuilder to be used with any HotVoice Object and any JSON file you desire.

If no JsonFile is listed, a file called Setting.json will be used. No matter what, if the chosen json does not exist, it will be created, blank, and can then be used and modified to by the methods above.
