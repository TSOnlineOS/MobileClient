UIChessMahjong = {}
local this = UIChessMahjong;

this.name = "UIChessMahjong";
this.uiController = nil;

ChessConstant = {
  -- *** 胡牌種類 ***
  BINGO_SAMECOLOR = 1;      -- 一色
  BINGO_FIVEBEAUTY = 2;     -- 五美人
  BINGO_SEAFLOOR = 3;       -- 海底
  BINGO_BINGO = 4;          -- 起手到 (天胡)莊家特有
  BINGO_ZIMO = 5;           -- 自摸
  BINGO_NORMAL = 6;         -- 胡牌
  BINGO_BEBINGO = 7;        -- 放槍
  -- *** 常數 ***
  ZMCHESS_PIECENUM = 5;         -- 每人棋子陣列最大值. 分為(3+2)
  ZMCHESS_FUNCBTNNUM = 4;       -- 功能按鈕數目 (吃. 胡. 摸. 取消)
  ZMCHESS_EFFECTNUM = 3;        -- 可使用的效果圖數量
  ZMCHESS_ALLPIECENUM = 32;     -- 全部張數
  ZMCHESS_UNOPENPIECENUM = 16;  -- 覆蓋著的棋子數量
  ZMCHESS_PLAYERNUM = 4;        -- 單局人數
  ZMCHESS_COUNTDOWN = 5;        -- 單局倒數秒數

  -- *** 功能鈕 ***
  FUNCBTN_NONE = 0;       -- 什麼都沒有
  FUNCBTN_EAT = 1;        -- 吃
  FUNCBTN_BINGO = 2;      -- 胡
  FUNCBTN_MO = 3;         -- 摸
  FUNCBTN_CANCEL = 4;     -- 取消
  FUNCBTN_PIECE = 5;      -- 點牌. 出牌
  FUNC_DEAL = 7;          -- 發牌
  FUNC_JOIN = 9;          -- 別人加入. 本等待中的棋局
  FUNC_QUIT = 10;         -- 有玩家離開棋局
  FUNC_JUSTIN = 11;       -- 剛入局的新人. 傳給目前棋局上所有人的 ID & MONEY

  -- *** 方向 ***
  DIR_MY = 1;             -- 自己的
  DIR_RIGHT = 2;          -- 右
  DIR_TOP = 3;            -- 上
  DIR_LEFT = 4;           -- 左

  -- *** 棋局狀態 ***
  GAME_NONE = 0;          -- 尚未開啟
  GAME_START = 1;         -- 開始...傳 其他玩家的資訊
  GAME_DEAL = 2;          -- 發牌中
  GAME_RUNNING = 3;       -- 遊戲進行中
  GAME_RESULT = 5;        -- 棋局結算
  GAME_OUTPIECE = 6;      -- 流局
  GAME_CONTI = 7;         -- 繼續一局.
  GAME_PLAYERQUIT = 8;    -- 違規離線
  GAME_SORTTIME = 9;      -- 理牌時間

  -- ****** 效果 ******
  -- === 圖索引 ===
  EFF_START = 1;      -- 開始
  EFF_SELFBINGO = 2;  -- 自摸
  EFF_BEBINGO = 3;    -- 放槍
  EFF_OUTPIECE = 4;   -- 流局
  EFF_BINGO = 5;      -- 胡
  EFF_BOOM = 6;       -- 爆炸
  -- === 效果時效 ===
  EFFTIME_START = 1;       -- 開始 顯示多久
  EFFTIME_BINGO = 3;       -- 胡 顯示多久
  EFFTIME_BEBINGO = 3;     -- 放槍 顯示多久
  EFFTIME_OUTPIECE = 3;    -- 流局 顯示多久

  -- *** 音效 ***
  SOUND_CANBINGO = "AudioClip_WA0044";  -- 可胡
  SOUND_BEBINGO = "AudioClip_WB0020";   -- 放槍
  SOUND_ZIMO = "AudioClip_WA0064";      -- 自摸
  SOUND_BINGO = "AudioClip_WA0035";     -- 胡
  SOUND_2BINGO = "AudioClip_WB0003";    -- 一炮雙響
  SOUND_3BINGO = "AudioClip_WB0015";    -- 一炮三響
  SOUND_OUTPIECE = "AudioClip_WA0012";  -- 流局
  SOUND_COUNTDOWN = "AudioClip_WA0045"; -- 倒數3秒
  SOUND_PIECE = "AudioClip_WB0007";     -- 出牌
  SOUND_DEAL = "AudioClip_WA0017";      -- 發牌
}

-- Region 自摸棋UI變數
local transform_FrameRect;
local pieceBtnAry = {};     -- 棋子也是按鈕
local funcBtnAry = {};      -- 按鈕 吃. 胡. 摸. 取消的Event
local funcBtnImageAry = {}; -- 按鈕 吃. 胡. 摸. 取消的RawImage
local countdownSequence;    -- 倒數計時的Sequence
local UI_WaitPlayerCount = {};        -- 等待玩家加入的資訊介面
local image_CoverPiece = {};          -- 檯面上未被翻開的棋子
local rawImage_Piece_Discarded = {};  -- 檯面上被玩家棄置的棋子
local rawImage_TopPiece = {};         -- 玩家上方的棋子
local rawImage_LeftPiece = {};        -- 玩家左方的棋子
local rawImage_RightPiece = {};       -- 玩家右方的棋子
local rawImage_MyPiece = {};          -- 玩家自己的棋子
local rawImage_Effect = {};           -- 顯示效果圖 (開始，自摸，胡牌，放槍)
local text_StatusMoney = {};          -- 顯示玩家金錢
local text_StatusName = {};           -- 顯示玩家名稱
local text_WaitMsg;                   -- 顯示等待玩家加入
local text_CountDown;                 -- 顯示倒數計時
local image_HeadIcon = {};            -- 顯示玩家的大頭圖
local transform_HeadIcon = {};        -- 玩家大頭圖的RectTransform，用來控制顯藏顯示
-- EndRegion 自摸棋UI變數
-- Region 自摸棋結算UI變數
local isResultVisible = false;
local UI_ZMC_Result;                -- 自摸棋結算介面
local text_ResultName;              -- 顯示玩家的名稱
local text_Result;                  -- 顯示贏了多少錢、輸了多少錢
local text_TotleMoney;              -- 顯示結算後的玩家金錢
local text_CountSum;                -- 顯示胡牌玩家贏了幾台
local rawImage_BingoStruct = {};    -- 顯示胡牌玩家的胡牌結構
local rawImage_BeBingo;             -- 顯示放槍圖案
local rawImage_Btn_Exit;            -- '見好就收'按鈕
local rawImage_Btn_Again;           -- '我要上訴'按鈕
local rawImage_Btn_MoneySettlement; -- '結算'按鈕
local moneySettlement = {};         -- 結算金錢的結果
-- EndRegion 自摸棋結算UI變數
-- Region 自摸棋邏輯專用變數
local allPlayers = {};          -- 儲存所有棋友 (ChessPlayer)
local myIdIdx = 0;              -- 玩家自己 (Server上存放Who)
local gameStatus = 0;           -- 目前棋局的狀態
local unOpenPieceNum = 0;       -- 未翻開的牌數
local openPieceNum = 0;         -- 被打出牌的牌數
local nowPlayerIdx = 0;         -- 輪到誰index
local bankerIdx = 0;            -- 莊家index
local baseBet = 0;              -- 基本賭金
local bingoPlayerIdx = 0;       -- 胡牌的玩家index
local beBingoPlayerIdx = 0;     -- 放槍的玩家index
local quitPlayerIdx = 0;        -- 中途違規離線的玩家index
local openPieceAry = {};        -- 桌上所打出的牌
-- EndRegion 自摸棋邏輯專用變數

function UIChessMahjong.Initialize(go)
  local uiController = go:GetComponent("UIController");
  this.uiController = uiController;
  this.uiController.onOpen = this.OnOpen;
  this.uiController.onVisible = this.OnVisible;
  this.uiController.onClose = this.OnClose;
  -- 初始化自摸棋遊戲主介面
  this.InitializeMainChessMahjong(uiController);
  -- 初始化自摸棋結算介面
  this.InitializeChessMahjongResult(uiController);
  -- 初始化邏輯需要的參數
  this.InitValue();
  gameStatus = ChessConstant.GAME_NONE;
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  
end

