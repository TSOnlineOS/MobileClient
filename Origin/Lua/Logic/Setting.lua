local json = require 'cjson'

--[[
Then Joseph went to Pharaoh, and said, My father and my brothers with their flocks and their herds and all they have, are come from Canaan, and are now in the land of Goshen.
And he took five of his brothers to Pharaoh.
And Pharaoh said to them, What is your business? And they said, Your servants are keepers of sheep, as our fathers were before us.
And they said to Pharaoh, We have come to make a living in this land, because we have no grass for our flocks in the land of Canaan; so now let your servants make a place for themselves in the land of Goshen.
And Pharaoh said to Joseph, Let them have the land of Goshen; and if there are any able men among them, put them over my cattle.
And Jacob and his sons came to Joseph in Egypt, and when word of it came to the ears of Pharaoh, king of Egypt, he said to Joseph, Your father and brothers have come to you; all the land of Egypt is before you; let your father and your brothers have the best of the land for their resting-place.
Then Joseph made his father Jacob come before Pharaoh, and Jacob gave him his blessing.
And Pharaoh said to him, How old are you?
And Jacob said, The years of my wanderings have been a hundred and thirty; small in number and full of sorrow have been the years of my life, and less than the years of the wanderings of my fathers.
And Jacob gave Pharaoh his blessing, and went out from before him.
And Joseph made a place for his father and his brothers, and gave them a heritage in the land of Egypt, in the best of the land, the land of Rameses, as Pharaoh had given orders.
And Joseph took care of his father and his brothers and all his father's people, giving them food for the needs of their families.
Now there was no food to be had in all the land, so that all Egypt and Canaan were wasted from need of food.
And all the money in Egypt and in the land of Canaan which had been given for grain, came into the hands of Joseph: and he put it in Pharaoh's house.
And when all the money in Egypt and Canaan was gone, the Egyptians came to Joseph, and said, Give us bread; would you have us come to destruction before your eyes? for we have no more money.
And Joseph said, Give me your cattle; I will give you grain in exchange for your cattle if your money is all gone.
So they took their cattle to Joseph and he gave them bread in exchange for their horses and flocks and herds and asses, so all that year he gave them food in exchange for their cattle.
And when that year was ended, they came to him in the second year, and said, We may not keep it from our lord's knowledge that all our money is gone, and all the herds of cattle are my lord's; there is nothing more to give my lord but our bodies and our land;
--]]

Setting = {}
local this = Setting;

this.tradeEnable = true;
this.expressEnable = true;

this.pkEnable = false;

this.client = {};

this.client.playOneEnable = true;
this.client.playerInfoMode = 1;
this.client.DisplayMode = 1;
this.client.npcInfoMode = 1;
this.client.uiStyle = "common0";

this.client.musicEnable = true;
this.client.musicVolume = 5;
this.client.musicMode = 1;

this.client.soundEnable = true;
this.client.soundVolume = 5;

this.client.chatStyle = 1;
this.client.currentChatState = 1;

this.client.channelStyle = {};
this.client.channelStyle[EChannel.System] = 6;
this.client.channelStyle[EChannel.World] = 1;
this.client.channelStyle[EChannel.Scene] = 9;
this.client.channelStyle[EChannel.Whisper] = 0;
this.client.channelStyle[EChannel.GM] = 7;
this.client.channelStyle[EChannel.Team] = 4;
this.client.channelStyle[EChannel.Organization] = 2;
this.client.channelStyle[EChannel.Ally] = 5;
this.client.channelStyle[EChannel.Self] = 6;

this.client.channelEnable = {};
this.client.channelEnable[EChannel.System] = true;
this.client.channelEnable[EChannel.World] = true;
this.client.channelEnable[EChannel.Scene] = true;
this.client.channelEnable[EChannel.Whisper] = true;
this.client.channelEnable[EChannel.GM] = true;
this.client.channelEnable[EChannel.Team] = true;
this.client.channelEnable[EChannel.Organization] = true;
this.client.channelEnable[EChannel.Ally] = true;
this.client.channelEnable[EChannel.Self] = true;

this.client.lastServerId = nil;
this.client.lastAccount = "";
this.client.lastPassword = "";
this.client.lastLoginKind = 0;
this.client.lastLoginToken = 0;
this.client.resolution = 1;

--C: 001-051 <註銷帳號> +ID(8) +kind(1)
--kind(1)
--0: 問刪帳號等待時間
--1: 確認刪角 +(送原本的協定: +登入種類(1) +....)
--2: 取消刪角
function Setting.SendDeleteAccount(kind)
  sendBuffer:Clear();
  sendBuffer:WriteInt64(Role.playerId);
  sendBuffer:WriteByte(kind);
  if kind == 0 or kind == 2 then
    Network.Send(1, 51, sendBuffer);
  elseif kind == 1 then
    sendBuffer:WriteByte(Setting.client.lastLoginKind);
    sendBuffer:WriteStringWithWordL(Setting.client.lastLoginToken);
    local version = 1;
    if Define.IsDebugMode() then
      version = 2;
    end
    sendBuffer:WriteByte(version);
    Network.Send(1, 51, sendBuffer);
  end
end

