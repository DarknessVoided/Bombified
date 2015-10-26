
--Not updated for Inspired newest version


local Menu = Menu("BM", "BM 2.0")

Menu:SubMenu("rofl", "Settings")

Menu.rofl:Boolean("Laugh", "Enable Emotes", true)
Menu.rofl:Boolean("Always", "Always laugh", false)
Menu.rofl:List("EmotesTable", "Use which Emotes", 1, {"Dance", "Laugh", "Taunt", "Joke"})

OnTick(function(myHero)
target = GetCurrentTarget()
Laugh()
Always()
end)

function Laugh()
   if IsDead(target) and Menu.rofl.Laugh:value() then
      if Menu.rofl.EmotesTable:Value() == 1 then Emoticon = EMOTE_DANCE
      elseif Menu.rofl.EmotesTable:Value() == 2 then Emoticon = EMOTE_LAUGH
      elseif Menu.rofl.EmotesTable:Value() == 3 then Emoticon = EMOTE_TAUNT
      elseif Menu.rofl.EmotesTable:Value() == 4 then Emoticon = EMOTE_JOKE
      end
      CastEmote(Emoticon)
   end
end

function Always()
   if IOW:TimeToMove() and Menu.rofl.Always:Value() then
      if Menu.rofl.EmotesTable:Value() == 1 then Emoticon = EMOTE_DANCE
      elseif Menu.rofl.EmotesTable:Value() == 2 then Emoticon = EMOTE_LAUGH
      elseif Menu.rofl.EmotesTable:Value() == 3 then Emoticon = EMOTE_TAUNT
      elseif Menu.rofl.EmotesTable:Value() == 4 then Emoticon = EMOTE_JOKE
      end
      CastEmote(Emoticon)
   end
end
