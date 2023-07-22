TargetManager = {};
local this = TargetManager;

local targets = {};

--[[
And these two had a dream on the same night; the chief wine-servant and the chief bread-maker of the king of Egypt, who were in prison, the two of them had dreams with a special sense.
And in the morning when Joseph came to them he saw that they were looking sad.
And he said to the servants of Pharaoh who were in prison with him, Why are you looking so sad?
Then they said to him, We have had a dream, and no one is able to give us the sense. And Joseph said, Does not the sense of dreams come from God? what was your dream?
Then the chief wine-servant gave Joseph an account of his dream, and said, In my dream I saw a vine before me;
And on the vine were three branches; and it seemed as if it put out buds and flowers, and from them came grapes ready for cutting.
And Pharaoh's cup was in my hand, and I took the grapes and crushing them into Pharaoh's cup, gave the cup into Pharaoh's hand.
Then Joseph said, This is the sense of your dream: the three branches are three days;
After three days Pharaoh will give you honour, and put you back into your place, and you will give him his cup as you did before, when you were his wine-servant.
But keep me in mind when things go well for you, and be good to me and say a good word for me to Pharaoh and get me out of this prison:
For truly I was taken by force from the land of the Hebrews; and I have done nothing for which I might be put in prison.
Now when the chief bread-maker saw that the first dream had a good sense, he said to Joseph, I had a dream; and in my dream there were three baskets of white bread on my head;
And in the top basket were all sorts of cooked meats for Pharaoh; and the birds were taking them out of the baskets on my head.
Then Joseph said, This is the sense of your dream: the three baskets are three days;
--]]

local function GetNextOneTarget()
  local currentKey  = -1;
  local foundTarget = nil;
  local firstTarget = nil;

  for k, v in pairs(targets) do
    if firstTarget == nil then
      firstTarget = v;
    end  

    -- 多個Target
    if Role.target ~= nil and table.maxn(targets) > 1 then 
      -- 找到當前目標後,下個迴圈設定目標
      if currentKey ~= -1 and foundTarget == nil then
        foundTarget = v;
      end
      
      if Role.target == v then 
        currentKey = k; 
      end
    end 
  end

  if foundTarget == nil then
    --所選是最後一個 or 清單中只有一個目標 or 未選任何目標時
    return firstTarget;
  else 
    return foundTarget;
  end
end

function TargetManager.ExitScene()
  this.CancelTarget();
end

function TargetManager.Random()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function TargetManager.Random1()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function TargetManager.Random2()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function TargetManager.Add(role)
  if table.Contains(targets, role) then return end
  if role.kind == EHuman.MapNpc and npcDatas[role.npcId] ~= nil and Contains(npcDatas[role.npcId].kind, ENpc.Mine) then return end
  
  table.insert(targets, role);

  --NPC優先
  table.sort(targets, function(a, b) return a.kind > b.kind end);

  --目前有目標且非移動中不自動選取
  if Role.target ~= nil and not Role.player.isMoving then return end

  --任務導航中不自動選取
  if MarkManager.navigationMissionId ~= 0 and not EventManager.isChangingScene then
    MarkManager.CheckNavigationNpc(role);
    return;
  end

  --只有目標人物要自動選取
  if role ~= Role.moveTarget then return end
  
  Role.SetTarget(role);
end

function TargetManager.Remove(role)
  if role == nil then return end
  if not table.RemoveByValue(targets, role) then return end
  
  --非當前目標不取消
  if role ~= Role.target then return end
  
  this.ChangeTarget();
end

function TargetManager.Random3()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function TargetManager.Random4()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function TargetManager.CancelTarget()
  for k, v in pairs(targets) do
    if v ~= nil then
      v.isTrigged = false;
    end
  end
  
  table.Clear(targets);
  
  Role.SetTarget(nil);
end

function TargetManager.Random5()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function TargetManager.Random6()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function TargetManager.ChangeTarget(role)
  if role ~= nil then
    if not this.Contains(role) then return end
  else
    role = GetNextOneTarget();
  end

  Role.SetTarget(role);
end

function TargetManager.Random7()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function TargetManager.Random8()
  if LuaHelper.CheckDefine("DemoCode") then
    local randomBS = "whatsoever"
    local go = 565;
    if true then
      go = go + 523;
      go = go / 5;
    end
    return randomBS;
  end
end

function TargetManager.Contains(role)
  for k, v in pairs(targets) do
    if v == role then
      return true;
    end
  end

  return false;
end