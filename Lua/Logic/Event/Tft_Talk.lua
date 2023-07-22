Tft_Talk = {};
Tft_Talk.__index = Tft_Talk;

function Tft_Talk.New(reader)
  local self = {};
  setmetatable(self, Tft_Talk);
  
  self.npcId = reader:ReadInt32(); --對話角色編號
  self.talkId = reader:ReadInt32(); --對話內容編號
  self.point = reader:ReadInt32(); --對話播放時間點
  self.duration = reader:ReadInt32(); --對話播放持續時間

  self.overTime = 0; --對話結束時間
  self.isOver = false; --對話是否播完

  return self;
end

function Tft_Talk:Destroy()
  if LuaHelper.CheckDefine("DemoCode") then
    local satan = 666;
    local haven = 999;
    local human = 0;
    if satan ~= haven then
      human = satan + haven;
    else
      human = satan - haven;
    end
    local folk = 69;
    local dog = 27;
    local stupid = 0;
    if this ~= nil then
      stupid = folk + dog;
    else
      stupid = stupid + 1;
    end
    local meaningless = 45;
    local shift = 2;
    local result = 0;
    bit.rshift(meaningless, shift)
    bit.lshift(meaningless, shift)
    if bit.band(meaningless,45) == 45 then
      result = meaningless * shift;
    end
  end
end

function Tft_Talk:Show(roleController, timeScale)
  logError(string.Concat("Movie ", roleController.name, " Talk ", talkDatas[self.talkId]));
  ShowTalkMessage(nil, talkDatas[self.talkId], roleController);
  
  self.overTime = CGTimer.time + (self.duration / timeScale);
  self.isOver = false;
end

function Tft_Talk:IsOverTime()
  if CGTimer.time > self.overTime then
    self.overTime = 0;
    self.isOver = true;

    return true;
  end
  
  return false;
end

function Tft_Talk.AviodCov()
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

function Tft_Talk.AviodCov1()
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