function UIChessMahjong.InitializeMainChessMahjong(uiController)
  transform_FrameRect = uiController:FindGameObject("FrameRect").transform;

  -- 背景圖
  TextureManager.SetPng(ETextureUseType.None, "ZMC_BG",  uiController:FindRawImage("ZMC_BG"));
  -- 活動名稱
  local text_ActivityName = uiController:FindText("Text_ActivityName");
  text_ActivityName.text = string.Get(22200);
  -- 等待玩家加入的資訊介面
  UI_WaitPlayerCount = uiController:FindGameObject("UI_WaitPlayerCount");
  text_WaitMsg = uiController:FindText("Text_WaitMsg");
  text_WaitMsg.text = "";
  text_CountDown = uiController:FindText("Text_CountDown");
  -- 功能按鈕
  funcBtnAry[ChessConstant.FUNCBTN_BINGO] = uiController:FindEvent("Image_Btn_Bingo");
  funcBtnAry[ChessConstant.FUNCBTN_BINGO]:SetListener(EventTriggerType.PointerClick, this.OnClick_Bingo);
  funcBtnImageAry[ChessConstant.FUNCBTN_BINGO] = uiController:FindRawImage("Image_Btn_Bingo");

  funcBtnAry[ChessConstant.FUNCBTN_CANCEL] = uiController:FindEvent("Image_Btn_Cancel");
  funcBtnAry[ChessConstant.FUNCBTN_CANCEL]:SetListener(EventTriggerType.PointerClick, this.OnClick_Cancel);
  funcBtnImageAry[ChessConstant.FUNCBTN_CANCEL] = uiController:FindRawImage("Image_Btn_Cancel");

  funcBtnAry[ChessConstant.FUNCBTN_EAT] = uiController:FindEvent("Image_Btn_Eat");
  funcBtnAry[ChessConstant.FUNCBTN_EAT]:SetListener(EventTriggerType.PointerClick, this.OnClick_Eat);
  funcBtnImageAry[ChessConstant.FUNCBTN_EAT] = uiController:FindRawImage("Image_Btn_Eat");

  funcBtnAry[ChessConstant.FUNCBTN_MO] = uiController:FindEvent("Image_Btn_Mo");
  funcBtnAry[ChessConstant.FUNCBTN_MO]:SetListener(EventTriggerType.PointerClick, this.OnClick_Mo);
  funcBtnImageAry[ChessConstant.FUNCBTN_MO] = uiController:FindRawImage("Image_Btn_Mo");

  -- 桌面上蓋著的棋子 (初始發完給四位玩家後會剩下16顆)
  for i = 1, ChessConstant.ZMCHESS_UNOPENPIECENUM do
    image_CoverPiece[i] = uiController:FindRawImage(string.format("ZMC_Piece_Covered (%d)", i ));
    this.ChangePieceToBottomCover(image_CoverPiece[i]);
  end

  -- 桌面上被玩家丟棄的棋子
  for i = 1, ChessConstant.ZMCHESS_UNOPENPIECENUM do
    rawImage_Piece_Discarded[i] = uiController:FindRawImage(string.format("ZMC_Piece_Discarded (%d)", i));
  end

  -- 玩家的五顆棋子
  for i = 1, ChessConstant.ZMCHESS_PIECENUM do
    pieceBtnAry[i] = uiController:FindEvent(string.format("Image_My_Piece (%d)", i));
    pieceBtnAry[i]:SetListener(EventTriggerType.PointerClick, function() this.OnClick_Piece(i) end);
    rawImage_MyPiece[i] = uiController:FindRawImage(string.format("Image_My_Piece (%d)", i ));
    this.ChangePieceToBottomCover(rawImage_MyPiece[i]);
  end
  -- 上方玩家的五顆棋子
  for i = 1, ChessConstant.ZMCHESS_PIECENUM do
    rawImage_TopPiece[i] = uiController:FindRawImage(string.format("Image_Top_Piece (%d)", i));
    if i == 5 then
      this.ChangePieceToTopCover(rawImage_TopPiece[i]);
    else
      this.ChangePieceToBottomCover(rawImage_TopPiece[i]);
    end
  end
  -- 左方玩家的五顆棋子
  for i = 1, ChessConstant.ZMCHESS_PIECENUM do
    rawImage_LeftPiece[i] = uiController:FindRawImage(string.format("Image_Left_Piece (%d)", i));
    if i == 5 then
      this.ChangePieceToLeftCover(rawImage_LeftPiece[i]);
    else
      this.ChangePieceToBottomCover(rawImage_LeftPiece[i]);
    end
  end
  -- 右方玩家的五顆棋子
  for i = 1, ChessConstant.ZMCHESS_PIECENUM do
    rawImage_RightPiece[i] = uiController:FindRawImage(string.format("Image_Right_Piece (%d)", i));
    if i == 5 then
      this.ChangePieceToRightCover(rawImage_RightPiece[i]);
    else
      this.ChangePieceToBottomCover(rawImage_RightPiece[i]);
    end
  end

  -- 玩家姓名、金錢、大頭圖
  text_StatusMoney[ChessConstant.DIR_TOP] = uiController:FindText("Top_Status_Money");
  text_StatusMoney[ChessConstant.DIR_LEFT] = uiController:FindText("Left_Status_Money");
  text_StatusMoney[ChessConstant.DIR_RIGHT] = uiController:FindText("Right_Status_Money");
  text_StatusMoney[ChessConstant.DIR_MY] = uiController:FindText("My_Status_Money");
  text_StatusName[ChessConstant.DIR_TOP] = uiController:FindText("Top_Status_Name");
  text_StatusName[ChessConstant.DIR_LEFT] = uiController:FindText("Left_Status_Name");
  text_StatusName[ChessConstant.DIR_RIGHT] = uiController:FindText("Right_Status_Name");
  text_StatusName[ChessConstant.DIR_MY] = uiController:FindText("My_Status_Name");
  transform_HeadIcon[ChessConstant.DIR_TOP] = uiController:FindGameObject("Top_Status"):GetComponent("RectTransform");
  transform_HeadIcon[ChessConstant.DIR_LEFT] = uiController:FindGameObject("Left_Status"):GetComponent("RectTransform");
  transform_HeadIcon[ChessConstant.DIR_RIGHT] = uiController:FindGameObject("Right_Status"):GetComponent("RectTransform");
  transform_HeadIcon[ChessConstant.DIR_MY] = uiController:FindGameObject("My_Status"):GetComponent("RectTransform");
  image_HeadIcon[ChessConstant.DIR_TOP] = HeadIconController.New(transform_HeadIcon[ChessConstant.DIR_TOP]:Find("Icon"));
  image_HeadIcon[ChessConstant.DIR_LEFT] = HeadIconController.New(transform_HeadIcon[ChessConstant.DIR_LEFT]:Find("Icon"));
  image_HeadIcon[ChessConstant.DIR_RIGHT] = HeadIconController.New(transform_HeadIcon[ChessConstant.DIR_RIGHT]:Find("Icon"));
  image_HeadIcon[ChessConstant.DIR_MY] = HeadIconController.New(transform_HeadIcon[ChessConstant.DIR_MY]:Find("Icon"));
  for i = 1, ChessConstant.ZMCHESS_PLAYERNUM do
    transform_HeadIcon[i].gameObject:SetActive(false);
  end

  -- 顯示效果圖 (開始，自摸，胡牌，放槍)
  for i = 1, ChessConstant.ZMCHESS_EFFECTNUM do
    rawImage_Effect[i] = uiController:FindRawImage(string.format("ZMC_Effect (%d)", i));
  end
end

function UIChessMahjong.OnOpen()
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  return true;
end

function UIChessMahjong.OnVisible(visible)
  if (visible) then
    UIFrame.Active(transform_FrameRect, string.Get(20066), this.OnClick_Close, this.OnClick_Help);
    -- 完成介面開啟後才註冊賭局
    this.SendSignUp();
    -- 確保因中斷離開的玩家，重新報名後不會跳出結算畫面
    this.CloseChessMahjongResult();
  end
end

function UIChessMahjong.OnClose()
  this.CloseChessMahjongResult();
  -- 離開棋局
  this.SendLeaveChessMahjong();
  -- 清除棋局Player資料
  this.ResetPlayerStatus();
  -- 恢復自摸棋介面到初始狀態
  this.ResetChessMahjongUI();
  return true;
end

function UIChessMahjong.ResetChessMahjongUI()
  -- 隱藏所有被玩家棄置的棋子
  for i = 1, ChessConstant.ZMCHESS_UNOPENPIECENUM do
    LuaHelper.SetColor(rawImage_Piece_Discarded[i], Color.Alpha);
  end
  -- 隱藏第五張棋子
  LuaHelper.SetColor(rawImage_MyPiece[5], Color.Alpha);
  LuaHelper.SetColor(rawImage_TopPiece[5], Color.Alpha);
  LuaHelper.SetColor(rawImage_RightPiece[5], Color.Alpha);
  LuaHelper.SetColor(rawImage_LeftPiece[5], Color.Alpha);
  -- 必須將第五張棋子改回被蓋住的狀態
  this.ChangePieceToTopCover(rawImage_TopPiece[5]);
  this.ChangePieceToRightCover(rawImage_RightPiece[5]);
  this.ChangePieceToLeftCover(rawImage_LeftPiece[5]);
  -- 將玩家棋子移動回尚未發牌的位置
  local sequence = DG.Tweening.DOTween.Sequence();
  for i = 1, ChessConstant.ZMCHESS_PIECENUM - 1 do
    sequence = this.MovePieceToNonDealingState(rawImage_MyPiece[i], sequence, 385 - (i*138), 53);
    sequence = this.MovePieceToNonDealingState(rawImage_TopPiece[i], sequence, 317 - (i*138), 53);
    sequence = this.MovePieceToNonDealingState(rawImage_LeftPiece[i], sequence, 385 - (i*138), 41);
    sequence = this.MovePieceToNonDealingState(rawImage_RightPiece[i], sequence, 317 - (i*138), 41);
  end
  sequence:Play();
  -- 顯示所有摸牌用的棋子
  -- (由於移動棋子後，有將棋子再移動回原位，故此處僅需顯示)
  for i = 1, ChessConstant.ZMCHESS_UNOPENPIECENUM do
    LuaHelper.SetColor(image_CoverPiece[i], Color.White);
  end
  -- 隱藏關閉功能按鈕
  this.HideAllFuncBtn();
  this.DisableAllFuncBtn();
  -- 修改遊戲狀態
  gameStatus = ChessConstant.GAME_NONE;
  -- 重置玩家狀態圖
  for i = 1, ChessConstant.ZMCHESS_PLAYERNUM do
    text_StatusMoney[i].text = 0;
    text_StatusName[i].text = "";
    transform_HeadIcon[i].gameObject:SetActive(false);
  end
  -- 顯示等待資訊
  UI_WaitPlayerCount:SetActive(true);
  text_WaitMsg.text = "";
end

function UIChessMahjong.OnClick_Close()
  -- 棋局開始與理牌時間中不能結束棋局
  if this.CheckGameStatusIsAfterSortTime() then
    UI.Close(this);
  end
  return true;
end

function UIChessMahjong.OnClick_Help(checkShow)
  if checkShow ~= true then
    UI.Open(UITutorialHint, 52, this);
  end

  return true;
end

function UIChessMahjong.OnClick_Bingo()
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  
  this.StopCountdown();
  this.SendFunctionMessage(ChessConstant.FUNCBTN_BINGO);
end

function UIChessMahjong.OnClick_Cancel()
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  
  this.StopCountdown();
  this.SendFunctionMessage(ChessConstant.FUNCBTN_CANCEL);
end

function UIChessMahjong.OnClick_Eat()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  this.StopCountdown();
  this.SendFunctionMessage(ChessConstant.FUNCBTN_EAT);
end

function UIChessMahjong.OnClick_Mo()
  this.StopCountdown();
  this.SendFunctionMessage(ChessConstant.FUNCBTN_MO);
end

function UIChessMahjong.OnClick_Piece(index)
  --1--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local code = DemoCode.GetBitxor(20);
    code = code * 10;
  end
  ---2--------------------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    local area =  DemoCode.CalTriangleArea(100, 100)
    area = area * 1 + 2;
    if area > DemoCode.GetBitxor(20) then  --test avg
      local avg = DemoCode.CalAvg(10, 20, 30);
    end
  end
  --3----------------------------------------------------
  this.SendFunctionMessage(ChessConstant.FUNCBTN_PIECE, index);
end

--[[
  傳送功能按鈕的協定
  @param funcIdx 功能按鈕的種類
  @param pieceIdx 若按的是棋子按鈕，則應輸入該按鈕的index
]]
function UIChessMahjong.SendFunctionMessage(funcIdx, pieceIdx)
  --紀錄最後一次按的功能鈕
  allPlayers[myIdIdx].funcBtnClicked = funcIdx;
  --[[ C:060-001 <一般操作> +種類(1)
    種類 1:吃
    種類 2:胡
    種類 3:摸
    種類 4:取消
    種類 6:發牌
    種類 7:出牌 +索引(1)
  ]]
  sendBuffer:Clear();
  -- 功能鈕為吃、摸、胡、取消
  if Contains(funcIdx, ChessConstant.FUNCBTN_EAT, ChessConstant.FUNCBTN_MO,
    ChessConstant.FUNCBTN_BINGO, ChessConstant.FUNCBTN_CANCEL) then
    sendBuffer:WriteByte(allPlayers[myIdIdx].funcBtnClicked);
  elseif (funcIdx == ChessConstant.FUNCBTN_PIECE) then
    sendBuffer:WriteByte(allPlayers[myIdIdx].funcBtnClicked);
    sendBuffer:WriteByte(pieceIdx);
  end
  Network.Send(60, 1, sendBuffer);
end

--[[
  停止倒數計時
]]
function UIChessMahjong.StopCountdown()
  text_CountDown.text = "";
  if (countdownSequence ~= nil) then
    countdownSequence:Kill(false);
  end
end

