--計算專武數值
ExclusiveWeapon = {};
ExclusiveWeapon.__index = ExclusiveWeapon;
local this = ExclusiveWeapon;
local lastEnhance = nil;

function ExclusiveWeapon.GetSkill(id, lv)
  if exclusiveWeaponDatas[id] ~= nil and exclusiveWeaponDatas[id][lv] ~= nil then
    return exclusiveWeaponDatas[id][lv].skillId, exclusiveWeaponDatas[id][lv].skillLv;
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

function ExclusiveWeapon.GetBaseAttribute(id, lv)
  local att = {};
  if exclusiveWeaponDatas[id] ~= nil and exclusiveWeaponDatas[id][lv] ~= nil then
    for i = 1, 2 do 
      local data = exclusiveWeaponDatas[id][lv].att[i];
      if att[data.kind] == nil then 
        att[data.kind] = 0;
      end
      att[data.kind] = att[data.kind] + data.value;
    end    
  end
  return att;
end

function ExclusiveWeapon.GetAttributeText(id, itemSave)
  local result = "";
  local lv = 0;
  if itemSave ~= nil then 
    lv = itemSave.enhanceLv;
  end
  local att = this.GetBaseAttribute(id, lv);
  for k, v in pairs(att)do
    local attributeText = nil;
    if k== 25 then
      attributeText = string.Get(20346);
    elseif k== 26 then
      attributeText = string.Get(20347);
    elseif k== 207 then
      attributeText = string.Get(20348);
    elseif k== 208 then
      attributeText = string.Get(20349);
    elseif k== 210 then
      attributeText = string.Get(20350);
    elseif k== 211 then
      attributeText = string.Get(20351);
    elseif k== 212 then
      attributeText = string.Get(20352);
    elseif k== 214 then
      attributeText = string.Get(20353);
    elseif k== 217 then
      attributeText = string.Get(90136);
    elseif k== 218 then
      attributeText = string.Get(20040); --體質
    elseif k== 219 then
      attributeText = string.Get(20041); --能量
    elseif k== 64 then
      attributeText = string.Get(10406); --忠誠
    end
      
    if attributeText ~= nil then
      if v > 100 then
        if not string.IsNullOrEmpty(result) then
          result = string.Concat(result, "\n");
        end

        local tempStr = string.Concat(attributeText, " +", (v - 100));
        result = string.Concat(result, string.GetColorText(tempStr, Color.ItemAtt));

      elseif v < 100 then
        if not string.IsNullOrEmpty(result) then
          result = string.Concat(result, "\n");
        end

        local tempStr = string.Concat(attributeText, " ", (v - 100));
        result = string.Concat(result, string.GetColorText(tempStr, Color.ItemAtt));
      end
    end
  end

  local elementStr = nil;
  if exclusiveWeaponDatas[id] ~= nil and exclusiveWeaponDatas[id][lv] ~= nil then
    local data = exclusiveWeaponDatas[id][lv];
    if data.element ~= 0 and data.elementValue ~= 0 then 
      if Between(data.element, 1, 8) then
        local elementName = "";
        local color = Color.Black;

        elementName ,color = Item.GetElementName(data.element);
        elementStr = string.Concat(string.Get(20354), elementName);

        local value = 0;
        if data.elementValue > 100 then
          value = data.elementValue - 100;
        end

        if value > 0 then
          elementStr = string.GetColorText(string.Concat(elementStr, "+", (value)), color);
          result = string.Concat(result, "\n", elementStr);
        end
      end
    end
  end


  return result;
end

