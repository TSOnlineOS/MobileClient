local json = require 'cjson'
--後面有資料
local argumentFunctions = {};
table.insert(argumentFunctions, { 1, "加貨幣", "種類", "數量" });
table.insert(argumentFunctions, { 2, "加物品", "物品編號", "數量" });
table.insert(argumentFunctions, { 3, "加經驗", "武將索引", "數量" });

table.insert(argumentFunctions, { 5, "加武將", "NPC編號" });
table.insert(argumentFunctions, { 6, "標記步驟", "標記編號", "步驟" });
table.insert(argumentFunctions, { 7, "標記完成", "標記編號", "是否完成" });
table.insert(argumentFunctions, { 8, "加技能", "技能編號", "等級" });
table.insert(argumentFunctions, { 9, "換場景", "場景編號", "座標X", "座標Y", "座標字串" });

table.insert(argumentFunctions, { 11, "加軍團資源", "資源種類", "數量"});
table.insert(argumentFunctions, { 12, "加官勳", "官勳" });
table.insert(argumentFunctions, { 13, "清永標", "編號", "值"});
table.insert(argumentFunctions, { 14, "加物品信", "物品ID", "數量"});
table.insert(argumentFunctions, { 15, "加元寶", "實點", "虛點"});
table.insert(argumentFunctions, { 16, "設陣營數值", "陣營", "數值"});
table.insert(argumentFunctions, { 17, "顯示RoleCount", "1:指定 2:全部", "索引"});
table.insert(argumentFunctions, { 18, "設定好友好感度", "索引", "數值"});
table.insert(argumentFunctions, { 19, "指定戰鬥", "戰鬥編號"});
table.insert(argumentFunctions, { 20, "加Combo表獎勵", "ComboPrizeID", "扣物品:1"});
table.insert(argumentFunctions, { 21, "客棧武將經驗", "索引", "數值"});
table.insert(argumentFunctions, { 22, "設定RoleCount", "索引", "數值"});
table.insert(argumentFunctions, { 23, "玩家/武將的HP/SP", "武將索引", "HP", "SP"});
table.insert(argumentFunctions, { 24, "世界BOSS獎勵測試", "單次傷害名次", "累積傷害名次", "累積傷害"});
table.insert(argumentFunctions, { 25, "設定忠誠度", "武將索引", "忠誠度"});
table.insert(argumentFunctions, { 26, "坐騎升級", "種類[0.總等級 1~5.屬性種類]", "等級"});
table.insert(argumentFunctions, { 27, "增加最大好友數量", "數量"});
table.insert(argumentFunctions, { 28, "設定卡片組合等級", "組合索引", "等級"});
table.insert(argumentFunctions, { 29, "熔爐盤面", "商店種類",  "獎勵類別", "測試R物品ID"});
table.insert(argumentFunctions, { 30, "進入戰鬥", "NPC編號"});
table.insert(argumentFunctions, { 31, "裝備損壞", "武將索引", "裝備索引", "設定損壞度"});
table.insert(argumentFunctions, { 32, "設定九宮格", "九宮格種類", "九宮格流水號"});
table.insert(argumentFunctions, { 33, "點擊觸發事件", "Npc索引", "地塊索引"});
table.insert(argumentFunctions, { 34, "軍團據點戰積分", "軍團ID", "1.設定 2.查詢", "設定積分"});
table.insert(argumentFunctions, { 35, "設定時間標記", "標記ID", "標記時間(分)"});
table.insert(argumentFunctions, { 36, "轉轉樂中大獎", "1頭獎 2貳獎", "貳獎獎項(1,2)"});
table.insert(argumentFunctions, { 37, "設定經驗瓶", "索引", "數量"});
table.insert(argumentFunctions, { 38, "七星燈等級", "LV(1~10)", "燈(1~7)"});
table.insert(argumentFunctions, { 39, "七星燈點數", "數量"});
table.insert(argumentFunctions, { 40, "PVP爬塔設定", "已挑戰的次數(0~10)", "目前積分", "每日積分", "每日積分領獎階段"});
table.insert(argumentFunctions, { 41, "專武等級", "背包Idx", "等級"});
table.insert(argumentFunctions, { 42, "自摸棋測試模式"});
table.insert(argumentFunctions, { 43, "一鍵功能全開", "座騎全開(1)", "座騎等級(10)", "卡片全開(10)", "造型全開(1)", "七星燈(10)", "身上靈裝(20)", "重置某項(-1)" });
table.insert(argumentFunctions, { 44, "武將拉霸","中大獎(1)", "指定獎項"});
table.insert(argumentFunctions, { 45, "行為樹測試模式", "開關"});
table.insert(argumentFunctions, { 46, "城鎮爭奪加票數", "陣營", "城鎮", "票數"});
table.insert(argumentFunctions, { 47, "升階洗鍊(五個值都要填)", "背包索引", "升階等級", "洗鍊1", "洗鍊2", "洗鍊3"});
table.insert(argumentFunctions, { 48, "修改戰場人物屬性值", "Column", "Row", "Attr_Kind", "數值"});
table.insert(argumentFunctions, { 49, "城鎮設定刷新分鐘間隔", "分鐘(0查看資料)"});
table.insert(argumentFunctions, { 50, "武將強化等級", "武將索引", "LV"});
table.insert(argumentFunctions, { 51, "永恆地城", "樓層"});
table.insert(argumentFunctions, { 53, "全伺服器紅包", "索引", "編號"});
table.insert(argumentFunctions, { 55, "大富翁強制移動", "步數"});
table.insert(argumentFunctions, { 56, "加神話裝備等級(內容數值隨機)", "背包索引", "等級"});
table.insert(argumentFunctions, { 60, "刪除靈魂"});
table.insert(argumentFunctions, { 61, "以指定數值新增靈魂(不指定填0)", "物品ID", "等級", "星等", "攻擊力", "防禦力", "知力", "敏捷", "HP上升", "SP上升", "技能1 ID", "技能2 ID", "技能3 ID", "技能4 ID", "屬性"});
table.insert(argumentFunctions, { 62, "新增神裝", "物品ID", "等級", "子屬性1", "子屬性數值1", "子屬性2", "子屬性數值2", "子屬性3", "子屬性數值3", "子屬性4", "子屬性數值4"});
table.insert(argumentFunctions, { 63, "加魂點", "魂點"});
table.insert(argumentFunctions, { 64, "加鎮魂Boss", "位置", "BossID", "強制覆蓋:1是, 0否"});
table.insert(argumentFunctions, { 65, "改祭祀累計次數", "種類0:次數/1:下限/2:上限", "數值"});
table.insert(argumentFunctions, { 66, "指定祭祀獎項", "獎項ID", "倍率"});
table.insert(argumentFunctions, { 67, "改魂點掉落倍率", "魂點倍率"});