function UIChessMahjong.SetBtnStatus()
  --紀錄是否有任一btn可以使用. 為真. 則全部按鈕需顯現
  local bBtnEnable = true;
  this.HideAllFuncBtn();
  this.DisableAllFuncBtn();
  -- 暫存Button的開啟狀態
  local isCanBingo = false;

    --尚未正式進入遊戲
  if not this.CheckGameStatusIsRunning() then
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    --3----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    
    return;
  end

  --剛剛沒按過 取消
  if (allPlayers[myIdIdx].funcBtnClicked ~= ChessConstant.FUNCBTN_CANCEL) then
    -- 檢查可否胡牌
    if this.CheckIfPlayerCanBingo() then
      -- 開啟胡按鈕
      this.SetBtnEnableBy(funcBtnImageAry[ChessConstant.FUNCBTN_BINGO],
        funcBtnAry[ChessConstant.FUNCBTN_BINGO], ChessConstant.FUNCBTN_BINGO, true);
      isCanBingo = true;
      -- 開啟取消按鈕
      this.SetBtnEnableBy(funcBtnImageAry[ChessConstant.FUNCBTN_CANCEL],
        funcBtnAry[ChessConstant.FUNCBTN_CANCEL], ChessConstant.FUNCBTN_CANCEL, true);
      -- 播'可胡'音效
      AudioManager.PlayOnce(ChessConstant.SOUND_CANBINGO, 0);
    end
  end

  -- 若胡不可以使用
  if (not isCanBingo) then
    if this.CheckIfPlayerCanThrowPiece() then
      -- 可以丟牌
    elseif this.CheckIfPlayerCanMo() then
      if this.CheckIfPlayerCanEat() then
        --可以吃牌
        this.SetBtnEnableBy(funcBtnImageAry[ChessConstant.FUNCBTN_EAT],
          funcBtnAry[ChessConstant.FUNCBTN_EAT], ChessConstant.FUNCBTN_EAT, true);
      end
      --可以摸牌
      this.SetBtnEnableBy(funcBtnImageAry[ChessConstant.FUNCBTN_MO],
        funcBtnAry[ChessConstant.FUNCBTN_MO], ChessConstant.FUNCBTN_MO, true);
    else
      --上述條件都不符合. 則不需要顯現任何 按鈕
      bBtnEnable = false;
    end
  end

  if (bBtnEnable) then
    this.ShowAllFuncBtn();
  end
end

--[[
  設定Button的可用性，修改圖片與開關事件
    if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
]]
function UIChessMahjong.SetBtnEnableBy(btnRawImage, btnEvent, kind, isEnabled)
  -- Texture檔名結尾與按鈕使用的kind常數相同
  local textureName = string.format("ZMC_Btn%d", kind);
  TextureManager.SetPng(ETextureUseType.None, textureName,  btnRawImage);
  -- 將ShiftCount變更為3等分
  btnRawImage.shiftCount = 3;
  btnRawImage.rectTransform.sizeDelta = Vector2.New(
    btnRawImage.texture.width,
    btnRawImage.texture.height / 3);
  if (isEnabled) then
    btnRawImage:ChangeOrder(1);
    btnEvent.enabled = true;
  else
    btnRawImage:ChangeOrder(3);
    btnEvent.enabled = false;
  end
end

function UIChessMahjong.BeginRevToAll(gameType)
  gameStatus = gameType;
end

function UIChessMahjong.RevToAllStartOrConti(gameType, revBankerIdx)
  if (gameType == ChessConstant.GAME_CONTI) then
    --繼續一局的變數初始
    this.InitConti();
  end
  --取得莊家idx
  bankerIdx = revBankerIdx;
  -- 顯示棋局開始的Logo
  local effectPosition = this.GetEffectPosition(0, ChessConstant.EFF_START);
  this.ShowEffectInSeconds(rawImage_Effect[1], ChessConstant.EFF_START, effectPosition, ChessConstant.EFFTIME_START);
end

function UIChessMahjong.RevToAllSortTime()
  -- 理牌時間
  -- 將所有玩家的牌都設為4張. 以免顯示錯誤
  for i = 1, ChessConstant.ZMCHESS_PLAYERNUM do
    allPlayers[i].pieceNum = 4;
  end
  -- 設定發完牌後的張數
  unOpenPieceNum = 16;
  -- 理牌. 排序
  allPlayers[myIdIdx] = this.AdjustPiece(allPlayers[myIdIdx]);

  for i = 1, ChessConstant.ZMCHESS_PIECENUM do
    -- 將玩家的牌蓋牌
    this.ChangePieceToBottomCover(rawImage_MyPiece[i]);
  end
end

function UIChessMahjong.RevToAllRunning(revNowPlayerIdx)
  -- 遊戲正式開始
  -- 取得新玩家
  nowPlayerIdx = revNowPlayerIdx;
  -- 玩家輪替所需作的處理
  this.ChangePlayer();

  -- 重新排序後，取得資料翻開玩家的牌.
  this.UpdateMyPieceArray();
  -- 若遊戲開始時的第一位是我
  if this.CheckIfNowPlayerIsMe() then
    -- 開啟功能按鈕
    this.SetBtnStatus();
    -- 倒數時間開始
    countdownSequence = this.ShowCountdownNumber(ChessConstant.ZMCHESS_COUNTDOWN, text_CountDown);
  end
end

--[[
  取得自己目前的棋子，並顯示在牌面上
]]
function UIChessMahjong.UpdateMyPieceArray()
  for i = 1, 4 do
    -- 從Logic取出玩家的牌
    this.ChangePieceByID(allPlayers[myIdIdx].pieceAry[i], rawImage_MyPiece[i]);
  end
end

function UIChessMahjong.RevToAllResultOrOutPiece(gameType, revPieceNum, revAllPieceAry)
  -- 遊戲結算或流局
  if (gameType == ChessConstant.GAME_OUTPIECE) then
    -- 流局，胡牌與放槍玩家設為0，代表沒有輸贏
    bingoPlayerIdx = 0;
    beBingoPlayerIdx = 0;
  end

  -- 取得所有人的牌
  for i = 1, ChessConstant.ZMCHESS_PLAYERNUM do
    -- 取得張數
    local pieceNum = revPieceNum[i];
    -- 紀錄新張數
    allPlayers[i].pieceNum = pieceNum;

    local pieceImgAry = this.GetPieceImgAryByPositionIndex(i);
    -- 顯示其他玩家的牌面
    for j = 1, pieceNum do
      if (revAllPieceAry[i][j] ~= nil) then
        -- 透過該玩家的手牌ID設置牌面
        -- 需顯示放置的棋子牌面 (立起來的棋子是1, 2開頭，放置的棋子是3, 4開頭，故取得ID後須再+20)
        this.ChangePieceByID(revAllPieceAry[i][j] + 20, pieceImgAry[j]);
        -- 將該棋子設定為顯示
        LuaHelper.SetColor(pieceImgAry[j], Color.White);
      end
    end
    -- 若是 胡放槍. 則將顯示第5張牌
    if (allPlayers[i].bingoStruct[1] == ChessConstant.BINGO_NORMAL) then
      this.ChangePieceByID(openPieceAry[openPieceNum] + 20, pieceImgAry[5]);
      -- 將該棋子設定為顯示
      LuaHelper.SetColor(pieceImgAry[5], Color.White);
    end
  end

  if (gameType == ChessConstant.GAME_RESULT) then
    -- 遊戲結算
    this.ShowChessMahjongResult();
  elseif (gameType == ChessConstant.GAME_OUTPIECE) then
    -- 流局特效
    local effectPosition = this.GetEffectPosition(0, ChessConstant.EFF_OUTPIECE);
    this.ShowEffectInSeconds(rawImage_Effect[1], ChessConstant.EFF_OUTPIECE,
      effectPosition, ChessConstant.EFFTIME_OUTPIECE, this.ShowChessMahjongResult);
    -- 播放流局音效
    AudioManager.PlayOnce(ChessConstant.SOUND_OUTPIECE, 0);
  end
  this.HideAllFuncBtn();
end

function UIChessMahjong.RevToAllEndSincePlayerQuit(revQuitPlayerAryIdx)
  -- 棋局是因. 違規離線 結束
  -- 取得離開玩家的 AryIdx
  quitPlayerIdx = revQuitPlayerAryIdx;

  if not (1 <= quitPlayerIdx) and (quitPlayerIdx <= ChessConstant.ZMCHESS_PLAYERNUM) then
    return;
  end
  --自己不秀
  if (quitPlayerIdx == myIdIdx) then
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      DemoCode.SetColorNum(10);
      local area =  DemoCode.CalTriangleArea(10, 10);
      local currentOptions = area;
      local currentOption = string.Get(80098);
    end
    --4-----------------------------------------------------
    return;
  end

  this.HideAllFuncBtn();
  -- 遊戲結算
  this.ShowChessMahjongResult();
end

function UIChessMahjong.ShowChessMahjongResult()
  -- 顯示結算畫面
  this.OpenChessMahjongResult();
end

function UIChessMahjong.CloseChessMahjongResult()
  -- 關閉結算畫面
  this.CloseChessMahjongResult();
end

--[[
  根據位置index取得玩家棋子的RawImage陣列
]]
function UIChessMahjong.GetPieceImgAryByPositionIndex(positionIndex)
  local direction = this.GetDirection(myIdIdx, positionIndex);
  if (direction == ChessConstant.DIR_MY) then
    return rawImage_MyPiece;
  elseif (direction == ChessConstant.DIR_LEFT) then
    return rawImage_LeftPiece;
  elseif (direction == ChessConstant.DIR_TOP) then
    return rawImage_TopPiece;
  elseif (direction == ChessConstant.DIR_RIGHT) then
    return rawImage_RightPiece;
  end
end

function UIChessMahjong.RevToOtherDeal(revUnOpenPieceNum, revAllPieceNum)
  -- 發牌
  -- 更新未開張數
  unOpenPieceNum = revUnOpenPieceNum;
  -- 更新該棋友的張數
  for i = 1, 4  do
    allPlayers[i].pieceNum = revAllPieceNum[i];
  end
  this.SetBtnStatus();
end

function UIChessMahjong.RevToSenderDeal(revNowPlayerIdx, revPieceAry)
  -- 發牌給我
  nowPlayerIdx = revNowPlayerIdx;  --取得由誰先開始

  --取得4張牌
  for i = 1 , 4 do
    allPlayers[myIdIdx].pieceAry[i] = revPieceAry[i];
  end

  -- 開局的發牌。製作發牌效果
  -- 將16張牌依照順序，傳送到指定的位置上，並更換圖片
  local sequence = DG.Tweening.DOTween.Sequence();
  for i = 1, 16 do
    local direction = (i - 1) % 4 + 1;
    local index = math.modf(i/4) + 1;

    if (direction == ChessConstant.DIR_MY) then
      sequence = this.MoveMyPieceWhenDeal(index, sequence, allPlayers[myIdIdx].pieceAry[index]);
    elseif (direction == ChessConstant.DIR_LEFT) then
      index = math.modf(i/4);
      sequence = this.MoveLeftPieceWhenDeal(index, sequence);
    elseif (direction == ChessConstant.DIR_TOP) then
      sequence = this.MoveTopPieceWhenDeal(index, sequence);
    elseif (direction == ChessConstant.DIR_RIGHT) then
      sequence = this.MoveRightPieceWhenDeal(index, sequence);
    end
  end
  sequence:Play();
end

--[[
  發牌時移動我的棋子到正確位置
  MyPiece (x差距66，y相同)
  x: -198 -132 -66 0 66 y: -180
]]
function UIChessMahjong.MoveMyPieceWhenDeal(index, sequence, pieceID)
  return this.MovePieceAndCallback(rawImage_MyPiece[index], sequence, -198 + (index*66), -180,
  function ()
    AudioManager.PlayOnce(ChessConstant.SOUND_DEAL, 0);
    this.ChangePieceByID(pieceID, rawImage_MyPiece[index]);
  end);
end

--[[
  發牌時移動左方的棋子到正確位置
  LeftPiece (x差距20，y差距50)
  xy: -362 97 xy: -382 47 xy: -402 -7 xy: -422 -57 xy: -442 -107
]]
function UIChessMahjong.MoveLeftPieceWhenDeal(index, sequence)
  return this.MovePieceAndCallback(rawImage_LeftPiece[index], sequence, -342 - (index*20), 147 - (index*50),
  function()
    AudioManager.PlayOnce(ChessConstant.SOUND_DEAL, 0);
    this.ChangePieceToLeftCover(rawImage_LeftPiece[index]);
  end);
end

