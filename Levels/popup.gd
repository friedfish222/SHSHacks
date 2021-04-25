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
var environment = 100000

var money_drain = 0

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
	Hud.set_environment(environment)

func next_week():
	budget-=money_drain
	weeks+=1

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
		7:
			Pop.start("You have been offered a contract by a paper straw company for your city to exclusively use their bio-degradable paper straws.")
		8:
			Pop.start("You have also been offered by a metal straw company to force your citizens to exclusively use reusable stainless steel straws, eliminating the output of waste altogether.")
		9:
			Pop.start("What do you choose?","stay plastic (-$100 weekly)","go paper (-$500 weekly)", "go metal (+$8000 one time)")
		10:
			Game.fade()
			next_week()
			if(choice == 1):
				happiness+=3
				environment-=20000
				money_drain-=100
				Pop.start("2 ducks were found dead with plastic straws in their throats")
			elif (choice == 2):
				money_drain-=500
				Pop.start("Paper Landfill buildup crushes a man")
				population -=1
			else:
				happiness-=5
				environment +=30000
				budget+=8000
				Pop.start("local moms concerned that metal straws will be used as a drug pipe")
				
	update_hud()


func _on_sliderPrompt_answer(a1, a2, a3):
	stage += 1
	match stage:
		6:
			Game.fade()
			budget -= a1*5 + a2*10 + a3*3
			next_week()
			var s = ""
			if(a1>=a2 and a1>=a3):
				happiness+=5
				environment-=4
				s = "cow methane releases continue to stink up the residential district"
			if(a2>=a1 and a2>=a3):
				happiness-=1
				environment+=2
				s = "citizens grumble at sythetic meat's price"
			if(a3>=a1 and a3>=a2):
				happiness+=1
				environment-=2
				s = "chicken ninjas sneak into the granary, caught after stuffing themselves"
			Pop.start("You built a cattle ranch, a sythetic meat lab, and a granary. "+s)
			get_parent().get_node("togglable").visible = true
	update_hud()
