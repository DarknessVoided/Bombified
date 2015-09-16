if GetObjectName(myhero) ~= "Trundle"  then else return end

require("IOW")
require("Inspired")

----------------------------------------------------------------Main Menu-----------------------------------------------------
TrundleMenu = Menu("Trundle", "Trundle")

----------------------------------------------------------------Sub Menu------------------------------------------------------
TrundleMenu:SubMenu("Combo", "Combo")
TrundleMenu:SubMenu("Misc", "Misc")
TrundleMenu:SubMenu("Drawings", "Drawings")

-----------------------------------------------------------Menu within combo Menu--------------------------------------------
TrundleMenu.Combo:Boolean("Q", "Use Q", true)
TrundleMenu.Combo:Boolean("W", "Use W", true)
TrundleMenu.Combo:Boolean("E", "Use E", true)
TrundleMenu.Combo:Boolean("R", "Use R", true)

-------------------------------------------------------------Menu within Misc-------------------------------------------------
TrundleMenu.Misc:Boolean("ER", "Use E to interupt enemy Ulti", true)
TrundleMenu.Misc:Boolean("QE", "Auto level Spell in RQWE", false)
TrundleMenu.Misc:Boolean("WQ", "Auto Level Spell in RWQE", false)
-----------------------------------------------------------Menu within Drawings----------------------------------------------
TrundleMenu.Drawings:Boolean("Q", "Enable Drawings for Q", false)
TrundleMenu.Drawings:Boolean("W", "Enable Drawings for W", false)
TrundleMenu.Drawinfs:Boolean("E", "Enable Drawings for E", false)
TrundleMenu.Drawings:Boolean("R", false)
---------------------------------------------------All my Local stuff -------------------------------------------
local myHero = GetMyHero();
local isTargetable = isTargetable(target)
local unitChanellingSpells = CHANELLING_SPELLS[GetObjectName(unit)]
local callback = Nil
local target = GetCurrentTarget()
AutoLevel()
Combo()
local botrk = GetItemSlot(myHero,3153)
-----------------------------------------------------------------------------------------------------------------------------
CHANELLING_SPELLS = {
    ["Caitlyn"]                     = {_R},
    ["Katarina"]                    = {_R},
    ["MasterYi"]                    = {_W},
    ["FiddleSticks"]                = {W, R},
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
}

---------------------------------------------All those interrupter   code goes under here------------------------------------
-OnProcessSpell(function(unit, spell)    
    if not callback or not unit or GetObjectType(unit) ~= Obj_AI_Hero  or GetTeam(unit) == GetTeam(GetMyHero()) then return end
 
    if unitChanellingSpells then
            for _, spellSlot in pairs(unitChanellingSpells) do
                if spell.name == GetCastName(unit, spellSlot) then callback(unit, CHANELLING_SPELLS) end
            end
    end
-----------------------------
OnLoop(function(myHero)
----------------------------------------------All my Auto Level Code goes here----------------------------------------------
Function AutoLevel()
If TrundleMenu.Misc.QE:value() then

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
if TrundleMenu.Combo.Q:value() and CanUseSpell(,_Q) == READY and IsTargetable and GoS:ValidTarget(target, 150)
then CastSpell(_Q)
end
end

if TrundleMenu.Combo.W:Value() and CanUseSpell(,_W) == READY and GoS:ValidTarget(target, 900)
then CastSpell(_W)
end
end

If TrundleMenu.Combo.E:Value() and CanUseSpell(,_E) == READY and GoS:ValidTarget(target, 1000)
then CastSkillShot(_E,EnemyPos.x,EnemyPos.y,EnemyPos.z)

If TrundleMenu.Combo.R:Value() and CanUseSpell(,_R) == READY and GoS:ValidTarget(target, 700) and GetCurrentTarget(target)
then CastSpell(_R)
end
end

end)
PrintChat("Thanks to Noddy(Helped me a ShitLoad,EzinBern, Cloud, Zypppy and Deftsu!")
PrintChat("Not forgetting those people who created Library and the IOW")
PrintChat("Have a good game!")
