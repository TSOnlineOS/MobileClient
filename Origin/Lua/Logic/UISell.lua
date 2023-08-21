UISell = {}
local this = UISell;

--[[
This is the book of the generations of Adam. In the day when God made man, he made him in the image of God;
Male and female he made them, naming them Man, and giving them his blessing on the day when they were made.
Adam had been living for a hundred and thirty years when he had a son like himself, after his image, and gave him the name of Seth:
And after the birth of Seth, Adam went on living for eight hundred years, and had sons and daughters:
And all the years of Adam's life were nine hundred and thirty: and he came to his end.
And Seth was a hundred and five years old when he became the father of Enosh:
And he went on living after the birth of Enosh for eight hundred and seven years, and had sons and daughters:
And all the years of Seth's life were nine hundred and twelve: and he came to his end.
And Enosh was ninety years old when he became the father of Kenan:
--]]

this.name = "UISell";
this.moneyString = '';
this.itemString = '';
this.roleCountString = '';
this.callback = nil;
this.args = {};
this.currentSellId = 0;
this.showRole = nil;
this.dontAsk = {};

function UISell.TestPas(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

--C:084-001 <查詢介消資料> +介消編號(2)
function UISell.Launch(sellId, callback, ...)
  if uisellDatas[sellId] == nil then return end

  if this.currentSellId ~= 0 then return end  
  
  this.moneyString = string.Get(uisellDatas[sellId].moneyString);
  this.itemString = string.Get(uisellDatas[sellId].itemString);
  this.callback = callback;

  if this.roleCountString == '' then
    this.roleCountString = string.Get(22819); 
  end  

  local args = { ... };

  this.args = args;

  sendBuffer:Clear();
  sendBuffer:WriteUInt16(sellId);

  for k, v in pairs(this.args) do
    sendBuffer:WriteUInt16(v);
  end

  Network.Send(84, 1, sendBuffer);

  this.currentSellId = sellId;
end

function UISell.SetAsk(sellId, ask)
  this.dontAsk[sellId] = ask;
end

function UISell.TestPas1(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end


function UISell.TestPas2(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end


function UISell.TestPas3(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

--S:084-001 <回傳介消資料> +介消編號(2) +結果(1)
function UISell.ReceiveQuery(data)
  local sellId = data:ReadUInt16();
  local kind = data:ReadByte();

  if kind == 0 then
    ShowCenterMessage(string.GetUiSellFail(sellId, data:ReadByte(), data:ReadUInt32()));
    this.currentSellId = 0;
    return;
  end

  local role;
  if this.showRole ~= nil then
    role = this.showRole;
  else
    role = Role.player;
  end

  if kind == 255 then  --使用物品
    local itemId = data:ReadUInt16();
    local count = data:ReadUInt16();
    ShowCheckMessage(
      function(result)
        if result then
          if sellId == 11 then --轉轉樂介消
            local items = Item.GetAllItemIndex(itemId, count);
            sendBuffer:Clear();
            sendBuffer:WriteByte(1);
            sendBuffer:WriteUInt16(sellId);
            sendBuffer:WriteByte(table.Count(items));
            for k, v in pairs(items) do
                sendBuffer:WriteUInt16(k);
                sendBuffer:WriteUInt16(v);
            end
  
            for k, v in pairs(this.args) do
              sendBuffer:WriteUInt16(v);
            end
            Network.Send(84, 2, sendBuffer);
            
          else
            local bagIndex = Item.GetItemIndex(itemId);
            sendBuffer:Clear();
            sendBuffer:WriteByte(1);
            sendBuffer:WriteUInt16(sellId);
            sendBuffer:WriteUInt16(bagIndex);
            for k, v in pairs(this.args) do
              sendBuffer:WriteUInt16(v);
            end
            Network.Send(84, 2, sendBuffer);
          end

          PluginManager.UISell(sellId);
        else
          this.Clear();
        end
      end,
      string.format(this.itemString, count, string.Concat("<url=ItemCheck_", itemId, ">", itemDatas[itemId]:GetName(true, true), "</url>")),
      role
    );
  elseif kind == 254 then  --免費使用
    sendBuffer:Clear();
    sendBuffer:WriteByte(2)
    sendBuffer:WriteUInt16(sellId);
    for k, v in pairs(this.args) do
      sendBuffer:WriteUInt16(v);
    end
    Network.Send(84, 2, sendBuffer);

    PluginManager.UISell(sellId);
  elseif Contains(kind, 1, 2, 3) then
    local money = data:ReadUInt32();
    local message = "";
    local uiSellData = uisellDatas[sellId];
    local rolecountId = uiSellData.rolecountId;

    --限購次數字串
    if uiSellData.rolecountId > 0 then
      message = string.format(this.roleCountString, tostring(RoleCount.Get(rolecountId)), tostring(RoleCount.Max(rolecountId)));
    end

    message = string.Concat(string.format(this.moneyString, tostring(money), string.GetCurrency(kind)), " ", message);
    
    if this.dontAsk[sellId] then
      sendBuffer:Clear();
      sendBuffer:WriteByte(2)
      sendBuffer:WriteUInt16(sellId);
      for k, v in pairs(this.args) do
        sendBuffer:WriteUInt16(v);
      end
      Network.Send(84, 2, sendBuffer);
      PluginManager.UISell(sellId);
    else
      ShowCheckMessage(
        function(result)
          if result then
            sendBuffer:Clear();
            sendBuffer:WriteByte(2)
            sendBuffer:WriteUInt16(sellId);
            for k, v in pairs(this.args) do
              sendBuffer:WriteUInt16(v);
            end
            Network.Send(84, 2, sendBuffer);
            PluginManager.UISell(sellId);
          else
            this.Clear();
          end
        end,
        message,
        role
      );
    end
  end

  this.showRole = nil;
end

function UISell.TestPas4(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function UISell.TestPas5(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

--S:084-002 <回傳介消結果> +介消編號(2) +結果(1)
function UISell.UISellResult(data)
  local sellId = data:ReadUInt16();
  local result = data:ReadByte();

  this.Clear();

  if result == 0 then  --失敗
    ShowCenterMessage(string.GetUiSellFail(sellId, data:ReadByte(), data:ReadUInt32()));
    return;
  end

  if this.callback ~= nil then
    this.callback();
  end
end

function UISell.TestPas6(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function UISell.TestPas7(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function UISell.ShowRole(npcId)
  this.showRole = Role.GetRole(EHuman.MapNpc, npcId);
end

function UISell.Clear()
  this.currentSellId = 0;
end

function UISell.TestPas8(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end

function UISell.TestPas9(pat)
  if pat > 100 then
    for i = 1 , 100 do
      pat = pat - i;
    end
    return pat;
  else
    return nil;
  end
end