--[[
  發牌時移動上方的棋子到正確位置
  TopPiece (x差距66，y相同)
  x: -198 -32 -66 0 66 y: 166
]]
function UIChessMahjong.MoveTopPieceWhenDeal(index, sequence)
  return this.MovePieceAndCallback(rawImage_TopPiece[index], sequence, -198 + (index*66), 166,
  function()
    AudioManager.PlayOnce(ChessConstant.SOUND_DEAL, 0);
    this.ChangePieceToTopCover(rawImage_TopPiece[index]);
  end);
end

--[[
  發牌時移動右方的棋子到正確位置
  RightPiece (x差距20，y差距50)
  xy: 362 97 xy: 382 47 xy: 402 -7 xy: 422 -57 xy: 442 -107
]]
function UIChessMahjong.MoveRightPieceWhenDeal(index, sequence)
  return this.MovePieceAndCallback(rawImage_RightPiece[index], sequence, 342 + (index*20), 147 - (index*50),
  function()
    AudioManager.PlayOnce(ChessConstant.SOUND_DEAL, 0);
    this.ChangePieceToRightCover(rawImage_RightPiece[index]);
  end);
end

function UIChessMahjong.RevToEat(revOpenPieceNum, revAllPieceNum, revEatPiece)
  -- 更新丟棄的棋數
  openPieceNum = revOpenPieceNum;

  -- 更新該棋友的張數
  for i = 1, 4 do
    allPlayers[i].pieceNum = revAllPieceNum[i];
  end

  -- 自己吃
  if revEatPiece ~= nil then
    -- 吃到的牌
    allPlayers[myIdIdx].pieceAry[allPlayers[myIdIdx].pieceNum] = revEatPiece;
    -- 紀錄按下哪各按鈕
    allPlayers[myIdIdx].funcBtnClicked = ChessConstant.FUNCBTN_EAT;
  end

  -- 吃棋時，將棋子移動到玩家的第五個位置上
  this.RevToEatOrMo(rawImage_Piece_Discarded[openPieceNum + 1], revEatPiece ~= nil);
end

function UIChessMahjong.RevToMo(revUnOpenPieceNum, revAllPieceNum, revMoPiece)
  -- 更新未開張數
  unOpenPieceNum = revUnOpenPieceNum;

  -- 更新該棋友的張數
  for i = 1 , 4 do
    allPlayers[i].pieceNum = revAllPieceNum[i];
  end

  if (revMoPiece ~= nil) then
    -- 摸到的牌
    allPlayers[myIdIdx].pieceAry[allPlayers[myIdIdx].pieceNum] = revMoPiece;
    -- 紀錄按下哪個按鈕
    allPlayers[myIdIdx].funcBtnClicked = ChessConstant.FUNCBTN_MO;
  else
    --其他玩家一摸牌. 強制關閉按鈕
    this.HideAllFuncBtn();
  end

  -- 摸棋時，將棋子移動到玩家第五個棋子的位置上
  local disableNum = ChessConstant.ZMCHESS_UNOPENPIECENUM - unOpenPieceNum;
  this.RevToEatOrMo(image_CoverPiece[disableNum], revMoPiece ~= nil);
end

--[[
  吃牌與摸牌的操作都相似，操控特定Image移動到玩家的第五張棋子的位置，並接著隱藏
  然後顯示玩家第五張棋子，若是自己吃摸牌，則必須更新牌面
  @param imageToMove 要操控移動的Image，移至正確位置後會隱藏
  @param isMe 是否為自己的boolean值
    if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  
]]
function UIChessMahjong.RevToEatOrMo(imageToMove, isMe)
  local nowPlayerDirection = this.GetNowPlayerDirection();
  local originalPosition = imageToMove.rectTransform.localPosition;
  this.MovePieceToFifthPosition(imageToMove, nowPlayerDirection, function()
    -- 需隱藏已經被摸走的棋子
    LuaHelper.SetColor(imageToMove, Color.Alpha);
    -- 將棋子移回原本的位置
    imageToMove.rectTransform.localPosition = originalPosition;
    -- 顯示目前輪到的玩家的第五張手牌
    this.ShowFifthPiece(nowPlayerDirection);
    -- 若摸牌的人是自己，則必須將第五張手牌更換為正確的牌面
    if (isMe) then
      local newPiece = allPlayers[myIdIdx].pieceAry[allPlayers[myIdIdx].pieceNum];
      this.ChangePieceByID(newPiece, rawImage_MyPiece[5]);
      -- 倒數時間開始
       countdownSequence = this.ShowCountdownNumber(ChessConstant.ZMCHESS_COUNTDOWN, text_CountDown);
      -- 開放讓玩家出牌
      for i = 1 , ChessConstant.ZMCHESS_FUNCBTNNUM do
        pieceBtnAry[i].enabled = true;
      end
    end
  end);
end

--[[
  更新檯面上未開的棋子數目，先將棋子移動到玩家的第五張棋子位置，而後隱藏
]]
function UIChessMahjong.MovePieceToFifthPosition(pieceImage, direction, callback)
  local sequence = DG.Tweening.DOTween.Sequence();
  if (direction == ChessConstant.DIR_MY) then
    sequence = this.MovePieceAndCallback(pieceImage, sequence, 132, -180, callback);
  elseif (direction == ChessConstant.DIR_LEFT) then
    sequence = this.MovePieceAndCallback(pieceImage, sequence, -442, -107, callback);
  elseif (direction == ChessConstant.DIR_TOP) then
    sequence = this.MovePieceAndCallback(pieceImage, sequence, 132, 166, callback);
  elseif (direction == ChessConstant.DIR_RIGHT) then
    sequence = this.MovePieceAndCallback(pieceImage, sequence, 442, -107, callback);
  end
  sequence:Play();
end

function UIChessMahjong.RevToPiece(revOpenPieceNum, revAllPieceNum, revOpenPiece, revNowPlayerIdx, revPieceClicked)
  -- 別人出明牌
  -- 更新檯面上棄置牌面的張數
  openPieceNum = revOpenPieceNum;
  -- 更新該棋友的張數
  for i = 1, 4  do
    allPlayers[i].pieceNum = revAllPieceNum[i];
  end
  -- 更新桌上打出去的牌
  openPieceAry[openPieceNum] = revOpenPiece;
  -- 輪到的玩家idIdx
  nowPlayerIdx = revNowPlayerIdx;

  if (revPieceClicked ~= nil) then
    -- 紀錄按下哪各按鈕
    allPlayers[myIdIdx].funcBtnClicked = ChessConstant.FUNCBTN_PIECE;
    -- 紀錄自己打出第幾張牌. (因應時限到server自動幫忙出牌)
    allPlayers[myIdIdx].pieceClicked = revPieceClicked;
    -- 清空自己打出的牌
    allPlayers[myIdIdx].pieceAry[allPlayers[myIdIdx].pieceClicked] = 0;
    -- 自己理牌
    allPlayers[myIdIdx] = this.AdjustPiece(allPlayers[myIdIdx]);
    --輪到的玩家idIdx
    nowPlayerIdx = revNowPlayerIdx;
    -- 丟棋子後重新顯示目前玩家的正確牌面
    this.UpdateMyPieceArray();
  end
  -- 更換玩家所需要做的工作
  this.ChangePlayer();

  -- 由於此時Server回傳的玩家已經輪到下一位，但要隱藏的是目前這一位的手牌
  local nowPlayerDirection = this.GetNowPlayerDirection() - 1;
  if (nowPlayerDirection == 0) then nowPlayerDirection = 4; end
  -- 隱藏目前輪到玩家的第五張手牌
  this.HideFifthPiece(nowPlayerDirection);
  -- 將該玩家丟出的棋子顯示於檯面上 (意即更改rawImage_Piece_Discarded的牌面)
  local discardedPieceID = openPieceAry[openPieceNum];
  local discardedPieceDestination = this.GetDiscardedPieceDestination(nowPlayerDirection);
  this.ShowOpenPieceAndMove(rawImage_Piece_Discarded[openPieceNum],
    discardedPieceID, discardedPieceDestination, this.AfterDiscardPiece);
  -- 播音效
  AudioManager.PlayOnce(ChessConstant.SOUND_PIECE, 0);
end

--[[
  丟牌動畫結束後，才檢查按鈕狀態
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
]]
function UIChessMahjong.AfterDiscardPiece()
  if this.CheckIfNowPlayerIsMe() then
    this.SetBtnStatus();
    -- 倒數時間開始
    countdownSequence = this.ShowCountdownNumber(ChessConstant.ZMCHESS_COUNTDOWN, text_CountDown);
  end
end

--[[
  顯示第五張手牌
]]
function UIChessMahjong.ShowFifthPiece(direction)
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
  this.SetFifthPieceColor(direction, Color.White);
end

--[[
  隱藏第五張手牌
]]
function UIChessMahjong.HideFifthPiece(direction)
  this.SetFifthPieceColor(direction, Color.Alpha);
end

function UIChessMahjong.SetFifthPieceColor(direction, color)
  if (direction == ChessConstant.DIR_MY) then
    LuaHelper.SetColor(rawImage_MyPiece[5], color);
  elseif (direction == ChessConstant.DIR_LEFT) then
    LuaHelper.SetColor(rawImage_LeftPiece[5], color);
  elseif (direction == ChessConstant.DIR_RIGHT) then
    LuaHelper.SetColor(rawImage_RightPiece[5], color);
  elseif (direction == ChessConstant.DIR_TOP) then
    LuaHelper.SetColor(rawImage_TopPiece[5], color);
  end
end

--[[
  取得目前輪到的玩家的方向
]]
function UIChessMahjong.GetNowPlayerDirection()
  return this.GetDirection(myIdIdx, nowPlayerIdx);
end

function UIChessMahjong.RevToBingo(revBeBingoPlayer, revBingoPlayer, revBingoStruct)
  if (revBingoStruct == nil) then
    -- 自己胡
    bingoPlayerIdx = myIdIdx;
    -- 放槍的玩家
    beBingoPlayerIdx = revBeBingoPlayer;
    allPlayers[myIdIdx].funcBtnClicked = ChessConstant.FUNCBTN_BINGO;
  else
    -- 別人胡
    bingoPlayerIdx = revBingoPlayer;
    -- 放槍的玩家
    beBingoPlayerIdx = revBeBingoPlayer;
    -- 胡牌組合1(1)+胡牌組合2(1)+胡牌組合3(1)
    allPlayers[bingoPlayerIdx].bingoStruct = {};
    for i = 1, 3 do
      allPlayers[bingoPlayerIdx].bingoStruct[i] = revBingoStruct[i];
    end
  end
  this.UpdateUIWhenBingo();
end

function UIChessMahjong.UpdateUIWhenBingo()
  -- 顯示爆炸的效果圖
  this.ShowEffectImage(1, bingoPlayerIdx, ChessConstant.EFF_BOOM, ChessConstant.EFFTIME_BINGO);

  -- 若是放槍的玩家Index為0，代表胡牌的人自摸
  if (beBingoPlayerIdx == 0) then
    -- 顯示自摸的效果圖
    this.ShowEffectImage(2, bingoPlayerIdx, ChessConstant.EFF_SELFBINGO, ChessConstant.EFFTIME_BINGO);
    -- 播音效
    AudioManager.PlayOnce(ChessConstant.SOUND_ZIMO, 0);
  else
    -- 顯示胡牌的效果圖
    this.ShowEffectImage(2, bingoPlayerIdx, ChessConstant.EFF_BINGO, ChessConstant.EFFTIME_BINGO);

    -- 顯示放槍的效果圖
    this.ShowEffectImage(3, beBingoPlayerIdx, ChessConstant.EFF_BEBINGO, ChessConstant.EFFTIME_BEBINGO);

    -- 如果放槍的是自己，播放放槍音效
    if (beBingoPlayerIdx == myIdIdx) then
      AudioManager.PlayOnce(ChessConstant.SOUND_BEBINGO, 0);
    else
      AudioManager.PlayOnce(ChessConstant.SOUND_BINGO, 0);
    end
  end
