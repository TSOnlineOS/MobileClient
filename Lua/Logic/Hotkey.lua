local json = require 'cjson'

EHotKeyType = {
  None = 0,
  Skill = 1,
  Item = 2,
  Fight = 3
}

-- 入口來源
EUseSource = {
  None = 0,
  SkillStree = 1,
  UIItemInfo = 2,
  UIFight = 3,
  CloseOnTurnUI = 4
}

-- 顯示模式
EHotkeyDisplayMode = {
  None = 0,
  SingleSkill = 1,
  SingleItem = 2,
  Both = 3
}

HotkeyData = {};
HotkeyData.__index = HotkeyData;

function HotkeyData.New(pageCount, btnCount)
  local self = {};
  setmetatable(self, HotkeyData);

  self.maxPages = pageCount;
  self.maxElements = btnCount;
  self.ids = {};
  for i = 1, self.maxPages do 
    for j = 1 , self.maxElements do
      self.ids[(i-1) * self.maxElements + j] = -1;
    end
  end
  return self;
end

Hotkey = {}
Hotkey.__index = Hotkey;

local this = Hotkey;
this.playerSkills = {};
this.items = {};
this.npcSkills = {};
this.currentRole = nil;
this.nextRole = nil;
this.currentDisplayMode = EHotkeyDisplayMode.None;
this.nextDisplayMode = EHotkeyDisplayMode.None;
this.isClearMode = false;
this.currentItemPage = 0;
this.currentSkillPage = 0;

function Hotkey.InitViewData(hotkeyData)
  -- logError("* Hotkey.InitViewData *");
  this.playerSkills = HotkeyData.New(hotkeyData[EHotKeyType.Skill].maxPages, hotkeyData[EHotKeyType.Skill].maxElements);
  this.playerSkills.ids = hotkeyData[EHotKeyType.Skill].ids;
  this.items = HotkeyData.New(hotkeyData[EHotKeyType.Item].maxPages, hotkeyData[EHotKeyType.Item].maxElements);
  this.items.ids = hotkeyData[EHotKeyType.Item].ids;
  this.npcSkills = HotkeyData.New(1, 5);
  this.UpdateNpcSkill();
end

function Hotkey.Show(nextRole, nextMode, defaultid)
  local sortOrder = 0;
  if defaultid == nil then 
    defaultid = -1
  end
  -- logError("* Hotkey.Show * : "..nextRole.name..", currentMode"..tostring(this.currentDisplayMode)..", nextMode : "..tostring(nextMode));

  if this.IsNeedToWait(nextMode) then
    -- logError("Hotkey.Show is NeedToWait");
    this.nextRole = nextRole;
    this.nextDisplayMode = nextMode;
  else
    -- logError("Hotkey.Show Not NeedToWait");
    if nextMode == EHotkeyDisplayMode.Both then
      sortOrder = UIFight.GetSortOrder();
      this.currentDisplayMode = nextMode;
      this.ChangeRole(nextRole, EUseSource.UIFight);
      
      if UI.IsVisible(UIHotkey) then
        UIHotkey.UpdateUI(true, sortOrder);
      else
        UI.Open(UIHotkey, defaultid, sortOrder);
      end
    elseif nextMode == EHotkeyDisplayMode.SingleItem then
      -- logError("*Hotkey.Show NextMode : EHotkeyDisplayMode.SingleItem *");
      sortOrder = UIItemInfo.GetSortOrder();
      this.currentDisplayMode = nextMode;
      this.ChangeRole(nextRole);
      
      if UI.IsVisible(UIHotkey) then
        UIHotkey.UpdateUI(true, sortOrder);
      else
        UI.Open(UIHotkey, defaultid, sortOrder);
      end 
    elseif nextMode == EHotkeyDisplayMode.SingleSkill then
      -- logError("*Hotkey.Show NextMode : EHotkeyDisplayMode.SingleSkill *");
      sortOrder = UISkillTree.GetSortOrder();
      this.currentDisplayMode = nextMode;
      this.ChangeRole(nextRole, EUseSource.UISkillTree);
  
      if UI.IsVisible(UIHotkey) then
        UIHotkey.UpdateUI(true, sortOrder);
      else
        UI.Open(UIHotkey, UISkillTree.GetCurrentClick(), sortOrder);
      end
    end
  end
