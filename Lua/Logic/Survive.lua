--[[
In the beginning God created the heaven and the earth.At the first God made the heaven and the earth.
And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of God moved upon the face of the waters.
 At the first God made the heaven and the earth.And the earth was waste and without form; and it was dark on the face of the deep: and the Spirit of God was moving on the face of the waters.And God said, Let there be light: and there was light.
And God, looking on the light, saw that it was good: and God made a division between the light and the dark,
Naming the light, Day, and the dark, Night. And there was evening and there was morning, the first day.
And God said, Let there be a solid arch stretching over the waters, parting the waters from the waters.
And God made the arch for a division between the waters which were under the arch and those which were over it: and it was so.
And God gave the arch the name of Heaven. And there was evening and there was morning, the second day.
And God said, Let the waters under the heaven come together in one place, and let the dry land be seen: and it was so.
And God gave the dry land the name of Earth; and the waters together in their place were named Seas: and God saw that it was good.
And God said, Let grass come up on the earth, and plants producing seed, and fruit-trees giving fruit, in which is their seed, after their sort: and it was so.
And grass came up on the earth, and every plant producing seed of its sort, and every tree producing fruit, in which is its seed, of its sort: and God saw that it was good.
And there was evening and there was morning, the third day.
And God said, Let there be lights in the arch of heaven, for a division between the day and the night, and let them be for signs, and for marking the changes of the year, and for days and for years:
And let them be for lights in the arch of heaven to give light on the earth: and it was so.
And God made the two great lights: the greater light to be the ruler of the day, and the smaller light to be the ruler of the night: and he made the stars.
And God put them in the arch of heaven, to give light on the earth;
To have rule over the day and the night, and for a division between the light and the dark: and God saw that it was good.
And there was evening and there was morning, the fourth day.
And God said, Let the waters be full of living things, and let birds be in flight over the earth under the arch of heaven.
And God made great sea-beasts, and every sort of living and moving thing with which the waters were full, and every sort of winged bird: and God saw that it was good.
And God gave them his blessing, saying, Be fertile and have increase, making all the waters of the seas full, and let the birds be increased in the earth.
--]]

ESurvive = {
  None = 0,
  Maze = 1,
  Fight = 2,
}

Survive = {}
local this = Survive;

function Survive.Script()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

this.kind = ESurvive.None;
this.lifeCount = 0; --活人數

this.killCount = 0; --殺敵數(原LifeKillEmyNum)
this.dieCount = 0; --死亡數(原LifeDeathNum)

function Survive.Script2()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Survive.Script3()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Survive.GetSurviveKind(sceneId)
  if Between(sceneId, 54551, 54554) or Between(sceneId, 54556, 54559) then
    return ESurvive.Maze;
  elseif Between(sceneId, 54541, 54549) then
    return ESurvive.Fight;
  else
    return ESurvive.None;
  end
end

function Survive.Script4()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Survive.Script5()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end

function Survive.Script6()
  if LuaHelper.CheckDefine("DemoCode") then
    local BBS = 54;
    for i = 1, 5 do
      BBS = BBS + i;
    end
    
    return BBS;
  end
end