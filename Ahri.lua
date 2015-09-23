--Declaration:This is Cloud Script.

if GetObjectName(myHero) ~= "Braum" then return end
-- Here we print chat. 
PrintChat(string.format("<font color='#4682B4'>[Ahri]</font><font color='#FFFFFF'> Loaded</font>"))
PrintChat(string.format("<font color='#FFFFFF'> Do good and make sure you upload results!</font>"))
PrintChat(string.format("<font color='#FFFFFF'> Make sure you select your combo from shift menu.</font>"))
PrintChat(string.format("<font color='#FFFFFF'> Combo 1 = IsCharmed combo will only use spells if the enemy has charm.</font>"))
PrintChat(string.format("<font color='#FFFFFF'> Combo 2 = Fast Combo QWER R no logic.</font>"))
PrintChat(string.format("<font color='#FFFFFF'> Combo 3 = Fast Combo [Recommended] QWER R with HP logic.</font>"))
PrintChat(string.format("<font color='#FFFFFF'> IF YOU HAVE <font color='#FF0000'>RED</font> CIRCLES [DRAWINGS] THEN RELOAD ASAP</font>"))

target = GetCurrentTarget()
mymouse = GetMousePos()

AhriMenu = Menu("Ahri", "Ahri")  --This is the main menu of the scripts

AhriMenu:SubMenu("LaneClear", "LaneClear/JungleClear") --Line 24-25 is SubMenu within Ahri
AhriMenu:SubMenu("Combo", "Combo")
AhriMenu:SubMenu("KS", "KS Options")
AhriMenu:SubMenu("Misc", "Misc")
AhriMenu:SubMenu("Combo", "Combo")
AhriMenu:SubMenu("Drawings", "Drawings")

AhriMenu.LaneClear:Boolean("LQ", "Use Q Laneclear", true)
AhriMenu.LaneClear:Boolean("LW", "Use W Laneclear", true)
AhriMenu.LaneClear:Boolean("JQ", "Use Q JungleClear", true)
AhriMenu.LaneClear:Boolean("JW", "Use W JungleClear", true)
AhriMenu.LaneClear:Boolean("JE", "Use E JungleClear", true)

AhriMenu.Misc:Boolean("F", "Use Q to LastHit Minions", false)
AhriMenu.Misc:Boolean("KsQ", "Use Q to KS", true)
AhriMenu.Misc:Boolean("KsE", "Use E to KS", true)
AhriMenu.Misc:Boolean("KsW", "Use W to KS", true)
AhriMenu.Misc:Boolean("IS", "Interrupter", true)
AhriMenu.Misc:Boolean("Zhongya", "Use Zhongya", false)
AhriMenu.Misc:Boolean("Level1", "Auto Level", false)

AhriMenu.Combo:Boolean("HQ", "Use H-Q", true)
AhriMenu.Combo:Boolean("HE", "Use H-E", true)
AhriMenu.Combo:Boolean("HW", "Use H-W", true)
AhriMenu.Combo:Boolean("Co2", "Combo 2", true)
AhriMenu.Combo:Boolean("Co3", "Combo 3", false)
AhriMenu.Combo:Boolean("Co", "Combo 1", false)
AhriMenu.Combo:Boolean("Q", "Use Q", true)
AhriMenu.Combo:Boolean("W", "Use W", true)
AhriMenu.Combo:Boolean("E", "Use E", true)
AhriMenu.Combo:Boolean("R", "Use R", true)

AhriMenu.Drawings:Boolean("DrawQ", "Draw Q", true) --Leeched drawings for deftsu
AhriMenu.Drawings:Boolean("DrawW", "Draw W", true)
AhriMenu.Drawings:Boolean("DrawE", "Draw E", true)
AhriMenu.Drawings:Boolean("DrawR", "Draw R", true)
AhriMenu.Drawings:Slider("QC", "Quality circles", 255, 1, 255, 1)
AhriMenu.Drawings:Boolean("DrawDMG", "Draw DMG", true)
end

OnLoop(function(myHero)
    if IOW:Mode() == "Combo" then

local QPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),1100,250,880,75,false,true) --Getting Prediction for Q as it is a skillshot.
local WPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),1700,250,550,50,true,true)
local EPred = GetPredictionForPlayer(GetMyHeroPos(),unit,GetMoveSpeed(unit),1200,250,GetCastRange(myHero,_E),60,true,true)

	if CanUseSpell(myHero, _Q) == READY and AhriMenu.Combo.Q:Value() and AhriMenu.Combo.Co and QPred.HitChance == 1 and GotBuff(unit, "AhriSeduce") == 1 and GoS:ValidTarget(target, 790)
		then CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
	end

	if CanUseSpell(myHero, _W) == READY and AhriMenu.Combo.W:Value() and AhriMenu.Combo.co and WPred.HitChance == 1 and IsInDistance(target, 550) and GoS:ValidTarget(target, 550)
		then CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
	end

	if CanUseSpell(myHero)


if AhriMenu.Misc.Level1:value()
local leveltable = {_Q, _W, _E, _Q, _Q, _R, _Q, _Q, _W, _W, _R, _W, _W, _E, _E, _R, _E, _E}
LevelSpell(leveltable[GetLevel(myHero)])
