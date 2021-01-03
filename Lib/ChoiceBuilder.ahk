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
			msgbox, JSON File Does Not Exist, Creating.
			FileAppend, {}, % settingsFile
			this.jsonfile := settingsFile
			FileRead, json_str, % settingsFile
			this.choiceNames := JSON.Load(json_str)
			this.hv := hv
		}
	}
	
	Build(choiceName){
		if (!this.choiceNames.HasKey(choiceName)){
			msgbox, invalid key
			Return
		}
		tempgrammar := this.hv.NewGrammar()
		tempgrammar.AppendChoices(this.hv.NewChoices(this.choiceNames[choiceName]))
		return tempgrammar
	}
	
	List(display := ""){
		FileRead, json_str, % this.jsonfile
		JsonObject := JSON.Load(json_str)
		ListText := ""
		for key, value in JsonObject{
			ListText .= key . "`n"
		}
		if (display){
			msgbox, %ListText%
		}
		return ListText
	}
	
	Add(ChoicesName, Choices){
		FileRead, json_str, % this.jsonfile
		FileDelete, % this.jsonfile
		JsonObject := JSON.Load(json_str)
		JsonObject[ChoicesName] := Choices
		json_str := JSON.Dump(JsonObject)
		this.choiceNames := JSON.Load(json_str)
		FileAppend, %json_str%, % this.jsonfile  
	}
	
	Delete(ChoicesName){
		FileRead, json_str, % this.jsonfile
		FileDelete, % this.jsonfile
		JsonObject := JSON.Load(json_str)
		JsonObject.Delete(ChoicesName)
		json_str := JSON.Dump(JsonObject)
		this.choiceNames := JSON.Load(json_str)
		FileAppend, %json_str%, % this.jsonfile
	}
}
