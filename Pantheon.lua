--[[1)Harass Mana Manager is not implemented.
    2)KS is not done yet.
    3)Items is not done yet.
    4)Most of it is broken.
]]--

if GetObjectName(GetMyHero()) ~= "Pantheon" then return end

require("Inspired")

if not pcall(require, "Inspired") then
	PrintChat("This script requre Inspired Library. Please download it and place it in the Common folder")
end

local version = 0.1

function AutoUpdate(data)
    if tonumber(data) > tonumber(version) then
        PrintChat("New version found! " .. data)
        PrintChat("Downloading update, please wait...")
        DownloadFileAsync("https://raw.githubusercontent.com/DarknessVoided/Bombified/master/Pantheon.lua", SCRIPT_PATH .. "Pantheon.lua", function() PrintChat("Update Completed, please 2x F6!") return end)
    else
        PrintChat("No updates found!")
    end
end

GetWebResultAsync("https://raw.githubusercontent.com/DarknessVoided/Bombified/master/Pantheon.version", AutoUpdate)


PrintChat("Panties loaded. Have a good game.")


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
	local pI = GetConicAOEPrediction(unit, E)
		if not IsDead(unit) then
			Combo(unit)
			KS(unit)
			Item()
			Harass(unit)
		end
	end

--CallBacks
OnUpdateBuff(function(unit,buffProc)
	if unit == GetCurrentTarget() then
		if buffProc.Type == 5 then
			CC = true
		elseif buffProc.Type == 8 then
			CC = true
		elseif buffProc.Type == 10 then
			CC = true
		end
	end
end)

function Combo(unit)
	if IOW:Mode() == "Combo" then
		if Ready(_Q) and ValidTarget(unit, 600) and PMenu.Harass.Q:Value() then
			CastTargetSpell(unit, _Q)
		end

		if Ready(_W) and ValidTarget(unit, 600) and PMenu.Harass.W:Value() and if not CC then
			CastTargetSpell(unit, _W)
		end

		if pI and pI.hitChance >= 0.25 and PMenu.Harass.E:Value() then
			CastSkillShot(_E, pI.castPos)
		end
	end
end

function Harass(unit)
	if IOW:Mode() == "Harass" then
		if Ready(_Q) and ValidTarget(unit, 600) and PMenu.Harass.Q:Value() then
			CastTargetSpell(unit, _Q)
		elseif Ready(_Q) and ValudTarget(unit, 600) and PMenu.Harass.Q:Value() and PMenu.Harass.TQ:Value() and if not UnderTurret(unit, enemyTurret) then
			CastTargetSpell(unit, _Q)
		end
	end
end

--25+40(n)
fuction KS(unit)
	local QDamage = CalcDamage(myHero,target,(25+40*(GetCastLevel(myHero, _Q))
	for i,enemy in pairs(GetEnemyHeroes()) do
		if Ready(_Q) and PMenu.KS.Q:Value() and GetCurrentHP(enemy) < QDamage
