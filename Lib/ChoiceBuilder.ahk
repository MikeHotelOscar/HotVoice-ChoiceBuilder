#include JSON.ahk
class ChoiceBuilder {
  __New(hv, settingsFile := "Setting.json"){
    FileRead, j, settingsFile
    this.choiceNames := JSON.Load(j)
    this.hv := hv
  }

  Build(choiceName){
    if (!this.choiceNames.HasKey(choiceName)){
      throw "Unknown Choice name " choiceName
    }
    return this.hv.NewChoices(this.choiceNames[choiceName])
  }
}
