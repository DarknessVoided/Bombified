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
local Mana = (GetCurrentMana(myHero)/GetMaxMana(myHero))^100

OnLoop(function(myHero)
Combo()
Interrupt()
AutoLvL()
check()
escape()
hunted()
end)

function hunted(target)
return
GotBuff(target, "quinnw_cosmetic")
end

function escape()
local mousePos = GetMousePos()
if FleeActive.getValue() and and Bird then
MoveToXYZ(mousePos.x,mousePos.y,mousePos.z)
end
elseif CanUseSpell(myHero,_R) == READY then
CastSpell(_R)
end
end

function check()
GetCastName(myHero,_Q) == "QuinnQ" or
GetCastName(myHero,_W) == "QuinnW" or
GetCastName(myHero,_E) == "QuinnE" then
Bird = false
Human = true
elseif
GetCastName(myHero,_Q) == "QuinnValorQ" or
GetCastName(myshero,_W) == "QuinnW" or
GetCastName(myHero,_E) == "QuinnValorE" then
Bird = true
Human = false
end

function Combo()
	if ComboActive.getValue() then

			--CastStartPosVec,EnemyChampionPtr,EnemyMoveSpeed,YourSkillshotSpeed,SkillShotDelay,SkillShotRange,SkillShotWidth,MinionCollisionCheck,AddHitBox

			local QPred = GetPredictionForPlayer(GetOrigin(target),target,GetMoveSpeed(target),1550,250,GetCastRange(myHero,_Q),80,true,true)
			if CanUseSpell(myHero,_Q) and QPred.Hitchance == 1 and UseQ.getValue() and human and ValidTarget(target, 1050) and IsInDistance(target, 1050) then
					CastSkillShot(_Q, QPred.PredPos.x,QPred.PredPos.y, QPred.PredPos.z)
					end
			elseif
				if IsInDistance(target, 275) and Bird and and ValidTarget(target, 275) and CastUseSpell(myHero,_Q) then
					CastSpell(_Q)
				end
			end

				if hunted == 0 and human and CanUseSpell(myHero,_E) and ValidTarget(target, 700) and UseE.getValue() then
					CastTargetSpell(target,_E)
				end
			elseif
				if IsInDistance(target, 700) and Bird and and ValidTarget(target, 700) and CanUseSpell(myHero,_E) and UseE.getValue() then
					CastTargetSpell(target,_E)
				end
			end

			if CanUseSpell(myHero,_R) and useR.getValue() and human and GoS:EnemiesAround(myHero, 700) < 1 then
				CastSpell(_R)
			end

end

addInterrupterCallback(function(target, spellType, spell)
  --just remove spellType == GAPCLOSER_SPELLS if you want support all spell type
  if IsInDistance(target, GetCastRange(myHero,_E)) and CanUseSpell(myHero,_E) == READY then
    if GapCloser.getValue() and spellType == GAPCLOSER_SPELLS then
      CastTargetSpell(target, _E)
    end
    if Interrupt.getValue() and spellType == CHANELLING_SPELLS then
      CastTargetSpell(target, _E)
    end
  end
end)

notification("Quinn - The Cat Hunter Loaded", 5000)
