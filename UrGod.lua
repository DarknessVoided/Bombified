{
	"scope": "source.lua - variable.other.lua",

	"completions":
	[

		{ "trigger": "OnLoop", "contents": "OnLoop(function(${1:myHero})" },
		{ "trigger": "OnObjectLoop", "contents": "OnObjectLoop(function(${1:Object}, ${2:myHero})" },
		{ "trigger": "OnProcessSpell", "contents": "OnProcessSpell(function(${1:object}, ${2:spellProc})" },
		{ "trigger": "OnDrawMinimap", "contents": "OnDrawMinimap(function()" },
		{ "trigger": "OnProcessRecall", "contents": "OnProcessRecall(function(${1:Object}, ${2:recallProc})" },
		{ "trigger": "PrintChat", "contents": "PrintChat(${1:text})" },
		{ "trigger": "CastSpell", "contents": "CastSpell(${1:Spell})" },
		{ "trigger": "CastSkillShot2", "contents": "CastSkillShot2(${1:Spell}, ${2:x}, ${3:y}, ${4:z})" },
		{ "trigger": "ARGB", "contents": "ARGB(${1:255}, ${2:255}, ${3:255}, ${4:255})" },
		{ "trigger": "WorldToMinimap", "contents": "WorldToMinimap(${1:Origin})" },
		{ "trigger": "LevelSpell", "contents": "LevelSpell(${1:Spell})" },
		{ "trigger": "CastSkillShot3", "contents": "CastSkillShot3(${1:Spell}, ${2:startpos}, ${3:endpos})" },
		{ "trigger": "IsTargetable", "contents": "IsTargetable(${1:Object})" },

		{ "trigger": "OnUpdateBuff", "contents": "OnUpdateBuff(function(${1:Object}, ${2:BuffName}, ${3:Stacks})" },
		{ "trigger": "OnRemoveBuff", "contents": "OnRemoveBuff(function(${1:Object}, ${2:BuffName})" },
		{ "trigger": "OnCreateObj", "contents": "OnCreateObj(function(${1:Object})" },
		{ "trigger": "OnDeleteObj", "contents": "OnDeleteObj(function(${1:Object})" },

		{ "trigger": "GetMapID", "contents": "GetMapID()" },
		{ "trigger": "GetBaseAttackSpeed", "contents": "GetBaseAttackSpeed(${1:Object})" },

		{ "trigger": "OnProcessWaypoint", "contents": "OnProcessWaypoint(function(${1:Object}, ${2:waypointProc})" },

		{ "trigger": "GetObjectType", "contents": "GetObjectType(${1:Object})" },
		{ "trigger": "GetObjectName", "contents": "GetObjectName(${1:Object})" },
		{ "trigger": "GetObjectBaseName", "contents": "GetObjectBaseName(${1:Object})" },
		{ "trigger": "IsDead", "contents": "IsDead(${1:Object})" },
		{ "trigger": "GetTeam", "contents": "GetTeam(${1:Object})" },
		{ "trigger": "GetOrigin", "contents": "GetOrigin(${1:Object})" },
		{ "trigger": "GetCurrentHP", "contents": "GetCurrentHP(${1:Object})" },
		{ "trigger": "GetMaxHP", "contents": "GetMaxHP(${1:Object})" },
		{ "trigger": "IsCampusUp", "contents": "IsCampusUp(${1:Object})" },
		{ "trigger": "GetCurrentMana", "contents": "GetCurrentMana(${1:Object})" },
		{ "trigger": "GetMaxMana", "contents": "GetMaxMana(${1:Object})" },
		{ "trigger": "GetMagicShield", "contents": "GetMagicShield(${1:Object})" },
		{ "trigger": "GetDmgShield", "contents": "GetDmgShield(${1:Object})" },
		{ "trigger": "GetCDR", "contents": "GetCDR(${1:Object})" },
		{ "trigger": "GetArmorPenFlat", "contents": "GetArmorPenFlat(${1:Object})" },
		{ "trigger": "GetMagicPenFlat", "contents": "GetMagicPenFlat(${1:Object})" },
		{ "trigger": "GetArmorPenPercent", "contents": "GetArmorPenPercent(${1:Object})" },
		{ "trigger": "GetMagicPenPercent", "contents": "GetMagicPenPercent(${1:Object})" },
		{ "trigger": "GetBonusDmg", "contents": "GetBonusDmg(${1:Object})" },
		{ "trigger": "GetBonusAP", "contents": "GetBonusAP(${1:Object})" },
		{ "trigger": "GetLifeSteal", "contents": "GetLifeSteal(${1:Object})" },
		{ "trigger": "GetSpellVamp", "contents": "GetSpellVamp(${1:Object})" },
		{ "trigger": "GetAttackSpeed", "contents": "GetAttackSpeed(${1:Object})" },
		{ "trigger": "GetBaseDamage", "contents": "GetBaseDamage(${1:Object})" },
		{ "trigger": "GetCritChance", "contents": "GetCritChance(${1:Object})" },
		{ "trigger": "GetArmor", "contents": "GetArmor(${1:Object})" },
		{ "trigger": "GetMagicResist", "contents": "GetMagicResist(${1:Object})" },
		{ "trigger": "GetHPRegen", "contents": "GetHPRegen(${1:Object})" },
		{ "trigger": "GetMPRegen", "contents": "GetMPRegen(${1:Object})" },
		{ "trigger": "GetMoveSpeed", "contents": "GetMoveSpeed(${1:Object})" },
		{ "trigger": "GetRange", "contents": "GetRange(${1:Object})" },
		{ "trigger": "GetBuffCount", "contents": "GetBuffCount(${1:object}, ${2:count})" },
		{ "trigger": "GetBuffName", "contents": "GetBuffName(${1:object}, ${2:count})" },
		{ "trigger": "IsImmune", "contents": "IsImmune(${1:Object}, ${2:myHero})" },
		{ "trigger": "GetItemSlot", "contents": "GetItemSlot(${1:object}, ${2:slot})" },
		{ "trigger": "GetCastLevel", "contents": "GetCastLevel(${1:myHero}, ${2:spell})" },
		{ "trigger": "GetCastRange", "contents": "GetCastRange(${1:myHero}, ${2:spell})" },
		{ "trigger": "GetCastMana", "contents": "GetCastMana(${1:myHero}, ${2:spell}, ${3:castLevel})" },
		{ "trigger": "GetCastCooldown", "contents": "GetCastCooldown(${1:myHero}, ${2:spell}, ${3:castLevel})" },
		{ "trigger": "GetCastName", "contents": "GetCastName(${1:myHero}, ${2:spell})" },
		{ "trigger": "CanUseSpell", "contents": "CanUseSpell(${1:myHero}, ${2:spell})" },
		{ "trigger": "GetHitBox", "contents": "GetHitBox(${1:Object})" },
		{ "trigger": "GetLevel", "contents": "GetLevel(${1:Object})" },
		{ "trigger": "GetExperience", "contents": "GetExperience(${1:Object})" },
		{ "trigger": "IsVisible", "contents": "IsVisible(${1:Object})" },
		{ "trigger": "IsObjectAlive", "contents": "IsObjectAlive(${1:Object})" },
		{ "trigger": "CastTargetSpell", "contents": "CastTargetSpell(${1:Spell}, ${2:Target})" },
		{ "trigger": "CastSkillShot", "contents": "CastSkillShot(${1:spell}, ${2:x}, ${3:y}, ${4:z})" },
		{ "trigger": "MoveToXYZ", "contents": "MoveTo(${1:x}, {2:y}, {3:z})" },		
		{ "trigger": "HoldPosition", "contents": "HoldPosition()" },
		{ "trigger": "AttackUnit", "contents": "AttackUnit(${1:Object})" },
		{ "trigger": "KeyIsDown", "contents": "KeyIsDown(${1:key})" },
		{ "trigger": "DrawCircle", "contents": "DrawCircle(${1:x}, ${2:y}, ${3:z}, ${4:radius}, ${5:width}, ${6:quality}, ${7:colorARGB})" },
		{ "trigger": "WorldToScreen", "contents": "WorldToScreen(${1:1}, ${2:x}, ${3:y}, ${4:z})" },
		{ "trigger": "DrawText", "contents": "DrawText(${1:text}, ${2:size}, ${3:x}, ${4:y}, ${5:colorARGB})" },
		{ "trigger": "DrawTextSmall", "contents": "DrawTextSmall(${1:text}, ${2:x}, ${3:y}, ${4:colorARGB})" },
		{ "trigger": "FillRect", "contents": "FillRect(${1:x}, ${2:y}, ${3:width}, ${4:height}, ${5:colorARGB})" },
		{ "trigger": "DrawDmgOverHpBar", "contents": "DrawDmgOverHpBar(${1:Object}, ${2:currentHp}, ${3:ADandTrueDmg}, ${4:APDmg}, ${5:colorARGB})" },
		{ "trigger": "GetMousePos", "contents": "GetMousePos()" },
		{ "trigger": "GetCurrentTarget", "contents": "GetCurrentTarget()" },
		{ "trigger": "GetPredictionForPlayer", "contents": "GetPredictionForPlayer(${1:CastStartPosVec}, ${2:EnemyChampionPtr}, ${3:EnemyMoveSpeed}, ${4:YourSkillshotSpeed}, ${5:SkillShotDelay}, ${6:SkillShotRange}, ${7:SkillShotWidth}, ${8:MinionCollisionCheck}, ${9:AddHitBox})" },
		
		"_Q",
		"_W",
		"_E",
		"_R",
		"SUMMONER_1",
		"SUMMONER_2",
		"READY",
		"NOTAVAILABLE",
		"NOTLEARNED",
		"READYNONCAST",
		"UNKNOWN",
		"ONCOOLDOWN",
		"Obj_AI_SpawnPoint",
		"Obj_AI_Camp",
		"Obj_AI_Barracks",
		"Obj_AI_Hero",
		"Obj_AI_Minion",
		"Obj_AI_Turret",
		"Obj_AI_LineMissle",
		"Obj_AI_Shop",

		"CRYSTAL_SCAR",
		"TWISTED_TREELINE",
		"SUMMONERS_RIFT",
		"HOWLING_ABYSS",
		"RECALL",

		".x",
		".y",
		".z",
		".index",
		".position",
		".HitChance",

	]
}




