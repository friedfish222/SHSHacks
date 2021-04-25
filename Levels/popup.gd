extends Node2D

onready var Pop:Popup = find_node("Prompt")
onready var SPop:Popup = find_node("sliderPrompt")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timer = 0
var budget = 10000000
var population = 10000
var happiness = 10000
var weeks = 0
var environment = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().get_node("togglable").visible = false
	Pop.start("We at Java welcome you as the new city planner!")
	update_hud()

func update_hud():
	Hud.set_budget(budget)
	Hud.set_population(population)
	Hud.set_happiness(happiness)
	Hud.set_weeks(weeks)

var stage = 0


func _on_Prompt_answer(choice):
	stage +=1
	match stage:
		1:
			Pop.start("Congratulations on being randomly selected to become City Planner of Oovoo Java for a term~!")
		2:
			Pop.start("Oovoo Java is a city where the citizens are comfortable, resistant to change, and not very environmentally conscious. However, you can change that!")
		3:
			Pop.start("Your goal is to keep your citizens happy, use less budget than the previous city manager, and emit less pollution than the previous city manager")
		4:
			Pop.start("The indicators show you how well you are doing relative to the previous city manager. Good luck with your term!")
		5:
			SPop.start("Buy 200k units of each food", "Livestock 5$", "Synthetic Meat $10", "Vegtables and Grains $3",200000)


func _on_sliderPrompt_answer(a1, a2, a3):
	stage += 1
	match stage:
		6:
			Game.fade()
			budget -= a1*5 + a2*10 + a3*3
			weeks += 1
			if(a1>=a2 and a1>=a3):
				happiness+=5
				environment-=4
			if(a2>=a1 and a2>=a3):
				happiness-=1
				environment+=2
			if(a3>=a1 and a3>=a2):
				happiness+=1
				environment-=2
			
			get_parent().get_node("togglable").visible = true
			Pop.start("You built a cattle ranch, a sythetic meat lab, and a granary")
	update_hud()
