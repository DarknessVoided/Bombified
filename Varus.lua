if GetObjectName(myHero) ~= "Varus" then return end

local function GoS:GetDistance(p1,p2)
local Origin = GetOrigin(myHero)
	p2 = p2 and p2 or Origin
	return p1:DistanceTo(p2)
end

local VarusMenu = Menu("Varus", "Varus")

VarusMenu:SubMenu("Combo", "Combo")
VarusMenu.Combo:Boolean("Q", "Use Q", true)
VarusMenu.Combo:Boolean("E", "Use E", true)
VarusMenu.Combo:Slider("RCount", "R min enemy to Hit", 1, 1, 5, 1)

VarusMenu:SubMenu("ManaManager", "Mana Manager")
VarusMenu.ManaManager:Slider("Q", "Use Q if Mana is above", 20, 0, 100, 1)
VarusMenu.ManaManager:Slider("E", "Use E if Mana is above", 20, 0, 100, 1)

VarusMenu.SubMenu("Harass", "Harass")
VarusMenu.Harass:Boolean("Q", "Use Q", true)
VarusMenu.Harass:Boolean("E", "Use E", true)

VarusMenu.SubMenu("Misc", "Misc")
VarusMenu.Misc:Boolean("KSQ", "Use Q to KS", true)
VarusMenu.Misc:Boolean("KSE", "Use E to KS", true)
VarusMenu.Misc:Boolean("AL", "Use Auto Level", false)
VarusMenu.Misc:List("Autolvltable", "Priority", 1, {"R-Q-E-W", "R-W-Q-E"})

OnLoop(function(myHero)

	if IOW:Mode() == "Combo" then
	    local QReady = CanUseSpell(myHero, _Q) == READY
		local EReady = CanUseSpell(myHero, _E) == READY
		local RReady = CanUseSpell(myHero, _R) == READY
		local MyMana = (GetCurrentMana(myHero)/GetMaxMana(myHero))*100
		local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1500,100,925,235,false,false)
		local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1950,25,1075,100,false,true)
		local target = GetCurrentTarget()

			if EREADY and GoS:ValidTarget(target, 925) and EPred.HitChance == 1 and MyMana >= VarusMenu.ManaManager.E:Value() then
			CastSkillShot(_Q,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
			end

			if RReady and GoS:ValidTarget(target, 1075) and RPred.HitChance == 1 and GoS:EnemiesAround(target, 550) = Varus.combo.Rcount:Value() then
			CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
			end

			if QReady and GoS:ValidTarget(target, 1625) and MyMana >= VarusMenu.ManaManager.Q:Value() then
			Blahblahblah
			end
		end

    elseif IOW:Mode() == "Harass" then
    	local QReady = CanUseSpell(myHero, _Q) == READY
		local EReady = CanUseSpell(myHero, _E) == READY
		local RReady = CanUseSpell(myHero, _R) == READY
		local MyMana = (GetCurrentMana(myHero)/GetMaxMana(myHero))*100
		local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1500,100,925,235,false,false)
		local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1950,25,1075,100,false,true)
		local target = GetCurrentTarget()















    elseif IOW:Mode() == "LaneClear" then
    elseif IOW:Mode() == "LastHit" then
    end

if VarusMenu.Misc.Autolvl:Value() then
   if VarusMenu.Misc.Autolvltable:Value() == 1 then leveltable = {_Q, _W, _E, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W}
   elseif VarusMenu.Misc.Autolvltable:Value() == 2 then leveltable = {_Q, _W, _E, _W, _W, _R, _W, _Q, _W, _Q, _R, _Q, _Q, _E, _E, _R, _E, _E}
   end
LevelSpell(leveltable[GetLevel(myHero)])
end
end) --Ends the OnLoop at Line 163

PrintChat("Credits to Ralphlol for Inspiring me to do Varus.")
