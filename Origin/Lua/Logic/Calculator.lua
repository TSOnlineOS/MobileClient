Calc = {}
local this = Calc;

local w1 = 0;
local w2 = 0;
local w3 = 0;
local w4 = 0;
local w5 = 0;
local w6 = 0;
local w7 = 0;
local w9 = 0;
local w10 = 0;
local w13 = 0;
local w14 = 0;
local w15 = 0;
local w16 = 0;
local w20 = 0;
local w21 = 0;
local w25 = 0;
local w28 = 0;
local w30 = 0;
local w31 = 0;
local w35 = 0;
local w36 = 0;
local extraExp = 0;
local baseHp = 0;
local baseSp = 0;
local w37 = 0;
local w40 = 0;
local w38 = 0;
local w39 = 0;
local w45 = 0;
local w50 = 0;
local w51 = 0;
local attAgiScope = 0;
local ran = 0;

local pracExtraValue = 20 --修行加成值
local pracMaxLv = 200; --最大修練等級
local pracExpDatas = {}; --修煉經驗表
local lastSummary = 0;
local lastShineAtts = {};

function Calc.Initialize(reader)
  w1 = reader:ReadDouble();
  w2 = reader:ReadDouble();
  w3 = reader:ReadDouble();
  w4 = reader:ReadDouble();
  w5 = reader:ReadDouble();
  w6 = reader:ReadDouble();
  w7 = reader:ReadDouble();
  w9 = reader:ReadDouble();
  w10 = reader:ReadDouble();
  w13 = reader:ReadDouble();
  w14 = reader:ReadDouble();
  w15 = reader:ReadDouble();
  w16 = reader:ReadDouble();
  w20 = reader:ReadDouble();
  w21 = reader:ReadDouble();
  w25 = reader:ReadDouble();
  w28 = reader:ReadDouble();
  w30 = reader:ReadDouble();
  w31 = reader:ReadDouble();
  w35 = reader:ReadDouble();
  w36 = reader:ReadDouble();
  extraExp = reader:ReadInt32();
  baseHp = reader:ReadUInt16();
  baseSp = reader:ReadUInt16();
  w37 = reader:ReadDouble();
  w40 = reader:ReadDouble();
  w38 = reader:ReadDouble();
  w39 = reader:ReadDouble();
  w45 = reader:ReadDouble();
  w50 = reader:ReadDouble();
  w51 = reader:ReadDouble();
  attAgiScope = reader:ReadUInt16();
  ran = reader:ReadByte();

  local lastExp = 0;
  for i = 1, pracMaxLv do
    lastExp = lastExp + (math.round(math.pow(i, 3)) + pracExtraValue);

    pracExpDatas[i] = lastExp;
  end
end

function Calc.GetHonor(value)
  return value;
end

function Calc.GetPracLv(exp)
  for i = 1, pracMaxLv do
    if exp < pracExpDatas[i] then
      return i;
    end
  end

  return pracMaxLv;
end

function Calc.GetPracNeedExp(level)
  return pracExpDatas[level];
end

