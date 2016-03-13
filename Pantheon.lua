if GetObjectName(GetMyHero()) ~= "Pantheon" then return end

require("Inspired")

if not pcall(require, "Inspired") then
	PrintChat("This script requre Inspired Library. Please download it and place it in the Common folder")
end

local version = 0.1

--AutoUpdate("/DarknessVoided/Bombified/master/Pantheon.lua)

	function hello()
		PrintChat("Panties loaded. Have a good game.")
		end
	end

--Menu--
PMenu = Menu("Pantheon, "Pantheon")

PMenu = SubMenu("Combo", "Combo")
PMenu.Combo:Boolean("Q", "Use Q", true)
PMenu.Combo:Boolean("W", "Use W", true)
PMenu.Combo:Boolean("E", "Use E", true)

PMenu = SubMenu("Harass", "Harass")
PMenu.Harass:Boolean("Q", "Use Q", true)
PMenu.Harass:Boolean("TQ", "Don't use Q under turret", true)
PMenu.Harass:Slider("ManaQ", "Stop Q when mana below", 0, 0, 0, 1)

PMenu = SubMenu("LastHit", "Last Hit")
PMenu.LastHit:Boolean("Q", "Use Q", true)
PMenu.LastHit:Slider("ManaQ", "Stop using Q when mana below", 0, 0, 0, 1)

PMenu = SubMenu("LaneClear", "Lane Clear")
PMenu.LaneClear:Boolean("Q", "Use Q", false)
PMenu.LaneClear:Boolean("W", "Use W", false)
PMenu.LaneClear:Boolean("E", "Use E", false)
PMenu.LaneClear:Slider("LaneMana", "Stop using skill when mana below", 0, 100, 0, 1)

PMenu = SubMenu("KS", "KS")
PMenu.KS:Boolean("Q", "Use Q", true)
PMenu.KS:Boolean("W", "Use W", true)

PMenu = SubMenu("Items", "Items")
PMenu.Items:Boolean("Items", "Use Items in Combo", true)
PMenu.Items:Info("List", Currently supported items")
PMenu.Items:Info("Kappa", "Tiamat, Ravenous,Yomuu GhostBlade")

PMenu = SubMenu("Misc", "Misc")
PMenu.Misc:Boolean("AutoLevel", "Use AutoLevel", false)

	OnTick(function(myHero)
	local unit = GetCurrentTarget()
		if not IsDead() then
			Combo(unit)
			KS(unit)
			Item()
			Harass(unit)
		end
	end

function Combo(unit)
	if CanUseSpell(,_Q) and isAround