--不送協定
table.insert(argumentFunctions, { 201, "動畫演出", "編號" });
table.insert(argumentFunctions, { 202, "場景特效", "編號" });
table.insert(argumentFunctions, { 203, "快遞", "NPCID", "模式" });
table.insert(argumentFunctions, { 204, "任務查詢", "標記編號" });
table.insert(argumentFunctions, { 205, "賽亞人(0關閉1開啟)", "必死開關", "無敵開關", "掉寶開關", "逃脫開關", "網羅開關", "節慶掉寶", "1帶4戰鬥"});
table.insert(argumentFunctions, { 206, "查背包(1背包2錢莊)", "總類" });
table.insert(argumentFunctions, { 207, "查詢通用永標", "編號", "編號" });
table.insert(argumentFunctions, { 208, "查詢物品", "名稱" });
table.insert(argumentFunctions, { 209, "查詢NPC", "名稱" });
table.insert(argumentFunctions, { 210, "查詢Talk字串, 查詢Text字串", "TalkID", "TextID" });
table.insert(argumentFunctions, { 211, "顯示系統時間" });
table.insert(argumentFunctions, { 212, "九宮格檢查任務", "九宮格ID", "索引", "任務ID"});
table.insert(argumentFunctions, { 213, "九宮格領獎", "九宮格ID", "索引"});
table.insert(argumentFunctions, { 214, "協定發送測試", "協定主編號", "協定次編號", "協定發送數量"});
table.insert(argumentFunctions, { 215, "顯示背包索引", "(0:關閉 1:開啟)"});
table.insert(argumentFunctions, { 216, "移除指定卡單", "索引"});
table.insert(argumentFunctions, { 217, "加二轉武將", "NPC編號"});
table.insert(argumentFunctions, { 224, "強制開啟慶典", "索引"});
table.insert(argumentFunctions, { 225, "調整大富翁背景圖", "圖片寬度", "圖片高度", "棋盤X座標", "棋盤Y座標"});
table.insert(argumentFunctions, { 226, "等級突破測試", "經驗"});
table.insert(argumentFunctions, { 228, "大富翁行進速度", "步數"});
table.insert(argumentFunctions, { 229, "調整家具互動點", "X", "Y", "Z", "X偏移量", "Y偏移量"});
table.insert(argumentFunctions, { 230, "調整家具圖片偏移", "X", "Y", "Z", "1裝潢2地毯3家具", "X偏移量", "Y偏移量"});
table.insert(argumentFunctions, { 231, "直接生成大量家具", "家具ID", "數量" });
table.insert(argumentFunctions, { 232, "查串表資料", "串表名稱", "id"});
table.insert(argumentFunctions, { 233, "調整家具特效", "X", "Y", "Z", "特效縮放", "高度偏移量"});
table.insert(argumentFunctions, { 234, "大量祭祀", "倍率", "數量"});
table.insert(argumentFunctions, { 235, "大富翁角色強制位移", "x", "y", "z"});

--後面無資料
local noneArgumentFunctions = {};
table.insert(noneArgumentFunctions, { 102, "血魔全滿" });
table.insert(noneArgumentFunctions, { 103, "進戰鬥" });
table.insert(noneArgumentFunctions, { 104, "清物品欄" });
table.insert(noneArgumentFunctions, { 105, "加場景標記" });
table.insert(noneArgumentFunctions, { 106, "清座騎資料" });
table.insert(noneArgumentFunctions, { 107, "跳過新手場景" });
table.insert(noneArgumentFunctions, { 108, "PVP跨天" });
table.insert(noneArgumentFunctions, { 109, "城鎮爭奪刷新地圖" });
table.insert(noneArgumentFunctions, { 110, "重設祭祀累計目標" });
table.insert(noneArgumentFunctions, { 111, "查詢目前祭祀狀態" });
table.insert(noneArgumentFunctions, { 112, "清福神" });

