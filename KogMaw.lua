if GetObjectName(GetMyHero()) ~= "KogMaw" then return end

require('Inspired')

local info = "Kogmaw_One_Key Reworked"
local upv = "Upvote if you like it!"
local sig = "Made by Snowbell, updated by Musti and DarknessVoided"
local ver = "Version 3.0"
local loaded = "VormitMachine Loaded"
textTable = {info,upv,sig,ver,loaded} 
PrintChat(textTable[1])
PrintChat(textTable[2])
PrintChat(textTable[3])
PrintChat(textTable[4])
PrintChat(textTable[5])

KogMawMenu = Menu("Kogmaw", "VormitMachine")

KogMawMenu:SubMenu("Combo", "Combo")
KogMawMenu:SubMenu("Mana", "Mana Manager")
KogMawMenu:SubMenu("Misc", "Misc")

KogMawMenu.Combo:Boolean("Q", "Use Q", true)
KogMawMenu.Combo:Boolean("W", "Use W", true)
KogMawMenu.Combo:Boolean("E", "Use E", true)
KogMawMenu.Combo:Boolean("R", "Use R", true)
KogMawMenu.Combo:Key("Combo1", "Combo", string.byte(" "))

KogMawMenu.Mana:Slider("Q", "Stop Q when % MP", 40, 1, 100, 1)
KogMawMenu.Mana:Slider("E", "Stop E when % MP", 40, 1, 100, 1)
KogMawMenu.Mana:Slider("R", "Stop R when % MP", 40, 1, 100, 1)

KogMawMenu.Misc:Boolean("lvl", "AutoLevel RWQE", true)
KogMawMenu.Misc:Boolean("KSQ", "KS With Q", true)
KogMawMenu.Misc:Boolean("KSE", "KS with E", true)
KogMawMenu.Misc:Boolean("KSR", "KS with R", true)

OnLoop(function(myHero)
local myHero = GetMyHero()
local target = GetCurrentTarget()
local myHeroPos = GetOrigin(myHero)
local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1650,250,1200,70,true,true)
local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1400,250,1360,120,false,true)
local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),math.huge,1200,1800,150,false,false)
local Mana = (GetCurrentMana(myHero)/GetMaxMana(myHero))*100 --This will get the mana percentage u current have
	
    if CanUseSpell(myHero,_Q) == READY and Mana >= KogMawMenu.Mana.Q:Value() and IsObjectAlive(target) and GoS:ValidTarget(target, 1200) and QPred.HitChance == 1 and KogMawMenu.Combo.Q:Value() and KogMawMenu.Combo.Combo1:Value() then
        CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
	end

	if CanUseSpell(myHero,_W) == READY and KogMawMenu.Combo.Combo1:Value() and KogMawMenu.Combo.W:Value() and GoS:ValidTarget(target, 600) then
		CastSpell(_W)
	end

	if CanUseSpell(myHero,_E) == READY and Mana >= KogMawMenu.Mana.E:Value() and KogMawMenu.Combo.E:Value() and KogMawMenu.Combo.Combo1:Value() and GoS:ValidTarget(target, 1360) and EPred.HitChance == 1 then
		CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
	end

	if CanUseSpell(myHero,_R) == READY and Mana >= KogMawMenu.Mana.R:Value() and RPred.HitChance == 1 and KogMawMenu.Combo.R:Value() and KogMawMenu.Combo.Combo1:Value() and GoS:ValidTarget(target, 1800) then
        CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
	end
KS()
end) --Ends the OnLoop
function KS()
	local target = GetCurrentTarget()
	for i,enemy in pairs(GoS:GetEnemyHeroes()) do
		local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(enemy),1650,250,1200,70,true,true)
		local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(enemy),1400,250,1360,120,false,true)
		local RPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(enemy),math.huge,1200,1800,150,false,false)
		
	if CanUseSpell(myHero,_Q) == READY and KogMawMenu.Misc.KSQ:Value() and GoS:ValidTarget(enemy, 1200) and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (50*GetCastLevel(myHero,_Q) + 30+ 0.5*(GetBonusAP(myHero)))) then
		CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
	end

	if CanUseSpell(myHero,_E) == READY and KogMawMenu.Misc.KSE:Value() and GoS:ValidTarget(enemy, 1360) and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (50*GetCastLevel(myHero,_E) + 10 + 0.7*(GetBonusAP(myHero)))) then
		CastSpell(_W)
	end

	if CanUseSpell(myHero,_R) == READY and KogMawMenu.Misc.KSR:Value() and GoS:ValidTarget(enemy, 1800) and GetCurrentHP(enemy) < GoS:CalcDamage(myHero, enemy, 0, (40*GetCastLevel(myHero,_R) + 40 + 0.5*(GetBaseDamage(myHero) + GetBonusDmg(myHero) + 0.3*(GetBonusAP(myHero)))),0) then
		CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
	end
end
end -- Ends the FunctionKS
