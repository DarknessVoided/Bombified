local version = "0.58"

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

--Script Tracker--
LoadGOSScript(Base64Decode("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"))
GoSTracker("SadisticAmumu",37)

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
