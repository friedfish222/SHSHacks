extends Popup

signal answer(choice)

var NewEvent:InputEvent
export var prompt:String = "prompt"
export var ans1:String = "ans1"
export var ans2:String = "ans2"
export var ans3:String = "ans3"


func _ready()->void:
	popup_exclusive = true
	connect("about_to_show", self, "init")
	#Localization
	SettingsLanguage.connect("ReTranslate", self, "retranslate")
	retranslate()


func start(p, a1="next", a2="", a3=""):
	prompt = p
	ans1 = a1
	ans2 = a2
	ans3 = a3
	popup()

func init()->void:
	retranslate()

#Localization
func retranslate()->void:
	find_node("ans1").visible = !ans1 == ""
	find_node("ans2").visible = !ans2 == ""
	find_node("ans3").visible = !ans3 == ""
	find_node("ans1").text = tr(ans1)
	find_node("ans2").text = tr(ans2)
	find_node("ans3").text = tr(ans3)
	find_node("Message").text = tr(prompt)

func _on_ans3_pressed():
	visible = false
	emit_signal("answer",3)

func _on_ans2_pressed():
	visible = false
	emit_signal("answer",2)

func _on_ans1_pressed():
	visible = false
	emit_signal("answer",1)
