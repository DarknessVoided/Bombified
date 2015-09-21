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

---------------------------------------------------All my Local stuff -------------------------------------------
local myHero = GetMyHero()
local target = GetCurrentTarget()
---------------------------------------------All those interrupter code goes under here------------------------------------

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
local playerTeam = GetTeam(GetMyHero()) --Because of line 25 there isn't any need to do local playerTeam = GetTeam(GetMyHero())

OnProcessSpell(function(unit, spell)    --Starts of OnProcessSpell-Notice that the ) has not been closed.
    if not unit or GetObjectType(unit) ~= Obj_AI_Hero  or GetTeam(unit) == playerTeam then return end
 
    if unitChanellingSpells then
            for _, spellSlot in pairs(unitChanellingSpells) do  --AUTO E
                if TrundleMenu.Misc.ER:Value() and spell.name == GetCastName(unit, spellSlot) and GoS:ValidTarget(unit,GetCastRange(myHero,_E)) then 
				 print("Want to E")
                  pos=GetOrigin(unit) --pos is a table!! :)
                  CastSkillShot(_E,pos.x,pos.y,pos.z)
                end
            end
    end
end) -- Marks the End of OnProcessSpell
----------------------------------------------All my OnLoop code goes here----------------------------------------------

OnLoop(function(myHero)
	AutoLevel()
	Combo()
end)
	
----------------------------------------------All my Auto Level Code goes here----------------------------------------------
function AutoLevel()
 if TrundleMenu.Misc.QE:Value() then
 
local level=GetLevel(myHero)

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

if TrundleMenu.Misc.WQ:Value() then
    
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
end
---------------------------------------Combo IOW--------------------------------------
function Combo()
if IOW:Mode() == "Combo" then


if TrundleMenu.Combo.Q:Value() and CanUseSpell(myHero,_Q) == READY and GoS:ValidTarget(target, 150) then
CastSpell(_Q)
end

if TrundleMenu.Combo.W:Value() and CanUseSpell(myHero,_W) == READY and GoS:ValidTarget(target, 900) then
CastSpell(_W)
end

EPred = GetPredictionForPlayer(GoS:myHeroPos(),target,GetMoveSpeed(target),math.huge,250,1000,225,false,false)

if TrundleMenu.Combo.E:Value() and CanUseSpell(myHero,_E) == READY and GoS:ValidTarget(target, 1000) then
CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
end

if TrundleMenu.Combo.R:Value() and CanUseSpell(myHero,_R) == READY and GoS:ValidTarget(target, 700) then 
  tank=findTank() 
  CastTargetSpell(tank,_R)
end
  
end	--ends iow check
end	--ends combo

-- Function to find the highest resistance hero
function findTank()
  local besttank=0 --resistance
  local tank=nil --champ 
  if GoS:GetEnemyHeroes() then --Can't be nil 
   for _,k in pairs(GoS:GetEnemyHeroes()) do -- K means enemy just to remind myself
     if GetArmor(k)+GetMagicResist(k)>besttank and GoS:ValidTarget(target,GetCastRange(myHero,_R)) then
      besttank=GetArmor(k)+GetMagicResist(k)
      tank=k
     end
   end
  end
 print("Best Tank: "..GetObjectName(tank).." with "..besttank.." Points")
return tank
end


PrintChat("Thanks to Noddy(Helped me a ShitLoad),Logge(Helped me much too)EzinBern, Cloud, Zypppy and Deftsu!")
PrintChat("Not forgetting those people who created Library and the IOW")
PrintChat("Have a good game!")
