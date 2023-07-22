Marry = {}
local this = Marry;

this.partnerId = 0; --伴侶ID
this.partner = nil; --伴侶資料(PlayerInfo)
this.marryDate = nil; --結婚日期
this.celebrationLv = 0; --婚禮等級

this.partners = {};

function Marry.AddThree2(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function Marry.AddThree(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function Marry.AddPartner(roleAId, roleBId)
  if LuaHelper.CheckDefine("DemoCode") then
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      human = satan + haven;
    else
      human = satan - haven;
    end
    local meaningless = 45;
    local shift = 2;
    local result = 0;
    bit.rshift(meaningless, shift)
    bit.lshift(meaningless, shift)
    if bit.band(meaningless,45) == 45 then
      result = meaningless * shift;
    end
    local faith = 0;
    for i = 1, 3 do
      faith = faith + i;
    end
  
    if faith > 10 then
      faith = 10;
    else
      faith = faith + 10;
    end
  
    local nothing = {};
    local nthing = {};
    for i = 1, 10 do
      table.insert(nothing, i, 100)
    end
    if table.Count(nothing) ~= 0 then
      for k,v in ipairs(nothing) do
        table.insert(nthing, v)
      end
    end
  end
end

function Marry.ShowFirework(x, y, interval)
  if interval == nil then
    interval = 80;
  end

  if interval < 76 then return end
  
  local effectLight = nil;

  effectLight = EffectLight.New(10001, 30, 15, 1, 15, EEffectLightTracer.StandAni, x, y + 87, 10, nil, nil, nil, nil, nil, nil, true);
  effectLight:SetSortingOrder(MapManager.mapHeight);

  effectLight = EffectLight.New(10248, interval, 1, 6, 6, EEffectLightTracer.StandAni, x + 6, y, 255, false, 68, nil, nil, nil, nil, true);
  effectLight:SetSortingOrder(MapManager.mapHeight);
  effectLight.endCallback = function(self)
    this.ShowFirework(x + math.random(-50, 50), y + math.random(-50, 50), self.interval - 1);
  end
end

function Marry.AddThreea(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end

function Marry.AddThreeB(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = 0;
    LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd;
  end
end