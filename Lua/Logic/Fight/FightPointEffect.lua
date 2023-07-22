FightPointEffect = {};
local this = FightPointEffect;

EFightPointStatus = {
  Processing = 1,
  Hited = 2,
  Finished = 3
}

function FightPointEffect.Donothing()
  if LuaHelper.CheckDefine("DemoCode") then
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

function FightPointEffect.GenerateBezierPath(ctrlPoints, totalNum)    --產生貝茲路徑
  local path = {};
  path.point = {};
  path.point[totalNum - 1] = ctrlPoints.point[table.Count(ctrlPoints.point) - 1];
  for i = 0, totalNum - 2 do
    path.point[i] = this.Bezier(ctrlPoints.point, i, totalNum - 1);
  end

  return path;
end

function FightPointEffect.Donothing1()
  if LuaHelper.CheckDefine("DemoCode") then
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

function FightPointEffect.Donothing2()
  if LuaHelper.CheckDefine("DemoCode") then
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

function FightPointEffect.Bezier(ctrlPoints, keyNum, totalNum)    --產生貝茲曲線某一指點定節點座標
  local k,kn,nn,nkn,n;
  local blend,muk,munk,mu;
  local iPoint = {};
  local rPoint = {x = 0, y = 0};
  n = table.Count(ctrlPoints) - 1;
  mu = keyNum / totalNum;
  muk = 1;
  munk = math.pow(1 - mu, n);

  for k = 0, n do
    nn = n;
    kn = k;
    nkn = n - k;

    blend = muk * munk;
    muk = muk * mu;
    munk = munk / (1 - mu);
    while nn >= 1 do
      blend = blend * nn;
      nn = nn - 1;

      if kn > 1 then
        blend = blend / kn;
        kn = kn - 1;
      end

      if nkn > 1 then
        blend = blend / nkn;
        nkn = nkn - 1;
      end
    end

    rPoint.x = rPoint.x + ctrlPoints[k].x * blend;
    rPoint.y = rPoint.y + ctrlPoints[k].y * blend;
  end

  iPoint.x = math.round(rPoint.x);
  iPoint.y = math.round(rPoint.y);
  return iPoint;
end

function FightPointEffect.GenerateDirection(points)             --路線產出所有點方向
  local n = table.Count(points);
  local directions = {};

  directions.dirs = {};
  for i = 0, n - 2 do
    directions.dirs[i] = this.Direction(points[i], points[i + 1]);
  end

  directions.dirs[n - 1] = this.Direction(points[n - 2], points[n - 1]);
  return directions;
end

function FightPointEffect.Donothing3()
  if LuaHelper.CheckDefine("DemoCode") then
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

function FightPointEffect.Donothing4()
  if LuaHelper.CheckDefine("DemoCode") then
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

function FightPointEffect.Donothing5()
  if LuaHelper.CheckDefine("DemoCode") then
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

function FightPointEffect.Direction(firstPoint, secondPoint)    --兩點找出一方向
  local jj,dy,dx;
  local sp;

  dx = secondPoint.x - firstPoint.x;
  dy = secondPoint.y - firstPoint.y;

  if dx == 0 then
    if dy > 0 then
      return 0;
    else
      return 4;
    end
  end

  sp = math.abs( math.floor(dy * 1000 / dx));
  
  if dx > 0 then
    if dy < 0 then
      if sp >= 2410 then
        jj = 0;
      else
        if sp >= 414 and sp < 2410 then
          jj = 1;
        else
          jj = 2;
        end
      end
    else
      if sp >= 2410 then
        jj = 4;
      else
        if sp >= 414 and sp < 2410 then
          jj = 3;
        else
          jj = 2;
        end
      end
    end
  else
    if dy < 0 then
      if sp >= 2410 then
        jj = 0;
      else
        if sp >= 414 and sp < 2410 then
          jj = 7;
        else
          jj = 6;
        end
      end
    else
      if sp >= 2410 then
        jj = 4;
      else
        if sp >= 414 and sp < 2410 then
          jj = 5;
        else
          jj = 6;
        end
      end
    end
  end

  return jj;
end

function FightPointEffect.PlayFightEffectA(rawImage, patternWidth, patternHeight, frame, path, dir, alpha, tailNum)
  local m,x,y,count,height,width,patternNO1,patternNO2;
  local status = {};
  table.insert(status, EFightPointStatus.Processing);
  count = 0;
 
  if frame < 0 then
    return status;
  end

  m = table.Count(path) - 1;
  if frame - tailNum > m then
    table.RemoveByValue(status, EFightPointStatus.Processing);
    table.insert(status, EFightPointStatus.Finished);
    return status;
  end

  height = rawImage.texture.height;
  width = rawImage.texture.width;

  for i = 0, tailNum do
    if frame - i >= 0 then
      if frame - i >= m then
        count = count + 1;
      else
        x = path[frame - i].x;
        y = path[frame - i].y;

        if width == patternWidth then
          patternNO1 = 0;
        else
          patternNO1 = dir[frame - i];
        end

        patternNO2 =  math.fmod((frame - i ), math.floor(height / patternHeight));

        rawImage.material:SetFloat("_InvisibleAlpha", alpha / 32);
        rawImage.uvRect = Rect.New(patternNO1 / 8, patternNO2 / 3, 1 / 8, 1 / 3);
        rawImage.rectTransform.anchoredPosition = Vector2.New(x - patternWidth / 2, -(y - patternHeight / 2));
      end
    end
  end

  if count == 1 then
    table.RemoveByValue(status, EFightPointStatus.Processing);
    table.insert(status, EFightPointStatus.Hited);
  end

  if count == tailNum + 1 then
    table.insert(status, EFightPointStatus.Finished);
  end

  return status;
end

function FightPointEffect.Donothing6()
  if LuaHelper.CheckDefine("DemoCode") then
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

function FightPointEffect.Donothing7()
  if LuaHelper.CheckDefine("DemoCode") then
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

function FightPointEffect.Test()
  local test = {};
  table.insert(test, EFightPointStatus.Processing);
  table.insert(test, EFightPointStatus.Hited);

  local test2 = {};
  table.insert(test2, EFightPointStatus.Processing);
  table.insert(test2, EFightPointStatus.Hited);
--  table.RemoveByValue(test, EFightPointStatus.Processing);
--  if table.Contains(test, EFightPointStatus.Processing) then
--    logError("Test has EFightPointStatus.Processing");
--  else
--    logError("Test is Nil");
--  end

--    if table.Contains(test, EFightPointStatus.Hited) then
--    logError("Test has EFightPointStatus.Hited");
--  else
--    logError("Test is Nil");
--  end


  if test == test2 then
    logError("test and test2 Equal");
  else
    logError("Not Equal");
  end
end

function FightPointEffect.Donothing8()
  if LuaHelper.CheckDefine("DemoCode") then
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

function FightPointEffect.Donothing9()
  if LuaHelper.CheckDefine("DemoCode") then
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