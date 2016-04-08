--[[
    1) AutoLevel is Broken
    2) LaneClear is not implemented.
]]--
 
if GetObjectName(GetMyHero()) ~= "Pantheon" then return end
 
require("Inspired")
 
if not pcall(require, "Inspired") then
    PrintChat("This script requre Inspired Library. Please download it and place it in the Common folder")
end

local version = 0.274
 
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
 
local Target = {3144,3153} --BligeWater and Botrk
 
local NonTargeted = {3074,3077,3053,3142} --Ravenous, Titanic hydra, Tiamat, Yomuu
 
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
    	end
end)
 
PrintChat("Panties loaded. Have a good game.")
PrintChat("Thanks TheLittleNug for testing.")
PrintChat("Thanks Sxcs for table tutorial.")
PrintChat("Huge thanks to Drei for fixing every and any errors")
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
 
--[[PMenu:Menu("LaneClear", "Lane Clear")
PMenu.LaneClear:Boolean("Q", "Use Q", false)
PMenu.LaneClear:Boolean("W", "Use W", false)
PMenu.LaneClear:Boolean("E", "Use E", false)
PMenu.LaneClear:Slider("LaneMana", "Stop using skill when mana below", 40, 1, 100, 1)
--]]
 
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
    local QDamage = QDmg()
    local pI = GetConicAOEPrediction(unit, E)
        if not IsDead(myHero) then
            Combo(unit) --Not yet
            KS() -- Done
            Item() --Not Yet
            Harass(unit) --Done
        end
end)
 
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
 
		if Ready(_W) and ValidTarget(unit, 600) and PMenu.Combo.W:Value() and not DontUseStun then
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

		elseif Ready(_Q) and ValidTarget(unit, 600) and PMenu.Harass.Q:Value() and PMenu.Harass.TQ:Value() and GetPercentMP(myHero) >= PMenu.Harass.ManaQ:Value() and not UnderTurret(unit, enemyTurret) then
			CastTargetSpell(unit, _Q)
		end
	end
end
 
function QDmg()
	if GetPercentHP(Unit) <= 15 then
    		return (CalcDamage(myHero, Unit, 25+40*GetCastLevel(myHero, _Q)+(GetBaseDamage(myHero) + GetBonusDmg(myHero))*1.40))*1.5
        else
        	return CalcDamage(myHero, Unit, 25+40*GetCastLevel(myHero, _Q)+(GetBaseDamage(myHero) + GetBonusDmg(myHero))*1.4)
        end
end
   
function KS()
	for i,enemy in pairs(GetEnemyHeroes()) do
		if Ready(_Q) and PMenu.KS.Q:Value() and ValidTarget(enemy, 600) and GetCurrentHP(enemy)+GetDmgShield(enemy) < CalcDamage(myHero, enemy, QDamage, 0) then
			CastTargetSpell(enemy, _Q)
		end

		if Ready(_W) and ValidTarget(enemy, 600) and PMenu.KS.W:Value() and GetCurrentHP(enemy)+GetMagicShield(enemy) < CalcDamage(myHero, enemy, 0, WDmg) then
			CastTargetSpell(enemy, _W)
		end
	end
end
 
function Item()
	for _,unit in pairs(GetEnemyHeroes()) do
		for i = 1,#Target do
			if isReady(GetItemSlot(myHero, Target[i])) and ValidTarget(unit, 600) then
				CastTargetSpell(unit, Target[i])
			end
		end

		for i = 1, #NonTarget do
			if IsReady(GetItemSlot(myHero, NonTarget[i])) and ValidTarget(unit, 100) then
				CastSpell(Target[i])
			end
		end
	end
end
