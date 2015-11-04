if GetObjectName(GetMyHero()) ~= "KogMaw" then return end

if not pcall( require, "Inspired" ) then PrintChat("You are missing Inspired.lua - Go download it and save it in Common!") return end

local info = "Kogmaw_One_Key Reworked"
local upv = "Upvote if you like it!"
local sig = "Made by Snowbell, updated by Musti and DarknessVoided"
local ver = "Version 3.0"
local loaded = "VormitMachine Loaded"
textTable = {info,upv,sig,ver,loaded}
PrintChat(textTable[1])
PrintChat(textTable[2])
PrintChat(textTable[3])
PrintChat(textTable[4])
PrintChat(textTable[5])

local KogMawMenu = MenuConfig("VormitMachine", "KogMaw")

KogMawMenu:Menu("Combo", "Combo")
KogMawMenu.Combo:Boolean("Q", "Use Q", true)
KogMawMenu.Combo:Boolean("W", "Use W", true)
KogMawMenu.Combo:Boolean("E", "Use E", true)
KogMawMenu.Combo:Boolean("R", "Use R", true)
KogMawMenu.Combo:KeyBinding("Combo1", "Combo", string.byte(" "))

KogMawMenu:Menu("Mana", "Mana Manager")
KogMawMenu.Mana:Slider("Q", "Stop Q when % MP", 40, 1, 100, 1)
KogMawMenu.Mana:Slider("E", "Stop E when % MP", 40, 1, 100, 1)
KogMawMenu.Mana:Slider("R", "Stop R when % MP", 40, 1, 100, 1)

KogMawMenu:Menu("Misc", "Misc")
KogMawMenu.Misc:Boolean("lvl", "AutoLevel R>W>Q>E", false)
KogMawMenu.Misc:Boolean("DeathWalk", "Auto Move to Target when Dead", false)
KogMawMenu.Misc:Boolean("KSQ", "KS With Q", true)
KogMawMenu.Misc:Boolean("KSE", "KS with E", true)
KogMawMenu.Misc:Boolean("KSR", "KS with R", true)
KogMawMenu.Misc:Boolean("Laugh", "Use Emote", false)
KogMawMenu.Misc:DropDown("EmotesTable", "Use which Emotes", 1, {"Dance", "Laugh", "Taunt", "Joke"})

KogMawMenu:Menu("Items", "Items")
KogMawMenu.Items:Boolean("Yomie", "Use Yomie")
KogMawMenu.Items:Boolean("BoTrK", "Use Botrk", true)
KogMawMenu.Items:Boolean("Cutlass", "Use Cutlass", true)
KogMawMenu.Items:Slider("III", "Use BoTrk or Cutlass when Health", 40, 1, 100, 1)

ts = TargetSelector(GetRange(myHero), TARGET_LESS_CAST, DAMAGE_PHYSICAL)
KogMawMenu:TargetSelector("ts", "Target Selector", ts)

OnTick(function(myHero)
   local target = ts:GetTarget()
   origin = GetOrigin(target)
   local QPred = GetPredictionForPlayer(myHeroPos(),target,GetMoveSpeed(target),1650,250,1200,70,true,false)
   local EPred = GetPredictionForPlayer(myHeroPos(),target,GetMoveSpeed(target),1400,250,1360,120,false,true)
   local RPred = GetPredictionForPlayer(myHeroPos(),target,GetMoveSpeed(target),math.huge,1200,1800,150,false,false)
   local botrk = GetItemSlot(myHero,3153)
   local Cutlass = GetItemSlot(myHero,3144)
   local Yomie = GetItemSlot(myHero, 3142)
   if target then
      Combo()
      KS()
      Items()
      Laugh()
      AmIDead()
      AutoLvL()
   end
end) --Ends the OnLoop

function Combo()
   if isReady(_Q) and GetPercentMP(myHero) >= KogMawMenu.Mana.Q:Value() and IsObjectAlive(target) and ValidTarget(target, 1200) and QPred.HitChance == 1 and KogMawMenu.Combo.Q:Value() and KogMawMenu.Combo.Combo1:Value() then
      CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
   end

   if isReady(_W) and KogMawMenu.Combo.Combo1:Value() and KogMawMenu.Combo.W:Value() and ValidTarget(target, 600) then
      CastSpell(_W)
   end

   if isReady(_E) and GetPercentMP(myHero) >= KogMawMenu.Mana.E:Value() and KogMawMenu.Combo.E:Value() and KogMawMenu.Combo.Combo1:Value() and ValidTarget(target, 1360) and EPred.HitChance == 1 then
      CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
   end

   if isReady(_R) and GetPercentMP(myHero) >= KogMawMenu.Mana.R:Value() and RPred.HitChance == 1 and KogMawMenu.Combo.R:Value() and KogMawMenu.Combo.Combo1:Value() and ValidTarget(target, 1800) then
      CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
   end
