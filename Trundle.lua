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
---------------------------------------------------All my Local stuff and Functions-------------------------------------------
local myHero = GetMyHero();
local CannotHitHim = IsImmune()
local isTargetable = isTargetable()
local unitChanellingSpells = CHANELLING_SPELLS[GetObjectName(unit)]
local callback = Nil
function AutoLevel()
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
----------------------------------------------All my Auto Level Code goes here----------------------------------------------
Function AutoLevel()
If TrundleMenu.Misc.QE:value() then

    if GetLevel(myHero) == 1 then
      LevelSpell(_Q)
      elseif GetLevel(myHero) == 2 then
      LevelSpell(_W)
      elseif GetLevel(myHero) == 3 then
      LevelSpell(_E)
      elseif GetLevel(myHero) == 4 then
      LevelSpell(_Q)
      elseif GetLevel(myHero) == 5 then
      LevelSpell(_Q)
      elseif GetLevel(myHero) == 6 then
      LevelSpell(_R)
      elseif GetLevel(myHero) == 7 then
      LevelSpell(_Q)
      elseif GetLevel(myHero) == 8 then
      LevelSpell(_W)
      elseif GetLevel(myHero) == 9 then
      LevelSpell(_Q)
      elseif GetLevel(myHero) == 10 then
      LevelSpell(_E)
      elseif GetLevel(myHero) == 11 then
      LevelSpell(_R)
      elseif GetLevel(myHero) == 12 then
      LevelSpell(_W)
      elseif GetLevel(myHero) == 13 then
      LevelSpell(_W)
      elseif GetLevel(myHero) == 14 then
      LevelSpell(_E)
      elseif GetLevel(myHero) == 15 then
      LevelSpell(_E)
      elseif GetLevel(myHero) == 16 then
      LevelSpell(_R)
      elseif GetLevel(myHero) == 17 then
      LevelSpell(_E)
      elseif GetLevel(myHero) == 18 then
      LevelSpell(_E)
      end
      end

If TrundleMenu.Misc.WQ:value() then
    if GetLevel(myHero) == 1 then
      LevelSpell(_Q)
      elseif GetLevel(myHero) == 2 then
      LevelSpell(_W)
      elseif GetLevel(myHero) == 3 then
      LevelSpell(_E)
      elseif GetLevel(myHero) == 4 then
      LevelSpell(_W)
      elseif GetLevel(myHero) == 5 then
      LevelSpell(_W)
      elseif GetLevel(myHero) == 6 then
      LevelSpell(_R)
      elseif GetLevel(myHero) == 7 then
      LevelSpell(_W)
      elseif GetLevel(myHero) == 8 then
      LevelSpell(_Q)
      elseif GetLevel(myHero) == 9 then
      LevelSpell(_W)
      elseif GetLevel(myHero) == 10 then
      LevelSpell(_E)
      elseif GetLevel(myHero) == 11 then
      LevelSpell(_R)
      elseif GetLevel(myHero) == 12 then
      LevelSpell(_Q)
      elseif GetLevel(myHero) == 13 then
      LevelSpell(_Q)
      elseif GetLevel(myHero) == 14 then
      LevelSpell(_E)
      elseif GetLevel(myHero) == 15 then
      LevelSpell(_E)
      elseif GetLevel(myHero) == 16 then
      LevelSpell(_R)
      elseif GetLevel(myHero) == 17 then
      LevelSpell(_E)
      elseif GetLevel(myHero) == 18 then
      LevelSpell(_E)
      end
  end
------------------------------------------------------------------------------------------------------------------
