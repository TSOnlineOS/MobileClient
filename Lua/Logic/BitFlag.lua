EBitFlag = {
  Login = 1,          --每日登入
  Announcement = 13,  --公告
  Back = 1517,        --消費返利
  LimitedTimeSale1 = 7126, --限時優惠
  LimitedTimeSale2 = 7292,
  LimitedTimeSale3 = 7293,
  LimitedTimeSale4 = 7294,
  LimitedTimeSale5 = 7295,
}

BitFlag = {}
local this = BitFlag;

local foreverFlags = {}; --永標

function BitFlag.Init(data)
  --S:081-002 <全部永標> +Size(2) +永標陣列(?)
  local count = data:ReadUInt16();
  for i = 1, count do
    foreverFlags[i] = data:ReadByte();
  end

  Mounts.UpdateCollection();
  UICollectBook.CheckWarriorRedDot();
  Organization.UpdateSignRedDot();
  BattlePass.UpdateRedDot();
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
end

function BitFlag.Get(flagId)
  return CheckFlag(foreverFlags, flagId);
end

function BitFlag.Set(flagId, value)
  if Between(flagId, 3201, 6000) then
    for k, v in pairs(collectWarriorDatas)do
      if flagId == v.getFlag and not BitFlag.Get(v.getFlag) and v.shineValue > 0 then
        ShowCenterMessage(string.format(string.Get(23825), v.shineValue));
      end
    end
  end
  
  foreverFlags = SetFlag(foreverFlags, flagId, value);

  if Between(flagId, 1001, 1299) then
    Mounts.OnGetCollection(flagId);
  
    UICollectBook.CheckNFTMountsRedDot();
  end

  if Between(flagId, 1600, 3000) or Between(flagId, 3201, 6000) then
    UICollectBook.CheckWarriorRedDot();
  end

  if Between(flagId, 3001, 3200) then
    CollectCard.AddCollectCardSortRedDot(flagId);
    UICollectBook.CheckCardSortRedDot();
  end

  if Between(flagId, 1490, 1499) then
    NotifyManager.Notify("CheckCondition", ECondition.Flag);
  end

  if flagId == 14 then
    Organization.UpdateSignRedDot();
  end
  
  if flagId == 6060 then
    BattlePass.UpdateRedDot();
    if UI.IsVisible(UIBattlePass) then
      UIBattlePass.UpdateUI();
    end
  end
end
