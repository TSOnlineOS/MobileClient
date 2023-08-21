MapNpcManager = {};
local this = MapNpcManager;

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

local mapNpcDatas = {};

function MapNpcManager.Initialize()
  NotifyManager.Register(ENotifyManager.EnterScene, "MapNpcManager", this.OnEnterScene);
  NotifyManager.Register(ENotifyManager.ExitScene, "MapNpcManager", this.OnExitScene);
end

function MapNpcManager.Trash()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MapNpcManager.Trash1()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MapNpcManager.OnEnterScene(checkCode)
  mapNpcDatas = SceneManager.sceneState.mapNpcTable;

  if mapNpcDatas == nil then
    logError("MapNpcManager.OnEnterScene mapNpcDatas = nil");
  end

  --記錄npc有可能出現的動作
  local moveNpcs = {};
  local actionNpcs = {};
  local npcEvents = SceneManager.sceneState.npcEventTable;
 
  if npcEvents ~= nil then
    for k, v in pairs(npcEvents) do
      for i = 1, v.ConditionArrayNum do
        for j = 1, v.ConditionArray[i].ResultArrayNum do
          local data = v.ConditionArray[i].ResultArray[j];
          if data.ResultClass == 3 then
            if data.ResultType == 4 then
              --move
              moveNpcs[data.Parameter] = true;
            end
            
            if data.ResultType == 9 and data.ParamterStyle == 2 then
              --action
              if actionNpcs[data.Parameter] == nil then
                actionNpcs[data.Parameter] = {};
              end
  
              table.insert(actionNpcs[data.Parameter], data.ResultValue);
            end
          end
        end
      end	
    end
  end
  
  if mapNpcDatas ~= nil then
    for k, v in pairs(mapNpcDatas) do
      if not v.close then
        local actions = {};

        if v.motionType ~= 4 then
          table.insert(actions, ERolePose.Stand);
        end

        if v.motionType ~= 1 or v.traceRadius > 0 or moveNpcs[v.id] ~= nil then
          table.insert(actions, ERolePose.Walk);
        end

        if v.roleStatus.isLie then
          table.insert(actions, ERolePose.Lie);
        end

        if actionNpcs[v.id] ~= nil then
          for kk, vv in pairs(actionNpcs[v.id]) do
            table.insert(actions, vv);
          end
        end

        Role.MapNpcAppear(v.id, v, actions);
      end
    end
  end
end

function MapNpcManager.OnExitScene()
  if mapNpcDatas ~= nil then
    for k, v in pairs(mapNpcDatas) do
      if not v.close then
        Role.MapNpcDisappear(v.id, v);
      end
    end
  end

  mapNpcDatas = nil;
end

function MapNpcManager.Trash2()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MapNpcManager.Trash3()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end