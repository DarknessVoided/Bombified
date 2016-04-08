local version = 0.02

------------Callback-------------
OnCreateObj(object)
	if GetObjectBaseName(Object) == "Despair_buf.troy" then
		WActive = true
	end
end

OnDeleteObj(object)
	if GetObjectBaseName(Object) == "Despair_buf.troy" then
		WActive = false
	end
end
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
Sad.LanClear:Boolean("W", "Use W to laneclear", true)
Sad.LaneClear:Boolean("E", "Use E to laneclear", true)

Sad:Menu("Prediction", "Prediction")
Sad.Prediction:Slider("Q", "Q Hit-Chance", 25, 1, 100, 1, function() UpdateHitChance() end)

local QData = Spells(_Q, 0.25, 2000, 80, 1100, true, 1, false, "linear", "Amumu Q", Sad.Prediction.Q:Value())

function UpdateHitChance()
    QData:GetHitChance(Sad.Prediction.Q:Value())
end

OnTick(function(myHero)
		Combo()
		laneclear()
end)

function Combo()
local target = GetCurrentTarget()
	if ValidTarget(target, 1100) and Sad.Combo.Q:Value() and isReady(_Q) and target ~= nil then
		QData:Cast1(target)
	end
	
	if isReady(_R) and EnemiesAround(myHero, 560) >= Sad.Combo.RM:Value() and Sad.Combo.R:Value() then
		CastSpell(_R)
	end
	
	if ValidTarget(target, 300) and isReady(_W) and WActive == false and Sad.Combo.W:Value() then
		CastSpell(_W)
	end
	
	if EnemiesAround(myHero, 300) = 0 and isReady(_W) and Sad.Combo.W:Value() and WActive == true then
		CastSpell(_W)
	end
end

function laneclear()
end

function KillSteal()
local EDmg = 25*(GetCastLevel(myHero, _E))+50
end