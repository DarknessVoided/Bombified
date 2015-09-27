if GetObjectName(GetMyHero()) ~= "Urgot" then return end

require("Inspired")

Urgot = Menu("Urgot", "Urgot")

Urgot:SubMenu("Combo", "Combo")
Urgot:SubMenu("Mana", "Mana Manager")
Urgot:SubMenu("Items", "Items")

Urgot.Items:Boolean("Cutless", "Bilgewater Cutlass", true)
Urgot.Items:Boolean("botrk", "Blade of the Ruined King", true)
Urgot.Items:Boolean("Murumana", "Murumana", true)
Urgot.Items:Slider("CHP", "Use BilgeWater Cutless at % HP", 40, 0, 100, 1)
Urgot.Items:Slider("botrkHP", "Use Blade of the Ruined King at % HP", 40, 0, 100, 1)

Urgot.Combo:Boolean("Q", "Use Q", true)
Urgot.Combo:Boolean("W", "Use W", true)
Urgot.Combo:Boolean("E", "Use E", true)
Urgot.Combo:Key("Combo1", "Combo", string.byte(" "))

Urgot.Mana:Slider("ManaQ", "Stop Casting Q at % mana", 30, 0, 100, 1)
Urgot.Mana:Slider("ManaW", "Stop casting W at % mana", 30, 0, 100, 1)
Urgot.Mana:Slider("ManaE", "Stop casting E at % mana", 30, 0, 100, 1)



OnLoop (function (myHero)
	local target = GetCurrentTarget()
	local myHeroPos = GetOrigin(myHero)

--Items / Stole from Noddy ezreal kek
	local Muramana = GetItemSlot(myHero,3042)
	local Cutless = GetItemSlot(myHero,3144)
	local botrk = GetItemSlot(myHero,3153)

--Items Usage
	if Urgot.Combo.Combo1:Value() then
		if Cutless >= 1 and GoS:ValidTarget(target, 550) and Urgot.Items.Cutless:Value() and (GetCurrentHP(myHero)/GetMaxHP(myHero))*100 <= Urgot.Items.CHP:Value() then
			CastTargetSpell(target, GetItemSlot(myHero,3144))

	elseif botrk >= 1 and GoS:ValidTarget(target,550) and Urgot.Items.botrk:Value() and (GetCurrentHP(myHero)/GetMaxHP(myHero))*100 <= Urgot.Items.botrkHP:Value()
			then CastTargetSpell(target, GetItemSlot(myHero,3153))
	end
end

--When Murumana has stacked finished/Evolved Mode
--This is Noddy code/ Couldn't figure it out. Scrubs kappa
	if Urgot.Combo.Combo1:Value() then
		if GoS:ValidTarget(target,GetCastRange(myHero,_Q)) and Muramana >= 1 and GotBuff(myHero,"Muramana") == 0 then
			CastSpell(GetItemSlot(myHero,3042))
	elseif GotBuff(myHero,"Muramana") == 1 and not GoS:ValidTarget(target, 1500) then
			CastSpell(GetItemSlot(myHero,3042))
end
end
if GotBuff(myHero,"Muramana") == 1 and not GoS:ValidTarget(target, 2500) then
	CastSpell(GetItemSlot(myHero,3042))
end

--Checks for Q Range
if GotBuff(target, "urgotcorrosivedebuff") >= 1 then
	local extraRange = 200
	local collision = false
else
	local extraRange = 0
	local collision = true
end

--Use Q
local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1800,250,1000+extraRange,80,collision,true)

	if CanUseSpell(myHero,_Q) == READY and GoS:ValidTarget(target,1000+extraRange) and 100*GetCurrentMana(myHero)/GetMaxMana(myHero) >= Urgot.Mana.ManaQ:Value() and Urgot.Combo.Q:Value() and Urgot.Combo.Combo1:Value() and QPred.HitChance == 1 then
		CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,Qpred.PredPos.z)
	end

--Use W

	if CanUseSpell(myHero,_W) == READY and 100*GetCurrentMana(myHero)/GetMaxMana(myHero) >= Urgot.Mana.ManaW:Value() and Urgot.Combo.W:Value() and Urgot.Combo.Combo1:Value() and GoS:ValidTarget(target, 1000) then
		CastSpell(_W)
	end

--Use E
local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,875,1100,250,false,true)

	if CanUseSpell(myHero,_E) == READY and 100*GetCurrentMana(myHero)/GetMaxMana(myHero) >= Urgot.Mana.ManaE:Value() and Urgot.Combo.Combo1:Value() and Urgot.Combo.E:Value() and GoS:ValidTarget(target, 900) and EPred.HitChance == 1 then
		CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
	end

end) --Ends OnLoop@Line19
PrintChat("Thanks Noddy for Q logic ._. ")
PrintChat("FurGot | Version 3.141592654 Loaded")
PrintChat("Standard Credits : Deftsu, Inspired")
