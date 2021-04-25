extends Popup

signal answer(a1, a2, a3)

export var prompt:String = "prompt"
export var ans1:String = "ans1"
export var ans2:String = "ans2"
export var ans3:String = "ans3"

var a1 = 0
var a2 = 0
var a3 = 0
var budget = 200000

func _ready()->void:
	popup_exclusive = true
	connect("about_to_show", self, "init")
	#Localization
	SettingsLanguage.connect("ReTranslate", self, "retranslate")
	retranslate()


func start(p, a1="next", a2="", a3="",ezfrag=0):
	prompt = p
	ans1 = tr(a1)
	ans2 = tr(a2)
	ans3 = tr(a3)
	budget = ezfrag
	
	update_max()
	popup()

func init()->void:
	retranslate()

#Localization
func retranslate()->void:
	find_node("ans1").visible = !ans1 == ""
	find_node("ans2").visible = !ans2 == ""
	find_node("ans3").visible = !ans3 == ""
	find_node("ans1").get_node("ScaleName").text = tr(ans1) + ": 0"
	find_node("ans2").get_node("ScaleName").text = tr(ans2) + ": 0"
	find_node("ans3").get_node("ScaleName").text = tr(ans3) + ": 0"
	find_node("Message").text = tr(prompt)


func _on_ans1_value_changed(value):
	a1 =value
	find_node("ans1").get_node("ScaleName").text = ans1+ ": " + str(a1)
	find_node("ans2").get_node("HSlider").max_value = budget-a1-a3
	find_node("ans3").get_node("HSlider").max_value = budget-a1-a2

func _on_ans2_value_changed(value):
	a2 = value
	find_node("ans2").get_node("ScaleName").text = ans2+ ": " + str(a2)
	find_node("ans1").get_node("HSlider").max_value = budget-a2-a3
	find_node("ans3").get_node("HSlider").max_value = budget-a1-a2

func _on_ans3_value_changed(value):
	a3 = value
	find_node("ans3").get_node("ScaleName").text = ans3+ ": " + str(a3)
	find_node("ans1").get_node("HSlider").max_value = budget-a2-a3
	find_node("ans2").get_node("HSlider").max_value = budget-a1-a3

func update_max():
	find_node("ans1").get_node("HSlider").value = 0
	find_node("ans2").get_node("HSlider").value = 0
	find_node("ans3").get_node("HSlider").value = 0

	find_node("ans1").get_node("HSlider").max_value = budget
	find_node("ans2").get_node("HSlider").max_value = budget
	find_node("ans3").get_node("HSlider").max_value = budget
	find_node("ans1").get_node("HSlider").min_value = 0
	find_node("ans2").get_node("HSlider").min_value = 0
	find_node("ans3").get_node("HSlider").min_value = 0


func _on_DefaultButton_pressed():
	if a1+a2+a3>budget:
		find_node("DefaultButton").text="Over Budget!"
	else:
		visible = false
		find_node("DefaultButton").text="next"
		emit_signal("answer",a1,a2,a3)