function Calc.GetMaxHp(role, level, hpx, equipMaxHp, extraHp, turn, career, turn3Lv, isNpc)
  local result = 0;
  local percent = 0;

  if role ~= nil then
    level = role:GetAttribute(EAttribute.Lv);
    hpx = role:GetAttribute(EAttribute.Hpx) + role:GetAttribute(EAttribute.EquipHpx);
    equipMaxHp = role:GetAttribute(EAttribute.EquipMaxHp);
    extraHp = 0;
    turn = role:GetAttribute(EAttribute.Turn);
    career = role:GetAttribute(EAttribute.Career);
    percent = role:GetAttribute(EAttribute.HpPercent);

    if turn >= 3 then
      turn3Lv = level - Role.playerMaxLv;
      level = Role.playerMaxLv;
    else
      turn3Lv = 0;
    end
  end

  if role ~= nil and role.kind == EHuman.Player then
    local shineAtts = Calc.GetCollectNFT();
    --BUFF加成
    hpx = hpx + role:GetAttribute(EAttribute.Buff, EAttribute.EquipHpx);
    --增益狀態加成
    hpx = hpx + DrugBuff.GetAttribute(EDrugAttribute.Hpx);    
    --七星命盤加成
    hpx = hpx + math.round(Astrolabe.GetAttribute(EAstrolabeAttribute.Hpx));
    --三轉加成
    if turn == 3 then
      hpx = hpx + math.min(turn3Lv, 70);
    end
    hpx = hpx + role:GetAttribute(EAttribute.Turn3Hpx);
    --收集測:時裝加成
    hpx = hpx + CollectStyle.GetAttribute(EAttribute.Hpx);
    --收集測:卡片加成
    hpx = hpx + CollectCard.GetAttribute(EAttribute.Hpx);
    --NFT
    if shineAtts[EAttribute.Hpx] ~= nil then
      hpx = hpx + shineAtts[EAttribute.Hpx];
    end

    --官階加成
    equipMaxHp = equipMaxHp + RankData.GetAttribute(role:GetAttribute(EAttribute.BattleHonor), EAttribute.EquipMaxHp);
    --永丹加成
    extraHp = extraHp + role.data.hpPillCount * Role.hpPillAdd;
    --座騎加成
    extraHp = extraHp + math.floor((Mounts.GetAttribute(EAttribute.ExtraHp) + Mounts.GetAttribute(EAttribute.EquipMaxHp)) * Mounts.collectionBonus);
  elseif role ~= nil and role.kind == EHuman.FollowNpc then
    --增益狀態加成
    hpx = hpx + DrugBuff.GetAttribute(EDrugAttribute.Hpx);
    --收集測:時裝加成
    hpx = hpx + CollectStyle.GetAttribute(EAttribute.Hpx);
    --收集測:卡片加成
    hpx = hpx + CollectCard.GetAttribute(EAttribute.Hpx);
    --永丹加成
    extraHp = extraHp + role.data.hpPillCount * Role.hpPillAdd;
    if turn == 2 then
      turn = 1;
    else
      turn = 0;
    end

  elseif isNpc or (role ~= nil and role.kind ~= EHuman.Players) then
    if turn == 2 then
      turn = 1;
    else
      turn = 0;
    end
  end
  
  hpx = math.max(0, hpx);

  if turn == 0 then
    result = math.round(w35 * level + w36 * hpx * math.pow(level, w37)) + baseHp + 2 * hpx + equipMaxHp + extraHp;
  elseif turn == 1 then
    result = math.round(w35 * level + w36 * hpx * math.pow(level, w37)) + 180  + 4 * hpx + equipMaxHp + extraHp;
  elseif turn == 2 then
    if career == ECareer.XiaKe then
      --=1 * 50 + 2.5 * A2 * 50^0.35 + 280 + 25 * A2
      result = math.round(w35 * level + 2.5 * hpx * math.pow(level, 0.35)) + 280 + 25 * hpx +  equipMaxHp + extraHp;
    elseif career == ECareer.BaWang then
      --=1 * 50 + 3 * A2 * 50^0.35 + 380 + 30 * A2
      result = math.round(w35 * level + 3 * hpx * math.pow(level, 0.35)) + 380 + 30 * hpx +  equipMaxHp + extraHp;
    elseif career == ECareer.XianShi then
      --=1 * 50 + 2 * A2 * 50^0.35 + 180 + 23 * A2
      result = math.round(w35 * level + 2 * hpx * math.pow(level, 0.35)) + 180 + 23 * hpx +  equipMaxHp + extraHp;
    elseif career == ECareer.DiXian then
      --=1 * 50 + 2 * A2 * 50^0.35 + 180 + 21 * A2
      result = math.round(w35 * level + 2 * hpx * math.pow(level, 0.35)) + 180 + 21 * hpx +  equipMaxHp + extraHp;
    end
  elseif turn == 3 then
    if career == ECareer.XiaKe then
        --=1 * 50 + 2.5 * A2 * 50^0.35 + 280 + 25 * A2
      result = math.round(w35 * level + 2.5 * hpx * math.pow(level, 0.35)) + 280 + 25 * hpx +  equipMaxHp + extraHp;
    elseif career == ECareer.BaWang then
      --=1 * 50  + 3 * A2 * 50^0.35 + 380 + 30 * A2
      result = math.round(w35 * level + 3 * hpx * math.pow(level, 0.35)) + 380 + 30 * hpx +  equipMaxHp + extraHp;
    elseif career == ECareer.XianShi then
      --=1 * 50 + 2 * A2 * 50^0.35 + 180 + 23 * A2
      result = math.round(w35 * level + 2 * hpx * math.pow(level, 0.35)) + 180 + 23 * hpx +  equipMaxHp + extraHp;
    elseif career == ECareer.DiXian then
      --=1 * 50 + 2 * A2 * 50^0.35 + 180 + 21 * A2
      result = math.round(w35 * level + 2 * hpx * math.pow(level, 0.35)) + 180 + 21 * hpx +  equipMaxHp + extraHp;
    end
    
    if turn3Lv > 140 then
      result = result + math.min((turn3Lv - 140), 60) * 5;
    end
    
    if turn3Lv > 90 then
      result = result + math.min((turn3Lv - 90), 50) * 10;
    end
    
    if turn3Lv > 70 then
      result = result + math.min((turn3Lv - 70), 20) * 25;
    end
  end
  
  result = math.floor(result * (100 + percent) * 0.01);

  return math.max(1, result);