--不用送協定
table.insert(noneArgumentFunctions, { 201, "開啟地塊編輯" });
table.insert(noneArgumentFunctions, { 202, "關閉地塊編輯" });
table.insert(noneArgumentFunctions, { 203, "清理記憶體" });
table.insert(noneArgumentFunctions, { 204, "戰鬥測試"});
table.insert(noneArgumentFunctions, { 205, "播放選擇技能"});
table.insert(noneArgumentFunctions, { 206, "輪播技能"});
table.insert(noneArgumentFunctions, { 207, "下一招技能"});
table.insert(noneArgumentFunctions, { 208, "停止播放技能"});
table.insert(noneArgumentFunctions, { 209, "尋徑測試工具"});
table.insert(noneArgumentFunctions, { 210, "中斷連線" });
table.insert(noneArgumentFunctions, { 211, "顯示Door" });
table.insert(noneArgumentFunctions, { 212, "關閉Door" });
table.insert(noneArgumentFunctions, { 213, "顯示事件狀態" });
table.insert(noneArgumentFunctions, { 214, "重啟遊戲" });
table.insert(noneArgumentFunctions, { 216, "測試準備轉生" });
table.insert(noneArgumentFunctions, { 217, "產經驗值表" });
table.insert(noneArgumentFunctions, { 218, "GM湊合介面" });
table.insert(noneArgumentFunctions, { 219, "無界" });
table.insert(noneArgumentFunctions, { 220, "錄影模式" });
table.insert(noneArgumentFunctions, { 221, "移除當前卡單" });
table.insert(noneArgumentFunctions, { 222, "測試準備二轉" });
table.insert(noneArgumentFunctions, { 223, "測試準備三轉" });
table.insert(noneArgumentFunctions, { 224, "加所有家具數量" });
table.insert(noneArgumentFunctions, { 225, "新增未持有家具" });
table.insert(noneArgumentFunctions, { 226, "塞背包"});

UIDebug = {};
local this = UIDebug;

this.name = "UIDebug";
this.uiController = nil;
this.RecordMode = false;

local image_Mask;

local text_Info;

local scrollContent_Function;
local scrollItems_Function = {};

local dropdown_Function;
local dropdown_Skill;

local inputField_Args = {};
local inputField_RoleId;
local image_Switch;

this.testSkillList = {};

function UIDebug.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  
  image_Mask = uiController:FindImage("Image_Mask");
  
  text_Info = uiController:FindText("Text_Info");
  
  scrollContent_Function = uiController:FindScrollContent("ScrollContent_Function");
  scrollContent_Function.onInitialize = this.OnInitialize_ScrollContent_Function;
  scrollContent_Function.onItemChange = this.OnItemChange_ScrollContent_Function;
  scrollContent_Function:Initialize(1);

  dropdown_Function = uiController:FindDropdown("Dropdown_Function");
  dropdown_Function:AddListener(this.OnValueChanged_Function);

  dropdown_Skill = uiController:FindDropdown("Dropdown_Skill");
  dropdown_Skill:AddListener(this.OnValueChanged_Skill);

  for i = 1, 15 do
    inputField_Args[i] = uiController:FindInputField(string.format("InputField_Args (%d)", i));
  end
  inputField_RoleId = uiController:FindInputField("InputField_RoleId");

  local tempEvent = nil;
  
  tempEvent = uiController:FindEvent("Image_Reset");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Reset);
  
  tempEvent = uiController:FindEvent("Image_Send");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Send);
  
  tempEvent = uiController:FindEvent("Image_Switch");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Switch);
  image_Switch = tempEvent.gameObject:GetComponent("Image");
end

function UIDebug.OnOpen()
  image_Mask.gameObject:SetActive(false);
  
  inputField_RoleId.text = tostring(Role.playerId);
  
  dropdown_Function:ClearOptions();
  for k, v in pairs(argumentFunctions) do
    dropdown_Function:AddOption(string.Concat(v[1], ".", v[2]));
  end

  dropdown_Skill:ClearOptions();

  this.testSkillList = {};
  for k, v in pairs(ESkill_Kind)do
    table.insert(this.testSkillList, v);
  end
  table.sort(this.testSkillList, function(a,b) return a > b; end);

  for k, v in pairs(this.testSkillList) do
    if v ~= nil then
      dropdown_Skill:AddOption(v);
    end
  end

    
  this.UpdateUI();
  
  scrollContent_Function:Reset(table.maxn(noneArgumentFunctions));
  
  if LuaHelper.CheckDefine("ReleaseTest") then
    LuaHelper.SetColor(image_Switch, Color.Alpha);
  else
    LuaHelper.SetColor(image_Switch, Color.White);
  end
  
  return true;
end

function UIDebug.UpdateUI()
  local functionId = dropdown_Function.value + 1;
  
  for k, v in pairs(inputField_Args) do
    if argumentFunctions[functionId][k + 2] ~= nil then
      v.interactable = true;
      v.placeholder.text = argumentFunctions[functionId][k + 2];
      v.text = "";
    else
      v.interactable = false;
      v.placeholder.text = "";
      v.text = "";
    end
  end

  if FightField.selectIdx ~= nil and FightField.selectIdx ~= dropdown_Skill.value + 1 then
    dropdown_Skill.value = FightField.selectIdx - 1;
  end
end

function UIDebug.OnClick_Switch(sender)
  image_Mask.gameObject:SetActive(not image_Mask.gameObject.activeSelf);

  if not image_Mask.gameObject.activeSelf then return end

  text_Info.text = "";
  text_Info.text = string.Concat(text_Info.text, "\n場景編號: ", SceneManager.sceneId);
  text_Info.text = string.Concat(text_Info.text, "\n傳點分區: ", SceneManager.areaId);
  text_Info.text = string.Concat(text_Info.text, "\n移動速度: ", Role.player.speed);
end

--Argument Function
function UIDebug.OnClick_Reset(sender)
  for k, v in pairs(inputField_Args) do
    v.text = "";
  end
end