function ExclusiveWeapon.GetEnhanceText(id, itemSave, rightWarrior)  
  if exclusiveWeaponDatas[id] == nil then 
    return nil;
  end
  local lv = 1;
  if itemSave ~= nil then 
    lv = itemSave.enhanceLv;
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
  local result = "";
  result = string.format(string.Get(22699), lv); 
  if not string.IsNullOrEmpty(result) then
    result = string.Concat(result);
  end

  if exclusiveWeaponDatas[id] ~= nil then
    for k,v in pairs(exclusiveWeaponDatas[id])do 
      local data = v.plusAtt;
      if data.kind ~= 0 and data.value ~= 0 then 
        local tempStr = string.format(string.Get(22700), k);
        if data.value ~= 0 and data.value ~= 100 then
          local attributeText = nil;
          if data.kind== 25 then
            attributeText = string.Get(20346);
          elseif data.kind== 26 then
            attributeText = string.Get(20347);
          elseif data.kind== 207 then
            attributeText = string.Get(20348);
          elseif data.kind== 208 then
            attributeText = string.Get(20349);
          elseif data.kind== 210 then
            attributeText = string.Get(20350);
          elseif data.kind== 211 then
            attributeText = string.Get(20351);
          elseif data.kind== 212 then
            attributeText = string.Get(20352);
          elseif data.kind== 214 then
            attributeText = string.Get(20353);
          elseif data.kind== 217 then
            attributeText = string.Get(90136);
          elseif data.kind== 218 then
            attributeText = string.Get(20040); --體質
          elseif data.kind== 219 then
            attributeText = string.Get(20041); --能量
          elseif data.kind== 64 then
            attributeText = string.Get(10406); --忠誠
          end
          
          if attributeText ~= nil then            
            if data.value > 100 then
              tempStr = string.Concat(tempStr, attributeText, " +", (data.value - 100));
            elseif data.value > 100 then
              tempStr = string.Concat(tempStr, attributeText, " ", (data.value - 100));
            end

            if rightWarrior and lv >= k then 
              tempStr = string.GetColorText(tempStr, Color.ItemAtt);
            else
              tempStr = string.GetColorText(tempStr, Color.Gray);
            end

            if not string.IsNullOrEmpty(result) then
              result = string.Concat(result, "\n");
            end              
            result = string.Concat(result, tempStr);          
          end
        end
      end
    end    
  end
  return result;
end

function ExclusiveWeapon.GetPlusAttribute(id, lv) --取得所有等級加成
  local att = {};
  if exclusiveWeaponDatas[id] ~= nil then
    for i = 1, lv do 
      local data = exclusiveWeaponDatas[id][i].plusAtt;
      if att[data.kind] == nil then 
        att[data.kind] = 0;
      end
      att[data.kind] = att[data.kind] + data.value;
    end    
  end
  return att;
end

function ExclusiveWeapon.GetMaxLevel(id)
  if exclusiveWeaponDatas[id] == nil then
    return 0;
  end

  local count = 0;
  for k, v in pairs(exclusiveWeaponDatas[id]) do
    if k ~= 0 then
      count = count + 1;
    end
  end

  return count;
end

function ExclusiveWeapon.CheckExclusiveWarrior(itemId, role)
  if exclusiveWeaponDatas[itemId] == nil or itemDatas[itemId] == nil then 
    return false;
  end

  local npcId = 0;
  if role ~= nil then 
    npcId = role.npcId;
  end

  local itemData = itemDatas[itemId];
  local baseNpcId = itemData.spare3;
  for k, v in pairs(collectWarriorSortDatas)do 
    if v.ids[1] == baseNpcId then 
      for k2, v2 in pairs(v.ids)do 
        if v2 == npcId then 
          return true;
        end
      end
      return false;
    end
  end
  return false;
end

function ExclusiveWeapon.GetExclusiveWarrior(itemId)
  if exclusiveWeaponDatas[itemId] == nil or itemDatas[itemId] == nil then
    return nil;
  end
  local itemData = itemDatas[itemId];
  local npcData = npcDatas[itemData.spare3];
  return npcData
end