end

function Hotkey.IsNeedToWait(nextMod)
  -- logError("* IsNeedToWait * : this.currentDisplayMode = "..tostring(this.currentDisplayMode).." , nextMod : "..tostring(nextMod));
  if this.currentDisplayMode == EHotkeyDisplayMode.SingleItem or this.currentDisplayMode == EHotkeyDisplayMode.SingleSkill then
    if nextMod == EHotkeyDisplayMode.Both then
      return true;
    end
  end
   return false;
end

function Hotkey.Close(who)
  -- logError("* Hotkey.Close *"..", Who : "..tostring(who));
  if not UI.IsVisible(UIHotkey) then return end;
  
  if who ~= EUseSource.UIFight then
    if this.currentDisplayMode == EHotkeyDisplayMode.SingleSkill or this.currentDisplayMode == EHotkeyDisplayMode.SingleItem then
      -- 當開技能快捷 or 物品快捷進戰鬥時，需再次打開給戰鬥快捷用
      if this.nextRole ~= nil then
        this.currentDisplayMode = EHotkeyDisplayMode.None;
        this.Show(this.nextRole, this.nextDisplayMode);
        this.nextRole = nil;
        this.nextDisplayMode = EHotkeyDisplayMode.None;
      else
        this.currentDisplayMode = EHotkeyDisplayMode.None;
        UI.Close(UIHotkey);
      end
    else
       -- 已經被戰鬥徵用，不需要在關一次
      --  logError("已經被戰鬥徵用，不需要在關一次");
    end
  elseif who == EUseSource.UIFight then
    -- 戰鬥結束
    this.nextRole = nil

    if this.currentDisplayMode == EHotkeyDisplayMode.Both then
      this.currentDisplayMode = EHotkeyDisplayMode.None;
      UI.Close(UIHotkey);
    else return end;
  elseif who == EUseSource.CloseOnTurnUI then
    -- 戰鬥回合
    if this.currentDisplayMode == EHotkeyDisplayMode.Both then
      this.currentDisplayMode = EHotkeyDisplayMode.None;
      UI.Close(UIHotkey);
    else return end;
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
end

function Hotkey.UpdateNpcSkill()
  if this.currentRole == nil or this.currentRole.kind == EHuman.Player then return end;

  local data = HotkeyData.New(2, 5);
  local i = 0;
  local skills = this.currentRole:GetElementSkill(0);

  for k, v in pairs(skills) do
    local skilldata = skillDatas[v.Id];
    if skilldata ~= nil and skilldata:CanUse() then 
      i = i + 1;
      data.ids[i] = v.Id;
    end
  end
  
  this.npcSkills = data;
end

function Hotkey.ChangeRole(nextRole, useSource)
  
  -- logError("* Hotkey.ChangeRole * : "..tostring(nextRole.name));

  if nextRole == nil then return end;

  this.currentRole = nextRole;
  this.UpdateNpcSkill();
  
  if UI.IsVisible(UIHotkey) then
    UIHotkey.UpdateUI(true);
  end
end

function Hotkey.GetLv(id)
  if this.currentRole ~= nil then
    -- 分身上沒有技能等級，要從玩家身上拿資料
      if this.currentDisplayMode == EHotkeyDisplayMode.Both then
        if this.CheckIsDivide(this.currentRole.kind) or this.CheckKindIsPlayer(this.currentRole.kind) then
          return Role.player:GetSkillLv(id);
        else
          return this.currentRole:GetSkillLv(id, true);
          --return Role.fightNpc:GetSkillLv(id);
        end
      else
        return this.currentRole:GetSkillLv(id, true);
      end
  else
    return 0;
  end
end

