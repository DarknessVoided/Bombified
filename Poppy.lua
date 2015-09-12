if GetObjectName(myhero) ~= "Poppy"  then return end

require("MapPositionGOS")
require("IOW")
require("Inspired")

---------------------Main Menu------------------
PoppyMenu = Menu("Poppy", "Poppy")
------------------------------------------------

---------------------Sub Menu-------------------
PoppyMenu:SubMenu("Combo", "Combo")
PoppyMenu:SubMenu("Misc", "Misc")
------------------------------------------------



--Menu within combo Menu--
PoppyMenu.Combo:Boolean("Q", "Use Q", true)
PoppyMenu.Combo:Boolean("W", "Use W", true)
PoppyMenu.Combo:Boolean("E", "Use E", true)
PoppyMenu.Combo:Boolean("R", "Use R", true)
--------------------------

-----Menu within Misc-----
PoppyMenu.Misc:Boolean("ER", "Use E to interupt enemy Ulti", true)
--------------------------

CHANELLING SPELLS = {
     ["Caitlyn"]      = {_R},
}
