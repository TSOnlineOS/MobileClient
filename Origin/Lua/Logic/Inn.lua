Inn = {}
local this = Inn;

 ENpcInnStatus = {
  Common = 0, 
  Dispatch = 1,
};

--const
this.minSpace = 30;
this.maxSpace = 60;

--var
this.Lv = 0; --客棧等級
this.npcs = {};

this.currentSpace = 0;

this.warshipIndex = 0;
this.warships = {};

function Inn.SaveNpc(index, followIndex, data)
  this.npcs[index] = NpcSaveData.New();

  if data ~= nil then
    this.npcs[index].npcId = data:ReadUInt16();
    this.npcs[index].level = data:ReadByte();
    this.npcs[index].exp = data:ReadUInt32();
    this.npcs[index].hp = data:ReadUInt32();
    this.npcs[index].name = data:ReadString(data:ReadByte());
    this.npcs[index].status = data:ReadByte();
  end

  if followIndex ~= nil then
    local followNpc = Role.GetRole(EHuman.FollowNpc, Role.playerId, followIndex);
    if followNpc ~= nil then
      this.npcs[index].npcId = followNpc.npcId;
      this.npcs[index].name = followNpc.name
      this.npcs[index].hp = followNpc:GetAttribute(EAttribute.Hp);
      this.npcs[index].sp = followNpc:GetAttribute(EAttribute.Sp);
      this.npcs[index].int = followNpc:GetAttribute(EAttribute.Int);
      this.npcs[index].atk = followNpc:GetAttribute(EAttribute.Atk);
      this.npcs[index].def = followNpc:GetAttribute(EAttribute.Def);
      this.npcs[index].agi = followNpc:GetAttribute(EAttribute.Agi);
      this.npcs[index].hpx = followNpc:GetAttribute(EAttribute.Hpx);
      this.npcs[index].spx = followNpc:GetAttribute(EAttribute.Spx);
      this.npcs[index].level = followNpc:GetAttribute(EAttribute.Lv);
      this.npcs[index].exp = followNpc:GetAttribute(EAttribute.Exp);
      this.npcs[index].skillPoint = followNpc:GetAttribute(EAttribute.SkillPoint);
      this.npcs[index].dieCount = followNpc.data.dieCount;
      this.npcs[index].faith = followNpc:GetAttribute(EAttribute.Faith);

      for i = 1, Role.maxNpcSkill do
        this.npcs[index].skillLv[i] = followNpc.data.skillLv[i];
      end

      for i = 1, Role.maxEquip do
        this.npcs[index].equips[i] = Item.GetBagItem(EThings.Equip, i, followIndex);
      end

      this.npcs[index].canGrow = followNpc.data.canGrow;
    end
  end

  if Define.IsInternal() then
    if not UIDebug.RecordMode then
      this.npcs[index].name = string.Concat(this.npcs[index].name, this.npcs[index].npcId)
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

  if UI.IsVisible(UINpcInn) then
    UINpcInn.UpdateUI();
  end
end

function Inn.RemoveNpc(index)
  this.npcs[index] = nil;

  if UI.IsVisible(UINpcInn) then
    UINpcInn.UpdateUI();
  end
end

function Inn.InitWarship(data)
  this.warshipIndex = data:ReadByte();

  table.Clear(this.warships);
  while data.length > 0 do
    local index = data:ReadByte();
    local warship = {};

    warship.Id = data:ReadUInt16();
    warship.equips = {};
    for i = 1, 4 do
      warship.equips[i] = data:ReadUInt16();
    end
    warship.used = data:ReadBoolean();

    this.warships = {};
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

function Inn.AddWarship(index, npcId)
  this.warships[index] = npcId

  if npcDatas[npcId] == nil then return end

  ShowCenterMessage(string.Concat(string.Get(90123), npcDatas[npcId].name));
end

function Inn.DelWarship(index)
  if this.warshipIndex == index then
    --Player.UnLoadShip;//則清除玩家戰船資料
    this.warshipIndex = 0;
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
  this.warships[index] = 0;
end

function Inn.RefreshRoleCount(data)
  this.currentSpace = data.value + this.minSpace;
  
  if UI.IsVisible(UINpcInn) then
    UINpcInn.UpdateUI();
  end
end

function Inn.HaveNpc(npcId)
  for k, v in pairs(this.npcs) do
    if v.npcId == npcId then
      return true;
    end
  end

  return false;
end

function Inn.Clear()
  table.Clear(this.npcs);
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