WorldBoss = {}
local this = WorldBoss;

this.active = false;
this.actTime = nil; --DateTime
this.revTime = nil; --DateTime
this.topScore = 0;
this.newScore = 0;
this.summationScore = 0;
this.scoreRateItemId = 0;
this.waitUpdateTick = 0;
this.rank = 0; --自己名次
this.lastRankScore = 0; --前一名分數
this.ticketItemId = 46614;

function WorldBoss.Demo()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function WorldBoss.Clear()
  this.active = false;
end

function WorldBoss.Demo2()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end

function WorldBoss.Demo3()
  if LuaHelper.CheckDefine("DemoCode") then
    local hjh = 895;
    local jhuh = hjh + 4;
    
    if jhuh > 5 then
      return hjh;
    else
      return jhuh;
    end
  end
end