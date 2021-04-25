extends Node2D

onready var Pop:Popup = find_node("Prompt")
onready var SPop:Popup = find_node("sliderPrompt")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timer = 0
var budget = 10000000
var population = 10000
var happiness = 50000
var weeks = 0
var environment = 50000

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
			if(choice == 1):
				happiness+=3
				environment-=20000
				money_drain+=100
				Pop.start("2 ducks were found dead with plastic straws in their throats")
			elif (choice == 2):
				money_drain+=500
				Pop.start("Paper Landfill buildup crushes a man")
				population -=1
			else:
				happiness-=5
				environment +=30000
				budget+=8000
				Pop.start("local moms concerned that metal straws will be used as a drug pipes")
			next_week()
		11:
			Pop.start("Currently, your city follows the same convention as your country of Themerica when it comes to grocery stores - plastic is widespread and conventionally used in packaging")
		12:
			Pop.start("However, like stores such as Baldis, GostGo, BullsEye, and Farmer Joes, you can try and remove as much plastic from your towns grocery stores as possible.")
		13:
			SPop.start("There are 17 stores, for each store reducing plastic: -$50000","reduced plastic stores","","",17)
		15:
			Pop.start("You need to reach 50,000 kWh units of energy per day.")
		16:
			SPop.start("Partition the amount of each energy (10000kwh each) you will use.", "nuclear -3mil", "fossil fuel -2mil", "hydro -1mil", 5)
		18:
			Pop.start("Currently, Oovoo Java has an illegal dumping problem with corporations who want to avoid the legal process of disposing of hazardous materials.")
		19:
			Pop.start("This hazardous waste could taint water and destroy ecosystems. However, the company has the resources to just continue to dump waste in this manner and pay fines.")
		20:
			Pop.start("Sadly, this hasn’t gotten much media coverage. What do you do?", "Enhance regulations","Accept fines +$500000")
		21:
			Game.fade()
			next_week()
			if(choice == 2):
				budget+=500000
				environment-=4000
				Pop.start("the media picks up on what you did, and the action is broadcasted across the world")
			else:
				environment+=8000
				Pop.start("companies see you cracking down on regulations, and lower their pollutants")
		22:
			Pop.start("As of right now, everyone in oovoo java likes to travel with a car - it’s fast and convenient. However, this produces a lot of emissions in the environment.")
		23:
			Pop.start("However, you have the option to build more environmentally conscious infrastructure.", "Build a railroad -$100000","Do nothing")
		24:
			Game.fade()
			next_week()
			if(choice == 1):
				environment+=4000
				budget-=100000
				get_parent().get_node("togglable3").visible = false
				yield(get_tree().create_timer(3), "timeout")
			else:
				environment-=6000
			Pop.start("Now that the railroad is built, bike riding is safer and more people bike")
		25:
			Pop.start("Currently, the people who do ride cars still emit many unnecessary greenhouse gasses")
		26:
			Pop.start("Would you like to regulate the quality of oil, raising the price but greatly lowering emissions?","Regulate gas -$100000","Dont lower")
		27:
			Game.fade()
			next_week()
			if(choice == 1):
				happiness-=3000
				budget-=100000
				environment+=10000
			else:
				happiness+=2000
				environment-=1000
			Pop.start("Sadly, the citizens of Oovoo Java have held an insurrection and booted you out! They are very displeased with your governing")
		28:
			Pop.start("Remember, the citizens resist change and don’t know very much about climate change! Try and reach a balance next time.")
		29:
			Pop.start("Oh no! Your poor management of the environment has doomed Oovoo Java. The sky is riddled with pollution, and living here is unhealthy.")
		30:
			Pop.start("Your town has contributed to drastic climate change, and ecosystems are disrupted. Many organisms are dying.")
		31:
			Pop.start("This is a very real problem that the earth is facing - with the current rates of air pollution and the release of greenhouse gasses")
		32:
			Pop.start("The earth’s climate is projected to change more dramatically in the next 50 years than it has in the last 6000.")
		33:
			Pop.start("In order to combat this, we must take many of the measures offered in this video game - to lower emissions, ")
		34:
			Pop.start("we must find cleaner methods of transportation, shipping, manufacturing, and energy production.")
		35:
			Pop.start("As it is currently, our lifestyle is not sustainable. We need to change.")
		36:
			Pop.start("Corporations must be held accountable, lobbying must end, and those who are able to make a change, the government, must listen to our voices. ")
		37:
			Pop.start("You can write to your mayor, governor, or even congress about climate change.")
		38:
			Pop.start("Our personal lifestyles must be accounted for as well. Do your best not to pollute the environment with litter, ")
		39:
			Pop.start("Try and find better sources of energy, bike more, use public transportation - there are so many methods to reduce our negative impact on the environment!")
		40:
			Pop.start("Plus, we have gotten to a point where we as humans NEED to change, and do so quickly.")
		41:
			Pop.start("After all, it’d be great to see a future on this planet.")
		42:
			Pop.start("Thanks for playing our game!")
		43:
			Game.emit_signal("ChangeScene", 'res://MainMenu/MainMenu.tscn')
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
			get_parent().get_node("togglable").visible = true
			yield(get_tree().create_timer(3), "timeout")
			Pop.start("You built a cattle ranch, a sythetic meat lab, and a granary. "+s)
		14:
			budget -= a1*50000
			Game.fade()
			next_week()
			if(a1>=20):
				Pop.start("many stores reduced their plastic usage, ducks and other aquatic life parade in the streets")
			elif(a1==0):
				Pop.start("no stores reduced plastic, families of ducks show up in protest")
			else:
				Pop.start("some stores reduced their plastic usage")
		17:
			budget -= 3000000*a1 + 2000000*a2 + 1000000*a3
			happiness -=6000*a1+2000*a2-1000*a3
			environment += 10000*a1 -35000*a2-40000*a3
			Game.fade()
			next_week()
			get_parent().get_node("togglable2").visible = true
			yield(get_tree().create_timer(3), "timeout")
			Pop.start("Deforestation and the damming of lakes for hydro power causes intesnse ecological trauma")
	update_hud()