function UIDebug.OnClick_Send(sender)
  if string.IsNullOrEmpty(inputField_RoleId.text) then return end

  local functionId = dropdown_Function.value + 1;
  
  if argumentFunctions[functionId][1] <= 200 then
    sendBuffer:Clear();
    sendBuffer:WriteInt64(inputField_RoleId.text);
  
    for k, v in pairs(inputField_Args) do
      if argumentFunctions[functionId][k + 2] ~= nil then
        if string.find(v.text, ",") ~= nil then
          sendBuffer:WriteStringWithByteL(v.text);
        elseif not string.IsNullOrEmpty(v.text) then
          sendBuffer:WriteUInt32(tonumber(v.text));
        else
          sendBuffer:WriteUInt32(0);
        end
      end
    end
    Network.Send(100, argumentFunctions[functionId][1], sendBuffer);
    if argumentFunctions[functionId][1] == 55 then
      this.OnClick_Switch();
    end

  --不用送的加這邊
  elseif argumentFunctions[functionId][1] == 201 then 
    if string.IsNullOrEmpty(inputField_Args[1].text) then return end
    
    MoviePlayer.PlayMovie(tonumber(inputField_Args[1].text));

  elseif argumentFunctions[functionId][1] == 202 then 
    if string.IsNullOrEmpty(inputField_Args[1].text) then return end

    SceneEffect.OpenEffect(tonumber(inputField_Args[1].text));

  elseif argumentFunctions[functionId][1] == 203 then 
    if string.IsNullOrEmpty(inputField_Args[1].text) then return end
    if string.IsNullOrEmpty(inputField_Args[2].text) then return end

    Social.PlayDeliver(tonumber(inputField_Args[1].text), tonumber(inputField_Args[2].text));

  elseif argumentFunctions[functionId][1] == 204 then
    if not string.IsNullOrEmpty(inputField_Args[1].text) then
      local missionId = tonumber(inputField_Args[1].text);
  
      if markDatas[missionId] ~= nil and markDatas[missionId].bitId == 0 then
        missionId = missionId + 1;
      end
  
      local mission = MarkManager.GetMission(missionId);
  
      if mission ~= nil then
        missionId = mission.id;
      end
  
      if markDatas[missionId] ~= nil then
        local text = string.AddBrackets(markDatas[missionId].name);
  
        if mission ~= nil then
          text = string.Concat(text, "進行中，目前步驟", mission.step);
        elseif MarkManager.GetMissionFlag(missionId) then
          text = string.Concat(text, "已完成 !!");
        else
          text = string.Concat(text, "未完成 !!");
        end
  
        ShowCenterMessage(text);
      else
        ShowCenterMessage("找不到此任務 !!");
      end

    else
      logError("已完成:");
      for bitIndex, missionId in pairs(bitMarkDatas) do
        if CheckFlag(MarkManager.flags, bitIndex) then
          if markDatas[missionId] ~= nil then
            logError(string.Concat(missionId, " ", markDatas[missionId].name));
          end
        end
      end
    end

  elseif argumentFunctions[functionId][1] == 205 then --與一般邏輯不一樣
    local result = 0;
    for k, v in pairs(inputField_Args) do
      if argumentFunctions[functionId][k + 2] ~= nil then
        if not string.IsNullOrEmpty(v.text) and tonumber(v.text) ~= 0 then
          result = result + bit.lshift(1, k-1);          
        end        
      end
    end

    sendBuffer:Clear();
    sendBuffer:WriteInt64(inputField_RoleId.text);
    sendBuffer:WriteUInt32(result);
    Network.Send(100, 101, sendBuffer);

  elseif argumentFunctions[functionId][1] == 206 then
    if string.IsNullOrEmpty(inputField_Args[1].text) then return end
    local kind = tonumber(inputField_Args[1].text);

    if kind == 1 then --背包
      local bag, bagSize, quantSize = Item.GetBag(EThings.Bag);
      table.Dump(bag);
  
      if LuaHelper.CheckDefine("DemoCode") then
        local code = DemoCode.GetBitxor(20);
      end
      
    elseif kind == 2 then --錢莊
      local bag, bagSize, quantSize = Item.GetBag(EThings.Bank);
      table.Dump(bag);
    end

  elseif argumentFunctions[functionId][1] == 207 then
    if string.IsNullOrEmpty(inputField_Args[1].text) then return end

    local startFlag = tonumber(inputField_Args[1].text);
    if not string.IsNullOrEmpty(inputField_Args[2].text) then
      local endFlag = tonumber(inputField_Args[2].text);
      local message = "";
      for i = startFlag, endFlag do
        message = string.Concat(message, string.Concat("通用永標 [", i, "]: ", (BitFlag.Get(i) and 1 or 0), " \n"));
      end
      Chat.AddMessage(EChannel.System, message);
    else
      Chat.AddMessage(EChannel.System, string.Concat("通用永標 [", startFlag, "]: ", (BitFlag.Get(startFlag) and 1 or 0)));
    end

  elseif argumentFunctions[functionId][1] == 208 then
    if string.IsNullOrEmpty(inputField_Args[1].text) then return end

    for k, v in pairs(itemDatas) do
      if string.find(v.name, inputField_Args[1].text) ~= nil then
        logError(string.format("Item %d name = %s", k, v:GetName(true)));
      end
    end

  elseif argumentFunctions[functionId][1] == 209 then
    if string.IsNullOrEmpty(inputField_Args[1].text) then return end

    for k, v in pairs(npcDatas) do
      if string.find(v.name, inputField_Args[1].text) ~= nil then
        logError(string.format("Npc %d name = %s", k, v.name));
      end
    end
  elseif argumentFunctions[functionId][1] == 210 then    
    if not string.IsNullOrEmpty(inputField_Args[1].text) then      
      Chat.AddMessage(EChannel.System, string.Concat("Talk[", inputField_Args[1].text, "]: ", talkDatas[tonumber(inputField_Args[1].text)]));      
    end
    if not string.IsNullOrEmpty(inputField_Args[2].text) then 
      Chat.AddMessage(EChannel.System, string.Concat("Text[", inputField_Args[2].text, "]: ", textDatas[tonumber(inputField_Args[2].text)]));      
    end
  elseif argumentFunctions[functionId][1] == 211 then
    Chat.AddMessage(EChannel.System, "serverTIme : " ..tostring(CGTimer.serverTime) .. " onlineTime : " ..tostring(CGTimer.onlineTime) .. " rolecount : " .. tostring(RoleCount.Get(ERoleCount.OnlineTime)));
  elseif argumentFunctions[functionId][1] == 212 then
    local jiuId = tonumber(inputField_Args[1].text);
    local index = tonumber(inputField_Args[2].text);
    local missionId = tonumber(inputField_Args[3].text);
    sendBuffer:Clear();
    sendBuffer:WriteByte(1);
    sendBuffer:WriteUInt16(jiuId);
    sendBuffer:WriteByte(index);
    sendBuffer:WriteUInt16(missionId);
    Network.Send(91, 2, sendBuffer);
  elseif argumentFunctions[functionId][1] == 213 then
    local jiuId = tonumber(inputField_Args[1].text);
    local index = tonumber(inputField_Args[2].text);
    sendBuffer:Clear();
    sendBuffer:WriteUInt16(jiuId);
    sendBuffer:WriteByte(index);
    Network.Send(91, 3, sendBuffer);
  elseif argumentFunctions[functionId][1] == 214 then
    local mainKind = tonumber(inputField_Args[1].text);
    local subKind = tonumber(inputField_Args[2].text);
    local count = tonumber(inputField_Args[3].text);  

    sendBuffer:Clear();
    for i = 1, count do
      Network.Send(mainKind, subKind, sendBuffer);
    end
  elseif argumentFunctions[functionId][1] == 215 then
    if string.IsNullOrEmpty(inputField_Args[1].text) then return end
    local kind = tonumber(inputField_Args[1].text);

    if kind == 0 then --關
      UIBag.showIndex = false;
    elseif kind == 1 then --開
      UIBag.showIndex = true;
    end
  elseif argumentFunctions[functionId][1] == 216 then
    local result = IAPData.GetTWProduct()
    LuaHelper.FinishBuy(result[tonumber(inputField_Args[1].text)]);
  elseif argumentFunctions[functionId][1] == 217 then
    if string.IsNullOrEmpty(inputField_Args[1].text) then return end
    if table.Count(Role.GetFollowNpcs(Role.playerId)) >= Role.maxFollowNpc then
      ShowCenterMessage("隊伍已滿");
      return
    end
    if npcDatas[tonumber(inputField_Args[1].text)] == nil or npcDatas[tonumber(inputField_Args[1].text)].kind ~= 36 then
      ShowCenterMessage("請選擇可以二轉的武將");
      return
    end
    sendBuffer:Clear();
    sendBuffer:WriteInt64(inputField_RoleId.text);
    sendBuffer:WriteUInt32(tonumber(inputField_Args[1].text));
    Network.Send(100, 5, sendBuffer);
    local index = 1;
    for i = 1, Role.maxFollowNpc do
      if Role.followNpcs[Role.playerId][i] == nil then
        index = i;
        break
      end
    end
    --C:044-001 <武將轉生> +武將索引(1)
    sendBuffer:Clear();
    sendBuffer:WriteByte(index);
    Network.Send(44, 1, sendBuffer);
    --C:044-003 <武將二轉> +武將索引(1)
    sendBuffer:Clear();
    sendBuffer:WriteByte(index);
    Network.Send(44, 3, sendBuffer);
    --C:100-003 <加經驗>
    sendBuffer:Clear();
    sendBuffer:WriteInt64(inputField_RoleId.text);
    sendBuffer:WriteUInt32(index);
    sendBuffer:WriteUInt32(100000000);
    Network.Send(100, 3, sendBuffer);
  elseif argumentFunctions[functionId][1] == 228 then
    if string.IsNullOrEmpty(inputField_Args[1].text) then return end
    UIMonopoly.SetStep(tonumber(inputField_Args[1].text));
  elseif argumentFunctions[functionId][1] == 229 then
    if string.IsNullOrEmpty(inputField_Args[1].text) then return end
    if string.IsNullOrEmpty(inputField_Args[2].text) then return end
    if string.IsNullOrEmpty(inputField_Args[3].text) then return end
    if string.IsNullOrEmpty(inputField_Args[4].text) then return end
    if string.IsNullOrEmpty(inputField_Args[5].text) then return end
    local x = tonumber(inputField_Args[1].text);
    local y = tonumber(inputField_Args[2].text);
    local z = tonumber(inputField_Args[3].text);
    local offset_X = tonumber(inputField_Args[4].text);
    local offset_Y = tonumber(inputField_Args[5].text);

    local furniture = HouseEditorManager.GetBlockFurniture(x, y, z, EFurnitureKindType.Furniture)

    if furniture == nil then
      ShowCenterMessage("沒有家具");
      return
    elseif table.Count(furniture.interactivePoint) > 0 then
      furniture.interactivePoint[1].x = offset_X;
      furniture.interactivePoint[1].y = offset_Y;
    end
  elseif argumentFunctions[functionId][1] == 230 then
    if string.IsNullOrEmpty(inputField_Args[1].text) then return end
    if string.IsNullOrEmpty(inputField_Args[2].text) then return end
    if string.IsNullOrEmpty(inputField_Args[3].text) then return end
    if string.IsNullOrEmpty(inputField_Args[4].text) then return end
    if string.IsNullOrEmpty(inputField_Args[5].text) then return end
    if string.IsNullOrEmpty(inputField_Args[6].text) then return end
    local x = tonumber(inputField_Args[1].text);
    local y = tonumber(inputField_Args[2].text);
    local z = tonumber(inputField_Args[3].text);
    local kindType = tonumber(inputField_Args[4].text);
    local offset_X = tonumber(inputField_Args[5].text);
    local offset_Y = tonumber(inputField_Args[6].text);
    local furniture = HouseEditorManager.GetBlockFurniture(x, y, z, kindType)

    if furniture == nil then
      ShowCenterMessage("沒有家具");
      return
    else
      npcDatas[furniture.data.Id].picOffsetX = offset_X - 1000;
      npcDatas[furniture.data.Id].picOffsetY = offset_Y - 1000;
      furniture:SetTexturePosition();
    end
  elseif argumentFunctions[functionId][1] == 231 then
    if string.IsNullOrEmpty(inputField_Args[1].text) then return end
    if string.IsNullOrEmpty(inputField_Args[2].text) then return end
    local id = tonumber(inputField_Args[1].text);
    local number = tonumber(inputField_Args[2].text);
    this.CreateALotFurnitures(id, number);

  elseif argumentFunctions[functionId][1] == 232 then
    if string.IsNullOrEmpty(inputField_Args[1].text) then return end
    local dataName = inputField_Args[1].text;
    local dataID = tonumber(inputField_Args[2].text);
    local dataTable = _G[dataName];
    if dataTable == nil then
      logError("Table not found");
      return
    end
    if string.IsNullOrEmpty(inputField_Args[2].text) then
      table.Dump(dataTable);
      return
    end
    local data = dataTable[dataID];
    if data == nil then
      logError("Index not used");
      return
    end
    if type(data) == "table" then
      table.Dump(data);
    else
      log(data);
    end
  elseif argumentFunctions[functionId][1] == 233 then
    if string.IsNullOrEmpty(inputField_Args[1].text) then return end
    if string.IsNullOrEmpty(inputField_Args[2].text) then return end
    if string.IsNullOrEmpty(inputField_Args[3].text) then return end
    if string.IsNullOrEmpty(inputField_Args[4].text) then return end
    if string.IsNullOrEmpty(inputField_Args[5].text) then return end
    local x = tonumber(inputField_Args[1].text);
    local y = tonumber(inputField_Args[2].text);
    local z = tonumber(inputField_Args[3].text);
    local scale = tonumber(inputField_Args[4].text);
    local offset_Y = tonumber(inputField_Args[5].text);

    local furniture = HouseEditorManager.GetBlockFurniture(x, y, z, EFurnitureKindType.Furniture)

    if furniture == nil then
      ShowCenterMessage("沒有家具");
      return
    elseif furniture.effectType == EFurnitureEffect.NoEffect then
      ShowCenterMessage("此家具無特效");
    else
      furniture.effect.effectScale = scale * 0.001;
      furniture.effect.effectOffset = offset_Y;
      furniture:SetEffectTexture();
    end
  elseif argumentFunctions[functionId][1] == 234 then
    if string.IsNullOrEmpty(inputField_Args[1].text) then return end
    if string.IsNullOrEmpty(inputField_Args[2].text) then return end
    Requiem.SendSacrifice(tonumber(inputField_Args[1].text), tonumber(inputField_Args[2].text));
  elseif argumentFunctions[functionId][1] == 235 then
    local x, y, z;
    if not string.IsNullOrEmpty(inputField_Args[1].text) then
      x = tonumber(inputField_Args[1].text);
    end
    if not string.IsNullOrEmpty(inputField_Args[2].text) then
      y = tonumber(inputField_Args[2].text);
    end
    if not string.IsNullOrEmpty(inputField_Args[3].text) then
      z = tonumber(inputField_Args[3].text);
    end
    if x == nil then
      x = 0;
    end
    if y == nil then
      y = 0;
    end
    if z == nil then
      z = 0;
    end
    UIMonopoly.ForceSetTokenPosition(Vector3.New(x, y, z));
  end