function ExclusiveWeapon.CheckIsSkill(itemid)
  if exclusiveWeaponDatas[itemid] == nil or itemDatas[itemid] == nil then 
    return false;
  end

  for k, v in pairs(exclusiveWeaponDatas[itemid])do 
    if v.skillId ~= 0 and v.skillLv > 0 then 
      return true;
    end
  end
  return false;
end

function ExclusiveWeapon.ViewSkill(bagKind, bagIndex, followIndex)
  local itemSave = nil;
  local itemId = nil;
  if bagKind == EThings.None then 
    itemSave = followIndex;
    itemId = bagIndex;
  else
    itemSave = Item.GetBagItem(bagKind, bagIndex, followIndex);
    if itemSave ~= nil then 
      itemId = itemSave.Id;
    end
  end
  
  local itemData = itemDatas[itemId];
  if itemData == nil then return end

  if exclusiveWeaponDatas[itemId] == nil then 
    return 
  end
  local nowLv = 0;
  local skillOpenLv = 0;
  local skillId = 0;
  local maxLv = this.GetMaxLevel(itemId);

  if itemSave ~= nil then
    for i = 0, maxLv do
      if i == itemSave.enhanceLv then
        nowLv = exclusiveWeaponDatas[itemId][i].skillLv;
        break;
      end
    end
  end

  if nowLv == 0 then
    skillId = exclusiveWeaponDatas[itemId][1].skillId;
    skillOpenLv = exclusiveWeaponDatas[itemId][1].skillLv;
  else
    skillId = exclusiveWeaponDatas[itemId][nowLv].skillId;

    for i = 1, maxLv do
      if exclusiveWeaponDatas[itemId][i].skillId == skillId then
        skillOpenLv = exclusiveWeaponDatas[itemId][i].skillLv;
        break;
      end
    end
  end

  UI.Open(UIWeaponSkillView, skillId, nowLv, string.format(string.Get(22705), skillOpenLv, maxLv));
end

function ExclusiveWeapon.SendEnhance(index1, index2)
  --C:023-091 <專武強化> +功能(1) +專武背包索引(2) +專武材料背包索引(2)
  sendBuffer:Clear();
  sendBuffer:WriteByte(1);
  sendBuffer:WriteUInt16(index1);
  sendBuffer:WriteUInt16(index2);
  Network.Send(23, 91, sendBuffer);
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
  lastEnhance = Item.GetBagItem(EThings.Bag, index1);
end

function ExclusiveWeapon.ReciveEnhance(data)
  local result = data:ReadByte();
  if result == 1 then
    if lastEnhance ~= nil and itemDatas[lastEnhance.Id] ~= nil then 
      ShowCenterMessage(string.format( string.Get(80498),  itemDatas[lastEnhance.Id].name, lastEnhance.enhanceLv + 1));       
      if UI.IsVisible(UICompound) then
        UICompound.ClearData();
        UICompound.StartMixEffect(ECompoundEffect.Compound, lastEnhance.bagIndex);
      end
      lastEnhance = nil;
    end
  elseif result == 2 then 
    ShowCenterMessage(string.Get(22701));
  elseif result == 3 then 
    ShowCenterMessage(string.Get(22703));
  elseif result == 4 then 
    ShowCenterMessage(string.Get(22704));
  elseif result == 5 then 
    ShowCenterMessage(string.Get(20582));
  end
end

function ExclusiveWeapon.GetSkillByRole(role)
  local weaponSkill = 0;
  local itemSave = Item.GetBagItem(EThings.Equip, EItemFitType.Equip_Hand, role.index);
  if itemSave ~= nil and ExclusiveWeapon.CheckExclusiveWarrior(itemSave.Id, role) then 
    if itemDatas[itemSave.Id] ~= nil then   
      weaponSkill = ExclusiveWeapon.GetSkill(itemSave.Id, itemSave.enhanceLv)        
      if weaponSkill ~= nil and weaponSkill ~= 0 then 
        return weaponSkill;
      end
    end      
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
  return 0;
end