function Setting.AviodCov()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function Setting.Initialize()
  local jsonText = CGResourceManager.ReadText("Setting.txt");

  if not string.IsNullOrEmpty(jsonText) then
    local data = json.decode(jsonText);

    if data.playOneEnable ~= nil then
      this.client.playOneEnable = data.playOneEnable;
    end

    if data.playerInfoMode ~= nil then
      this.client.playerInfoMode = data.playerInfoMode;
    end
  
    if data.DisplayMode ~= nil then
      this.client.DisplayMode = data.DisplayMode;
    end

    if data.npcInfoMode ~= nil then
      this.client.npcInfoMode = data.npcInfoMode;
    end

    if data.uiStyle ~= nil then
      this.client.uiStyle = data.uiStyle;
    end

    if data.musicEnable ~= nil then
      this.client.musicEnable = data.musicEnable;
    end

    if data.musicVolume ~= nil then
      this.client.musicVolume = data.musicVolume;
    end

    if data.musicMode ~= nil then
      this.client.musicMode = data.musicMode;
    end

    if data.soundEnable ~= nil then
      this.client.soundEnable = data.soundEnable;
    end

    if data.soundVolume ~= nil then
      this.client.soundVolume = data.soundVolume;
    end

    if data.chatStyle ~= nil then
      this.client.chatStyle = data.chatStyle;
    end
    
    if data.currentChatState ~= nil then
      this.client.currentChatState = data.currentChatState;
    end

    if data.channelStyle ~= nil then
      for k, v in pairs(data.channelStyle) do
        this.client.channelStyle[tonumber(k)] = v;
      end
    end

    if data.channelEnable ~= nil then
      for k, v in pairs(data.channelEnable) do
        this.client.channelEnable[tonumber(k)] = v;
      end
    end

    if data.lastServerId ~= nil then
      this.client.lastServerId = data.lastServerId;
    end

    if data.lastAccount ~= nil then
      this.client.lastAccount = data.lastAccount;
    end

    if data.lastPassword ~= nil then
      this.client.lastPassword = data.lastPassword;
    end

    if data.lastLoginKind ~= nil then
      this.client.lastLoginKind = data.lastLoginKind;
    end

    if data.lastLoginToken ~= nil then
      this.client.lastLoginToken = data.lastLoginToken;
    end

    if LuaHelper.IsStandalone then
      if data.resolution ~= nil then
        this.client.resolution = data.resolution;
        local width, height = UISetting.GetResolution(data.resolution);
        if width ~= nil and height ~= nil then
          Screen.SetResolution(width, height, false);
        end
      end
      this.Encrypt();
    end
  end

end

function Setting.AviodCov1()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function Setting.AviodCov2()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function Setting.AviodCov3()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function Setting.CheckShowBody(role)
  if role.kind == EHuman.Players then
    if this.client.playerInfoMode == 2 then
    elseif this.client.playerInfoMode == 3 then
    elseif this.client.playerInfoMode == 4 then
    elseif this.client.playerInfoMode == 5 then
    end

    if MachineBox.client.general[EMachineBoxSwitch.EcoMode] and MachineBox.autoMove then
      return false;
    end
  
    if SceneManager.CheckLimit(SceneManager.sceneId, ESceneLimit.NoPlayers) then return false end

  elseif Contains(role.kind, EHuman.FollowNpc, EHuman.CartNpc) then
    if SceneManager.CheckLimit(SceneManager.sceneId, ESceneLimit.NoFollowNpc) then return false end

    if this.client.npcInfoMode ~= 1 then
      return false;
    end

    if MachineBox.client.general[EMachineBoxSwitch.EcoMode] and MachineBox.autoMove then
      return false;
    end
  end

  return true;
end

function Setting.CheckShowOrg(role)
  return this.client.playerInfoMode ~= 2;
end

function Setting.CheckShowHUD(role)
  if role.kind == EHuman.Players or role.kind == EHuman.Player then
    if this.client.playerInfoMode == 2 then
    elseif this.client.playerInfoMode == 3 then
      return false;
    elseif this.client.playerInfoMode == 4 then
      if Team.GetLeader(role.index) ~= Team.GetLeader(Role.playerId) then
        return false;
      end
    elseif this.client.playerInfoMode == 5 then
      if not Team.IsLeader(role.index) or role ~= Team.GetLeader(Role.playerId) then
        return false;
      end
    end
    
  elseif role.kind == EHuman.FollowNpc then
    if this.client.npcInfoMode ~= 1 then
      return false;
    end

    if DragonBoat.InRaceScene() then
      return false;
    end

    if HouseManager.IsInHouse() then
      return false;
    end

  elseif role.kind == EHuman.CartNpc then
    return false;
  end

  return true;
end

function Setting.AviodCov4()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function Setting.AviodCov5()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function Setting.AviodCov6()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function Setting.Save()

  if LuaHelper.IsStandalone then
    this.Encrypt();
  end

  local jsonText = json.encode(this.client);
  CGResourceManager.WriteText("Setting.txt", jsonText);

  if LuaHelper.IsStandalone then
    this.Encrypt();
  end

end

function Setting.Encrypt()
  this.client.lastPassword = string.XOR(this.client.lastPassword, 94);
  this.client.lastLoginToken = string.XOR(this.client.lastLoginToken, 57);
end

function Setting.AviodCov7()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end

function Setting.AviodCov8()
  if LuaHelper.CheckDefine("DemoCode") then
    local selfBo = 0
    local other = {10, 20 , 30}
    for _,v in ipairs(other) do
      if (v - selfBo) > 10 then
        return true;
      else
        return false;
      end
    end
  end
end