end

function UIDebug.OnValueChanged_Function(value)
  this.UpdateUI();
end

function UIDebug.OnValueChanged_Skill(value)
  FightField.selectIdx = value + 1;
end

--None Argument Function
function UIDebug.OnClick_Function(sender)
  if string.IsNullOrEmpty(inputField_RoleId.text) then return end
  
  local kind = noneArgumentFunctions[sender.parameter][1];
  
  if kind <= 200 then
    sendBuffer:Clear();
    sendBuffer:WriteInt64(inputField_RoleId.text);
    Network.Send(100, kind, sendBuffer);

  --不用送的加這邊
  elseif kind == 201 then
    MapManager.ClearBlock();
    MapManager.CreateBlock();
    UI.Open(UIBlockEditor);
  elseif kind == 202 then
    MapManager.ClearBlock();
    UI.Close(UIBlockEditor);
  elseif kind == 203 then
    Util.ClearMemory();
  elseif kind == 204 then
    FightField.TestMode();
  elseif kind == 205 then
    FightField.TestSkill();
  elseif kind == 206 then
    FightField.TestAllSkill();
  elseif kind == 207 then
    dropdown_Skill.value = dropdown_Skill.value + 1;
    FightField.NextSkill();
  elseif kind == 208 then
    FightField.TestEnd();  
  elseif kind == 209 then 
    MissionPathTest.Init();
    UI.Close(UIDebug);
  elseif kind == 210 then
    Network.Disconnect();
  elseif kind == 211 then 
    MapManager.CreatDoor();
  elseif kind == 212 then 
    MapManager.ClearBlock();
  elseif kind == 213 then
    EventManager.PrintEventState();
  elseif kind == 214 then 
    Game.Logout(true);
  elseif kind == 216 then
    this.ReadyToTurn();
  elseif kind == 217 then
    this.GenerateExp();
  elseif kind == 218 then 
    UI.Open(UIGMFight);
  elseif kind == 219 then 
    sendBuffer:Clear();
    sendBuffer:WriteInt64(inputField_RoleId.text);
    Network.Send(1, 20, sendBuffer);
    --[[
    Network.serverId_Unbounded = 31;
    Network.host_Unbounded = "192.168.38.49"; 
    Network.port_Unbounded = Network.port;
    Network.SN_Unbounded = 1; 
    Network.loginKind = ELogin.Unbounded;
    Network.Connect_Unbounded();]]
  elseif kind == 220 then
    this.RecordMode = not this.RecordMode;
  elseif kind == 221 then
    IAP.FinishPurchase();
  elseif kind == 222 then
    this.ReadyToTurn2();
  elseif kind == 223 then
    this.ReadyToTurn3();
  elseif kind == 224 then
    this.AddAllFurnitures();
  elseif kind == 225 then
    this.AddNewFurnitures();
  elseif kind == 226 then
    this.FillBag();
  end
