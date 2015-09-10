require("Inspired")
require("IsFacing")

 
Tryndamere = Menu("Tryndamere", "Tryndamere") --My Menu
 
Tryndamere:SubMenu("c", "Combo")
Tryndamere.c:Boolean("Q", "Use Q", true)
Tryndamere.c:Slider("QT", " Q Health", 30, 1, 100, 1)
Tryndamere.c:Boolean("W", "Use W", true)
Tryndamere.c:Slider("WO", " W when enemy from Range", 350, 1, 400, 1)
Tryndamere.c:Boolean("R", "Use R", true)
Tryndamere.c:Slider("RP", " R Health", 10, 1, 100, 1)

OnLoop(function(myHero)) --Standard start
local target = GetCurrentTarget() --Finds the target
 
--Cast Q
 
	if CanUseSpell(myHero,_Q) == READY and Tryndamere.c.Q:Value() and (GetCurrentHP(myHero)/GetMaxHP(myHero))*100 <= Tryndamere.c.QT:Value() and GoS:ValidTarget(target, "1000")
		then CastSpell(_Q)
end
 
--Cast W
	if CanUseSpell(myHero,_W) == READY and Tryndamere.c.W.value() and not IsFacing(target, Tryndamere.c.WO.Value()) and GoS:ValidTarget(target, "400")
		then CastSpell(_W)
end
 
--Cast R
	if CanUseSpell(myHero,_R) == READY and Tryndamere.c.W:Value() and (GetCurrentHP(myHero)/GetMaxHP(myHero))*100 <= Tryndamere.c.RP:Value() and GoS:ValidTarget(target, "1000")
		then CastSpell(_R)
end

PrintChat("Thanks to Cloud,Noddy,Foxy,Maxxel and D3ftsu and I")

end) -- Ends the OnLoop