if GetObjectName(myHero) ~= "Urgot" then return end

require("Inspired")

MainMenu = Menu("Furgot", "Urgot")

Urgot:SubMenu("Combo", "Combo")
Urgot:SubMenu("Mana", "Mana Manager")
Urgot.SubMenu("Items", "Items")

Urgot.Items:Boolean("Cutless", "Bilgewater Cutlass", true)
Urgot.Items:Boolean("botrk", "Blade of the Ruined King", true)
Urgot.Items:Boolean("Murumana", "Murumana", true)
Urgot.Items:Slider("CHP", "Use BilgeWater Cutless at % HP", 40, 0, 100, 1)
Urgot.Items:Slider("botrkHP", "Use Blade of the Ruined King at % HP", 40, 0, 100, 1)

Urgot.Combo:Boolean("Q", "Use Q", true)
Urgot.Combo:Boolean("W", "Use W", true)
Urgot.Combo:Boolean("E", "Use E", true)
Urgot.Combo:Key("Combo1", "Combo", string.byte(" "))

Urgot.Mana:Slider("ManaQ", "Stop Casting Q at % mana", 30, 0, 100, 1)
Urgot.Mana:Slider("ManaW", "Stop casting W at % mana", 30, 0, 100, 1)
Urgot.Mana:Slider("ManaE", "Stop casting E at % mana", 30, 0, 100, 1)