function Hotkey.CanBeSet(id, hotKeyType)
  -- logError("* Hotkey.CanBeSet *, id : "..id..", hotKeyType : "..tostring(hotKeyType));

  if id > -1 then
    if hotKeyType == EHotKeyType.Skill and this.currentDisplayMode == EHotkeyDisplayMode.SingleSkill then
      if this.currentRole.kind == EHuman.Player then
        -- 只有玩家才能使用設定 or 清除功能
        if this.isClearMode then
          return true;
        else
          if this.IsSummonSkill(id) then
            return this.currentRole ~= nil and skillDatas[id] ~= nil and this.currentRole:GetSkillLv(id) > 0;
          else
            return this.currentRole ~= nil and skillDatas[id] ~= nil and this.currentRole:GetSkillLv(id) > 0 and skillDatas[id]:CanUse();
          end
        end
      end
    elseif hotKeyType == EHotKeyType.Item and this.currentDisplayMode == EHotkeyDisplayMode.SingleItem then
      if this.isClearMode then
        return true;
      else
        return Item.CheckHotKeyItemID(id);
      end
    end
  end

  return false;
end

function Hotkey.CanBeClear(pageIndex, btnIndex, id, hotKeyType)
  if hotKeyType == EHotKeyType.Skill then
    return this.playerSkills.ids[this.GetDataIndex(pageIndex, this.playerSkills.maxElements, btnIndex)] > 0;
  elseif hotKeyType == EHotKeyType.Item then
    return  this.items.ids[this.GetDataIndex(pageIndex, this.items.maxElements, btnIndex)] > 0;
  else
    return false;
  end
end

function Hotkey.OnSettingHotkey(pageIndex, btnIndex, id, hotKeyType)
  -- logError("* Hotkey.OnSettingHotkey * 不能使用:-1 清除技能:0");

  if this.isClearMode then
    if Hotkey.CanBeClear(pageIndex, btnIndex, id, hotKeyType) then
      id = 0;
    else
      id = -1
    end
  end
  
  if this.CanBeSet(id, hotKeyType) then
    -- 2: 設定快捷列 <SubKind(1)[1.技能快捷 2.物品快捷] + 技能頁(1) + 位置索引(1) + ID(2)>
    sendBuffer:Clear();
    sendBuffer:WriteByte(hotKeyType);
    sendBuffer:WriteByte(pageIndex);
    sendBuffer:WriteByte(btnIndex);
    sendBuffer:WriteUInt16(id);
    Network.Send(40, 2, sendBuffer);
    
    -- 延遲關閉
    if hotKeyType == EHotKeyType.Item and this.isClearMode == false then
      CGTimer.DoFunctionDelay(0.2, this.WaitToCloseUI);
    end
  end
end

function Hotkey.WaitToCloseUI()
  if UI.IsVisible(UIHotkey) then
    this.Close(EUseSource.None);
  end
end

function Hotkey.OnSettingFinsh()

  if UI.IsVisible(UIHotkey) then
    UIHotkey.UpdateUI();
  end

  if UI.IsVisible(UIItemInfo) and this.isClearMode == false then
    UI.Close(UIItemInfo);
  end

end

-- 招換技能 
function Hotkey.IsSummonSkill(id)
  return Contains(id , 14026, 14077);
end

-- 招換技能 使用
function Hotkey.GetUseSummonSkill(id)
  if this.IsSummonSkill (id) then
    if this.CheckIsDivide(this.currentRole.kind) or this.CheckKindIsPlayer(this.currentRole.kind) then
      -- 分身 or Player
      if not ItemData.IsSummonItem(Role.player.data.equips[EItemFitType.Equip_Spec]) then --沒裝紋章的話
        return id;
      else
        if id == 14026 then 
          return Skill.GetSummonSkill(Role.player:GetAttribute(EAttribute.Element));
        else
          if ItemData.IsLightDarkSummonItem(Role.player.data.equips[EItemFitType.Equip_Spec]) then
            if Role.player:GetAttribute(EAttribute.Turn3Element) == 7 then 
              if Contains(Role.player.data.equips[EItemFitType.Equip_Spec], 23361, 23367) then          
                return Skill.GetSummonSkill(Role.player:GetAttribute(EAttribute.Turn3Element));
              end
            else            
              if Contains(Role.player.data.equips[EItemFitType.Equip_Spec], 23362, 23368) then          
                return Skill.GetSummonSkill(Role.player:GetAttribute(EAttribute.Turn3Element));
              end        
            end          
            return 14077;          
          end
        end
      end
    else
      if not ItemData.IsSummonItem(this.currentRole.data.equips[EItemFitType.Equip_Spec]) then --沒裝紋章的話
        return id;
      else
        return Skill.GetSummonSkill(this.currentRole:GetAttribute(EAttribute.Element));
      end
    end
  else
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
    return id;
  end
