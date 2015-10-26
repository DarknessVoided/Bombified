if GetObjectName(myHero) ~= "Varus" then return end

VarusMenu = MenuConfig("Varus", "Varus")

VarusMenu:Menu("Combo", "Combo")
VarusMenu.Combo:Boolean("Q", "Use Q", true)
VarusMenu.Combo:Boolean("E", "Use E", true)
VarusMenu.Combo:Boolean("R", "Use R", true)
VarusMenu.Combo:Slider("RCount", "R min enemy to Hit", 1, 1, 5, 1)

VarusMenu:Menu("ManaManager", "Mana Manager")
VarusMenu.ManaManager:Slider("Q", "Use Q if Mana is above", 20, 0, 100, 1)
VarusMenu.ManaManager:Slider("E", "Use E if Mana is above", 20, 0, 100, 1)
VarusMenu.ManaManager:Slider("R", "Use R if Mana is above", 20,0, 100, 1)

VarusMenu:Menu("Misc", "Misc")
VarusMenu.Misc:Boolean("KSQ", "Use Q to KS", true)
VarusMenu.Misc:Boolean("KSE", "Use E to KS", true)
VarusMenu.Misc:Boolean("AL", "Use Auto Level", false)
VarusMenu.Misc:DropDown("Autolvltable", "Priority", 1, {"R-Q-E-W", "R-W-Q-E"})

VarusMenu:TargetSelector("ts", "Target Selector",  DAMAGE_MAGICAL, 1450, TARGET_LESS_CAST)
--[[
Okay lets do the thought process here.
From what we can see, Varus Q increases in a speed 2 seconds. The other one seconds just hold the arrow in it's maximum length.
While Channeling, His speed is slowed by 20%. Do we need to calculate this? The answer is no.
Okay lets get into the technical stuff. The arrow starts at 925- Without even channeling and ends at 1625-Channeling for 2 seconds.
This means that in one second, the arrow increases by 350. Calculation part is not need. idgaf as i don't need to ks kappa
]]--
--------------------------------------------------------------------------------------------------------------------
OnProcessSpellComplete(function(Object, SpellProc) --Time in which Q is Casted
   if Object == myHero and SpellProc.name == "varusqlaunch" then
      range  = 925
      qRange = 0
      startTime = GetGameTimer()
   end
end)
-------------------------------------------------------------------------------------------------------------------
OnUpdateBuff(function(Object,buffProc) --Checks the Start of Q Cast
   if Object == myHero and buffProc.Name == "varusqlaunch" then
      VarusQ = true
   end
end)

OnRemoveBuff(function(Object,buffProc) --Checks the end of Q Cast
   if Object == myHero and buffProc.Name == "varusqlaunch" then
      VarusQ = false
   end
end)
qRange = 0
-------------------------------------------------------------------------------------------------------------------
OnTick(function(myHero)

   if IOW:Mode() == "Combo" then
      local EPred = GetPredictionForPlayer(myHeroPos(),target,GetMoveSpeed(target),1500,100,925,235,false,false)
      local RPred = GetPredictionForPlayer(myHeroPos(),target,GetMoveSpeed(target),1950,25,1075,100,false,true)
      local QPred = GetPredictionForPlayer(myHeroPos(),target,GetMoveSpeed(target),1900,250,qRange,70,false,false)
      local mousePos = GetMousePos()
      local target = VarusMenu.ts:GetTarget()

      if CanUseSpell(myHero, _E) == READY and ValidTarget(target, 925) and VarusMenu.Combo.E:Value() and EPred.HitChance == 1 and GetPercentMP(myHero) >= VarusMenu.ManaManager.E:Value() then
         CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
      end

      if CanUseSpell(myHero, _R) and GetPercentMP(myHero) >= VarusMenu.ManaManager.R:Value() and ValidTarget(target, 1075) and RPred.HitChance == 1 and VarusMenu.Combo.R:Value() and EnemiesAround(target, 550) >= Varus.combo.Rcount:Value() then
         CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
      end
      -------------------------------------------------------------------------------------------------------------------
      if varusQ ~= nil then
         if varusQ == true then
            --We know the Q start at the point of 925 and ends at 1625 in 2 seconds.
            timepassed = (GetGameTimer() - startTime)*1000 --This is mainly because 1 seconds = 1000 milliseconds
            if qRange < 1625 then
               qRange = range + timepassed*0.35 + GetHitBox(myHero)
            end
         end
      end
      -------------------------------------------------------------------------------------------------------------------
      if CanUseSpell(myHero, _Q) and ValidTarget(target, 1625) and VarusMenu.Combo.Q:Value() and GetPercentMP(myHero) >= VarusMenu.ManaManager.Q:Value() then
         CastSkillShot(_Q,mousePos.x,mousePos.y,mousePos.z) then

            if QPred == 1 then
               CastSkillShot2(_Q, QPred.PredPos.x, QPred.PredPos.y, QPred.PredPos.z)
            end
         end
      end --Ends IOW Combo

      Level()
   end) --Ends OnTick

   function Level()
      if VarusMenu.Misc.AL:Value() then
         if VarusMenu.Misc.Autolvltable:Value() == 1 then leveltable = {_Q, _W, _E, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W}
         elseif VarusMenu.Misc.Autolvltable:Value() == 2 then leveltable = {_Q, _W, _E, _W, _W, _R, _W, _Q, _W, _Q, _R, _Q, _Q, _E, _E, _R, _E, _E}
         end
         LevelSpell(leveltable[GetLevel(myHero)])
      end
   end)
