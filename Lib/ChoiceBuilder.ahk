#include Lib\JSON.ahk

class ChoiceBuilder {

	__New(hv, settingsFile := "Setting.json"){
		if FileExist(settingsFile){
			this.jsonfile := settingsFile
			FileRead, json_str, % settingsFile
			this.choiceNames := JSON.Load(json_str)
			this.hv := hv
		}
		else{
			msgbox, JSON File Does Not Exist
		}
	}
	
	Build(choiceName){
		if (!this.choiceNames.HasKey(choiceName)){
			Return
		}
		return this.hv.NewChoices(this.choiceNames[choiceName])
	}
	
	List(){
		FileRead, json_str, % this.jsonfile
		JsonObject := JSON.Load(json_str)
		ListText := ""
		for key, value in JsonObject{
			ListText .= key . "`n"
		}
		msgbox, %ListText%
	}
}