end

function Calc.GetMaxSp(role, level, spx, equipMaxSp, extraSp, turn, career, turn3Lv, isNpc)
  local result = 0;
  local percent = 0;

  if role ~= nil then
    level = role:GetAttribute(EAttribute.Lv);
    turn = role:GetAttribute(EAttribute.Turn);
    career = role:GetAttribute(EAttribute.Career);
    spx = role:GetAttribute(EAttribute.Spx) + role:GetAttribute(EAttribute.EquipSpx);
    extraSp = 0;
    equipMaxSp = role:GetAttribute(EAttribute.EquipMaxSp);
    percent = role:GetAttribute(EAttribute.SpPercent);

    if turn >= 3 then
      turn3Lv = level - Role.playerMaxLv;
      level = Role.playerMaxLv;
    else
      turn3Lv = 0;
    end
  end

  if role ~= nil and role.kind == EHuman.Player then
    local shineAtts = Calc.GetCollectNFT();
    --BUFF加成
    spx = spx + role:GetAttribute(EAttribute.Buff, EAttribute.EquipSpx);
    --增益狀態加成
    spx = spx + DrugBuff.GetAttribute(EDrugAttribute.Spx);
    --七星命盤加成
    spx = spx + math.round(Astrolabe.GetAttribute(EAstrolabeAttribute.Spx));
    --三轉加成
    if turn == 3 then
      spx = spx + turn3Lv;
    end
    spx = spx + role:GetAttribute(EAttribute.Turn3Spx);
    --收集測:卡片加成
    spx = spx + CollectCard.GetAttribute(EAttribute.Spx);
    --NFT
    if shineAtts[EAttribute.Spx] ~= nil then
      spx = spx + shineAtts[EAttribute.Spx];
    end
    --收集測:時裝加成
    spx = spx + CollectStyle.GetAttribute(EAttribute.Spx);    
    --官階加成
    equipMaxSp = equipMaxSp + RankData.GetAttribute(role:GetAttribute(EAttribute.BattleHonor), EAttribute.EquipMaxSp);
    --永丹加成
    extraSp = extraSp + role.data.spPillCount * Role.spPillAdd;
    --座騎加成
    extraSp = extraSp + math.floor((Mounts.GetAttribute(EAttribute.ExtraSp) + Mounts.GetAttribute(EAttribute.EquipMaxSp)) * Mounts.collectionBonus);
  elseif role ~= nil and role.kind == EHuman.FollowNpc then
    --增益狀態加成
    spx = spx + DrugBuff.GetAttribute(EDrugAttribute.Spx);
    --收集測:卡片加成
    spx = spx + CollectCard.GetAttribute(EAttribute.Spx);
    --收集測:時裝加成
    spx = spx + CollectStyle.GetAttribute(EAttribute.Spx);    
    --永丹加成
    extraSp = extraSp + role.data.spPillCount * Role.spPillAdd;
    if turn == 2 then
      turn = 1;
    else
      turn = 0;
    end

  elseif isNpc or (role ~= nil and role.kind ~= EHuman.Players) then
    if turn == 2 then
      turn = 1;
    else
      turn = 0;
    end
  end
    
  spx = math.max(0, spx);

  if turn == 0 then
    result = math.round(w38 * level + w39 * spx * math.pow(level, w40)) + baseSp + equipMaxSp + extraSp;
  elseif turn == 1 then
    result = math.round(w38 * level + w39 * spx * math.pow(level, w40)) + 110 + equipMaxSp + extraSp;
  elseif turn == 2 then
    if career == ECareer.XiaKe then
      --=1 * 50 + 2 * A3 * 50^0.25 + 160
      result = math.round(w38 * level + 2 * spx * math.pow(level, 0.25)) + 160 + equipMaxSp + extraSp;
    elseif career == ECareer.BaWang then
      --=1 * 50 + 2 * A3 * 50^0.25 + 160
      result = math.round(w38 * level + 2 * spx * math.pow(level, 0.25)) + 160 + equipMaxSp + extraSp;
    elseif career == ECareer.XianShi then
      --1 * 50 + 3 * A3 * 50^0.25 + 310
      result = math.round(w38 * level + 3 * spx * math.pow(level, 0.25)) + 310 + equipMaxSp + extraSp;
    elseif career == ECareer.DiXian then
      --=1 * 50 + 3.5 * A3 * 50^0.25 + 410
      result = math.round(w38 * level + 3.5 * spx * math.pow(level, 0.25)) + 410 + equipMaxSp + extraSp;
    end
  elseif turn == 3 then
    if career == ECareer.XiaKe then
      --=1 * 50 + 2 * A3 * 50^0.25 + 160
      result = math.round(w38 * level + 2 * spx * math.pow(level, 0.25)) + 160 + equipMaxSp + extraSp;
    elseif career == ECareer.BaWang then
      --=1 * 50 + 2 * A3 * 50^0.25 + 160
      result = math.round(w38 * level + 2 * spx * math.pow(level, 0.25)) + 160 + equipMaxSp + extraSp;
    elseif career == ECareer.XianShi then
      --1 * 50 + 3 * A3 * 50^0.25 + 310
      result = math.round(w38 * level + 3 * spx * math.pow(level, 0.25)) + 310 + equipMaxSp + extraSp;
    elseif career == ECareer.DiXian then
      --=1 * 50 + 3.5 * A3 * 50^0.25 + 410
      result = math.round(w38 * level + 3.5 * spx * math.pow(level, 0.25)) + 410 + equipMaxSp + extraSp;
    end
  end
  
  result = math.floor(result * (100 + percent) * 0.01);
  
  return math.max(1, result);
