local version = "0.54"

------------Callback-------------
--[[OnCreateObj(function(object)
	if GetObjectBaseName(Object) == "Despair_buf.troy" then
		WActive = true
	end
end)

OnDeleteObj(object)
	if GetObjectBaseName(function(Object) == "Despair_buf.troy" then
		WActive = false
	end)
end ]]--

OnUpdateBuff(function(unit,buff)
	if unit == myHero and buff.Name == "despair" then
		WActive = true
	end
end)

OnRemoveBuff(function(unit,buff)
	if unit == myHero and buff.Name == "despair" then
		WActive = true
	end
end)
---------------------------
if FileExist(COMMON_PATH.."MixLib.lua") then
 require('MixLib')
 LoadMixLib()
else
 PrintChat("MixLib not found. Please wait for download.")
 DownloadFileAsync("https://raw.githubusercontent.com/VTNEETS/NEET-Scripts/master/MixLib.lua", COMMON_PATH.."MixLib.lua", function() PrintChat("Update Complete, please 2x F6!") return end)
end

function AutoUpdate(data)
    if tonumber(data) > tonumber(version) then
        PrintChat("New version found! " .. data)
        PrintChat("Downloading update, please wait...")
        DownloadFileAsync("https://raw.githubusercontent.com/DarknessVoided/Bombified/master/SadisticAmumu.lua", SCRIPT_PATH .. "SadisticAmumu.lua", function() PrintChat("Update Completed, please 2x F6!") return end)
    else
        PrintChat("No updates found!")
    end
end
 
GetWebResultAsync("https://raw.githubusercontent.com/DarknessVoided/Bombified/master/SadisticAmumu.lua", AutoUpdate)

PrintChat("Thanks NEET for everything!")
PrintChat("SadisticAmumu loaded!")

Sad = MenuConfig("Amumu", "Amumu")

Sad:Menu("Combo", "Combo")
Sad.Combo:Boolean("Q", "Use Q", true)
Sad.Combo:Boolean("W", "Use W", true)
Sad.Combo:Boolean("E", "Use E", true)
Sad.Combo:Boolean("R", "Use R", true)
Sad.Combo:Slider("RM", "R only when enemy more than", 3, 1, 5, 1)

Sad:Menu("LaneClear", "LaneClear")
Sad.LaneClear:Boolean("W", "Use W to laneclear", true)
Sad.LaneClear:Slider("NW", "W only when minion more than", 3, 1, 5, 1)
Sad.LaneClear:Boolean("E", "Use E to laneclear", true)
Sad.Combo:Slider("NE", "E only when minions more than", 3, 1, 5, 1)

Sad:Menu("Prediction", "Prediction")
Sad.Prediction:Slider("Q", "Q Hit-Chance", 25, 1, 100, 1, function() UpdateHitChance() end)

Sad:Menu("Misc", "Misc")
Sad.Misc:Boolean("RBlock", "Block R", true)
Sad.Misc:DropDown("S", "Skin Changer", 1, {"Classic", "Pharaoh", "Vancouver", "Emumu", "Re-Gifted", "Almost-Prom King", "Little Knight", "Sad Robot", "Surprised Party", "Turn off"})

local QData = Spells(_Q, 0.25, 2000, 80, 1100, true, 1, false, "linear", "Amumu Q", Sad.Prediction.Q:Value())

function UpdateHitChance()
	QData:GetHitChance(Sad.Prediction.Q:Value())
end

OnTick(function(myHero)
		Combo()
		StopW()
		laneclear()
end)

OnDraw(function(myHero)
	if Sad.Misc.S:Value() ~= 10 then
		HeroSkinChanger(myHero, Sad.Misc.S:Value() - 1)
	elseif Sad.Misc.S:Value() == 10 then
		HeroSkinChanger(myHero, 0)
	end
end)

function Combo()
local target = GetCurrentTarget()
	if Mix:Mode() == "Combo" then
		if ValidTarget(target, 1100) and Sad.Combo.Q:Value() and Ready(_Q) and target ~= nil then
			QData:Cast1(target)
		end
		
		if Ready(_R) and EnemiesAround(myHero, 560) >= Sad.Combo.RM:Value() and Sad.Combo.R:Value() then
			CastSpell(_R)
		end
	
		if ValidTarget(target, 300) and Ready(_W) and WActive == false and Sad.Combo.W:Value() then
			CastSpell(_W)
		end
		
		if ValidTarget(target, 350) and Ready(_E) and Sad.Combo.E:Value() then
			CastSpell(_E)
		end
	end
end

function laneclear()
	if Mix:Mode() == "LaneClear" then
		for _, mob in pairs(minionManager.objects) do
			if mob ~= nil then
				if Ready(_E) and ValidTarget(mob, 350) and MinionsAround(myHero, 300) >= Sad.LaneClear.NW:Value() and Sad.LaneClear.E:Value() then
					CastSpell(_E)
				end
			
				if Ready(_W) and ValidTarget(mob, 300) and MinionsAround(myHero, 300) >= Sad.LaneClear.NE:Value() and WActive == false then
					CastSpell(_W)
				end
			end
		end
	end
end

function StopW()
	if (EnemiesAround(myHero, 300) == 0 or MinionsAround(myHero, 300) == 0) and Ready(_W) and WActive == true then
		CastSpell(_W)
	end
end

function KillSteal()
local EDmg = (25*(GetCastLevel(myHero, _E))+50)+((GetBaseDMG(myHero)+GetBonusAP(myHero))*0.5)
local RDmg = (100*(GetCastLevel(myHero, _R))+50)+((GetBaseDMG(myHero)+GetBonusAP(myHero))*0.8)

	for i,enemy in pairs(GetEnemyHeroes()) do
		if Ready(_E) and Sad.KillSteal.E:Value() and ValidTarget(enemy, 350) and GetCurrentHP(enemy)+GetMagicShield(enemy) < CalcDamage(myHero, enemy, 0, EDmg) then
			CastSpell(_E)
		end
		if Ready(_R) and Sad.KillSteal.R:Value() and ValidTarget(enemy, 530) and GetCurrentHP(enemy)+GetMagicShield(enemy) < CalcDamage(myHero, enemy, 0, RDmg) then
			CastSpell(_R)
		end
	end
end

OnSpellCast(function(spell)
	if spell.spellID == _R and Sad.Misc.RBlock:Value() and EnemiesAround(myHero, 560) == 0 then
		BlockCast()
	end
end)