end

function Hotkey.CheckSkillElement(skillId, inUI)
  local skill = skillDatas[skillId];
  if skill ~= nil then 
    local role = nil;
    if inUI then 
      role = this.currentRole;
    else    
      role = UIFight.GetRole();
      if role == nil then 
        return false;
      end
    end

    --判斷光暗
    if Contains(role.kind, EHuman.Player, EHuman.Players) and Contains(skill.element, 7, 8) then 
      if role:GetAttribute(EAttribute.Turn3Element) ~= skill.element then 
        return false;
      end
    end
  end
  
  return true;
end

function Hotkey.CheckCanUseSkill(skillId)  
  local skill = skillDatas[skillId];
  if skill ~= nil then 
    local role = UIFight.GetRole();
    if role == nil then 
      return false;
    end

    if skill.requireSp <= role:GetAttribute(EAttribute.Sp) then 
      return true;      
    end
  end
  
  return false;
end

function Hotkey.OnUseHotKey(id, hotKeyType)
  -- logError("* Hotkey.OnUseHotKey * ".. "id : "..tostring(id)..", HotkeyType : "..tostring(hotKeyType));
  if id == -1 then return end
  if hotKeyType == EHotKeyType.Skill then

    if this.GetLv(id) > 0 then

      -- 如果是招換技需要轉換skillid
      id = this.GetUseSummonSkill(id);

      if not this.CheckSkillElement(id) then         
        return;
      end

      if this.CheckCanUseSkill(id) then
        FightField.SetConSkill(id);
      else
        ShowCenterMessage(string.Get(40032));
      end

    else
      ShowCenterMessage(string.Get(20888));
    end
  else 
    if Item.GetItemCount(id) > 0 then
      FightField.SetConItem(id);
    else
      ShowCenterMessage(string.Get(20363));
    end
  end
end

function Hotkey.CheckIsDivide(kind)
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
  return kind == EHuman.Divide or kind == EHuman.Duplicate;
end

function Hotkey.CheckKindIsPlayer(kind)
  return kind == EHuman.Player;
end

function Hotkey.GetViewData(hotKeyType)
  -- logError("* Hotkey.GetViewData *");

  if hotKeyType == EHotKeyType.Skill then
    if this.currentRole ~= nil then
      -- 分身 跟 玩家使用同一份資料
      if this.CheckKindIsPlayer(this.currentRole.kind) or this.CheckIsDivide(this.currentRole.kind) then
        return this.playerSkills;
      else
        return this.npcSkills;
      end
    else
      -- Skill資料有問題時給一筆空的
      return HotkeyData.New(1, 5);
    end
  elseif hotKeyType == EHotKeyType.Item then
    return this.items;
  end
  
  -- item資料有問題時給一筆空的
  return HotkeyData.New(1, 3);
end

function Hotkey.GetDataIndex(pageIndx, maxElements, btnIndex)
  return (pageIndx - 1) * maxElements + btnIndex;
end

function Hotkey.SetPage(type, pageIndex)
  if type == EHotKeyType.Item then
    this.currentItemPage = pageIndex;
  elseif type == EHotKeyType.Skill then
    if this.currentRole ~= nil and this.currentRole.kind == EHuman.Player then
      this.currentSkillPage = pageIndex;
    end
  end
end

function Hotkey.GetPage(type)
  if type == EHotKeyType.Item then
   return this.currentItemPage;
  elseif type == EHotKeyType.Skill then
    if this.currentRole ~= nil and this.currentRole.kind == EHuman.Player then
      return this.currentSkillPage;
    else
      return 0;
    end
  end

  return 0;
end

function Hotkey.UseClearMode(setTrigger)
  if setTrigger ~= nil then
    this.isClearMode = setTrigger;
  else
    this.isClearMode = not this.isClearMode;
  end
end

function Hotkey.IsPlayer()
  if this.currentRole ~= nil and this.currentRole.kind == EHuman.Player then
    return true;
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
  return false;
end