end

function UIDebug.ReadyToTurn()
  --跳過新手場景
  sendBuffer:Clear();
  sendBuffer:WriteInt64(inputField_RoleId.text);
  Network.Send(100, 107, sendBuffer);

  -- 場景標計
  sendBuffer:Clear();
  sendBuffer:WriteInt64(inputField_RoleId.text);
  Network.Send(100, 105, sendBuffer);
    
  -- Lv120
  sendBuffer:Clear();
  sendBuffer:WriteInt64(inputField_RoleId.text);
  sendBuffer:WriteUInt32(0);
  sendBuffer:WriteUInt32(33999999);
  Network.Send(100, 3, sendBuffer);

  -- 加完成標計
  sendBuffer:Clear();
  sendBuffer:WriteInt64(inputField_RoleId.text);
  sendBuffer:WriteUInt32(10867);
  sendBuffer:WriteUInt32(1);
  Network.Send(100, 7, sendBuffer);

  -- 加未完成標計
  sendBuffer:Clear();
  sendBuffer:WriteInt64(inputField_RoleId.text);
  sendBuffer:WriteUInt32(10869);
  sendBuffer:WriteUInt32(0);
  Network.Send(100, 7, sendBuffer);

  -- 加任務步驟
  sendBuffer:Clear();
  sendBuffer:WriteInt64(inputField_RoleId.text);
  sendBuffer:WriteUInt32(12316);
  sendBuffer:WriteUInt32(4);
  Network.Send(100, 6, sendBuffer);

  -- 傳送仙島
  sendBuffer:Clear();
  sendBuffer:WriteInt64(inputField_RoleId.text);
  sendBuffer:WriteUInt32(59411);
  sendBuffer:WriteUInt32(510);
  sendBuffer:WriteUInt32(440);
  sendBuffer:WriteUInt32(0);
  Network.Send(100, 9, sendBuffer);