OnLoop (function (myHero)
local target = GetCurrentTarget()
local myHeroPos = GetOrigin(myHero)

--Items / Stole from Noddy ezreal kek
local Muramana = GetItemSlot(myhero,3042)
local Cutless = GetItemSlot(myhero,3144)
local botrk = GetItemSlot(myHero,3153)

--Items Usage
if Urgot.Combo.Combo1:value()
	if Cutless >= 1 and GoS:ValidTarget(target, 550) and Urgot.Items.Cutless:Value() and (GetCurrentHP(myHero)/GetMaxHP(myHero))*100 <= Urgot.Items.CHP:Value()
		then CastTargetSpell(target, GetItemSlot(myHero,3144))

	elseif botrk >= 1 and GoS:ValidTarget(target,550) and Urgot.Items.botrk:Value() and (GetCurrentHP(myHero)/GetMaxHP(myHero))*100 <= Urgot.Items.botrkHP:Value()
		then CastTargetSpell(target, GetItemSlot(myHero,3153))
end

--When Murumana has stacked finished/Evolved Mode
--This is Noddy code/ Couldn't figure it out. Scrubs kappa
	if Urgot.Combo.Combo1:Value() then
		if GoS:ValidTarget(target,GetCastRange(myHero,_Q)) and Muramana >= 1 and GotBuff(myHero,"Muramana") == 0 then
		CastSpell(GetItemSlot(myHero,3042))
elseif GotBuff(myHero,"Muramana") == 1 and not GoS:ValidTarget(target, 1500) then
		CastSpell(GetItemSlot(myHero,3042))
end
end
if GotBuff(myHero,"Muramana") == 1 and not GoS:ValidTarget(target, 2500) then
	CastSpell(GetItemSlot(myHero,3042))
end

--Checks for Q Range
if GotBuff(target, "UrgotCorrosiveDebuff") == 1 then
	extraRange = 200
	collision = false
else
	extraRange = 0
	collision = true
end

--Use Q
local QPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),1800,250,1000+extraRange,80,collision,true)

if CanUseSpell(myHero,_Q) == READY and GoS:ValidTarget(target,1000+extraRange) and 100*GetCurrentMana(myHero)/GetMaxMana(myHero) >= Urgot.Mana.ManaQ:Value() and Urgot.Combo.Q:Value() and Urgot.Combo.Combo1:Value() and if QPred.HitChance == 1 then
CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,Qpred.PredPos.z)
	end
end

--Use W

if CanUseSpell(myHero,_W) == READY and 100*GetCurrentMana(myHero)/GetMaxMana(myHero) >= Urgot.Mana.ManaW:Value() and Urgot.Combo.W:Value() and Urgot.Combo.Combo1:Value() and GoS:ValidTarget(target, 1000)
then CastSpell(_W)
	end
end

--Use E
local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),0,875,1100,250,false,true)

if CanUseSpell(myHero,_E) == READY and 100*GetCurrentMana(myHero)/GetMaxMana(myHero) >= Urgot.Mana.ManaE:Value() and Urgot.Combo.Combo1:Value() and Urgot.Combo.E:Value() and GoS:ValidTarget(target, 900) and if EPred.HitChance == 1
then CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
	end
end
end) --Ends OnLoop@Line19
PrintChat("Thanks Noddy for Q logic ._. ")
PrintChat("Standard Credits : Deftsu, Inspired")
