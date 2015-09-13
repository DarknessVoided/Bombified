if GetObjectName(myhero) ~= "Trundle"  then else

require('IOW')
require('Inspired')

--------Main Menu--------
TrundleMenu = Menu("Trundle", "Trundle")
------------------------

--------Sub Menu----------
TrundleMenu:SubMenu("Combo", "Combo")
TrundleMenu:SubMenu("Miscva", "Misc")
TrundleMenu:SubMenu("Drawings", "Drawings")
--------------------------



--Menu within combo Menu--
TrundleMenu.Combo:Boolean("Q", "Use Q", true)
TrundleMenu.Combo:Boolean("W", "Use W", true)
TrundleMenu.Combo:Boolean("E", "Use E", true)
TrundleMenu.Combo:Boolean("R", "Use R", true)
--------------------------

-----Menu within Misc-----
TrundleMenu.Misc:Boolean("ER", "Use E to interupt enemy Ulti", true)
TrundleMenu.Misc:Boolean("QE", "Auto level Spell in QWER", false)
--------------------------

---Menu within Drawings---
TrundleMenu.Drawings:Boolean("Q", "Enable Drawings for Q", false)
TrundleMenu.Drawings:Boolean("W", "Enable Drawings for W", false)
TrundleMenu.Drawinfs:Boolean("E", "Enable Drawings for E", false)
TrundleMenu.Drawings:Boolean("R", false)

--------------------------
CHANELLING SPELLS = {
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
}
OnLoop(function(myHero)
OnProcessSpell(function(unit, spellProc)
    if not IsDead(myhero) and CanUseSpell(myhero, _E) and Trundle.Misc.ER:Value()
