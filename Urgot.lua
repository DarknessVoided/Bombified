local ver = 0.01

Urgot = MenuConfig("Urgot", "Urgot")

Urgot:Menu("Combo", "Combo")
Urgot.Combo:Boolean("Q", "Use Q", true)
Urgot.Combo:Boolean("W", "Use W", true)
Urgot.Combo:Boolean("E", "Use E", true)

Urgot:Menu("Misc", "Misc")
Urgot.Misc:List(idk)
Urgot.Misc:Boolean("Interrupt",

Urgot:Menu("Predictions", "Prediction")
Urgot.Predictions:List("P", "Prediction loaded", 1, {"OpenPredict", "GoS", "iPrediction"})
Urgot.Prediction:Slider("OpenPredict", "OpenPredict HitChance", DesoWarriorAssembled)
Urgot.Prediction:Info("info1", "Every time you changed the predictions, you need to 2x F6")

Urgot:List("Orb", "Choose your Orbwalker", 1, {"Deftsu Auto Carry", "PlatyWalk", "GoSWalk"})
Urgot:Info("info2", "Do note that you need to reload the script everytime you change Orbwalker/Prediction")

if Urgot.Orb:Value() == 1 then
	LoadDAC()
elseif Urgot.Orb:Value() == 2 then
	LoadPW()
elseif Urgot.Orb:Value() == 3 then
	LoadGoSWalk()
end

function DoshRange()
	if GotBuff(target, "UrgotCorrosiveBuff") then
		QRange = 900
	else
		QRange = 1200
	end
return QRange
end

function Mode()
	