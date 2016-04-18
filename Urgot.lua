local ver = 0.01

Urgot = MenuConfig("Urgot", "Urgot")

Urgot:Menu("Combo", "Combo")
Urgot.Combo:Boolean("Q", "Use Q", true)
Urgot.Combo:Boolean("W", "Use W", true)
Urgot.Combo:Boolean("E", "Use E", true)

Urgot:Menu("Misc", "Misc")
Urgot.Misc:DropDown(idk)
Urgot.Misc:Boolean("Interrupt", "Interrupt with ultimate", true)

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
	if LoadDAC() then
		if IOW:Mode() == "Combo" then return "Combo"
      elseif IOW:Mode() == "Harass" then return "Harass"
      elseif IOW:Mode() == "LaneClear" then return "LaneClear"
      elseif IOW:Mode() == "LastHit" then return "LastHit"
     end
     
	if LoadPW() then
		if PW:Mode() == "Combo" then return "Combo"
      elseif PW:Mode() == "Harass" then return "Harass"
      elseif PW:Mode() == "LaneClear" then return "LaneClear"
      elseif PW:Mode() == "LastHit" then return "LastHit"
    end
     
	if GoSWalk.CurrentMode == 0 then return "Combo"
      elseif GoSWalk.CurrentMode == 1 then return "Harass"
      elseif GoSWalk.CurrentMode == 2 then return "LaneClear"
      elseif GoSWalk.CurrentMode == 3 then return "LastHit"
     end
end