end

function UIDebug.ReadyToTurn2()
  if Role.player:GetAttribute(EAttribute.Turn) ~= 1 then return end
   -- Lv120
  sendBuffer:Clear();
  sendBuffer:WriteInt64(inputField_RoleId.text);
  sendBuffer:WriteUInt32(0);
  sendBuffer:WriteUInt32(90000000);
  Network.Send(100, 3, sendBuffer);

  -- 加完成標計
  sendBuffer:Clear();
  sendBuffer:WriteInt64(inputField_RoleId.text);
  sendBuffer:WriteUInt32(11431);
  sendBuffer:WriteUInt32(1);
  Network.Send(100, 7, sendBuffer);

  sendBuffer:Clear();
  sendBuffer:WriteInt64(inputField_RoleId.text);
  sendBuffer:WriteUInt32(11433);
  sendBuffer:WriteUInt32(1);
  Network.Send(100, 7, sendBuffer);

  sendBuffer:Clear();
  sendBuffer:WriteInt64(inputField_RoleId.text);
  sendBuffer:WriteUInt32(11449);
  sendBuffer:WriteUInt32(1);
  Network.Send(100, 7, sendBuffer);

  sendBuffer:Clear();
  sendBuffer:WriteInt64(inputField_RoleId.text);
  sendBuffer:WriteUInt32(11489);
  sendBuffer:WriteUInt32(1);
  Network.Send(100, 7, sendBuffer);

  sendBuffer:Clear();
  sendBuffer:WriteInt64(inputField_RoleId.text);
  sendBuffer:WriteUInt32(11463);
  sendBuffer:WriteUInt32(1);
  Network.Send(100, 7, sendBuffer);

  sendBuffer:Clear();
  sendBuffer:WriteInt64(inputField_RoleId.text);
  sendBuffer:WriteUInt32(11491);
  sendBuffer:WriteUInt32(1);
  Network.Send(100, 7, sendBuffer);

  sendBuffer:Clear();
  sendBuffer:WriteInt64(inputField_RoleId.text);
  sendBuffer:WriteUInt32(11487);
  sendBuffer:WriteUInt32(1);
  Network.Send(100, 7, sendBuffer);

  -- 加任務步驟
  sendBuffer:Clear();
  sendBuffer:WriteInt64(inputField_RoleId.text);
  sendBuffer:WriteUInt32(12412);
  sendBuffer:WriteUInt32(3);
  Network.Send(100, 6, sendBuffer);

  -- 傳送仙島
  sendBuffer:Clear();
  sendBuffer:WriteInt64(inputField_RoleId.text);
  sendBuffer:WriteUInt32(59411);
  sendBuffer:WriteUInt32(510);
  sendBuffer:WriteUInt32(440);
  sendBuffer:WriteUInt32(0);
  Network.Send(100, 9, sendBuffer);
end