end

--[[
  顯示指定效果圖，並設定顯示時間 (秒)
  @param layer 效果圖的圖層順序 (數字越低在越上層，目前只支援最多3個圖層)
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
]]
function UIChessMahjong.ShowEffectImage(layer, positionIndex, effectKind, delaySecond)
  local effectDirection = this.GetDirection(myIdIdx, positionIndex);
  local effectPosition = this.GetEffectPosition(effectDirection, effectKind);
  this.ShowEffectInSeconds(rawImage_Effect[layer], effectKind, effectPosition, delaySecond);
end

function UIChessMahjong.RevToSenderCancel()
  -- 取消
  -- 清除 胡牌組合
  for i = 1 , 5 do
    allPlayers[myIdIdx].bingoStruct[i] = 0;
  end

  allPlayers[myIdIdx].funcBtnClicked = ChessConstant.FUNCBTN_CANCEL;
  this.SetBtnStatus();
  -- 倒數時間開始
   countdownSequence = this.ShowCountdownNumber(ChessConstant.ZMCHESS_COUNTDOWN, text_CountDown);
end

function UIChessMahjong.RevToSenderJoin(revIdIdx)
  -- 加入等待中的棋局. 選擇繼續棋局server的回傳
  -- 取得自己所坐的位置
  myIdIdx = revIdIdx;
  this.SettingMyStatus();

  -- 若結算畫面是打開的狀態，代表玩家再度加入同一個棋局
  if (this.IsResultVisible()) then
    this.CloseChessMahjongResult();
    this.ResetChessMahjongUI();
    this.ResetPreviousPieceArray();
    this.UpdatePlayerStatus();
    this.UpdatePlayerNumber();
  end
end

function UIChessMahjong.RevToOtherJoin(revPos, revID, revMoney, revName, revPatt)
  -- 其他玩家加入棋局
  -- 取得AryIdx
  local pos = revPos;
  -- 取得id
  allPlayers[pos].ID = revID;
  -- 取得Money
  allPlayers[pos].money = revMoney;
  -- 取得name
  allPlayers[pos].name = revName;
  -- 取得玩家大頭圖色盤
  allPlayers[pos].patt = revPatt;
  -- Str_40435:加入棋局
  ShowCenterMessage(string.Concat(allPlayers[pos].name, string.Get(40435)));

  this.UpdatePlayerStatus();
  this.UpdatePlayerNumber();
end

function UIChessMahjong.RevToSenderJustIn(revIdIdx, revPos, revAllID, revAllMoney, revAllName, revAllPatt)
  -- 剛加入棋局的新人
  -- 清空Status避免殘留
  this.ResetPlayerStatus();
  -- 取得自己的座位
  myIdIdx = revIdIdx;
  this.SettingMyStatus();

  for i = 1 , ChessConstant.ZMCHESS_PLAYERNUM do
    local pos = revPos[i];
    if (pos ~= nil) then
      if not (1 <= pos) and (pos <= ChessConstant.ZMCHESS_PLAYERNUM) then
        return;
      end
      --取得該玩家id
      allPlayers[pos].ID = revAllID[pos];
      --取得該玩家AryIdx
      allPlayers[pos].money = revAllMoney[pos];
      -- 取得該玩家Name
      allPlayers[pos].name = revAllName[pos];
      -- 取得玩家大頭圖色盤
      allPlayers[pos].patt = revAllPatt[pos];
    end
  end

  -- 玩家剛加入棋局
  this.UpdatePlayerStatus();
  this.UpdatePlayerNumber();
end

function UIChessMahjong.RevToOtherQuit(revPos)
  -- 其他玩家離開棋局
  -- 取得AryIdx
  local pos = revPos;
  -- Str_40436 離開棋局
  if (allPlayers[pos].name ~= "") then
    ShowCenterMessage(string.Concat(allPlayers[pos].name, string.Get(40436)));
  end
  allPlayers[pos].ID = 0;
  allPlayers[pos].money = 0;
  allPlayers[pos].name = "";
  allPlayers[pos].patt = nil;

  this.UpdatePlayerStatus();
  this.UpdatePlayerNumber();
end

--[[
  更新玩家的大頭圖、名稱、金錢
]]
function UIChessMahjong.UpdatePlayerStatus()
  -- 設定玩家的大頭圖、名稱與金錢
  for playerIdx = 1, ChessConstant.ZMCHESS_PLAYERNUM do
    local playerPatt = allPlayers[playerIdx].patt;
    local direction = this.GetDirection(myIdIdx, playerIdx);

    if (playerPatt.headStyle ~= nil) then
      transform_HeadIcon[direction].gameObject:SetActive(true);
      text_StatusName[direction].text = allPlayers[playerIdx].name;
      text_StatusMoney[direction].text = allPlayers[playerIdx].money;
      image_HeadIcon[direction]:ChangeIcon(playerPatt.sex, playerPatt.headStyle);
      image_HeadIcon[direction]:ChangeIconColor(EHeadIconPart.Hair, this.GetColorTint(EColorPart.Hair, playerPatt.colorTints));
      image_HeadIcon[direction]:ChangeIconColor(EHeadIconPart.Skin, this.GetColorTint(EColorPart.Skin, playerPatt.colorTints));
    else
      transform_HeadIcon[direction].gameObject:SetActive(false);
    end
  end
end

function UIChessMahjong.UpdatePlayerNumber()
  local missingNum = ChessConstant.ZMCHESS_PLAYERNUM;
  for playerIdx = 1, ChessConstant.ZMCHESS_PLAYERNUM do
    if (allPlayers[playerIdx].name ~= "") then
      missingNum = missingNum - 1;
    end
  end
  -- 當缺少玩家數到0時，自動隱藏該介面
  text_WaitMsg.text = string.Concat(string.Get(80042), ",", string.Get(80043), missingNum, string.Get(80044));
  if (missingNum <= 0) then
    UI_WaitPlayerCount:SetActive(false);
  end
end

function UIChessMahjong.FinishRevToSender(funcIdx)
  if Contains(funcIdx ,ChessConstant.FUNCBTN_PIECE, ChessConstant.FUNCBTN_BINGO) then
    -- 自己出牌、胡牌. 隱藏所有按鈕
    this.HideAllFuncBtn();
  else
    --檢查按鈕.
    this.SetBtnStatus();
  end
end

function UIChessMahjong.ShowAllFuncBtn()
  for i = 1 , ChessConstant.ZMCHESS_FUNCBTNNUM do
    LuaHelper.SetColor(funcBtnImageAry[i], Color.White);
  end
end

function UIChessMahjong.HideAllFuncBtn()
  for i = 1 , ChessConstant.ZMCHESS_FUNCBTNNUM do
    LuaHelper.SetColor(funcBtnImageAry[i], Color.Alpha);
  end
end

function UIChessMahjong.DisableAllFuncBtn()
  for i = 1 , ChessConstant.ZMCHESS_FUNCBTNNUM do
    this.SetBtnEnableBy(funcBtnImageAry[i], funcBtnAry[i], i, false);
    pieceBtnAry[i].enabled = false;
  end
end

--[[
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
  
  加入10000底自摸棋棋局
]]
function UIChessMahjong.SignUp()
  baseBet = 10000;
  UI.Open(UIChessMahjong);
end

function UIChessMahjong.InitValue()
  unOpenPieceNum = ChessConstant.ZMCHESS_ALLPIECENUM;
  openPieceNum = 0;
  this.ResetPlayerStatus();
end

function UIChessMahjong.ResetPlayerStatus()
  for i = 1, ChessConstant.ZMCHESS_PLAYERNUM do
    allPlayers[i] = ChessPlayer:New();
  end
end

--[[
  重置上一局殘留的棋子數字
]]
function UIChessMahjong.ResetPreviousPieceArray()
  for i = 1, ChessConstant.ZMCHESS_PLAYERNUM do
    for j = 1, ChessConstant.ZMCHESS_PIECENUM do
      allPlayers[i].pieceAry[j] = 0;
    end
  end
end

--[[
  重新棋局時需要初始化的變數
]]
function UIChessMahjong.InitConti()
  unOpenPieceNum = ChessConstant.ZMCHESS_ALLPIECENUM;
  openPieceNum = 0;
  bankerIdx = 0;
  bingoPlayerIdx = 0;
  beBingoPlayerIdx = 0;
  quitPlayerIdx = 0;
  -- 清空 桌上所打出的牌
  openPieceAry = {};
  -- 清空胡牌結構
  for i = 1, ChessConstant.ZMCHESS_PLAYERNUM do
    allPlayers[i].bingoStruct = {};
  end
end

--[[
  加入棋局後，將自己的資訊寫入AllID，AllMoney，AllName，AllPatt
]]
function UIChessMahjong.SettingMyStatus()
  -- 取得自己的ID，名稱，金錢
  allPlayers[myIdIdx].ID = Role.playerId;
  allPlayers[myIdIdx].name = Role.player.name;
  allPlayers[myIdIdx].money = Role.playerData.gold;
  allPlayers[myIdIdx].patt = {};
  allPlayers[myIdIdx].patt.sex = Role.player.data.sex;
  allPlayers[myIdIdx].patt.headStyle = Role.player.data.headStyle;
  allPlayers[myIdIdx].patt.colorTints = Role.player.data.colorTints;
end

function UIChessMahjong.AdjustPiece(chessPlayer)
  for  j = 1, ChessConstant.ZMCHESS_PIECENUM  do
    for  i = 1, (ChessConstant.ZMCHESS_PIECENUM - j)  do
      local idx1 = chessPlayer.pieceAry[i];
      local idx2 = chessPlayer.pieceAry[i+ 1];

      if (idx2 ~= nil) and (idx2 ~= 0) and ((idx1 == 0) or (idx1 > idx2)) then
      local Temp = chessPlayer.pieceAry[i];
      chessPlayer.pieceAry[i] = chessPlayer.pieceAry[i+ 1];
      chessPlayer.pieceAry[i+ 1] = Temp;
      end
    end
  end
  return chessPlayer;
end

function UIChessMahjong.ChangePlayer()
  --若玩家變更
  --清除上一手所按的按鈕. 以免判斷錯誤
  allPlayers[myIdIdx].funcBtnClicked = ChessConstant.FUNCBTN_NONE;
  --清除上一手所按的棋子. 以免判斷錯誤
  allPlayers[myIdIdx].pieceClicked = 0;
end

--[[
  離開棋局
]]
function UIChessMahjong.SendLeaveChessMahjong()
  --C:057-001 <離開牌局>
  Network.Send(57, 1);
end

--[[
  註冊棋局
]]
function UIChessMahjong.SendSignUp()
  --C:060-004 <報名牌局> +基本賭金(1)
  if (baseBet == 10000) then
    sendBuffer:Clear();
    -- 1為10000底 (舊版分100、1000底，新版改為10000底)
    sendBuffer:WriteByte(1);
    Network.Send(60, 4, sendBuffer);
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    
  end
end

--[[
  檢查目前棋局是否為進行中
]]
function UIChessMahjong.CheckGameStatusIsRunning()
  return (gameStatus == ChessConstant.GAME_RUNNING);
end

--[[
  檢查目前棋局是否已經過了理牌時間
  (意即棋局進行中、遊戲結算或流局、棋局因違規離線結束)
]]
function UIChessMahjong.CheckGameStatusIsAfterSortTime()
  return not Contains(gameStatus, ChessConstant.GAME_SORTTIME,
    ChessConstant.GAME_START, ChessConstant.GAME_CONTI, ChessConstant.GAME_DEAL);
end

