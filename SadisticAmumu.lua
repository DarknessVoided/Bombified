local version = "0.56"

if FileExist(COMMON_PATH.."MixLib.lua") then
 require('MixLib')
 Mix:LoadPred()
else
 PrintChat("MixLib not found. Please wait for download.")
 DownloadFileAsync("https://raw.githubusercontent.com/VTNEETS/NEET-Scripts/master/MixLib.lua", COMMON_PATH.."MixLib.lua", function() PrintChat("Downloaded MixLib, please 2x F6!") return end)
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
 
GetWebResultAsync("https://raw.githubusercontent.com/DarknessVoided/Bombified/master/SadisticAmumu.version", AutoUpdate)

PrintChat("Thanks NEET for everything!")
PrintChat("SadisticAmumu loaded!")
------------------------------

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
Sad.LaneClear:Slider("NE", "E only when minions more than", 3, 1, 5, 1)

Sad:Menu("KillSteal", "KillSteal")
Sad.KillSteal:Boolean("E", "Use E", true)
Sad.KillSteal:Boolean("R", "Use R", false)

Sad:Menu("Prediction", "Prediction")
Sad.Prediction:Slider("Q", "Q Hit-Chance", 25, 1, 100, 1, function() UpdateHitChance() end)

Sad:Menu("Misc", "Misc")
Sad.Misc:Boolean("StopW", "Stop W", true)
Sad.Misc:Boolean("RBlock", "Block R", true)
Sad.Misc:DropDown("S", "Skin Changer", 1, {"Classic", "Pharaoh", "Vancouver", "Emumu", "Re-Gifted", "Almost-Prom King", "Little Knight", "Sad Robot", "Surprised Party"}, function() AmumuSkinsChange() end)

local QData = Spells(_Q, 0.25, 2000, 80, myHero:GetSpellData(_Q).range, true, 1, false, "linear", "Amumu Q", Sad.Prediction.Q:Value()/100)
local WActive = false

function UpdateHitChance()
	QData:GetHitChance(Sad.Prediction.Q:Value()/100)
end

function AmumuSkinsChange()
	HeroSkinChanger(myHero, Sad.Misc.S:Value() - 1)
end
AmumuSkinsChange()

OnTick(function(myHero)
		Combo()
		StopW()
		Laneclear()
        KillSteal()
end)

function Combo()
local target = GetCurrentTarget()
	if Mix:Mode() == "Combo" then
		if ValidTarget(target, 1100) and Sad.Combo.Q:Value() and Ready(_Q) then
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

function Laneclear()
	if Mix:Mode() == "LaneClear" then
	    if Ready(_E) and Sad.LaneClear.W:Value() and MinionsAround(myHero.pos, 300, MINION_ENEMY) >= Sad.LaneClear.NE:Value() and Sad.LaneClear.E:Value() then
	        CastSpell(_E)
	    end
			
	    if Ready(_W) and Sad.LaneClear.W:Value() and MinionsAround(myHero.pos, 300, MINION_ENEMY) >= Sad.LaneClear.NW:Value() and WActive == false then
	        CastSpell(_W)
	    end
	end
end

function StopW()
    if not Sad.Misc.StopW:Value() then return end
    if not WActive then return end
    if Mix:Mode() == "Combo" and EnemiesAround(myHero.pos, 300) < 1 then CastSpell(_W) end
    if Mix:Mode() == "LaneClear" and MinionsAround(myHero.pos, 300, MINION_ENEMY) < 1 and MinionsAround(myHero.pos, 300, MINION_JUNGLE) < 1 then CastSpell(_W) end
    if Mix:Mode() == "NotActive" and EnemiesAround(myHero.pos, 300) < 1 and MinionsAround(myHero.pos, 300, MINION_ENEMY) < 1 and MinionsAround(myHero.pos, 300, MINION_JUNGLE) < 1 then CastSpell(_W) end
end

function KillSteal()
local EDmg = 25*GetCastLevel(myHero, _E) + 50 + myHero.ap*0.5
local RDmg = 100*GetCastLevel(myHero, _R) + 50  + myHero.ap*0.8

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

OnUpdateBuff(function(unit,buff)
	if unit == myHero and buff.Name == "despair" then
		WActive = true
	end
end)

OnRemoveBuff(function(unit,buff)
	if unit == myHero and buff.Name == "despair" then
		WActive = false
	end
end)