end

function Calc.GetNeedTExp(level, turn)
  result = 0;
  for i = 1, level do
    result = result + this.GetUpExp(i, turn);
  end
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    for i = 1, 3 do
      DemoCode.SetColorNum(i);
    end
    local area =  DemoCode.CalTriangleArea(1, 1);
    local currentOptio = area;
    local currentOption = string.Get(10055);
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  return result;
end

function Calc.GetUpExp(level, turn)
  --升級Exp = Lv^w28 + ExtraExp
  if turn == 0 then
    return math.trunc(SimpleRoundTo(math.pow(level, w28))) + extraExp;
  elseif turn == 1 then
    return math.trunc(SimpleRoundTo(math.pow(level, 3.1))) + extraExp;
  elseif turn == 2 then
    return math.trunc(SimpleRoundTo(math.pow(level, 3.24))) + extraExp;
  elseif turn == 3 then
    --[[return math.trunc(SimpleRoundTo(math.pow(math.min(level, 62), 3.85))) + 
           math.trunc(SimpleRoundTo(math.logN(300, math.max(level - 61, 1)) * 100000 * 20)) + 
           600000;]]
    if level <= 0 then
      return 1; 
    end
    return math.round(math.round(math.pow((level % 60), 3.85))*math.pow(math.trunc(level / 60)+1.2, 1.6)
          + 1400000*math.pow(math.trunc(level / 60)+0.5, 2.6));       
  else
    return math.trunc(SimpleRoundTo(math.pow(level, 3))) + extraExp;
  end
end

function Calc.GetCollectNFT()
  local summary = UICollectBook.GetSummary();
  local shineAtts = {};
  
  if lastSummary == summary then
     return lastShineAtts;
  end
  
  for k, v in pairs(collectStyleValueDatas)do
    if v.nft == 1 and summary >= v.score then
      for i = 1, 4 do
        if v.attribute[i].kind > 0 then
          if shineAtts[v.attribute[i].kind] ~= nil then
            shineAtts[v.attribute[i].kind] = shineAtts[v.attribute[i].kind] + v.attribute[i].value;
          else
            shineAtts[v.attribute[i].kind] = v.attribute[i].value;
          end
        end
      end
    end
  end
  
  lastSummary = summary;
  lastShineAtts = shineAtts;
  
  return shineAtts;
end