--[[
  檢查可否胡牌
]]
function UIChessMahjong.CheckIfPlayerCanBingo()
  allPlayers[myIdIdx].bingoStruct = this.CheckBingo(allPlayers[myIdIdx], myIdIdx, openPieceAry[openPieceNum], unOpenPieceNum);

  if (allPlayers[myIdIdx].bingoStruct[1] ~= 0) then
    return true;
  end
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  return false;
end

--[[
  檢查是否可丟牌
]]
function UIChessMahjong.CheckIfPlayerCanThrowPiece()
  --已經有5張嘍
  return (allPlayers[myIdIdx].pieceNum == 5);
end

--[[
  檢查是否可以摸牌
]]
function UIChessMahjong.CheckIfPlayerCanMo()
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  
        --有4張牌        --輪到你才可以摸             --沒有未開的牌可以摸
  return (allPlayers[myIdIdx].pieceNum == 4) and (nowPlayerIdx == myIdIdx) and (unOpenPieceNum > 0);
end

--[[
  檢查是否可以吃牌
]]
function UIChessMahjong.CheckIfPlayerCanEat()
      --有棄牌才可以吃      --取消不胡牌. 則不可以吃. 只能摸牌
  return (openPieceNum > 0) and (allPlayers[myIdIdx].funcBtnClicked ~= ChessConstant.FUNCBTN_CANCEL);
end

--[[
  檢查目前的玩家是否輪到我
]]
function UIChessMahjong.CheckIfNowPlayerIsMe()
  return (nowPlayerIdx == myIdIdx);
end

--[[
  取得棋局的結算結果，贏了多少、輸了多少
  (必須要在玩家胡牌後使用才準確，此時的BingoStruct才有胡牌結構)
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------  --5-----------------------------------------------------
  --  if LuaHelper.CheckDefine("DemoCode") then
  --   --
  --  end
  --  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
  
  
]]
function UIChessMahjong.GetMoneySettlement()
  local allResult = {};
  for i = 1, ChessConstant.ZMCHESS_PLAYERNUM do
    allResult[i] = {};
    allResult[i].name = allPlayers[i].name;
    allResult[i].money = allPlayers[i].money;
    allResult[i].result = 0;
  end

  -- 若有玩家違規離線
  if(quitPlayerIdx ~= 0) then
    for i = 1, ChessConstant.ZMCHESS_PLAYERNUM do
      if (i == quitPlayerIdx) then
        allResult[i].result = allResult[i].result - baseBet * (ChessConstant.ZMCHESS_PLAYERNUM);
        allResult[i].money = allResult[i].money + allResult[i].result;
      else
        allResult[i].result = allResult[i].result + baseBet;
        allResult[i].money = allResult[i].money + allResult[i].result;
      end
    end
    return allResult;
  end

  local winner = bingoPlayerIdx;
  local loser = beBingoPlayerIdx;
  -- 若棋局流局，winner跟loser為0
  if (winner == 0 and loser == 0) then
    return allResult;
  end

  -- 取得總台數
  local countSum = this.GetCountSum(allPlayers[winner].bingoStruct);
  -- 取得倍數
  local multiple = this.GetMultiple(allPlayers[winner].bingoStruct);

  -- 若胡的玩家是自摸
  if (loser == 0) then
    -- 除自摸的玩家. 其餘都輸錢
    for i = 1, ChessConstant.ZMCHESS_PLAYERNUM do
      if (i ~= winner) then
        allResult[i].result = allResult[i].result - (countSum * baseBet);
        allResult[i].money = allResult[i].money + allResult[i].result;
      end
    end
  else
    -- 放槍
    -- 紀錄放槍的玩家輸多少錢
    allResult[loser].result = allResult[loser].result - (countSum * baseBet);
    allResult[loser].money = allResult[loser].money + allResult[loser].result;
  end
  -- 取得 東錢金額
  local ziMoMoney = this.GetZiMoMoney();
  allResult[winner].result = allResult[winner].result + (countSum * baseBet * multiple) - ziMoMoney;
  allResult[winner].money = allResult[winner].money + allResult[winner].result;
  return allResult;
end

--[[
  若胡牌的人是自摸，取得東錢金額
]]
function UIChessMahjong.GetZiMoMoney()
  local ziMoMoney = 0;
  -- 胡牌玩家的index，若為0代表流局
  local winner = bingoPlayerIdx;
  -- 放槍玩家的index，若為0代表胡牌自摸，需計算東錢
  local loser = beBingoPlayerIdx;
  if (loser == 0 and winner ~= 0) then
    if (baseBet == 10000) then
      ziMoMoney = 5000;
    end
  end
  return ziMoMoney;
end

--[[
  依傳入的玩家，判斷是否可胡牌
  @param chessPlayer 傳入的玩家
  @param aryIdx 該員坐的位置
  @param lastOpenPiece 最後一張棄子
  @param unopenPieceNum 未開棋子數
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
]]
function UIChessMahjong.CheckBingo(chessPlayer, aryIdx, lastOpenPiece, unopenPieceNum)
  -- 紀錄胡牌類型的table，初始化時全部設為0
  local bingoStruct = {};
  for i = 1, ChessConstant.ZMCHESS_PIECENUM do
    bingoStruct[i] = 0;
  end
  -- 不到張牌. 又沒有棄子可以吃
  if (chessPlayer.pieceNum == 4) and (openPieceNum <= 0) then
    return bingoStruct;
  end

  -- 沒有棄子. 清除LastOpenPiece以免錯誤
  if (openPieceNum <= 0) then
    lastOpenPiece = 0;
  end

  -- 取得要比對的5隻棋
  local pieceAry = {};
  -- 使用setmetatable的__index進行指定，才不會影響原本的table
  setmetatable(pieceAry, { __index = chessPlayer.pieceAry});
  for i = 1, ChessConstant.ZMCHESS_PIECENUM do
    if (pieceAry[i] == nil) then
      pieceAry[i] = 0;
    end
  end

  -- 不滿5張. 則第5張為所有人打出的棄牌最後一張
  if (chessPlayer.pieceNum == 4) then
    pieceAry[5] = lastOpenPiece;
  end

  -- 計算手牌的數量 (紅、黑，以及不同種類棋子的數量)
  -- 初始化統計陣列
  local idxNumAry = {};
  for color = 1, 2 do
    idxNumAry[color] = {};
    for kind = 0, 7 do
      idxNumAry[color][kind] = 0;
    end
  end
  for i = 1, 5 do
    if (pieceAry[i] ~= 0) then
      local color = math.modf(pieceAry[i] / 10);
      local kind = pieceAry[i] % 10;

      -- 累加該種牌數
      idxNumAry[color][kind] = idxNumAry[color][kind] + 1;
      -- 累加該色牌數
      idxNumAry[color][0] = idxNumAry[color][0] + 1;
    end
  end

  -- 檢查五美人
  local bSameWord = false;
  if (idxNumAry[1][7] == 5) or (idxNumAry[2][7] == 5) then
    bSameWord = true;
  end

  -- 排序
  pieceAry = this.PopSort(pieceAry, 1, 5, true);
  for i = 1, 5 do
    -- 檢查手牌是否未被清空，否則直接檢查下一個
    if (pieceAry[i] ~= 0) then
      -- 取得顏色
      local color = math.modf(pieceAry[i] / 10);
      -- 取得字
      local kind = pieceAry[i] % 10;
      --[[
        --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
        -- 胡牌編號. (五美人將用不到 bingoStruct[4].[5])
        -- === 3張 ===. (紀錄第一張牌id)
        紅  帥仕相 = 11; 車馬炮 = 14; 兵兵兵 = 17;
        黑     = 21;    = 24;    = 27;

        -- === 2張 ===. (紀錄第一張牌id)
        紅  將帥 = 1; 仕 = 12; 相 = 13; 車 = 14; 馬 = 15; 炮 = 16; 兵 = 17;
        黑         = 22;  = 23;  = 24;  = 25;  = 26;  = 27;
      ]]
      -- 該棋種的數量
      -- 1張
      if (idxNumAry[color][kind] == 1) then
        -- 字的種類
        if (kind == 1) then
          -- 將帥 (帥可搭配將 成2張; 或是 帥仕相<將士相> 成3張)

          -- *** 檢查2張 (將帥) ***
          -- 帥          -- 將1張
          if (color == 1) and (idxNumAry[2][1] == 1) then
            -- 後面塞不下2張. 基本上不會發生. 保險檢查用
            if (i > 4) then
              return bingoStruct;
            end

            for j = 1, 5 do
              if (pieceAry[j] == 21) then -- 尋找將
                pieceAry[j] = 0; -- 清空
                break;
              end
              bingoStruct[5] = 1; --  <==紀錄2張牌型
            end
          elseif (idxNumAry[color][2] == 1) and (idxNumAry[color][3] == 1) then
            -- 同色的士 1張           -- 同色的象 1張
            -- 後面塞不下2張. 基本上不會發生. 保險檢查用
            if (i > 3) then
              return bingoStruct;
            end

            for j = 0, 2 do
              pieceAry[i + j] = 0; -- 清空
            end
            bingoStruct[4] = (color * 10) + kind; --  <==紀錄3張牌型
          else
            -- 只有帥. 沒有仕&相. 且沒有將. 則離開
            return bingoStruct;
          end
        elseif (kind == 4) then
          -- 車
          -- 後面塞不下一張. 基本上不會發生. 保險檢查用
          if (i > 3) then
            return bingoStruct;
          end

          -- 同色的馬不是  1張        -- 同色的炮不是 1張
          if (idxNumAry[color][5] ~= 1) or (idxNumAry[color][6] ~= 1) then
            return bingoStruct;
          end

          for j = 0, 2 do
            pieceAry[i + j] = 0; -- 清空
          end
          bingoStruct[4] = (color * 10) + kind; --  <==紀錄3張牌型
        else
          -- 單張的 仕 相 馬 炮 兵. 則離開
          return bingoStruct;
        end
      elseif (idxNumAry[color][kind] == 2) then
        -- 兩張相同
        -- 後面塞不下1張. 基本上不會發生. 保險檢查用
        if (i > 4) then
          return bingoStruct;
        end

        for j = 0, 1 do
          pieceAry[i + j] = 0 -- 清掉
        end
        bingoStruct[5] = (color * 10) + kind; --  <==紀錄2張牌型
      elseif (idxNumAry[color][kind] == 3) then
        -- 3張 (兵卒)
        -- 後面塞不下2張. 基本上不會發生. 保險檢查用
        if (i > 3) then
          return bingoStruct;
        end

        for j = 0, 2 do
          pieceAry[i + j] = 0; -- 清掉
        end
        bingoStruct[4] = (color * 10) + kind; --  <==紀錄3張牌型
      elseif (idxNumAry[color][kind] == 4) then
        -- 4張(兵卒). 則離開
        return bingoStruct;
      end
    end
  end

  -- ====== 條件都符合. 決定胡牌種類 ======
  -- *** 檢查第一項 ***
  local bingoIdx = 1; -- 第1項. (最基本的. 與不搭配其他的)

  -- 檢查自摸 or 一般胡牌...
  if (chessPlayer.funcBtnClicked == ChessConstant.FUNCBTN_MO) then -- 最後一次執行的是自摸
    -- 自摸
    bingoStruct[bingoIdx] = ChessConstant.BINGO_ZIMO;
  else
    -- 一般胡牌
    bingoStruct[bingoIdx] = ChessConstant.BINGO_NORMAL;
  end
  -- *** 檢查第2項 ***
  bingoIdx = 2; -- 換第二項

  -- 檢查起手到...(一定是自摸)
  if (aryIdx == bankerIdx) then -- 是莊家
    if (unopenPieceNum == 15) then -- 自己摸了一張
      if (chessPlayer.pieceNum == 5) then -- 自己有5張
        bingoStruct[bingoIdx] = ChessConstant.BINGO_BINGO;
        bingoIdx = bingoIdx + 1; -- 換下一項
      end
    end
  end

  -- 檢查五美人...(僅可搭配自摸)
  if (bSameWord) then
    bingoStruct[bingoIdx] = ChessConstant.BINGO_FIVEBEAUTY;
    bingoIdx = bingoIdx + 1; -- 換下一項
  end

  -- 最多3項. 已超過3項. 以下便不需要檢查
  if (bingoIdx > 3) then
    return bingoStruct;
  end

  -- 檢查海底
  if (unopenPieceNum == 0) then -- 沒有可以摸的牌了
    if (openPieceNum == 15) and -- 還有一張未打出 & 現在該我 & 我剛剛才摸牌
      (nowPlayerIdx == aryIdx) and -- 現在輪到我
      (chessPlayer.funcBtnClicked == ChessConstant.FUNCBTN_MO) then
      bingoStruct[bingoIdx] = ChessConstant.BINGO_SEAFLOOR;
      bingoIdx = bingoIdx + 1; -- 換下一項
    elseif (openPieceNum == 16) then -- 最後一個人打出牌了
      bingoStruct[bingoIdx] = ChessConstant.BINGO_SEAFLOOR;
      bingoIdx = bingoIdx + 1; -- 換下一項
    end
  end

  -- 最多3項. 已超過3項. or 已胡五美人. 以下便不需要檢查
  if (bingoIdx > 3) or (bSameWord) then
    return bingoStruct;
  end

  -- 一色
  if (idxNumAry[1][0] == 5) or (idxNumAry[2][0] == 5) then
    bingoStruct[bingoIdx] = ChessConstant.BINGO_SAMECOLOR;
  else
    -- 將帥各一張
    if (idxNumAry[1][1] == 1) and (idxNumAry[2][1] == 1) then
      bingoStruct[bingoIdx] = ChessConstant.BINGO_SAMECOLOR;
    end
  end
  return bingoStruct;
