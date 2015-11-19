--[[
V1.0 - Initial Commit
V1.1 - Fixed some bugs]]--

if not pcall( require, "Inspired" ) then PrintChat("You are missing Inspired.lua - Go download it and save it in Common!") return end
if not pcall( require, "DamageLib" ) then PrintChat("You are missing DamageLib.lua - Go download it and save it in Common!") return end
if not pcall( require, "DeftLib" ) then PrintChat("You are missing DeftLib.lua - Go download it and save it in Common!") return end

AutoUpdate("/DarknessVoided/Bombified/blob/master/ButterAIO.lua","/DarknessVoided/Bombified/blob/master/ButterAIO.Version","ButterAIO.lua",1)

SupportedHero = {["Akali"] = true}
Class = "Akali"

function Akali:__init()
  OnTick(function(myHero) self:OnLoad(myHero) end)
  OnDraw(function(myHero) self:On_Draw(myHero) end)
  
    OnProcessSpellComplete(function(Object, spell)
      if Object == GetMyHero() and spell.name == "AkaliR" and Akali.Combo.W:Value() and Ready(_W) then
        CastTargetSpell(_W,GetOrigin(myHero))
      end
    end)

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
