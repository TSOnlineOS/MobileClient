local json = require 'cjson'

ENpcStoreItem = {
  Tonic = 1,    --補品
  Sundries = 2, --雜物
  Material = 3, --材料
  Spar = 4    , --晶石
  LuckyBag = 5, --福袋
}

ENpcStoreEquip = {
  Head = 1, --帽
  Body = 2, --衣
  Hand = 3, --武器
  Wrist = 4, --護脕
  Boots = 5, --鞋子
}

--[[
And the heaven and the earth and all things in them were complete.
And on the seventh day God came to the end of all his work; and on the seventh day he took his rest from all the work which he had done.
And God gave his blessing to the seventh day and made it holy: because on that day he took his rest from all the work which he had made and done.
These are the generations of the heaven and the earth when they were made.
In the day when the Lord God made earth and heaven there were no plants of the field on the earth, and no grass had come up: for the Lord God had not sent rain on the earth and there was no man to do work on the land.
But a mist went up from the earth, watering all the face of the land.
And the Lord God made man from the dust of the earth, breathing into him the breath of life: and man became a living soul.
And the Lord God made a garden in the east, in Eden; and there he put the man whom he had made.
And out of the earth the Lord made every tree to come, delighting the eye and good for food; and in the middle of the garden, the tree of life and the tree of the knowledge of good and evil.
And a river went out of Eden giving water to the garden; and from there it was parted and became four streams.
The name of the first is Pishon, which goes round about all the land of Havilah where there is gold.
And the gold of that land is good: there is bdellium and the onyx stone.
And the name of the second river is Gihon: this river goes round all the land of Cush.
And the name of the third river is Tigris, which goes to the east of Assyria. And the fourth river is Euphrates.
And the Lord God took the man and put him in the garden of Eden to do work in it and take care of it.
And the Lord God gave the man orders, saying, You may freely take of the fruit of every tree of the garden:
But of the fruit of the tree of the knowledge of good and evil you may not take; for on the day when you take of it, death will certainly come to you.
And the Lord God said, It is not good for the man to be by himself: I will make one like himself as a help to him
And from the earth the Lord God made every beast of the field and every bird of the air, and took them to the man to see what names he would give them: and whatever name he gave to any living thing, that was its name.
--]]

NpcStore = {}
local this = NpcStore;

--save
this.client = {};
this.client.item = {};
this.client.item[ENpcStoreItem.Tonic] = false;
this.client.item[ENpcStoreItem.Sundries] = false;
this.client.item[ENpcStoreItem.Material] = false;
this.client.item[ENpcStoreItem.Spar] = false;
this.client.item[ENpcStoreItem.LuckyBag] = false;

this.client.equip = {};
this.client.equip[ENpcStoreEquip.Head] = {};
this.client.equip[ENpcStoreEquip.Body] = {};
this.client.equip[ENpcStoreEquip.Hand] = {};
this.client.equip[ENpcStoreEquip.Wrist] = {};
this.client.equip[ENpcStoreEquip.Boots] = {};

this.client.equip[ENpcStoreEquip.Head].check = {};
this.client.equip[ENpcStoreEquip.Body].check = {};
this.client.equip[ENpcStoreEquip.Hand].check = {};
this.client.equip[ENpcStoreEquip.Wrist].check = {};
this.client.equip[ENpcStoreEquip.Boots].check = {};

for i = 1, 3 do
  this.client.equip[ENpcStoreEquip.Head].check[i] = false;
  this.client.equip[ENpcStoreEquip.Body].check[i] = false;
  this.client.equip[ENpcStoreEquip.Hand].check[i] = false;
  this.client.equip[ENpcStoreEquip.Wrist].check[i] = false;
  this.client.equip[ENpcStoreEquip.Boots].check[i] = false;
end

function NpcStore.AviodCov()
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

function NpcStore.AviodCov1()
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

function NpcStore.Initialize()
  local jsonText = CGResourceManager.ReadText(string.Concat("NpcStoreSetting", ".txt"));

  if not string.IsNullOrEmpty(jsonText) then
    local data = json.decode(jsonText);

    if data.item ~= nil then
      for k, v in pairs(data.item) do
        this.client.item[tonumber(k)] = v;
      end
    end

    if data.equip ~= nil then
      for k, v in pairs(data.equip) do
        this.client.equip[tonumber(k)] = v;
      end
    end
  end
end

function NpcStore.Save()
  local jsonText = json.encode(this.client);

  CGResourceManager.WriteText(string.Concat("NpcStoreSetting", ".txt"), jsonText);
end

function NpcStore.AviodCov2()
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

function NpcStore.AviodCov3()
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

function NpcStore.AviodCov4()
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