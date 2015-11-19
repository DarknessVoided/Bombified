--[[
V1.0 - Initial Commit
V1.1 - Fixed some bugs
v1.1.1 - Added FileExist style. Cleaned up some codes]]--

DeftLib_PATH = COMMON_PATH.."DeftLib.lua"
DamageLib_PATH = COMMON_PATH.."DamageLib.lua"
Inspired_PATH = COMMON_PATH.."Inspired.lua"

	if FileExist(DeftLib_PATH) then
	require('DeftLib')
	else PrintChat("You are missing DeftLib in your Common folder - Install it") then
	return end
	
	if FileExist(DamageLib_PATH) then
	require('DamageLib')
	else PrintChat("You are missing DamageLib in your Common folder - Install it") then
	return end
	
	if FileExist(Inspired_PATH) then
	require('Inspired')
	else PrintChat("You are missing Inspired in your Common folder - Install it") then
	return end

AutoUpdate("/DarknessVoided/Bombified/blob/master/ButterAIO.lua","/DarknessVoided/Bombified/blob/master/ButterAIO.Version","ButterAIO.lua",1)

SupportedHero = {["Akali"] = true}
Class = "Akali"

function Akali:__init()
  OnTick(function(myHero) self:OnLoad(myHero) end)
  OnDraw(function(myHero) self:On_Draw(myHero) end)
  
    OnProcessSpellComplete(function(Object, spell)
      if Object == GetMyHero() and spell.name == "AkaliShadowDance" and Akali.Combo.W:Value() and Ready(_W) then
        CastTargetSpell(_W,GetOrigin(myHero))
      end
    end)

--[[OnProcessRecall(function(Object, RecallProc)
	if Onject == myHero and RecallProc.isFalse]]--
	
Akali = MenuConfig("[ButterAIO", "ButterAIO")

Akali:Menu("Combo", "Combo")
Akali:Menu("Drawings", "Drawings")
Akali:Menu("Misc", "Misc")

Akali.Combo:Boolean("Q", "Use Q", true)
Akali.Combo:Boolean("W", "Use W immediately after R", true)
Akali.Combo:Boolean("E", "Use E", true)
Akali.Combo:Boolean("R", "Use R", true)
Akali.Combo:Boolean("Dive", "Do not Dive under turret", true)

Akali.Drawings:Boolean("Q", "Show Q range", false)
Akali.Drawings;Boolean("WSpots", "Draw W Spots which gives extra range(For Escaping)", false)
Akali.Drawings:Boolean("E", "Show E range", false)
Akali.Drawings:Boolean("R", "Show R range", false)
end --Ends Init function

function Akali:OnLoad()
  self:CallCombo()
end

function self:CallCombo()
  if IOW:MODE() == "Combo" then
    self:Combo()
  end
end

function Akali:Combo()
    local target = GetCurrentTarget()
    local UnderTurret = blahblah

      if Ready(_Q) and ValidTarget(target,600) and Akali.Combo.Q:value() then
        CastTargetSpell(_Q,target)
        AttackUnit(target)
      end
      
      if Ready(_E) and ValidTarget(target,300) and Akali.Combo.E:Value() then
        CastSpell(_E)
		elseif Ready(_E) and ValidTarget(target,300) and not UnderTurret and Akali.Combo.Dive:Value() and Akali.Combo.E:value() then
				CastSpell(_E)
      end
      
      if Ready(_R) and ValidTarget(target) >= Akali.Combo.R:Value() then
        CastTargetSpell(_R,target)
      end
end

function Akali:KS()
end

Class = "Fizz"

function Fizz:__init()