end --Ends the Combo function

function KS()
   local target = ts:GetTarget()
   for i,enemy in pairs(GetEnemyHeroes()) do
      local QPred = GetPredictionForPlayer(myHeroPos(),enemy,GetMoveSpeed(enemy),1650,250,1200,70,true,true)
      local EPred = GetPredictionForPlayer(myHeroPos(),enemy,GetMoveSpeed(enemy),1400,250,1360,120,false,true)
      local RPred = GetPredictionForPlayer(myHeroPos(),enemy,GetMoveSpeed(enemy),math.huge,1200,1800,150,false,false)

      if isReady(_Q) == READY and KogMawMenu.Misc.KSQ:Value() and ValidTarget(enemy, 1200) and GetCurrentHP(enemy) < CalcDamage(myHero, enemy, 0, (50*GetCastLevel(myHero,_Q) + 30+ 0.5*(GetBonusAP(myHero)))) then
         CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
      end

      if isReady(_E) and KogMawMenu.Misc.KSE:Value() and ValidTarget(enemy, 1360) and GetCurrentHP(enemy) < CalcDamage(myHero, enemy, 0, (50*GetCastLevel(myHero,_E) + 10 + 0.7*(GetBonusAP(myHero)))) then
         CastSpell(_W)
      end

      if isReady(_R) and KogMawMenu.Misc.KSR:Value() and ValidTarget(enemy, 1800) and GetCurrentHP(enemy) < CalcDamage(myHero, enemy, 0, (40*GetCastLevel(myHero,_R) + 40 + 0.5*(GetBaseDamage(myHero) + GetBonusDmg(myHero) + 0.3*(GetBonusAP(myHero)))),0) then
         CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
      end
   end
end -- Ends the FunctionKS

function AmIDead()
   if KogMawMenu.Misc.DeathWalk:Value() and GotBuff(myHero, "kogmawicathiansurprise") == 1 and ValidTarget(target, 1000) then
      MoveToXYZ(origin.x,origin.y,origin.z)
   end
end --AmIDead

function Laugh()
   if IsDead(target) and KogMawMenu.Misc.Laugh:value() then
      if KogMawMenu.Misc.EmotesTable:Value() == 1 then Emoticon = {EMOTE_DANCE}
      elseif KogMawMenu.Misc.EmotesTable:Value() == 2 then Emoticon = {EMOTE_LAUGH}
      elseif KogMawMenu.Misc.EmotesTable:Value() == 3 then Emoticon = {EMOTE_TAUNT}
      elseif KogMawMenu.Misc.EmotesTable:Value() == 4 then Emoticon = {EMOTE_JOKE}
      end
      CastEmote(Emoticon)
   end
end

LevelTables = {_Q, _W, _E, _W, _W, _R, _W, _Q, _W, _Q, _R, _Q, _Q, _E, _E, _R, _E, _E,}
function AutoLvL()
   if KogMawMenu.Misc.lvl:Value() then
      LevelSpell(LevelTables[GetLevel(myHero)])
   end
end

function Items()
   --For BoTrK
   if KogMawMenu.Combo.Combo1:Value() then

      if botrk >= 1 and KogMawMenu.Items.BoTrK:Value() and ValidTarget(target,550) and GetPercentHP(myHero) >= KogMawMenu.Items.III:value() then
         if CanUseSpell(myHero,GetItemSlot(myHero,3153)) == READY then
            CastTargetSpell(target,GetItemSlot(myHero,3153))
         end

      elseif Cutlass >= 1 and KogMawMenu.Items.Cutlass.Value() and ValidTarget(target, 550) and GetPercentHP(myHero) >= KogMawMenu.Items.III:Value() then
         if CanUseSpell(myHero, GetItemSlot(myHero,3144)) == READY then
            CastTargetSpell(target, GetItemSlot(myHero, 3144))
         end
      end

      if KogMawMenu.Combo.Combo1:Value() and Yomie >= 1 and ValidTarget(target, 500) and EnemiesAround(myHero, 500) >= 1 then
         if CanUseSpell(myHero, GetItemSlot(myHero, 3142)) == READY then
            CastSpell(GetItemSlot(myHero,3142))
         end
      end
   end
end --End function Items
