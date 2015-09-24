require("Inspired")

MainMenu = Menu("Furgot", "Urgot")

Urgot:SubMenu("Combo", "Combo")
Urgot:SubMenu("Mana", "Mana Manager")

Urgot.Combo:Boolean("Q", "Use Q", true)
Urgot.Combo:Boolean("W", "Use W", true)
Urgot.Combo:Boolean("E", "Use E", true)
Urgot.Combo:Key("Combo1", "Combo", string.byte(" "))

Urgot.Mana:Slider("ManaQ", "Q stop at %", 30, 0, 100, 1)
Urgot.Mana:Slider("ManaW", "W stop at %", 30, 0, 100, 1)
Urgot.Mana:Slider("ManaE", "Stop casting E at % mana", 30, 0, 100, 1)



OnLoop (function (myHero)
local target = GetCurrentTarget()
local myHeroPos = GetOrigin(myHero)

--Items / Stole from Noddy ezreal kek
local sheen = GetItemSlot(myHero,3057)
local trinity = GetItemSlot(myHero,3078)
local Murumana = GetItemSlot(myhero,3042)

--Items Usage

--Checks for Q Range
if GotBuff(target, ) == 1 then
	extraRange = 200
	collision = false
else
	extraRange = 0
	collision = true
end

--Use Q
local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1800,250,1050+extraRange,80,collision,true)

if CanUseSpell(myHero,_Q) == READY and GoS:ValidTarget(target,1000+extraRange) and Urgot.Combo.Q:Value() and Urgot.Combo.Combo1:Value() and if QPred.HitChance == 1 then
CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,Qpred.PredPos.z)
	end
end

--Use W

if CanUseSpell(myHero,_W) == READY and Urgot.Combo.W:Value() and Urgot.Combo.Combo1:Value() and GoS:ValidTarget(target, 1000)
then CastSpell(_W)
	end
end

--Use E
local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,875,1100,250,false,true)

if CanUseSpell(myHero,_E) == READY and Urgot.Combo.Combo1:Value() and Urgot.Combo.E:Value() and GoS:ValidTarget(target, idklatermecheck) and if EPred.HitChance == 1
then CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
	end
end
end) --Ends OnLoop@Line19
PrintChat("Thanks Noddy for Q logic ._. ")
PrintChat("Standard Credits : Deftsu, Inspired")