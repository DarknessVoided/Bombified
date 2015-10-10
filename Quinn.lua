--Require DLIB or no shit/Shit is still in progress

if GetObjectName(myHero) ~= "Quinn" then return end

require('DLib')
require('Interrupter')

local Main = menu.addItem(SubMenu.new("Quinn - The Cat Hunter"))

local Combo = Main.addItem(SubMenu.new("Combo"))
	local useQ = Combo.addItem(MenuBool.new("Use Q",true))
	local useE = Combo.addItem(MenuBool.new("Use E",true))
	local useR = Combo.addItem(MenuBool.new("Use R",true))
	local ComboActive = Combo.addItem(MenuKeyBind.new("Combo", 32))

local Misc = Main.addItem(SubMenu.new("Misc"))
	local GapCloser = Misc.addItem(MenuBool.net("Use E against GapCloser", true))
	local Interrupt = Misc.addItem(MenuBool.net("Use E to Interrupt Spells", true))
	local AutoLvL = Misc.addItem(MenuBool.net("Auto level IN RWEQ", false))
	local FleeActive = Misc.addItem(MenuKeyBind.new("Flee using Ultimate", 0x56))

--My local Stuff
local ValidTarget = d.ValidTarget
local IsInDistance = d.IsInDistance
local Mana = (GetCurrentMana(myHero)/

OnLoop(function(myHero)
Combo()
Interrupt()
AutoLvL()
check()
end)

function check()
GetCastName(myHero,_Q) == "TakeDown" or
GetCastName(myHero,_W) == "Pounce" or
GetCastName(myHero,_E) == "Swipe" then
Bird = true
Human = false
elseif
GetCastName(myHero,_Q) == "JavelinToss" or
GetCastName(myshero,_W) == "Bushwhack" or
GetCastName(myHero,_E) == "PrimalSurge" then
Bird = false
Human = true
end

function hunted(target)
return
GotBuff(target, "quinnpassive")
end --End of function
	
function Combo()
	if KeyIsDown(32) and ValidTarget(target) then

			local QPred = GetPredictionForPlayer(GetOrigin(target),target,GetMoveSpeed(target),2000,250,GetCastRange(myHero,_Q),60,true,true)
			if QPred.Hitchance == 1 and UseQ.getValue() and human then
					CastSkillShot(_Q, QPred.PredPos.x,QPred.PredPos.y, QPred.PredPos.z)
					end
					
			local EPred = GetPredictionForPlayer(GetOrigin(target),target,GetMoveSpeed(target),2000,250,GetCastRange(myHero,_E),60,false,false)
			if EPred.Hitchance == 1 and hunted == 0 and human then
			CastSkillShot(_E, EPred.PredPos.x,EPred.PredPos.y, EPred.PredPos.z)
			end
end

addInterrupterCallback(function(target, spellType, spell)
  --just remove spellType == GAPCLOSER_SPELLS if you want support all spell type
  if IsInDistance(target, GetCastRange(myHero,_E)) and CanUseSpell(myHero,_E) == READY then
    if tamo.key:value() and spellType == GAPCLOSER_SPELLS then
      CastTargetSpell(target, _E)
    end
    if TIMO.KEY:value() and spellType == CHANELLING_SPELLS then
      CastTargetSpell(target, _E)
    end
  end
end)
