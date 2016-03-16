--[[ 1)Harass Mana Manager is not implemented.
    2)KS is not done yet.
    3)Items is not done yet.
    4)Most of it is broken.
]]--

if GetObjectName(GetMyHero()) ~= "Pantheon" then return end

require("Inspired")

if not pcall(require, "Inspired") then
	PrintChat("This script requre Inspired Library. Please download it and place it in the Common folder")
end

local version = 0.232

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

local items = {
		["3074"] = "Ravenous",
		["3077"] = "Tiamat",
		["3142"] = "Yomuu",
		["3144"] = "BligeWater",
		["3153"] = "Botrk",
		["3053"] = "TitanicHydra"
}

CHANELLING_SPELLS = {
    ["Caitlyn"]                     = {_R},
    ["Katarina"]                    = {_R},
    ["MasterYi"]                    = {_W},
    ["FiddleSticks"]                = {_W, _R},
    ["Galio"]                       = {_R},
    ["Lucian"]                      = {_R},
    ["MissFortune"]                 = {_R},
    ["VelKoz"]                      = {_R},
    ["Nunu"]                        = {_R},
    ["Shen"]                        = {_R},
    ["Karthus"]                     = {_R},
    ["Malzahar"]                    = {_R},
    ["Pantheon"]                    = {_R},
    ["Warwick"]                     = {_R},
    ["Xerath"]                      = {_R},
    ["Tristana"]                    = {_W},
    ["Vi"]                          = {_Q}
}

local unitChanellingSpells = CHANELLING_SPELLS[GetObjectName(unit)]
local playerTeam = GetTeam(GetMyHero())
	OnProcessSpell(function(unit, spell)
		if not unit or GetObjectType(unit) ~= Obj_AI_Hero  or GetTeam(unit) == playerTeam then return end
  
    if unitChanellingSpells then
            for _, spellSlot in pairs(unitChanellingSpells) do
                if PMenu.Misc.I:Value() and spell.name == GetCastName(unit, spellSlot) and ValidTarget(unit, 600) then
                	CastTargetSpell(unit, _W)
                end
            end
    end
end)

PrintChat("Panties loaded. Have a good game.")

--Menu--
PMenu = Menu("Pantheon", "Pantheon")

PMenu:Menu("Combo", "Combo")
PMenu.Combo:Boolean("Q", "Use Q", true)
PMenu.Combo:Boolean("W", "Use W", true)
PMenu.Combo:Boolean("E", "Use E", true)

PMenu:Menu("Harass", "Harass")
PMenu.Harass:Boolean("Q", "Use Q", true)
PMenu.Harass:Boolean("TQ", "Don't use Q under turret", true)
PMenu.Harass:Slider("ManaQ", "Stop Q when mana below", 40, 1, 100, 1)

PMenu:Menu("LastHit", "Last Hit")
PMenu.LastHit:Boolean("Q", "Use Q", true)
PMenu.LastHit:Slider("ManaQ", "Stop using Q when mana below", 40, 1, 100, 1)

PMenu:Menu("LaneClear", "Lane Clear")
PMenu.LaneClear:Boolean("Q", "Use Q", false)
PMenu.LaneClear:Boolean("W", "Use W", false)
PMenu.LaneClear:Boolean("E", "Use E", false)
PMenu.LaneClear:Slider("LaneMana", "Stop using skill when mana below", 40, 1, 100, 1)

PMenu:Menu("KS", "KS")
PMenu.KS:Boolean("Q", "Use Q", true)
PMenu.KS:Boolean("W", "Use W", true)

PMenu:Menu("Items", "Items")
PMenu.Items:Boolean("Items", "Use Items in Combo", true)
PMenu.Items:Info("List", "Currently supported items")
PMenu.Items:Info("Kappa", "Tiamat, Ravenous,Yomuu GhostBlade")

PMenu = SubMenu("Misc", "Misc")
PMenu.Misc:Boolean("AutoLevel", "Use AutoLevel", false)
PMenu.Misc:Boolean("I", "Use W to interrupt", true)

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
	if unit == GetCurrentTarget() and (buffProc.Type == 5 or buffProc.Type == 8 or buffProc.Type == 10) then
		DontUseStun = true
	end
end)

function Combo(unit)
	if IOW:Mode() == "Combo" then
		if Ready(_Q) and ValidTarget(unit, 600) and PMenu.Combo.Q:Value() then
			CastTargetSpell(unit, _Q)
		end

		if Ready(_W) and ValidTarget(unit, 600) and PMenu.Combo.W:Value() and if not CC then
			CastTargetSpell(unit, _W)
		end

		if pI and pI.hitChance >= 0.25 and PMenu.Combo.E:Value() then
			CastSkillShot(_E, pI.castPos)
		end
	end
end

function Harass(unit)
	if IOW:Mode() == "Harass" then
		if Ready(_Q) and ValidTarget(unit, 600) and PMenu.Harass.Q:Value() and GetPercentMP(myHero) >= PMenu.Harass.ManaQ:Value()then
			CastTargetSpell(unit, _Q)
		elseif Ready(_Q) and ValidTarget(unit, 600) and PMenu.Harass.Q:Value() and PMenu.Harass.TQ:Value() and GetPercentMP(myHero) >= PMenu.Harass.ManaQ:Value() and if not UnderTurret(unit, enemyTurret) then
			CastTargetSpell(unit, _Q)
		end
	end
end

function QDmg()
	local base = Cal25+40*(GetCastLevel(myHero, _Q))+(1.4*(GetBonusDMG(myHero))) --Normally if Enemy Health is not below 15%

fuction KS(unit)
	for i,enemy in pairs(GetEnemyHeroes()) do
		if Ready(_Q) and PMenu.KS.Q:Value() and GetCurrentHP(enemy) < QDamage then
			CastTargetSpell(enemy, _Q)
		end
	end
end