end

function UIChessMahjong.GetMultiple(bingoAry)
  local result = 0;
  if (bingoAry[1] == 0) then
    return;
  end

  if (bingoAry[1] == ChessConstant.BINGO_ZIMO) then
    result = 3;
  else
    result = 1;
  end
  return result;
end

--[[
  計算台數
]]
function UIChessMahjong.GetCountSum(bingoAry)
  local count = 0;
  local countSum = 0;

  for i = 1, 3 do
    if (bingoAry[i] == ChessConstant.BINGO_SAMECOLOR) then
      count = 1;
    elseif (bingoAry[i] == ChessConstant.BINGO_FIVEBEAUTY) then
      count = 5;
    elseif (bingoAry[i] == ChessConstant.BINGO_SEAFLOOR) then
      count = 3;
    elseif (bingoAry[i] == ChessConstant.BINGO_BINGO) then
      count = 5;
    elseif (bingoAry[i] == ChessConstant.BINGO_ZIMO) then
      count = 2;
      -- 不只有 胡 or 自摸. (胡不算台. 自摸變1台)
      if  (bingoAry[2] ~= 0) and
        (bingoAry[2] ~= ChessConstant.BINGO_SAMECOLOR) then -- 一色. (胡算1台. 自摸算2台)
        if (bingoAry[2] ~= ChessConstant.BINGO_BINGO) then -- 起手到. (自摸算0台)
          count = count - 1;
        else
          count = 0;
        end
      end
    elseif (bingoAry[i] == ChessConstant.BINGO_NORMAL) then
      count = 1;

      -- 不只有 胡 or 自摸. (胡不算台. 自摸變1台)
      if (bingoAry[2] ~= 0) and
        (bingoAry[2] ~= ChessConstant.BINGO_SAMECOLOR) then -- 一色. (胡算1台. 自摸算2台)
        count = count - 1;
      end
    else
      break; -- 遇到0. 即是結尾
    end
    countSum = countSum + count; -- 台數累加
  end

  -- 回傳總台數
  return countSum;
end

function UIChessMahjong.PopSort(intAry, idx, endIdx, bTopIsSmaller)
  if (endIdx <= idx) then
    return;
  end

  for i = idx, (endIdx - 1) do
    for j = idx, (endIdx - i) do
      local bSwap = false;
      if (bTopIsSmaller) and (intAry[j] > intAry[j + 1]) then
        bSwap = true;
      elseif (not (bTopIsSmaller)) and (intAry[j] < intAry[j + 1]) then
        bSwap = true;
      end

      if (bSwap) then
        local temp = intAry[j];
        intAry[j] = intAry[j + 1];
        intAry[j + 1] = temp;
      end
    end
  end

  return intAry;
end

-- Region UIChessMahjong 調整介面的工具Function

--[[
  根據棋子的ID更換牌面
  @param pieceID  紅  帥 = 11; 仕 = 12; 相 = 13; 車 = 14; 馬 = 15; 炮 = 16; 兵 = 17;
          黑  將 = 21;   = 22;  = 23;  = 24;  = 25;  = 26;   = 27;
  @param pieceRawImage 要更換的棋子的RawImage
]]
function UIChessMahjong.ChangePieceByID(pieceID, pieceRawImage)
  -- 取得顏色
  local color = math.modf(pieceID / 10);
  -- 取得字
  local kind = pieceID % 10;

  -- Texture檔名結尾與棋子的種類ID相同
  local textureName = string.format("ZMC_Piece_%d", kind);
  TextureManager.SetPng(ETextureUseType.None, textureName,  pieceRawImage);
  -- 將ShiftCount變更為4等分
  pieceRawImage.shiftCount = 4;
  pieceRawImage.rectTransform.sizeDelta = Vector2.New(
    pieceRawImage.texture.width,
    pieceRawImage.texture.height / 4);
  -- 圖片的棋子顏色順序，也與棋子ID取出的color相同
  pieceRawImage:ChangeOrder(color);
end

--[[
  將棋子移動回未發牌的狀態
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
]]
function UIChessMahjong.MovePieceToNonDealingState(rawImage, sequence, x, y)
  local moveSpeed = 0.2;
  local snappingInteger = false;
  -- 這邊用Join，一次恢復多個棋子
  sequence:Join(rawImage.rectTransform:DOLocalMove(Vector2.New(x, y), moveSpeed, snappingInteger));
  -- 將玩家的牌蓋牌
  this.ChangePieceToBottomCover(rawImage);
  return sequence;
end

function UIChessMahjong.MovePieceAndCallback(rawImage, sequence, x, y, callback)
  local moveSpeed = 0.2;
  local snappingInteger = false;
  sequence:Append(rawImage.rectTransform:DOLocalMove(
    Vector2.New(x, y), moveSpeed, snappingInteger));
  if (callback ~= nil) then
    sequence:AppendCallback(callback);
  end
  return sequence;
end

--[[
  將棋子設定為Bottom覆蓋的形式
]]
function UIChessMahjong.ChangePieceToBottomCover(rawImage)
  this.ChangePieceToCover(rawImage, "ZMC_Piece_28");
end

--[[
  將棋子設定為Top覆蓋的形式
]]
function UIChessMahjong.ChangePieceToTopCover(rawImage)
  this.ChangePieceToCover(rawImage, "ZMC_Piece_29");
end

--[[
  將棋子設定為Left覆蓋的形式
]]
function UIChessMahjong.ChangePieceToLeftCover(rawImage)
  this.ChangePieceToCover(rawImage, "ZMC_Piece_30");
end

--[[
  將棋子設定為Right覆蓋的形式
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
    --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
   --
  end
  --6-----------------------------------------------------
  
]]
function UIChessMahjong.ChangePieceToRightCover(rawImage)
  this.ChangePieceToCover(rawImage, "ZMC_Piece_31");
end

function UIChessMahjong.ChangePieceToCover(rawImage, coverName)
  TextureManager.SetPng(ETextureUseType.None, coverName,  rawImage);
  -- 將ShiftCount變更為1等分
  rawImage.shiftCount = 1;
  rawImage.rectTransform.sizeDelta = Vector2.New(
    rawImage.texture.width,
    rawImage.texture.height);
  rawImage:ChangeOrder(1);
end

--[[
  製作玩家丟棄棋子時的丟牌效果
  @param callback 丟牌效果結束後的事件
]]
function UIChessMahjong.ShowOpenPieceAndMove(openPieceImage, discardedPieceID, discardedPieceDestination, callback)
  -- 顯示原本隱藏的棋子
  LuaHelper.SetColor(openPieceImage, Color.White);
  -- 顯示放置的棋子牌面 (立起來的棋子是1, 2開頭，放置的棋子是3, 4開頭，故取得ID後須再+20)
  this.ChangePieceByID(discardedPieceID + 20, openPieceImage);
  -- 將該棋子移動到指定位置並放大顯示後，再移動回去
  local originalPosition = openPieceImage.rectTransform.localPosition;
  openPieceImage.rectTransform.localPosition = discardedPieceDestination;
  openPieceImage.rectTransform.localScale = Vector3.New(2, 2, 2);
  local moveSpeed = 0.1;
  local moveDelay = 0.9;
  local sequence = DG.Tweening.DOTween.Sequence();
  sequence:AppendInterval(moveDelay);
  sequence:Append(openPieceImage.rectTransform:DOLocalMove(originalPosition, moveSpeed, false));
  sequence:Join(openPieceImage.rectTransform:DOScale(Vector3.New(1, 1, 1), moveSpeed));
  if (callback ~= nil) then
    sequence:AppendCallback(callback);
  end
  sequence:Play();
end

--[[
  製作丟牌效果時，比較高的棋子的位置
]]
function UIChessMahjong.GetDiscardedPieceDestination(direction)
  if (direction == ChessConstant.DIR_MY) then
    return Vector2.New(0, -112);
  elseif (direction == ChessConstant.DIR_LEFT) then
    return Vector2.New(-320, 0);
  elseif (direction == ChessConstant.DIR_TOP) then
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    --5-----------------------------------------------------
    if LuaHelper.CheckDefine("DemoCode") then
      --
    end
    --6-----------------------------------------------------
    
    return Vector2.New(0, 112);
  elseif (direction == ChessConstant.DIR_RIGHT) then
    return Vector2.New(320, 0);
  end
end

--[[
  計算玩家的位置 (自己位置方向為1，依此轉換為其他玩家的方向)
]]
function UIChessMahjong.GetDirection(myIdx, idxToGetDirection)
  local direction = (idxToGetDirection - myIdx+ 1);
  if (idxToGetDirection < myIdx) then
    direction = direction + 4;
  end

  if (direction == 0) then
    direction = 4;
  end
  return direction;
end

--[[
  依照種類與方向，決定效果的的Position
]]
function UIChessMahjong.GetEffectPosition(direction, kind)
  -- 胡牌，放槍，自摸，爆炸效果
  if (kind == ChessConstant.EFF_BINGO) or (kind == ChessConstant.EFF_BEBINGO) or
    (kind == ChessConstant.EFF_SELFBINGO) or (kind == ChessConstant.EFF_BOOM) then
    if (direction == ChessConstant.DIR_MY) then
      return Vector2.New(0, -112);
    elseif (direction == ChessConstant.DIR_LEFT) then
      return Vector2.New(-320, 0);
    elseif (direction == ChessConstant.DIR_TOP) then
      return Vector2.New(0, 112);
    elseif (direction == ChessConstant.DIR_RIGHT) then
      return Vector2.New(320, 0);
    end
  end

  -- 開始，流局
  if (kind == ChessConstant.EFF_START) then
    return Vector2.New(0, 57);
  elseif (kind == ChessConstant.EFF_OUTPIECE) then
    return Vector2.New(0, -30);
  end
end

