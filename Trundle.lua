if GetObjectName(myHero) ~= "Trundle"  then return end

require("IOW")
require("Inspired")

----------------------------------------------------------------Main Menu-----------------------------------------------------
TrundleMenu = Menu("Trundle", "Trundle")

----------------------------------------------------------------Sub Menu------------------------------------------------------
TrundleMenu:SubMenu("Combo", "Combo")
TrundleMenu:SubMenu("Misc", "Misc")

-----------------------------------------------------------Menu within combo Menu--------------------------------------------
TrundleMenu.Combo:Boolean("Q", "Use Q", true)
TrundleMenu.Combo:Boolean("W", "Use W", true)
TrundleMenu.Combo:Boolean("E", "Use E", true)
TrundleMenu.Combo:Boolean("R", "Use R", true)

-------------------------------------------------------------Menu within Misc-------------------------------------------------
TrundleMenu.Misc:Boolean("ER", "Use E to interupt enemy channels", true)
TrundleMenu.Misc:Boolean("QE", "Auto level Spell in RQWE", false)
TrundleMenu.Misc:Boolean("WQ", "Auto Level Spell in RWQE", false)
------------------------------------------------------
---------------------------------------------------All my Local stuff -------------------------------------------
OnLoop(function(myHero)
local myHero = GetMyHero();
local isTargetable = isTargetable(target)
local unitChanellingSpells = CHANELLING_SPELLS[GetObjectName(unit)]
local target = GetCurrentTarget()
AutoLevel()
Combo()
FindTank()
-----------------------------------------------------------------------------------------------------------------------------
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
---------------------------------------------All those interrupter   code goes under here------------------------------------
OnProcessSpell(function(unit, spell)    
    if not unit or GetObjectType(unit) ~= Obj_AI_Hero  or GetTeam(unit) == GetTeam(GetMyHero()) then return end
 
    if unitChanellingSpells then
            for _, spellSlot in pairs(unitChanellingSpells) do  --AUTO E
                if TrundleMenu.Misc.ER:Value() and spell.name == GetCastName(unit, spellSlot) and GoS:ValidTarget(unit,GetCastRange(myHero,_E)) then 
                  pos=GetOrigin(unit) --pos is a table!! :)
                  CastSkillShot(_E,pos.x,pos.y,pos.z)
                  --callback(unit, CHANELLING_SPELLS) 
                end
            end
    end


end)
---------------------for ultimate---------------------
function findTank()
  local besttank=0 --resistance
  local tank=nil --champ 
  if GetEnemyHeroes() then --Can't be nil 
   for _,k in pairs(GetEnemyHeroes()) do -- K means enemy just to remind myself
     if GetArmor(k)+GetMagicResist(k)>besttank and GoS:ValidTarget(target,GetCastRange(myHero,_R)) then
      besttank=GetArmor(k)+GetMagicResist(k)
      tank=k
     end
   end
  end
return tank
end

----------------------------------------------All my Auto Level Code goes here----------------------------------------------
function AutoLevel()
if TrundleMenu.Misc.QE:value() then

if level == 1 then
   LevelSpell(_Q)
 elseif level == 2 then
   LevelSpell(_W)
 elseif level == 3 then
   LevelSpell(_E)
 elseif level == 4 then
   LevelSpell(_Q)
 elseif level == 5 then
   LevelSpell(_Q)
 elseif level == 6 then
   LevelSpell(_R)
 elseif level == 7 then
   LevelSpell(_Q)
 elseif level == 8 then
   LevelSpell(_W)
 elseif level == 9 then
   LevelSpell(_Q)
 elseif level == 10 then
   LevelSpell(_E)
 elseif level == 11 then
   LevelSpell(_R)
 elseif level == 12 then
   LevelSpell(_W)
 elseif level == 13 then
   LevelSpell(_W)
 elseif level == 14 then
   LevelSpell(_E)
 elseif level == 15 then
   LevelSpell(_E)
 elseif level == 16 then
   LevelSpell(_R)
 elseif level == 17 then
   LevelSpell(_E)
 elseif level == 18 then
   LevelSpell(_E)
      end
      end

If TrundleMenu.Misc.WQ:value() then
    
 if level == 1 then
   LevelSpell(_Q)
 elseif level == 2 then
   LevelSpell(_W)
 elseif level == 3 then
   LevelSpell(_E)
 elseif level == 4 then
   LevelSpell(_W)
 elseif level == 5 then
   LevelSpell(_W)
 elseif level == 6 then
   LevelSpell(_R)
 elseif level == 7 then
   LevelSpell(_W)
 elseif level == 8 then
   LevelSpell(_Q)
 elseif level == 9 then
   LevelSpell(_W)
 elseif level == 10 then
   LevelSpell(_E)
 elseif level == 11 then
   LevelSpell(_R)
 elseif level == 12 then
   LevelSpell(_Q)
 elseif level == 13 then
   LevelSpell(_Q)
 elseif level == 14 then
   LevelSpell(_E)
 elseif level == 15 then
   LevelSpell(_E)
 elseif level == 16 then
   LevelSpell(_R)
 elseif level == 17 then
   LevelSpell(_E)
 elseif level == 18 then
   LevelSpell(_E)
    end
    end

---------------------------------------Combo IOW--------------------------------------
function Combo()
if IOW:Mode() == "Combo" then

local EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),math.huge,250,1000,225,false,false)

if TrundleMenu.Combo.Q:value() and CanUseSpell(myHero,_Q) == READY and IsTargetable and GoS:ValidTarget(target, 150)
then CastSpell(_Q)
end
end

if TrundleMenu.Combo.W:Value() and CanUseSpell(,_W) == READY and GoS:ValidTarget(target, 900)
then if TrundleMenu.Combo.W:Value() and CanUseSpell(,_W) == READY and GoS:ValidTarget(target, 900)
then myHeroPos =GetOrigin(myHero) CastSkillShot(_W,myHeroPos.x,myHeroPos.y,myHeroPos.z)
end
end

If TrundleMenu.Combo.E:Value() and CanUseSpell(,_E) == READY and GoS:ValidTarget(target, 1000) and EPred.HitChance == 1
then CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)

If TrundleMenu.Combo.R:Value() and CanUseSpell(,_R) == READY and GoS:ValidTarget(target, 700) then 
  target=findTank() 
  CastTargetedSpell(target,_R)

end
end

PrintChat("Thanks to Noddy(Helped me a ShitLoad),Logge(Helped me much too)EzinBern, Cloud, Zypppy and Deftsu!")
PrintChat("Not forgetting those people who created Library and the IOW")
PrintChat("Have a good game!")
