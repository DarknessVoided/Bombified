Menu = Menu("BM", "BM 2.0")

Menu:SubMenu("rofl", "Settings")

Menu.rofl:Boolean("Laugh", "Enable Emotes", true)
Menu.rofl:List("EmotesTable", "Use which Emotes", 1, {"Dance", "Laugh", "Taunt", "Joke"})

OnLoop(function(myHero)
Laugh()
end)

function Laugh()
   if IsDead(target) and Menu.Laugh.EmotesTable:value() then
      if Menu.Laugh.EmotesTable:Value() == 1 then Emoticon = {EMOTE_DANCE}
      elseif Menu.Laugh.EmotesTable:Value() == 2 then Emoticon = {EMOTE_LAUGH}
      elseif Menu.Laugh.EmotesTable:Value() == 3 then Emoticon = {EMOTE_TAUNT}
      elseif Menu.Laugh.EmotesTable:Value() == 4 then Emoticon = {EMOTE_JOKE}
      end
      CastEmote(Emoticon)
   end
end