--[[
  顯示指定效果圖，並設定顯示時間 (毫秒)
]]
function UIChessMahjong.ShowEffectInSeconds(rawImage, effectKind, position, delaySecond, callback)
  local textureName = string.format("ZMC_Eff%d", effectKind);
  TextureManager.SetPng(ETextureUseType.None, textureName,  rawImage);
  -- 設定位置
  rawImage.rectTransform.localPosition = position;
  -- 設定正確大小
  rawImage.rectTransform.sizeDelta = Vector2.New(rawImage.texture.width, rawImage.texture.height);
  -- 顯示效果圖
  LuaHelper.SetColor(rawImage, Color.White);

  local sequence = DG.Tweening.DOTween.Sequence();
  -- 設定延遲
  sequence:AppendInterval(delaySecond);
  sequence:AppendCallback(function()
    -- 延遲結束後隱藏
    LuaHelper.SetColor(rawImage, Color.Alpha);
  end);
  -- 增加Effect效果圖消失後的callback
  if (callback ~= nil) then
    sequence:AppendCallback(callback);
  end
  sequence:Play();
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
  --5-----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    --
  end
  --6-----------------------------------------------------
end

--[[
  顯示倒數計時字串(每秒減1)
  @return sequence 回傳倒數計時的DOTween Sequence
]]
function UIChessMahjong.ShowCountdownNumber(countdownNumber, textComponet)
  local delaySecond = 1;
  textComponet.text = countdownNumber;
  local sequence = DG.Tweening.DOTween.Sequence();
  for i = 1, countdownNumber + 1 do
    -- 設定倒數秒數
    sequence:AppendInterval(delaySecond);
    sequence:AppendCallback(function()
      -- 每回合修改計數文字
      if (i <= countdownNumber) then
        textComponet.text = countdownNumber - i;
      else
        -- 計數小於0後，將倒數文字設為空字串，代表倒數結束
        textComponet.text = "";
      end
      -- 如果倒數剩餘3秒，播放倒數音效
      if (countdownNumber - i <= 3) then
        AudioManager.PlayOnce(ChessConstant.SOUND_COUNTDOWN, 0);
      end
    end);
  end
  sequence:Play();
  return sequence;
end

--[[
  計算大頭圖色彩
]]
function UIChessMahjong.GetColorTint(colorPart, colorTints)
  local r = 4;
  local g = 4;
  local b = 4;

  if colorPart == EColorPart.Helm then
    r = (colorTints[1] / 100000000) % 10;
    g = (colorTints[1] / 10000000) % 10;
    b = (colorTints[1] / 1000000) % 10;
  elseif colorPart == EColorPart.Hair then
    r = (colorTints[1] / 100000) % 10;
    g = (colorTints[1] / 10000) % 10;
    b = (colorTints[1] / 1000) % 10;
  elseif colorPart == EColorPart.Skin then
    r = (colorTints[1] / 100) % 10;
    g = (colorTints[1] / 10) % 10;
    b = (colorTints[1] / 1) % 10;
  elseif colorPart == EColorPart.Clothes then
    r = (colorTints[2] / 100000000) % 10;
    g = (colorTints[2] / 10000000) % 10;
    b = (colorTints[2] / 1000000) % 10;
  elseif colorPart == EColorPart.Orna1 then
    r = (colorTints[2] / 100000) % 10;
    g = (colorTints[2] / 10000) % 10;
    b = (colorTints[2] / 1000) % 10;
  elseif colorPart == EColorPart.Boots then
    r = (colorTints[2] / 100) % 10;
    g = (colorTints[2] / 10) % 10;
    b = (colorTints[2] / 1) % 10;
  end

  return r, g, b;
end

-- EndRegion UIChessMahjong 調整介面的工具Function

-- Region 自摸棋結算介面
function UIChessMahjong.InitializeChessMahjongResult(uiController)
  UI_ZMC_Result = uiController:FindGameObject("UI_ZMC_Result");
  text_ResultName = uiController:FindText("Text_ResultName");
  text_Result = uiController:FindText("Text_Result");
  text_TotleMoney = uiController:FindText("Text_TotleMoney");
  text_CountSum = uiController:FindText("Text_CountSum");

  local tempEvent = uiController:FindEvent("Image_Btn_Exit");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Exit);
  rawImage_Btn_Exit = uiController:FindImage("Image_Btn_Exit");
  local tempText = uiController:FindText("Text_Btn_Exit");
  tempText.text = string.Get(22203);

  tempEvent = uiController:FindEvent("Image_Btn_Again");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_Again);
  rawImage_Btn_Again = uiController:FindImage("Image_Btn_Again");
  tempText = uiController:FindText("Text_Btn_Again");
  tempText.text = string.Get(22202);

  tempEvent = uiController:FindEvent("Image_Btn_MoneySettlement");
  tempEvent:SetListener(EventTriggerType.PointerClick, this.OnClick_MoneySettlement);
  rawImage_Btn_MoneySettlement = uiController:FindImage("Image_Btn_MoneySettlement");
  tempText = uiController:FindText("Text_Btn_MoneySettlement");
  tempText.text = string.Get(22201);

  tempText = uiController:FindText("Text_ResultTitle");
  tempText.text = string.Concat(string.Get(22200), string.Get(22201));

  for i = 1, 3 do
    rawImage_BingoStruct[i] = uiController:FindRawImage(string.format("Image_BingoStruct (%d)", i));
  end
  rawImage_BeBingo = uiController:FindRawImage("Image_BeBingo");
end

function UIChessMahjong.OpenChessMahjongResult()
  UI_ZMC_Result:SetActive(true);
  isResultVisible = true;
  -- 取得結算需要的資料
  moneySettlement = this.GetMoneySettlement();
  this.HideMoneySettlementUI();
  this.ShowBingoStruct();
end

--[[
  顯示胡牌結果 (胡牌玩家是誰、誰放槍、胡牌種類、幾台)
   --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
   --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
]]
function UIChessMahjong.ShowBingoStruct()
  local loser = beBingoPlayerIdx;
  local winner = bingoPlayerIdx;

  if (loser == 0 and winner == 0) then
    -- 流局不用顯示胡牌結果，直接顯示金錢結算結果
    this.HideBingoStructUI();
    this.ShowMoneySettlement();
    return;
  end

  -- 顯示操作用的按鈕
  rawImage_Btn_MoneySettlement.gameObject:SetActive(true);

  -- 依照胡牌結構顯示
  for i = 1, 3 do
    if (allPlayers[winner].bingoStruct[i] ~= 0) then
      -- Texture檔名結尾與胡牌使用的常數相同
      local textureName = string.format("ZMC_Bingo%d", allPlayers[winner].bingoStruct[i]);
      TextureManager.SetPng(ETextureUseType.None, textureName, rawImage_BingoStruct[i]);
      LuaHelper.SetColor(rawImage_BingoStruct[i], Color.White);
    end
  end

  -- 顯示玩家名稱
  text_ResultName.text = this.AddTextNewLine(text_ResultName, allPlayers[winner].name);
  if (loser ~= 0) then
    text_ResultName.text = this.AddTextNewLine(text_ResultName, allPlayers[loser].name);
    -- 顯示放槍效果圖
    LuaHelper.SetColor(rawImage_BeBingo, Color.White);
  end

  -- 顯示幾台 接字串
  local countSum = this.GetCountSum(allPlayers[winner].bingoStruct);
  text_CountSum.text = string.Concat(string.Get(40437), countSum, string.Get(22199));
end

--[[
  顯示金錢結算畫面
]]
function UIChessMahjong.ShowMoneySettlement()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  -- 顯示操作用的按鈕
  rawImage_Btn_Exit.gameObject:SetActive(true);
  rawImage_Btn_Again.gameObject:SetActive(true);

  for i = 1, ChessConstant.ZMCHESS_PLAYERNUM do
    -- 顯示玩家名稱
    text_ResultName.text = this.AddTextNewLine(text_ResultName, moneySettlement[i].name);
    -- 顯示贏了多少、輸了多少
    if (moneySettlement[i].result < 0) then
      text_Result.text = this.AddTextNewLine(text_Result,
        string.Concat(string.Get(40441), math.abs(moneySettlement[i].result)));
    elseif (moneySettlement[i].result > 0) then
      text_Result.text = this.AddTextNewLine(text_Result,
        string.Concat(string.Get(40440), moneySettlement[i].result));
    else
      -- 只換行
      text_Result.text = this.AddTextNewLine(text_Result, "");
    end
    -- 顯示玩家金錢 (為結算後的金錢)
    text_TotleMoney.text = this.AddTextNewLine(text_TotleMoney, moneySettlement[i].money);
  end

  -- 若是胡牌玩家自摸則需顯示東錢. (半台)
  local ziMoMoney = this.GetZiMoMoney();
  if (ziMoMoney ~= 0) then
    text_Result.text = this.AddTextNewLine(text_Result,
        string.Concat(string.Get(40439), ziMoMoney, string.Get(40438)));
  end;
end

--[[
  新增文字並自動換行
]]
function UIChessMahjong.AddTextNewLine(textComponent, text)
  local newText = string.Concat(textComponent.text, text, "\n");
  return newText;
end

function UIChessMahjong.CloseChessMahjongResult()
  UI_ZMC_Result:SetActive(false);
  this.HideBingoStructUI();
  this.HideMoneySettlementUI();
  isResultVisible = false;
end

function UIChessMahjong.HideBingoStructUI()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  
  text_CountSum.text = "";
  text_ResultName.text = "";
  for i = 1, 3 do
    LuaHelper.SetColor(rawImage_BingoStruct[i], Color.Alpha);
  end
  LuaHelper.SetColor(rawImage_BeBingo, Color.Alpha);
  rawImage_Btn_MoneySettlement.gameObject:SetActive(false);
end

function UIChessMahjong.HideMoneySettlementUI()
  text_Result.text = "";
  text_ResultName.text = "";
  text_TotleMoney.text = "";
  rawImage_Btn_Exit.gameObject:SetActive(false);
  rawImage_Btn_Again.gameObject:SetActive(false);
end

function UIChessMahjong.IsResultVisible()
  return isResultVisible;
end

function UIChessMahjong.OnClick_MoneySettlement()
  -- 顯示結算金錢畫面，需先隱藏胡牌畫面
  this.HideBingoStructUI();
  this.ShowMoneySettlement();
end

function UIChessMahjong.OnClick_Exit()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  -- 離開棋局
  UI.Close(this);
end

function UIChessMahjong.OnClick_Again()
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  --3----------------------------------------------------
  if LuaHelper.CheckDefine("DemoCode") then
    DemoCode.SetColorNum(10);
    local area =  DemoCode.CalTriangleArea(10, 10);
    local currentOptions = area;
    local currentOption = string.Get(80098);
  end
  --4-----------------------------------------------------
  
  --C:060-002 <繼續牌局>
  Network.Send(60, 2);
end
-- EndRegion 自摸棋結算介面

-- 儲存自摸棋棋友的屬性資料
ChessPlayer = {
  ID = 0,                     -- ID
  name = "",                  -- 該棋友的名稱
  money = 0,                  -- 該棋友的金錢
  patt = {},                  -- 該棋友的大頭圖色盤
  funcBtnClicked = 0,         -- 最後一次按下的功能鈕Idx
  pieceClicked = 0,           -- 最後一次打出牌的AryIdx
  pieceNum = 0,               -- 所擁有的棋子數
  bingoStruct = {},           -- 胡牌的組合. 最多可一次胡3種牌. (ex.自摸+海底+一色)
  pieceAry = {}               -- 所擁有的棋子
}

function ChessPlayer:New()
  local newtable = {
    patt = {},
    bingoStruct = {},
    pieceAry = {}
  };
  setmetatable(newtable, { __index = self});
  return newtable;
end