function UIDebug.ReadyToTurn3()
  if Role.player:GetAttribute(EAttribute.Turn) ~= 2 then return end
  -- Lv200
  sendBuffer:Clear();
  sendBuffer:WriteInt64(inputField_RoleId.text);
  sendBuffer:WriteUInt32(0);
  sendBuffer:WriteUInt32(1400000000);
  Network.Send(100, 3, sendBuffer);

  -- 加完成標計
  sendBuffer:Clear();
  sendBuffer:WriteInt64(inputField_RoleId.text);
  sendBuffer:WriteUInt32(12268);
  sendBuffer:WriteUInt32(1);
  Network.Send(100, 7, sendBuffer);

  sendBuffer:Clear();
  sendBuffer:WriteInt64(inputField_RoleId.text);
  sendBuffer:WriteUInt32(12270);
  sendBuffer:WriteUInt32(1);
  Network.Send(100, 7, sendBuffer);

  -- 加任務步驟
  sendBuffer:Clear();
  sendBuffer:WriteInt64(inputField_RoleId.text);
  sendBuffer:WriteUInt32(12563);
  sendBuffer:WriteUInt32(2);
  Network.Send(100, 6, sendBuffer);

  -- 傳送仙島
  sendBuffer:Clear();
  sendBuffer:WriteInt64(inputField_RoleId.text);
  sendBuffer:WriteUInt32(59411);
  sendBuffer:WriteUInt32(510);
  sendBuffer:WriteUInt32(440);
  sendBuffer:WriteUInt32(0);
  Network.Send(100, 9, sendBuffer);
end

function UIDebug.AddAllFurnitures()
  for k, v in pairs(furnitureDatas) do
    for kk, vv in pairs(itemDatas) do
      if vv.spare3 == v.Id then
        sendBuffer:Clear();
        sendBuffer:WriteInt64(Role.playerId);
        sendBuffer:WriteUInt32(kk);
        sendBuffer:WriteUInt32(50);
        Network.Send(100, 2, sendBuffer);
      end
    end
  end
end

function UIDebug.AddNewFurnitures()
  if table.Count(FurnitureManager.GetFurnituresInBag()) == 0 then
    ShowCenterMessage("請先進入小屋");
    return;
  end

  for k, v in pairs(furnitureDatas) do
    for kk, vv in pairs(itemDatas) do
      if vv.spare3 == v.Id then
        if FurnitureManager.GetFurnitureAmount(v.Id) == 0 then
          sendBuffer:Clear();
          sendBuffer:WriteInt64(Role.playerId);
          sendBuffer:WriteUInt32(kk);
          sendBuffer:WriteUInt32(50);
          Network.Send(100, 2, sendBuffer);
        end
      end
    end
  end
end

function UIDebug.CreateALotFurnitures(id ,number)
  if not HouseManager.IsInHouse() or not HouseManager.IsMyHouse() then return end
  if furnitureDatas[id] == nil or furnitureDatas[id].type ~= EFurnitureType.Ground then
    ShowCenterMessage("沒有此家具");
    return
  end

  FurnitureManager.SendAskAllFurnitures();

  local furnitureCount = 0;

  if number >= HouseEditorManager.maxAmountOfFurnitureOnScene then
    number = HouseEditorManager.maxAmountOfFurnitureOnScene;
  end

  if FurnitureManager.GetFurnitureAmount(id) < number then
    for k, v in pairs(itemDatas) do
      if v.spare3 == id then
        sendBuffer:Clear();
        sendBuffer:WriteInt64(Role.playerId);
        sendBuffer:WriteUInt32(k);
        sendBuffer:WriteUInt32(number);
        Network.Send(100, 2, sendBuffer);
      end
    end
  end

  FurnitureManager.ReceiveAllFurnituresOnScene();
  HouseEditorManager.UpdateAllBlockState();

  for x = 1, HouseEditorManager.sizeX / furnitureDatas[id].occupyBlockX do
    for y = 1, HouseEditorManager.sizeY / furnitureDatas[id].occupyBlockY do
      if furnitureCount < number then
        local blockX = x + (x - 1) * (furnitureDatas[id].occupyBlockX - 1);
        local blockY = y + (y - 1) * (furnitureDatas[id].occupyBlockY - 1);
        FurnitureManager.CreateFurniture(id, false, blockX, blockY, 0, EFurnitureDirection.LeftDown);
        furnitureCount = furnitureCount + 1;
      end
    end
  end

  FurnitureManager.SendFurnitureData();
end

function UIDebug.FillBag()
  local randomItems = RandomSampleTable(itemDatas, math.min(Item.GetBagLeftCount(EThings.Bag), 100));
  for k, v in pairs(randomItems) do
    sendBuffer:Clear();
    sendBuffer:WriteInt64(Role.playerId);
    sendBuffer:WriteUInt32(v.Id);
    sendBuffer:WriteUInt32(1);
    Network.Send(100, 2, sendBuffer);
  end
end

function UIDebug.GenerateExp()
  local result = "";

  for turn = 0, 3 do
    result = string.Concat(result, "Turn ", turn, "\n");
    for level = 1, Role.playerMaxLv do
      result = string.Concat(result, "[", level, "] ", string.GetCommaValue(Calc.GetUpExp(level, turn)), "\n");
    end
    result = string.Concat(result, "\n");
  end

  CGResourceManager.WriteText("Exp.txt", result);
end

function UIDebug.OnInitialize_ScrollContent_Function(scrollItems)
  for i = 0, scrollItems.Length - 1 do
    scrollItems_Function[i] = {};
    scrollItems_Function[i].text_Name = scrollItems[i]:Find("Text_Name"):GetComponent("Text");
    scrollItems_Function[i].event_BG = scrollItems[i]:Find("Image_BG"):GetComponent("UIEvent");
    scrollItems_Function[i].event_BG:SetListener(EventTriggerType.PointerClick, this.OnClick_Function);
  end
end

function UIDebug.OnItemChange_ScrollContent_Function(dataIndex, itemIndex)
  if noneArgumentFunctions[dataIndex + 1][1] == nil then return false end
  
  scrollItems_Function[itemIndex].text_Name.text = noneArgumentFunctions[dataIndex + 1][2];
  scrollItems_Function[itemIndex].event_BG.parameter = dataIndex + 1;
  
  return true;
end
