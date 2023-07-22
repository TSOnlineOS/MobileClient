
Protocal = {
  Connect		= 101,	--连接服务器
  Exception   = 102,	--异常掉线
  Disconnect  = 103,	--正常断线   
  Message		= 104,	--接收消息
  Internet = 105,
}

--[[ 簡化資料
物品資料 +物品ID(2) +數量(2) +毀壞度(1) +屬性(1) +屬性值(1) +抵抗(1) +成長等級(1) +成長經驗值(4) +特殊作用(1) +靈石屬性(1) +靈石強化等級(1)
  特殊作用 0:無 1:可交易1次
武將資料 +NpcID(2) +等級(1) +經驗值(1) +轉生(1) +MaxHP(2) +MaxSP(2) +六圍(2)*6 +強化等級(1) +特殊技學習(1) +技能等級(1)*3
玩家名片 +L(1) +姓名(L) +等級(1) +屬性(1) +轉生類別(1) +職業(1) +性別(1) +頭型(1) +色盤一(4) +色盤五(4)
好友資料 +玩家ID(8) +玩家名片(?) +是否在線(1) +信任度(2) +功能標記(1) +結交時間(8) +離線時間(8)
軍團成員資料 +玩家ID(8) +玩家名片(?) +是否在線(1) +是否在線(1) +累積活躍值(4) +週活躍值(4) +標記(5)
戰鬥角色資料 +戰鬥形式(1) +角色類型(1) +玩家ID(8) +NPCID(2) +主人玩家ID(8) +行(1) +列(1) +總HP(2) +總SP(2) +HP(2) +SP(2) +LV(1) +屬性(1) +戰鬥外觀(?)
戰鬥外觀 +L(1) +名字(L) +性別(1) +屬性(1) +等級(1) +衰神標記(1) +福神標記(1) +臉圖(1) +頭型(1) +身型(1) +色盤值(帽,髮,膚)(4) +色盤值(衣,配一,鞋)(4) 
  +擂台團P最後勝幾場(2) +擂台團P玩家的名次(1) +Npc挑戰賽勝場次(1) +轉生的種類(1) +職業種類(1) +裝備數量(1) <<+物品ID(2)>> +組隊狀態(1) +軍團ID(4)
--]]

protocolTable = {};

--[[ 連線
C:000-000 <詢問伺服器資訊> +版本編號(2)
]]--
protocolTable[0] = {};

--[[ 斷線
S:000-000 <斷線> +斷線原因(1)
]]--
protocolTable[0][0] = function(data)
  local cause = data:ReadByte();
  
  local message = "";
  local quit = false;

  if cause == 1 then
    message = string.Get(10001); --'封包資料太多斷線';
    quit = true;
  elseif cause == 2 then
    message = string.Get(10002); --'抽問答錯三次斷線';
    quit = false;
  elseif cause == 3 then
    message = string.Get(10003); --'Login三次錯誤';
    quit = true;
  elseif cause == 4 then
    message = string.Get(10004); --'被Server踢下線';
    quit = false;
  elseif cause == 5 then
    message = string.Get(10005); --'發現違規的事件斷線';
    quit = false;
  elseif cause == 6 then
    message = string.Get(10006); --'發現違規的事件斷線';
    quit = false;
  elseif cause == 7 then
    message = string.Get(10007); --'查不到事件可做,斷線';
    quit = false;
  elseif cause == 8 then
    message = string.Get(10008); --'無法預期的觸發,斷線';
    quit = false;
  elseif cause == 9 then
    message = string.Get(10009); --'事件表檔版本不符';
    quit = false;
  elseif cause == 10 then
    message = string.Get(10010); --'因查表錯誤斷線';
    quit = false;
  elseif cause == 11 then
    message = string.Get(10011); --'走到障礙點斷線';
    quit = false;
  elseif cause == 12 then
    message = string.Get(10012); --'按下地雷不合法';
    quit = false;
  elseif cause == 13 then
    message = string.Get(10013); --'因連送協定斷線';
    quit = false;
  elseif cause == 14 then
    message = string.Get(10014); --'因超距離的移動而斷線';
    quit = false;
  elseif cause == 15 then
    message = string.Get(10015); --'刪除成功,請重新開始';
    quit = false;
  elseif cause == 16 then
    message = string.Get(10016); --'因登入IP不合法而斷線';
    quit = true;
  elseif cause == 17 then
    message = string.Get(10017); --'版本不符,請更新檔案';
    quit = true;
  elseif cause == 18 then
    message = string.Get(10018); --'修改資料斷線';
    quit = true;
  elseif cause == 19 then
    message = string.Get(10019); --'重覆登入斷線';
    quit = false;
  elseif cause == 20 then
    message = string.Get(10020); --'伺服器異常斷線';
    quit = true;
  elseif cause == 21 then
    message = string.Get(10021); --'Save檔案資訊異常斷線';
    quit = true;
  elseif cause == 22 then
    message = string.Get(10022); --'封包格式不符斷線';
    quit = true;
  elseif cause == 23 then
    message = string.Get(10023); --'改名斷線';
    quit = true;
  elseif cause == 24 then
    message = string.Get(10024); --'密碼長度太短斷線';
    quit = true;
  elseif cause == 25 then
    message = string.Get(10025); --'名字重複斷線(暫用)';
    quit = false;
  elseif cause == 26 then
    message = string.Get(10026); --'事件違規的觸發斷線';
    quit = true;
  elseif cause == 27 then
    message = string.Get(10027); --'登入錯誤斷線';
    quit = true;
  elseif cause == 28 then
    message = string.Get(10028); --'防衛斷線';
    quit = true;
  elseif cause == 29 then
    message = string.Get(10029); --'資料累積太多';
    quit = true;
  elseif cause == 30 then
    message = string.Get(10030); --'鎖帳號斷線';
    quit = true;
  elseif cause == 31 then
    message = string.Get(10031); --'登入ID未開放斷線';
    quit = true;
  elseif cause == 32 then
    message = string.Get(10032); --'跨場景戰鬥';
    quit = true;
  elseif cause == 33 then
    message = string.Get(10033); --'場景與標記不符斷線';
    quit = true;
  elseif cause == 34 then
    message = string.Get(10034); --'跨伺服器重複登入';
    quit = true;
  elseif cause == 35 then
    message = string.Get(10035); --'連送登入協定';
    quit = true;
  elseif cause == 36 then
    message = string.Get(10036); --'ID範圍不符';
    quit = true;
  elseif cause == 37 then
    message = string.Get(10037); --'不同場景斷線';
    quit = false;
  elseif cause == 38 then
    message = string.Get(10038); --'目的場景不符斷線';
    quit = false;
  elseif cause == 40 then
    message = string.Get(10040); --'修改合成封包斷線';
    quit = true;
  elseif cause == 41 then
    message = string.Get(10041); --'請於登入後儲值';
    quit = false;
  elseif cause == 42 then
    message = string.Get(10042); --'修改戰鬥封包';
    quit = true;
  elseif cause == 43 then
    message = string.Get(10043); --'玩家戰鬥型態錯誤0';
    quit = false;
  elseif cause == 44 then
    message = string.Get(10044); --'觸發事件與場景不合';
    quit = false;
  elseif cause == 45 then
    message = string.Get(21169); --'帳號因違規被停權';
    quit = true;
  elseif cause == 46 then
    message = string.Get(10046); --'戰鬥問答作弊';
    quit = true;
  elseif cause == 47 then
    message = string.Get(10047); --'戰鬥未結束事件先結束';
    quit = false;
  elseif cause == 48 then
    message = string.Get(10048); --'非法使用召喚特技';
    quit = false;
  elseif cause == 49 then
    message = string.Get(10049); --'已到宵禁時間';
    quit = true;
  elseif cause == 50 then
    message = string.Get(10050); --'登入比賽專屬Server';
    quit = false;
  elseif cause == 51 then
    message = string.Get(10051); --'無法登入比賽專屬Server';
    quit = true;
  elseif cause == 52 then
    message = string.Get(10051); --'無法登入比賽專屬Server';
    quit = true;
  elseif cause == 53 then
    message = string.Get(10053); --'登入未開放的Server';
    quit = false;
  elseif cause == 54 then
    message = string.Get(10054); --'鬥陣擂台活動結束';
    quit = false;
  elseif cause == 55 then
    message = string.Get(30186); --'目的伺服器移民資料保存中';
    quit = false;
  elseif cause == 56 then
    message = string.Get(71180); --'伺服器忙碌中請稍候';
    quit = false;
  elseif cause == 57 then
    message = string.Get(10302); --'目前Server人數過多,請至其它Server進行遊戲';
    quit = false;
  elseif cause == 58 then
    message = string.Get(10303); --'目前伺服器人數過多請稍候,或至其它伺服器進行遊戲';
    quit = false;
  elseif cause == 59 then
    message = string.Get(10304); --'角色閒置過久，請重新登入';
    quit = false;
  elseif cause == 60 then
    message = string.Get(20889); --'伺服器關機維護';
    quit = false;
  elseif cause == 61 then
    message = string.Get(data:ReadUInt32());
    quit = false;
  elseif cause == 90 then
    message = string.Get(23280); --'登入太頻繁';	
    quit = false;
  else
    message = string.Get(10300); --'與Server連線中斷';
    quit = false;
    cause = 255;
  end

  Network.disconnectQuit = quit;
  Network.disconnectCause = cause;
  Network.disconnectMessage = message;
  Network.OnSocket(Protocal.Disconnect, nil);
end

--[[ 登入
C:001-000 <登入> +伺服器ID(2) +登入方式(1)
  登入方式 1:帳密 +L(1) +帳號(L) +L(1) +密碼(L)
  登入方式 2:遊客
  登入方式 3:FB +L(1) +UserId(L) +L(1) +AccessToken(L)
C:001-001 <重連> +連線碼(4)
C:001-002 <斷線重連> +L(1) +帳號(L) +連線碼(4)
C:001-003 <帳號綁定> +綁定方式(1)
  綁定方式 1:FB +L(1) +UserId(L) +L(1) +AccessToken(L)
C:001-016 <查Server時間>
C:001-051 <註銷帳號>
]]--
protocolTable[1] = {};

--[[ 玩家離線
S:001-001 <玩家離線> +玩家ID(8)
]]--
protocolTable[1][1] = function(data)
  Role.PlayerDisappear(data:ReadInt64());
end

--[[ 登入結果
S:001-002 <登入結果> +結果(1)
  結果 0:成功 +DBID(2) +GSID(2) +玩家ID(8) +Sever時間(8) +特殊開關(1) +L(1) +帳號(L) +L(1) +密碼(L) +綁定方式(1)
    特殊開關 bit1:送審 bit2:電玩展
    綁定方式 0:未綁定 1:FB
  結果 1:帳號密碼錯誤
  結果 2:DB無回應
  結果 3:伺服器ID錯誤
  結果 4:帳號有不合法字元
  結果 5:密碼有不合法字元
  結果 6:版本錯誤
  結果 7:無此帳號(登外部備檔專用)
  結果 8:登入方式錯誤
  結果 9:伺服器維護中
  結果 10:帳號因違規被停權
  結果 11:帳號密碼長度超過上限
  結果 12:重覆登入斷線
  結果 13:等待資料回存，請稍後再進行登入
  結果 14:伺服器人數已滿，請稍後再試
  結果 15:登入處理中
  結果 16:登入伺服器無回應
  結果 17:系統錯誤
]]--
protocolTable[1][2] = function(data)
  if MachineBox.client.general[EMachineBoxSwitch.AutoLogin] then
    if CGTimer.ContainsListener(Network.RunAutoLogin) then
      CGTimer.RemoveListener(Network.RunAutoLogin);
    end
  end

  CGTimer.RemoveListener(Network.ShowConnectMessage);

  local result = data:ReadByte();

  if result > 0 then
    Game.Logout();

    if result == 1 then
      ShowCenterMessage(string.Get(20690));  --帳號密碼錯誤
    elseif result == 2 then
      ShowCenterMessage(string.Get(30176));  --無法連線中繼伺服器,請稍後再試
    elseif result == 3 then
      ShowCenterMessage(string.Get(20924));  --伺服器編號錯誤
    elseif result == 4 then
      ShowCenterMessage(string.Get(20913));  --帳號有不合法字元
    elseif result == 5 then
      ShowCenterMessage(string.Get(20914));  --密碼有不合法字元
    elseif result == 6 then
      ShowCenterMessage(string.Get(10017));  --版本不符,請更新檔案
      CGResourceManager.DownloadApp();
    elseif result == 7 then
      ShowCenterMessage(string.Get(21107));  --無此帳號
    elseif result == 8 then
      ShowCenterMessage(string.Get(21108));  --登入方式錯誤
    elseif result == 9 then
      ShowCenterMessage(string.Get(21109));  --伺服器維護中
    elseif result == 10 then
      ShowCenterMessage(string.Get(21169));  --此帳號遭鎖定，請儘快與客服聯絡
    elseif result == 11 then
      ShowCenterMessage(string.Get(21380));  --帳號密碼長度需介於6~12字元
    elseif result == 12 then
      ShowCenterMessage(string.Get(10019));  --重覆登入斷線
    elseif result == 13 then
      ShowCenterMessage(string.Get(21445));  --等待資料回存，請稍後再進行登入
    elseif result == 14 then
      ShowCenterMessage(string.Get(21583));  --伺服器人數已滿，請稍後再試
    elseif result == 15 then
      ShowCenterMessage(string.Get(21751));  --登入處理中
    elseif result == 16 then
      ShowCenterMessage(string.Get(21752));  --登入伺服器無回應
    elseif result == 17 then
      ShowCenterMessage(string.Get(21753));  --系統錯誤
    else
      ShowCenterMessage(string.Concat("login fail !! error code = ", result));
    end

    return;
  end
  Network.InUnbound = false;
  local aDBID = data:ReadUInt16();
  local aSID = data:ReadUInt16();
  if aSID ~= Network.serverId_Unbounded then 
    --不是登入無界的話紀錄資訊 
    --登入伺服器資訊
    Network.dbId = aDBID;  
    Network.serverId = aSID;
  elseif aSID ~= 0 and aSID == Network.serverId_Unbounded then   
    Network.InUnbound = true; --依此判斷登入無界
  end    

  --玩家ID
  Role.playerId = data:ReadInt64();

  --SERVER時間
  local time = data:ReadDouble();
  CGTimer.SetServerTime(time);
  CGTimer.SetOnlineTime(time);

  --送審開關
  Network.serverSwitch = data:ReadByte();

  --實際帳密
  Setting.client.lastLoginKind = UILogin.loginKind;
  Setting.client.lastLoginToken = UILogin.loginToken;
  Setting.Save();
  Network.loginKind = ELogin.AccPwd;
  Network.account = data:ReadString(data:ReadByte());
  Network.password = data:ReadString(data:ReadByte());
  --綁定方式
  Network.accountKind = data:ReadByte();
  
  if aSID ~= Network.serverId_Unbounded then 
    --儲存上次登入資訊 (登入無界除外)
    Setting.client.lastServerId = Network.serverId;
    Setting.client.lastAccount = Network.account;
    Setting.client.lastPassword = Network.password;
    Setting.Save();
  end
  Game.ClearAll();

  --加入心跳包
  CGTimer.AddListener(Network.CheckConnect, Network.jumpHeartTime, false);
end

--[[ 登入成功
S:001-003 <登入成功> +需要改暗碼(1)
]]--
protocolTable[1][3] = function(data)
  local changePassword = data:ReadBoolean();
  UI.Close(UILogin);
  UI.Open(UICreateRole);
end

--[[ 無法連線中繼伺服器
S:001-005 <無法連線中繼伺服器>
]]--
protocolTable[1][5] = function(data)
  ShowCenterMessage(string.Get(30176), 2);
end

--[[ 密碼錯誤
S:001-006 <密碼錯誤>
]]--
protocolTable[1][6] = function(data)
  ShowCenterMessage(string.Get(20690), 2);
  --[[
  if not FCtrl.GameStart then
    se_IDPassord.appear;
    se_IDPassord.IDField.Text:='';
    se_IDPassord.PasswordField.Text:='';

  {$ifdef thai}
    se_IDPassord.IDField.EditorPlot.Clear();
    se_IDPassord.PasswordField.EditorPlot.Clear();
  {$endif}

    ShowCenterMessage(string.Get(20690), 2);
  end
  ]]--
end

--[[ 目的伺服器尚未連線
S:001-007 <目的伺服器尚未連線>
]]--
protocolTable[1][7] = function(data)
  ShowCenterMessage(string.Get(30175), 2);
  --[[
  if not FCtrl.GameStart then
  begin
    se_IDPassord.appear;
    se_IDPassord.IDField.Text:='';
    se_IDPassord.PasswordField.Text:='';
    ShowCenterMessage(string.Get(30175), 2);
  end
  ]]--
end

--[[ 帳號目前被鎖
S:001-008 <帳號目前被鎖>
]]--
protocolTable[1][8] = function(data)
  local unlockMinutes = data:ReadUInt32();
  if unlockMinutes == 65535 then
    ShowCenterMessage(string.Get(90038));
  else
    ShowCenterMessage(string.Get(90038)..unlockMinutes..string.Get(90039));
  end
  --[[
  Result:=FConnect.CharToDWord(Copy(Data, 2, 4));
  if Result = 65535 then
    DZ_WillCloseForm1.MsgEditor.Text:=string.Get(90038)--string.Get(90038) = '此帳號目前被鎖住';
  else
    DZ_WillCloseForm1.MsgEditor.Text:=string.Get(90038)+ tostring(Result)+string.Get(90039);--string.Get(90038) = '此帳號目前被鎖住';string.Get(90039) = '分';
  end

  DZ_WillCloseForm1.btnRtn.Appear;
  DZ_WillCloseForm1.btnExit.Appear;
  DZ_WillCloseForm1.btnUpdate.Disappear;
  DZ_WillCloseForm1.Appear;
  ]]--
end

--[[ 伺服器忙碌中請稍候
S:001-010 <伺服器忙碌中請稍候>
]]--
protocolTable[1][10] = function(data)
  ShowCenterMessage(string.Get(71180));
  --[[
  DZ_WillCloseForm1.MsgEditor.Text:=string.Get(71180);--伺服器忙碌中請稍候
  DZ_WillCloseForm1.btnRtn.Appear;
  DZ_WillCloseForm1.btnExit.Appear;
  DZ_WillCloseForm1.btnUpdate.Disappear;
  DZ_WillCloseForm1.Appear;
  ]]--
end

--[[ 需要更新版本
S:001-012 <需要更新版本>
]]--
protocolTable[1][12] = function(data)
  ShowCenterMessage(string.Get(80258));
  --[[
  LH_TopMessageForm.Appear;
  ]]--
end

--[[ 登入送完所有資訊
S:001-013 <登入送完所有資訊> +連線序號(4)
]]--
protocolTable[1][13] = function(data)
  log("Login Done !! Game Start SceneId = "..SceneManager.sceneId);
  
  Network.connectCode = data:ReadUInt32();
  Network.loginFinished = true;
  
  --C:043-004 <要求所有軍團資訊>
  Network.Send(43, 4);

  --[[
  --C:037-001 <送遠端位址> +位址(?)
  sendBuffer:Clear();
  sendBuffer:WriteString(Network.servers[Network.serverId].host);
  Network.Send(37, 1, sendBuffer);
  ]]--

  MachineBox.SetAutoFight(false);

  Game.OnLogin();
  Network.ResetAutoLoginInfo();
  
  --[[
  Chk_Show_FDisc1 = false;   --登入遊戲後第一次移動顯示
  Chk_Show_FDisc2 = false;   --換場遇黑頻
  Chk_Show_FDisc3 = false;   --秀人物有問題  --  92/11/19-1F

  if LogPic~=nil then
    LogPic.Free;
    LogPic = nil;
  end

  GameEnd = false;
  GameStart = true;      --遊戲開始

  Form1.CheckHPOldTime = GetTickCount;   --判斷自動補血用
  for i =  1 to MaxGarDamage do
    HumManage.DamageAry[i] = 0;
  end
  
  --模擬伺服器啟動
  BKSimServer = TBKSimServer.Create;

  MR_FlyScrollSForm.ReSet;

  Se_MainStatus.reset;
  Se_MainStatus.appear;
  Se_InputBar.reset;
  Se_InputBar.appear;
  Se_HotKeyForm.Reset;
  Se_HotKeyForm.appear;
  Se_ChatMsgForm.reset;
  Se_ChatMsgForm.appear;
  MR_BuffForm.appear;

  Se_SystemForm.LoadData;
  Se_EmotiomForm.LoadData;
  Se_BlockMsgList.Loadlist;
  JK_mansel1.reset;

  {$ifdef Free}
  JC_GSForm1.Init;
  {$endif}

  AC_shortMsgForm.setPic('panel4',100,20,300,145,true,0,0,50,50);
  form1.TriggerTransition(2);

  if VenderMenu ~= nil then  --只在登入時清空
  VenderMenu.LoginInit; 

  LH_DragonBoat.isDragonBoatFestival = False; --登入時先清成False
  Player.DragonBoatWinNum = 0; --登入時清成0
  AL_WorldBossRankForm.Init;
  FNpcUpgradeManage.Init;  --武強將化 Alen 20140801

  LH_ApparatusMenu.LoadSetinfo;
  FMixStoneMenu.GameStartDo;  --靈石強化
  Player.InX_Mas_DoorOpen = False;  --聖誕節傳點活動光圈預設關
  Player.IsCookingTime =  False;      --煮年菜活動傳點開關
  FSaleRoomForm.GameStartDo;   --拍賣場

  if FExpSlotForm ~= nil then
    FExpSlotForm.GameStartDo;    --武將拉霸
  end

  --人物增益介面  
  if FHumanBuffForm ~= nil then
    FHumanBuffForm.GameStartDo;
  end

  LH_ActGovRequireManage.Init;
  AL_ActSwapItemManage.Init;
  AL_ActEpicBattleManage.Init;
  Se_EquipForm.Page = 0;
  Se_EquipForm.ReNewPage;
  ]]--
end

--[[ 要求送重連協定
S:001-014 <要求送重連協定> +連線序號(4)
]]--
protocolTable[1][14] = function(data)
  local loginSN = data:ReadInt32();

  CGTimer.DoFunctionDelay(1.5,
    function()
      --C:001-001 <重連> +連線序號(4)
      sendBuffer:Clear();
      sendBuffer:WriteInt32(loginSN);
      Network.Send(1, 1, sendBuffer);
    end
  );
end

--[[ 帳號綁定結果
S:001-015 <帳號綁定結果> +結果(1)
  結果 0:成功 +綁定方式(1)
    綁定方式 0:未綁定 1:FB
]]--
protocolTable[1][15] = function(data)
  local result = data:ReadByte();

  if result == 0 then
    Network.accountKind = data:ReadByte();

    if UI.IsVisible(UIAccount) then
      UIAccount.UpdateUI();
    end

    if Network.accountKind == EAccount.Guest then
      ShowCenterMessage(string.Get(21381));
    else
      ShowCenterMessage(string.Get(21304));
    end
  elseif result == 1 then
    ShowCenterMessage(string.Get(21305));
  elseif result == 2 then
    ShowCenterMessage(string.Get(21306));
  elseif result == 3 then
    ShowCenterMessage(string.Get(21307));
  else
    ShowCenterMessage(string.format(string.Get(21308), result));
  end
end

--[[
S:001-016 <收Server時間> +Server時間(8)
]]--
protocolTable[1][16] = function(data)
  CGTimer.SetServerTime(data:ReadDouble());
end

--[[
S:001-020 <通知連無界伺服器> ServerId(2)+ L(1) +IP(L) + port(2) + SN(4) 
]]--
protocolTable[1][20] = function(data)
  Network.serverId_Unbounded = data:ReadUInt16();
  Network.host_Unbounded = data:ReadString(data:ReadByte()); 
  Network.port_Unbounded = data:ReadUInt16();
  Network.SN_Unbounded = data:ReadUInt32(); 
  Network.loginKind = ELogin.Unbounded;
  Network.Par1_Unbounded = Role.playerId;
  --logError("host = "..Network.host_Unbounded.." port = "..Network.port_Unbounded.."  SN ="..Network.SN_Unbounded);
  Network.Connect_Unbounded();
end

--[[
S:001-021 <通知連回原SERVER> GSID(2) 
]]--
protocolTable[1][21] = function(data)
  local aSID = data:ReadUInt16();
  if Network.serverId ~= aSID then
    -- 不是原本的GS.... 我也不能幹嘛@@
  end
  Network.loginKind = ELogin.AccPwd;
  Network.serverId = Setting.client.lastServerId; 
  Network.account = Setting.client.lastAccount;
  Network.password = Setting.client.lastPassword;
 -- Network.Disconnect();
  Network.Connect();
end

--[[
S: 001-051 <註銷帳號> +kind(1) +res(1)
    kind(1)
      0: 刪角等待時間
          res(1)
            0:還沒有刪角時間
            1:有刪角時間 +時間(8)
      1: 確認刪角
          res(1)
            0:失敗(密碼錯誤)
            1:刪角成功
            2:開始倒數
            3:時間還沒到 +時間(8)
      2: 取消刪角
          res(1)
            1:重置時間成功
]]--
protocolTable[1][51] = function(data)
  local kind = data:ReadByte();
  local result = data:ReadByte();
  local time;
  if kind == 0 then
    if result == 0 then
      ShowConfirmDeleteAccount(string.Get(23709),string.GetColorText(string.Get(23710), Color.Red),
        function(text)
          if text == "1234" then
            UISetting.OnClick_ConfirmDeleteAccount();
          else
            ShowCenterMessage(string.Get(23711));
          end
        end);
    else
      time = DateTime.FromOADate(data:ReadDouble());
      if DateTime.Compare(CGTimer.serverTime, time) >= 0 then
        ShowConfirmDeleteAccount(string.Get(24091),string.GetColorText(string.Get(24092), Color.Red),
          function(text)
            if text == "1234" then
              UISetting.OnClick_ConfirmDeleteAccount();
            elseif text == "取消刪除" then
              UISetting.OnClick_CheckCancelDeletAccount();
            else
              ShowCenterMessage(string.Get(23711));
            end
          end);
      else
        local leftTime = DateTime.Subtract(time, CGTimer.serverTime);
        ShowCheckMessage(
          function(result)
            if result then
              UISetting.OnClick_CheckCancelDeletAccount();
            end
          end,
          string.Concat(string.Get(24093), string.GetSecondText(math.ceil(leftTime.TotalSeconds))," ， ", string.Get(24094)),
          Role.player
        );
      end
    end
  elseif kind == 1 then
    if result == 0 then
      ShowCenterMessage(string.Get(24095));
    elseif result == 1 then
      ShowCenterMessage(string.Get(23678));
      Setting.client.lastAccount = "";
      Setting.client.lastPassword = "";
      Setting.Save();
      Game.Logout();
    elseif result == 2 then
      ShowCenterMessage(string.Get(24096));
    elseif result == 3 then
      time = DateTime.FromOADate(data:ReadDouble());
      local leftTime = DateTime.Subtract(time, CGTimer.serverTime);
      ShowCheckMessage(
        function(result)
          if result then
            UI.Close(UICheck);
          end
        end,
        string.Concat(string.Get(24093), string.GetSecondText(math.ceil(leftTime.TotalSeconds))),
        Role.player
      );
    else
      logError("001-051 out of known result : " ..tostring(result));
    end
  elseif kind == 2 then
    if result == 1 then
      ShowCenterMessage(string.Get(24097));
    end
  end
end

--[[ 交談
C:002-001 <全頻發話> +L(1) +內容(L) +物品數量(1) <<+物品資料(?)>> +武將數量(1) <<+武將資料(?)>>
C:002-002 <輕頻發話> +L(1) +內容(L) +物品數量(1) <<+物品資料(?)>> +武將數量(1) <<+武將資料(?)>>
C:002-003 <密頻發話> +玩家ID(8) +L(1) +名字(L) +L(1) +內容(L) +物品數量(1) <<+物品資料(?)>> +武將數量(1) <<+武將資料(?)>>
C:002-004 <GM頻發話> +L(1) +內容(L) +物品數量(1) <<+物品資料(?)>> +武將數量(1) <<+武將資料(?)>>
C:002-005 <隊頻發話> +L(1) +內容(L) +物品數量(1) <<+物品資料(?)>> +武將數量(1) <<+武將資料(?)>>
C:002-006 <團頻發話> +L(1) +內容(L) +物品數量(1) <<+物品資料(?)>> +武將數量(1) <<+武將資料(?)>>
C:002-007 <盟頻發話> +L(1) +內容(L) +物品數量(1) <<+物品資料(?)>> +武將數量(1) <<+武將資料(?)>>
]]--
protocolTable[2] = {}

--[[ 系統訊息
S:002-000 <系統訊息> +玩家ID(8) +稱號(2) +L(1) +名字(L) +L(1) +內容(L) +物品數量(1) <<+物品資料(?)>> +武將數量(1) <<+武將資料(?)>>
]]--
protocolTable[2][0] = function(data)
  Chat.ReceiveMessage(EChannel.System, data);
end

--[[ 全頻訊息
S:002-001 <全頻訊息> +玩家ID(8) +稱號(2) +L(1) +名字(L) +L(1) +內容(L) +物品數量(1) <<+物品資料(?)>> +武將數量(1) <<+武將資料(?)>>
]]--
protocolTable[2][1] = function(data)
  Chat.ReceiveMessage(EChannel.World, data);
end

--[[ 輕頻訊息
S:002-002 <輕頻訊息> +玩家ID(8) +稱號(2) +L(1) +名字(L) +L(1) +內容(L) +物品數量(1) <<+物品資料(?)>> +武將數量(1) <<+武將資料(?)>>
]]--
protocolTable[2][2] = function(data)
  Chat.ReceiveMessage(EChannel.Scene, data);
end

--[[ 密頻訊息
S:002-003 <密頻訊息> +玩家ID(8) +稱號(2) +L(1) +名字(L) +L(1) +內容(L) +物品數量(1) <<+物品資料(?)>> +武將數量(1) <<+武將資料(?)>>
]]--
protocolTable[2][3] = function(data)
  Chat.ReceiveMessage(EChannel.Whisper, data);
end

--[[ GM頻訊息
S:002-004 <GM頻訊息> +玩家ID(8) +稱號(2) +L(1) +名字(L) +L(1) +內容(L) +物品數量(1) <<+物品資料(?)>> +武將數量(1) <<+武將資料(?)>>
]]--
protocolTable[2][4] = function(data)
  Chat.ReceiveMessage(EChannel.GM, data);
end

--[[ 隊頻訊息
S:002-005 <隊頻訊息> +玩家ID(8) +稱號(2) +L(1) +名字(L) +L(1) +內容(L) +物品數量(1) <<+物品資料(?)>> +武將數量(1) <<+武將資料(?)>>
]]--
protocolTable[2][5] = function(data)
  Chat.ReceiveMessage(EChannel.Team, data);
end

--[[ 團頻訊息
S:002-006 <團頻訊息> +玩家ID(8) +稱號(2) +L(1) +名字(L) +L(1) +內容(L) +物品數量(1) <<+物品資料(?)>> +武將數量(1) <<+武將資料(?)>>
]]--
protocolTable[2][6] = function(data)
  Chat.ReceiveMessage(EChannel.Organization, data);
end

--[[ 盟頻訊息
S:002-007 <盟頻訊息> +玩家ID(8) +稱號(2) +L(1) +名字(L) +L(1) +內容(L) +物品數量(1) <<+物品資料(?)>> +武將數量(1) <<+武將資料(?)>>
]]--
protocolTable[2][7] = function(data)
  Chat.ReceiveMessage(EChannel.Ally, data);
end

--[[ 系統公告暫時禁言
S:002-008 <系統公告暫時禁言>
]]--
protocolTable[2][8] = function(data)
  --Se_InputBar.SetSystemSpeakTick;
end

--[[ 廣播訊息
S:002-010 <廣播訊息> +顯示方式(1) +主字串種類(1) +參數數量(1) <<+參數字串種類(1)>>
  顯示方式 bit1:系統頻道 bit2:中央訊息 bit3:跑馬燈
  字串種類 0:字串內容 +L(1) +字串內容(L)
  字串種類 1:字串編號 +字串編號(4)
  字串種類 2:數值 +值(4)
]]--
protocolTable[2][10] = function(data)
  local showSwitch = data:ReadByte();
  local message = string.GetServerText(data);
  if string.IsNullOrEmpty(message) then return end

  --logWarn(string.Concat("Receive 2 - 10 Message: ", message));

  if CheckFlag(showSwitch, 1) then
    Chat.AddMessage(EChannel.System, message);
  end

  if CheckFlag(showSwitch, 2) then
    CGTimer.DoFunctionDelay(0, function() ShowCenterMessage(message) end);
  end

  if CheckFlag(showSwitch, 3) then
    ShowMarqueeMessage(message);
  end
end

--[[ 主角
C:003 <選擇角色>
]]--
protocolTable[3] = {};

--[[ 玩家出現
S:003-000 <玩家出現> +玩家ID(8)
                    +性別(1)
                    +屬性(1)
                    +三轉屬性(1)
                    +等級(1)
                    +衰神標記(1)
                    +福神標記(1)
                    +場景(2)
                    +座標X(2)
                    +座標Y(2)
                    +臉圖(1)
                    +頭型(1)
                    +身型(1)
                    +色盤值(帽,髮,膚)(4)
                    +色盤值(衣,配一,鞋)(4)
                    +擂台團P最後勝幾場(2)
                    +擂台團P玩家的名次(1)
                    +線上狀態(1)
                    +Npc挑戰賽勝場次(1)
                    +來源伺服器ID(1)
                    +轉生的種類(1)
                    +職業種類(1)
                    +L(1) +名字(L)
                    +分區(2)
                    +坐騎(2)
                    +座騎等級(1)
                    +裝備數量(1) <<+物品ID(2)>>
                    +稱號(2)
                    +軍團ID(4)
]]--
protocolTable[3][0] = function(data)
  Role.PlayerAppear(data:ReadInt64(), data);
end

--[[ 主角出現
S:003-001 <玩家登入天數> +登入天數(2) +連續登入天數(2)
]]--
protocolTable[3][1] = function(data)
  Role.SetLoginDay(data);
end

--[[ 更新每日在線時間
S:003-002 <更新每日在線時間> +時間(8)
]]--
protocolTable[3][2] = function(data)
  CGTimer.SetOnlineTime(data:ReadDouble());

  if UI.IsVisible(UILoginAward) then
    UILoginAward.CheckCrossDay();
  end
  
  BattlePass.CheckCrossDay();

  Social.ClearVisitedFriendsTable();
end

--[[ 更新半月卡購買時間
S:003-003 <更新半月卡購買時間> +時間(8)
]]--
protocolTable[3][3] = function(data)
  StoreValue.SetHalfMonthCardTime(data:ReadDouble());
  UIMain.UpdateBuff();
end

--[[ 玩家資料
C:005-007 <設定在線狀態> +種類(1)
C:005-008 <看完新手教學> +教學編號(1)
C:005-012 <更換稱號> +稱號ID(2)
]]--
protocolTable[5] = {}

--[[ 玩家脫下裝備
S:005-001 <玩家脫下裝備> +玩家ID(8) +數量(1) <<+物品ID(2)>>
]]--
protocolTable[5][1] = function(data)
  local roleId = data:ReadInt64();
  local count = data:ReadByte();
  if roleId == Role.playerId then return end
  if Role.players[roleId] == nil then return end
  for i = 1, count do
    local itemId = data:ReadUInt16();

    if itemDatas[itemId] == nil then return end

    Role.players[roleId]:SetEquip(itemDatas[itemId].fitType, 0);
  end
end

--[[ 玩家穿上裝備
S:005-002 <玩家穿上裝備> +玩家ID(8) +數量(1) <<+物品ID(2)>>
]]--
protocolTable[5][2] = function(data)
  local roleId = data:ReadInt64();
  local count = data:ReadByte();
  if roleId == Role.playerId then return end
  if Role.players[roleId] == nil then return end
  for i = 1, count do
    local itemId = data:ReadUInt16();

    if itemDatas[itemId] == nil then return end

    Role.players[roleId]:SetEquip(itemDatas[itemId].fitType, itemId);
  end
end

--[[ 玩家資料
S:005-003 <玩家資料> +玩家資料(?)
]]--
protocolTable[5][3] = function(data)
  Role.ReceivePlayerData(data);
end

--[[ 資料傳完可秀人物
S:005-004 <資料傳完可秀人物>
]]--
protocolTable[5][4] = function(data)
  --[[
  HumManage.isShowHum = True;
  Player.MoveOldTime = GetTickCount;
  MouseInfo.SetNowCursor(curDefault);
  ]]--
end

--[[ 玩家變身
S:005-005 <玩家變身> <<+玩家ID(8) +NPCID(2)>>
]]--
protocolTable[5][5] = function(data)
  while data.length > 0 do
    local roleId = data:ReadInt64();
    local npcId = data:ReadUInt16();

    if Role.players[roleId] ~= nil then
      if npcDatas[npcId] ~= nil then
        Role.players[roleId].npcId = npcId;
      else
        Role.players[roleId].npcId = 0;
      end

      Role.players[roleId]:UpdateAll();

      --若是玩家,更新裝備和狀態欄
      if roleId == Role.playerId then
        --[[
        if Se_StatusInfoForm.Visible then
          Se_StatusInfoForm.Appear;
        end

        if Se_EquipForm.Visible then
          Se_EquipForm.Appear;
        end
        ]]--
      end
    end
  end
end

--[[ 玩家線上狀態
S:005-008 <玩家線上狀態> +玩家ID(8) +狀態(1)
]]--
protocolTable[5][8] = function(data)
  local roleId = data:ReadInt64();

  if Role.players[roleId] == nil then return end

  Role.players[roleId].data.onlineState = data:ReadByte();
end

--[[ 二代武將換造型
S:005-009 <二代武將換造型> +玩家ID(8) +武將索引(1) +NPCID(2)
]]--
protocolTable[5][9] = function(data)
  local roleId = data:ReadInt64();
  local followIndex = data:ReadByte();
  local followNpc = Role.GetRole(EHuman.FollowNpc, roleId, followIndex);

  if followNpc == nil then return end

  local npcId = data:ReadUInt16();

  if npcDatas[npcId] == nil then return end
  
  followNpc.npcId = npcId;

  npcDatas[npcId]:SetRoleAttributes(role);
  
  followNpc:UpdateAll();
end

--[[ 玩家升級
S:005-010 <玩家升級> +玩家ID(8)
]]--
protocolTable[5][10] = function(data)
  local roleId = data:ReadInt64();

  if Role.players[roleId] == nil then return end

  Role.players[roleId]:PlayUpEffect("LevelUP", 0);

  if roleId == Role.playerId then
    AudioManager.PlayOnce("AudioClip_WA0013", 0);
  end
end

--[[ 玩家丹藥次數
S:005-011 <玩家丹藥次數> +太上金丹(1) +健體玉液(1) +幻能玉液(1) +技能丹(1)
]]--
protocolTable[5][11] = function(data)
  Role.player.data.attrPillCount = data:ReadByte();
  Role.player.data.hpPillCount = data:ReadByte();
  Role.player.data.spPillCount = data:ReadByte();
  Role.player.data.skillPillCount = data:ReadByte();

  Role.player:SetAttribute(EAttribute.MaxHp, Calc.GetMaxHp(Role.player));
  Role.player:SetAttribute(EAttribute.MaxSp, Calc.GetMaxSp(Role.player));

  if UI.IsVisible(UIStatus) and UIStatus.IsCurrentRole(Role.player) then
    UIStatus.UpdateUI();
  end
end

--[[ 玩家更換稱號
S:005-012 <玩家更換稱號> +玩家ID(8) +稱號ID(2)
]]--
protocolTable[5][12] = function(data)
  local roleId = data:ReadInt64();

  if Role.players[roleId] == nil then return end

  Role.players[roleId]:SetTitle(data:ReadUInt16());
end

--[[ 玩家穿上外顯時裝
S:005-013 <玩家穿上外顯時裝> +玩家ID(8) + 數量(1) + <<物品ID(2)>>
]]--
protocolTable[5][13] = function(data)
  local roleId = data:ReadInt64();
  if Role.players[roleId] == nil then return end
  local count = data:ReadByte();
  for i = 1, count do
    local itemID = data:ReadUInt16();
    Role.players[roleId]:SetEquip(itemDatas[itemID].fitType + Role.maxOutfitStyle, itemID);
  end
end

--[[ 玩家脫下外顯時裝
S:005-014 <玩家脫下外顯時裝> +玩家ID(8) + 數量(1) + <<物品ID(2)>>
]]--
protocolTable[5][14] = function(data)
  local roleId = data:ReadInt64();
  if Role.players[roleId] == nil then return end
  local count = data:ReadByte();
  for i = 1, count do
    local itemID = data:ReadUInt16();
    Role.players[roleId]:SetEquip(itemDatas[itemID].fitType + Role.maxOutfitStyle, 0);
  end
end

--[[ 移動
C:006-001 <玩家移動> +方向(1) +座標X(2) +座標Y(2)
C:006-002 <玩家停止移動> +方向(1) +座標X(2) +座標Y(2) -- C端不送這一條
]]--
protocolTable[6] = {}

--[[ 玩家移動
S:006-001 <玩家移動> +玩家ID(8) +走到目的點後的面朝向(1) +座標X(2) +座標Y(2)
]]--
protocolTable[6][1] = function(data)
  --在龍舟賽道內,移動由Server控制
  if DragonBoat.InRaceScene() then return end

  local roleId = data:ReadInt64();

  if Role.players[roleId] == nil then return end

  --[[
  --在水戰中且在海上,隊員可自由移動
  if Warship.scene ~= EWaterScene.Fight and Team.IsLeader(Role.playerId) then
    for i = 1, Player.Team.PartnerNum do
      if Player.Team.Partner[i].ID == roleId then
        return;
      end
    end
  end

  if Player.isActPos and Player.Team.LeaderID == aID2 then
    Player.DisActPose;
  end
  ]]--

  local direction = data:ReadByte() + 8;
  local position = Vector2.New(data:ReadUInt16(), data:ReadUInt16());

  Role.players[roleId]:Move(position, nil, true);
end

--[[ 玩家停止移動
S:006-002 <玩家停止移動>
]]--
protocolTable[6][2] = function(data)
  Role.player:StopMove();
end

--[[ 分區
C:007-001 <要分區列表>
C:007-002 <切換分區> +分區(2)
]]--
protocolTable[7] = {};

--[[ 玩家瞬移
S:007-000 <玩家瞬移> +玩家ID(8) +場景編號(2) +座標X(2) +座標Y(2)
]]--
protocolTable[7][0] = function(data)
  local roleId = data:ReadInt64();

  if Role.players[roleId] == nil then return end

  Role.players[roleId]:ChangeScene(data:ReadUInt16(), Vector2.New(data:ReadUInt16(), data:ReadUInt16()), nil ,Role.player.data.instanceId);
end

--[[ 分區列表
S:007-001 <分區列表> +數量(1) <<+區號(2)>>
]]--
protocolTable[7][1] = function(data)
  local count = data:ReadByte();

  if count <= 0 then
    ShowCenterMessage(string.Get(10135));
    return;
  end

  table.Clear(UIServerArea.instances);
  
  for i = 1, count do
    local aeraData = {};
    aeraData.index = data:ReadUInt16();
    aeraData.currentPlayers = data:ReadUInt16();
    aeraData.maxPlayers = data:ReadUInt16();
    table.insert(UIServerArea.instances, aeraData);
  end
  
  if not table.Contains(UIServerArea.instances, SceneManager.instanceId) then
    local aeraData = {};
    aeraData.index = SceneManager.instanceId;
    table.insert(UIServerArea.instances, aeraData);
  end

  table.sort(UIServerArea.instances, function(a, b) return a.index < b.index end);

  if not UI.IsVisible(UIServerArea) then
    UI.Open(UIServerArea);
  end
end

--[[ 換分區結果
S:007-002 <換分區結果> +結果(1)
  結果 1:不可換到同一區
  結果 2:無指定區可換
  結果 3:組隊不可換分區
  結果 4:人數已滿
]]--
protocolTable[7][2] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    ShowCenterMessage(string.Get(20687));
  elseif result == 2 then
    ShowCenterMessage(string.Get(20688));
  elseif result == 3 then
    ShowCenterMessage(string.Get(20728));
  elseif result == 4 then
    ShowCenterMessage(string.Get(10330));
  else
    if UI.IsVisible(UIServerArea) then
      UI.Close(UIServerArea);
    end
  end
end

--[[ 人物屬性
C:008-001 <設定屬性> +武將索引(2) +種類(1) +數值(4) +參數(1)
C:008-002 <設定屬性(金手指)> +武將索引(2) +種類(1) +數值(4) +參數(1)
C:008-011 <脫胎換骨確認> +武將索引(1) +結果(1)
  結果 1:同意 2:取消
C:008-014 <設定3轉人物光暗屬性> +結果(1) 
  結果 1:同意 2:取消
]]--
protocolTable[8] = {}

--[[ 設定主角屬性
S:008-001 <設定主角屬性> +種類(1) +正負號(1) +數值(4) +參數(4)
]]--
protocolTable[8][1] = function(data)
  local attrKind = data:ReadByte();
  local sign = data:ReadByte();
  local attrValue = data:ReadInt32();
  local attrArg = data:ReadInt32();
  
  if sign == 2 then
    attrValue = attrValue * -1;
  end
  
  Role.SetAttribute(EHuman.Player, Role.playerId, attrKind, attrValue, attrArg);
end

--[[ 設定人物屬性
S:008-002 <設定人物屬性> +人物種類(1) +人物索引(2) +種類(1) +正負號(1) +數值(4) +參數(4)
]]--
protocolTable[8][2] = function(data)
  local humanKind = data:ReadByte();
  local index = data:ReadUInt16();
  local attrKind = data:ReadByte();
  local sign = data:ReadByte();
  local attrValue = data:ReadInt32();
  local attrArg = data:ReadInt32();
  
  if sign == 2 then
    attrValue = attrValue * -1;
  end
  
  Role.SetAttribute(humanKind, index, attrKind, attrValue, attrArg);
end

--[[ 設定世界人物屬性
S:008-003 <設定世界人物屬性> +玩家ID(8) +種類(1) +正負號(1) +數值(4) +參數(4)
]]--
protocolTable[8][3] = function(data)
  local roleId = data:ReadInt64();
  local attrKind = data:ReadByte();
  local sign = data:ReadByte();
  local attrValue = data:ReadInt32();
  local attrArg = data:ReadInt32();

  if sign == 2 then
    attrValue = attrValue * -1;
  end
  
  Role.SetAttribute(EHuman.Players, roleId, attrKind, attrValue, attrArg);
end

--[[ 設定守衛NPC屬性
S:008-004 <設定守衛NPC屬性> +人物索引(1) +種類(1) +數值(4)
]]--
protocolTable[8][4] = function(data)
  if City.cityId == 0 then return end

  local index = data:ReadByte();
  local attrKind = data:ReadByte();
  local attrValue = data:ReadInt32();
  
  Role.SetAttribute(EHuman.GuardNpc, index, attrKind, attrValue);
end

--[[ 設定主角戰船技能
S:008-005 <設定主角戰船技能> <<+技能ID(2) +技能等級(1)>>*4
]]--
protocolTable[8][5] = function(data)
  if Warship.warships[Role.playerId] == nil then return end

  for i = 1, Warship.MaxBoatInnateSkill do
    Warship.warships[Role.playerId]:SetSkill(i, data:ReadUInt16(), data:ReadByte());
  end
end

--[[ 設定戰船屬性
S:008-006 <設定戰船屬性> +屬性種類(1) +屬性數值(2)
]]--
protocolTable[8][6] = function(data)
  if Warship.warships[Role.playerId] == nil then return end

  Warship.warships[Role.playerId]:SetAttribute(data:ReadByte(), data:ReadUInt16());
end

--[[ 設定主角戰船屬性
S:008-007 <設定主角戰船屬性> +屬性種類(1) +屬性數值(2)
]]--
protocolTable[8][7] = function(data)
  if Warship.warships[Role.playerId] == nil then return end

  Warship.warships[Role.playerId]:SetAttribute(data:ReadByte(), data:ReadUInt16());
end

--[[ 新增加持屬性聊天訊息
S:008-008 <新增加持屬性聊天訊息> +種類(1) +數值(1)
]]--
protocolTable[8][8] = function(data)
  local kind = data:ReadByte();
  local value = data:ReadByte();

  if kind == 1 then
    Chat.AddMessage(EChannel.System, string.Get(40459)..tostring(value)..string.Get(40464));
  elseif kind == 2 then
    Chat.AddMessage(EChannel.System, string.Get(40460)..tostring(value)..string.Get(40464));
  elseif kind == 3 then
    Chat.AddMessage(EChannel.System, string.Get(40461)..tostring(value)..string.Get(40464));
  elseif kind == 4 then
    Chat.AddMessage(EChannel.System, string.Get(40462)..tostring(value)..string.Get(40464));
  elseif kind == 5 then
    Chat.AddMessage(EChannel.System, string.Get(40463)..tostring(value)..string.Get(40464));
  end
end

--[[ 設定BUFF資料
S:008-009 <設定BUFF資料> <<+種類(1) +到期時間(8) +數值(2)>>*6
]]--
protocolTable[8][9] = function(data)
  for i = 1, 6 do
    data:ReadByte(); --種類好像沒有用
    
    DrugBuff.SetTimeBuff(ETimeBuff.DoubleExp + i, data:ReadDouble(), data:ReadUInt16());
  end
end

--[[ 設定主角跟隨NPC世界王Buff時間
S:008-010 <設定主角跟隨NPC世界王Buff時間> +數量(1) <<+索引(1) +時間(8)>>
]]--
protocolTable[8][10] = function(data)
  local count = data:ReadByte();

  for i = 1, count do
    local followIndex = data:ReadByte();
    local time = DateTime.FromOADate(data:ReadDouble());

    local followNpc = Role.GetRole(EHuman.FollowNpc, Role.playerId, followIndex);
    if followNpc ~= nil then
      followNpc.data.worldBossBuff = time;
    end
  end
end

--[[ 武將操作暫存資料
S:008-011 <武將操作暫存資料> +操作種類(1) +武將ID(2) +武將屬性(1)*6
  操作種類 1:強化 2:脫胎換骨
]]--
protocolTable[8][11] = function(data)
  Role.rebornKind = data:ReadByte();
  Role.rebornNpcId = data:ReadUInt16();
  Role.rebornAttributes[1] = data:ReadByte(); --int
  Role.rebornAttributes[2] = data:ReadByte(); --atk
  Role.rebornAttributes[3] = data:ReadByte(); --def
  Role.rebornAttributes[6] = data:ReadByte(); --agi
  Role.rebornAttributes[4] = data:ReadByte(); --hpx
  Role.rebornAttributes[5] = data:ReadByte(); --spx
  
  if UI.IsVisible(UIStatus) then
    UIStatus.UpdateUI();
  end
end

--[[ 設定3轉人物光暗屬性
S:008-012 <設定3轉人物光暗屬性> +結果(1)
]]--
protocolTable[8][12] = function(data)
  local result = data:ReadByte();
end

--[[ 設定主角技能
S:008-013 <設定主角技能> +元素(1) +技能點數(2) +技能數量(1) +<<技能ID(2) +等級(1)>>
]]--
protocolTable[8][13] = function(data)
  Role.ReceivePlayerSkillData(data);
end

--[[ 設定世界人物屬性(Int64)
S:008-014 <設定世界人物屬性> +種類(1) +正負號(1) +數值(8) +參數(4)
]]--
protocolTable[8][14] = function(data)
  local attrKind = data:ReadByte();
  local sign = data:ReadByte();
  local attrValue = data:ReadInt64();
  local attrArg = data:ReadInt32();
  
  if sign == 2 then
    attrValue = attrValue * -1;
  end
  
  Role.SetAttribute(EHuman.Player, Role.playerId, attrKind, attrValue, attrArg);
end

--[[等級突破
S:008-015<設定等級突破> + 種類(1)
                      1.等級突破經驗(4)
                      2.開關(1)
]]--
--獲得經驗時server判斷送client

protocolTable[8][15] = function(data)
  local kind = data:ReadByte();
  if kind == 1 then
    local exp = data:ReadUInt32();
    Breakthrough.UpdateBreakthrough(exp);
  elseif kind == 2 then
    local flag = data:ReadBoolean();
    Breakthrough.SetBreakthroughFlag(flag);
  end
end

--[[ 選角色
C:009-001 <創角> +性別(1) +臉圖(1) +頭型(1) +體型(1) +調色盤1(4) +調色盤5(4) +屬性(1) +數值(1)*6 +密碼L(1) +密碼(密碼L) +暗碼L(1) +暗碼(暗碼L)
C:009-002 <檢查名字> +名字(?)
]]--
protocolTable[9] = {}

--[[ 創角
S:009-001 <創角成功>
]]--
protocolTable[9][1] = function(data)
  UI.Close(UICreateRole);
  
  --C:003 <選擇角色>
  Network.Send(3);
end

--[[ 檢查名字
S:009-003 <檢查名字> +結果(1)
  結果 0:可用
  結果 1:重複
  結果 2:非法
  結果 8:確認角色是否存在其他伺服器中
  結果 9:其他伺服器已有角色
]]--
protocolTable[9][3] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    ShowCenterMessage(string.Get(50040));
  elseif result == 2 then
    ShowCenterMessage(string.Get(50041));
  elseif result == 3 then
    ShowCenterMessage(string.Get(50053));
  elseif result == 8 then
    ShowCenterMessage(string.Get(23958));
  elseif result == 9 then
    ShowCenterMessage(string.Get(23959));
  end
end

--[[ 防沉迷的己使用時間
S:009-004 <防沉迷的己使用時間> +時間(4)
]]--
protocolTable[9][4] = function(data)
  local count = data:ReadUInt32();
  --[[
  SetTickCount = GetTickCount;
  OnUseCount = FConnect.CharToDWord(Copy(Data, 2, 4));
  ]]--
  logError("Receive OnUseCount = "..count);
end

--[[ 防沉迷的沉迷時間
S:009-005 <防沉迷的沉迷時間> +累計在線時間(4) +累計下線時間(4) +是否已成年(1)
]]--
protocolTable[9][5] = function(data)
  local onlineMinutes = data:ReadUInt32();
  local offlineMinutes = data:ReadUInt32();
  local isAdult = data:ReadBoolean();
  --[[
  OnWallowUseTick = GetTickCount;
  isShowWallowMsg = True;
  WallowMinA = onlineMinutes;
  WallowMinB = offlineMinutes;

  --若會出發輸入身份證等資料,則不會秀以下的訊息
  if FCtrl.WallowDelayShow then
    return;
  end

  if joOnLineTip.CloseShowForm<>nil then
    return;
  end
  ]]--
  if isAdult then
    ShowCenterMessage(string.Get(40482), 5);
  else
    ShowCenterMessage(string.Get(40483), 5);
  end
end

--[[ 不知道幹嘛的
C:010-000 <心跳包>
C:010-001 <不知道幹嘛的>
]]
protocolTable[10] = {};

--[[ 心跳包回覆
S:010-000 <心跳包回覆>
]]--
protocolTable[10][0] = function(data)
end

--[[ 戰鬥
C:011-001 <結束觀戰>
C:011-002 <PK> +戰鬥類型(1) +玩家ID(8) +索引(2)
C:011-003 <參戰> +玩家ID(8) +索引(2)
C:011-006 <求救>
C:011-008 <攻城戰PK> +戰鬥類型(1) +玩家ID(8) +索引(1)
C:011-009 <離開城戰觀戰>
C:011-010 <生存戰場PK> +戰鬥類型(1) +玩家ID(8)
]]--
protocolTable[11] = {};

--[[ 結束戰鬥
S:011-000 <結束戰鬥> + 結束的玩家ID(8) + 結束的NPCIndex(2)
]]--
protocolTable[11][0] = function(data)
  FightManager.FightOver(data:ReadInt64(), data:ReadUInt16());
end

--[[ 角色離開戰鬥
S:011-001 <角色離開戰鬥> + 行(1) + 列(1)
]]--
protocolTable[11][1] = function(data)
  local colm = data:ReadByte();
  local row = data:ReadByte();
  FightManager.RevExitFight(colm, row);
  --log("Exit Fight 11 1 "..colm.." "..row);
end

--[[ 戰鬥錯誤訊息
S:011-003 <戰鬥錯誤訊息> + 種類(1)
]]--
protocolTable[11][3] = function(data)
  FightManager.RevFailMsg(data);
end

--[[ 場景玩家戰鬥類型
S:011-004 <場景玩家戰鬥類型> <<+角色種類(1) +玩家ID(8) + NPCID(2) +戰鬥類型(1)>>
]]--
protocolTable[11][4] = function(data)
  while data.length > 0 do
    local kind = data:ReadByte();
    local index1 = data:ReadInt64();
    local index2 = data:ReadUInt16();
    local warKind = data:ReadByte();

    if kind == EHuman.Players then
      if Role.players[index1] == nil then return end

      Role.players[index1]:SetWar(warKind);

    elseif kind == EHuman.MapNpc then
      if Role.mapNpcs[index1] == nil then return end

      Role.mapNpcs[index1]:SetWar(warKind);

    elseif kind == EHuman.GuardNpc then
      if Role.guardNpcs[index2] == nil then return end

      Role.guardNpcs[index2]:SetWar(warKind);

    elseif kind == EHuman.ForeignNpc then
      if Role.foreignNpcs[index2] == nil then return end

      Role.foreignNpcs[index2]:SetWar(warKind);
    end
  end
end

--[[ 戰場舊玩家收到參戰玩家資訊
S:011-005 <參戰角色資訊> <<+戰鬥角色資料(?)>>
]]--
protocolTable[11][5] = function(data)
  while data.length > 0 do 
    FightField.RoleAppear(data);
  end
end

--[[ 收到求救訊息
S:011-006 <收到求救訊息> +玩家ID(8)
]]--
protocolTable[11][6] = function(data)
  local roleId = data:ReadInt64();

  if Role.players[roleId] == nil then return end
  
  Role.players[roleId]:PlayEmoji(118);
end

--[[ 使用自動戰鬥
S:011-007 <使用自動戰鬥> +種類(1) +次數(1)
]]--
protocolTable[11][7] = function(data)
end

--[[ 設定補血攻擊丸次數
S:011-009 <設定補血攻擊丸次數> + 次數(1) + 是否顯示(1)
]]--
protocolTable[11][9] = function(data)
  local count = data:ReadByte();
  local visible = data:ReadByte();

  if visible == 1 then
    ShowCenterMessage(string.Get(40312)..count..string.Get(40114));
  end
end

--[[ 設定戰場戰鬥類型
S:011-010 <設定戰場戰鬥類型> + 戰場類型(1) + 回合數(2) + 限制類型(1) + 限制開關(4)
]]--
protocolTable[11][10] = function(data)
  FightManager.FightFieldWarStyle(data);  
end

--[[ 使用機關盒消耗物品,收到使用機關盒期限
S:011-011 <收到使用機關盒期限> + 使用期限(8)
]]--
protocolTable[11][11] = function(data)
end

--[[ 收到擺攤到期日
S:011-012 <收到擺攤到期日> + 日期(8)
]]--
protocolTable[11][12] = function(data)
  --local dueDate = data:ReadDouble()
  --ShowCenterMessage(string.Get(80122)..DateTime.FromOADate(dueDate):ToString("yyyy/MM/dd HH:mm"));
  --UIVender.SetDueDat(dueDate);
end

--[[ 現行戰鬥現況
S:011-250 <現行戰鬥現況> +地質資訊(1) +事件編號(2) <<+戰鬥角色資料(?)>>
]]--
protocolTable[11][250] = function(data)
  FightField.Create(data:ReadByte(), data:ReadUInt16());

  while data.length > 0 do 
    FightField.RoleAppear(data);
  end
end

--[[ 換場景
C:012-001 <換場景完畢>
]]--
protocolTable[12] = {};

--[[ 玩家更換場景
S:012-000 <玩家更換場景> +玩家ID(8) +場景編號(2) +座標X(2) +座標Y(2) +換場索引(2) +區號(2) +裝備數量(1) <<+物品ID(2)>> +稱號(2)
]]--
protocolTable[12][0] = function(data)
  local roleId = data:ReadInt64();

  if Role.players[roleId] == nil then return end

  local sceneId = data:ReadUInt16();

  if roleId ~= Role.playerId and sceneId ~= SceneManager.sceneId then
    sceneId = 0;
    Team.RemoveMember(roleId, false);
  end

  local position = Vector2.New(data:ReadUInt16(), data:ReadUInt16());
  local sceneTag = data:ReadUInt16();
  local instanceId = data:ReadUInt16();

  Role.players[roleId]:ClearEquip();

  local count = data:ReadByte();
  for i = 1, count do
    local itemId = data:ReadUInt16();

    if itemDatas[itemId] ~= nil then
      Role.players[roleId]:SetEquip(itemDatas[itemId].fitType, itemId, false);
    end
  end
  
  --外顯外觀裝備
  local outfitStyleCount = data:ReadByte();
  
  for i = 1, outfitStyleCount do
    local itemId = data:ReadUInt16();
    if itemDatas[itemId] ~= nil then
      Role.players[roleId]:SetEquip(itemDatas[itemId].fitType + Role.maxOutfitStyle, itemId, false);
    end
  end

  Role.players[roleId]:SetTitle(data:ReadUInt16(), false);

  Role.players[roleId]:ChangeScene(sceneId, position, sceneTag, instanceId);
end

--[[ 組隊
C:013-001 <要求組隊> +玩家ID(8)
C:013-003 <回覆要求組隊> +結果(1) +玩家ID(8)
  結果 1:同意
  結果 2:拒絕
  結果 3:無回應
C:013-004 <離開隊伍> +隊長玩家ID(8)
C:013-005 <設定軍師> +玩家ID(8)
C:013-006 <取消軍師> +玩家ID(8)
C:013-007 <邀請組隊> +玩家ID(8)
C:013-008 <回覆邀請組隊> +結果(1) +玩家ID(8)
  結果 1:同意
  結果 2:拒絕
  結果 3:無回應
C:013-009 <換隊長> +玩家ID(8)
C:013-010 <踼隊員> +玩家ID(8)
]]--
protocolTable[13] = {}

--[[ 要求組隊
S:013-001 <要求組隊> +玩家ID(8)
]]--
protocolTable[13][1] = function(data)
  Invitation.Add(EInvitation.Team, data:ReadInt64(), ETeamInvitation.Join);
end

--[[ 要求組隊結果
S:013-002 <要求組隊結果> +結果(1)
  結果 1:忙碌中
]]--
protocolTable[13][2] = function(data)
  local result = data:ReadByte();
  if result == 1 then
    ShowCenterMessage(string.Get(40067), 2);
  end
end

--[[ 要求組隊結果
S:013-003 <要求組隊結果> +結果(1) +L(1) +名字(L)
  結果 1:同意
  結果 2:拒絕
  結果 3:無回應
]]--
protocolTable[13][3] = function(data)
  local result = data:ReadByte();
  local name = data:ReadString(data:ReadByte());

  if result == 1 then
    ShowCenterMessage(name..string.Get(40026), 1);
  elseif result == 2 then
    ShowCenterMessage(name..string.Get(40027), 1);
  elseif result == 3 then
    ShowCenterMessage(name..string.Get(40028), 1);
  end
end

--[[ 玩家離開隊伍
S:013-004 <玩家離開隊伍> +玩家ID(8) +坐標X(2) +坐標Y(2)
]]--
protocolTable[13][4] = function(data)
  local roleId = data:ReadInt64();
  Team.RemoveMember(roleId);

  if Role.players[roleId] == nil then return end

  Role.players[roleId]:Teleport(Vector2.New(data:ReadUInt16(), data:ReadUInt16()));
end

--[[ 玩家加入隊伍
S:013-005 <玩家加入隊伍> +隊長玩家ID(8) +玩家ID(8)
]]--
protocolTable[13][5] = function(data)
  Team.AddMember(data:ReadInt64(), data:ReadInt64());
end

--[[ 隊伍資料
S:013-006 <隊伍資料> <<+隊長玩家ID(8) +隊員數量(1) <<+玩家ID(8)>>>>
]]--
protocolTable[13][6] = function(data)
  while data.length > 0 do
    local leaderId = data:ReadInt64();
    local count = data:ReadByte();
    for i = 1, count do
      Team.AddMember(leaderId, data:ReadInt64(), false);
    end
  end
end

--[[ 設定主角隊伍軍師
S:013-007 <設定主角隊伍軍師> +玩家ID(8)
]]--
protocolTable[13][7] = function(data)
  Team.AddAdviser(data:ReadInt64());
end

--[[ 取消主角隊伍軍師
S:013-008 <取消主角隊伍軍師>
]]--
protocolTable[13][8] = function(data)
  Team.RemoveAdviser(Role.playerId);
end

--[[ 邀請組隊
S:013-009 <邀請組隊> +玩家ID(8) 
]]--
protocolTable[13][9] = function(data)
  Invitation.Add(EInvitation.Team, data:ReadInt64(), ETeamInvitation.Invite);
end

--[[ 邀請組隊結果
S:013-010 <邀請組隊結果> +結果(1) +L(1) +名字(L)
  結果 1:同意
  結果 2:拒絕
  結果 3:無回應
]]--
protocolTable[13][10] = function(data)
  local result = data:ReadByte();
  local name = data:ReadString(data:ReadByte());

  if result == 1 then
    ShowCenterMessage(name..string.Get(40068), 1);
  elseif result == 2 then
    ShowCenterMessage(name..string.Get(40069), 1);
  elseif result == 3 then
    ShowCenterMessage(name..string.Get(40028), 1);
  end
end

--[[ 軍師資料
S:013-011 <軍師資料> <<+玩家ID(8)>>
]]--
protocolTable[13][11] = function(data)
  while data.length > 0 do
    Team.AddAdviser(data:ReadInt64(), false);
  end
end

--[[ 刪除軍師資料
S:013-012 <刪除軍師資料> +玩家ID(8)
]]--
protocolTable[13][12] = function(data)
  Team.RemoveAdviser(data:ReadInt64());
end

--[[ 組隊訊息
S:013-013 <組隊訊息> +訊息種類(1)
  訊息種類 1:該隊人數己滿
  訊息種類 2:本隊人數己滿
  訊息種類 3:該玩家事件中
  訊息種類 4:不可與等級比自己高的隊長組隊
  訊息種類 5:不可讓等級比自己低的人入隊
  訊息種類 6:隊伍已解散
  訊息種類 7.自己在副本組隊中
  訊息種類 8.對方在副本組隊中
]]--
protocolTable[13][13] = function(data)
  local result = data:ReadByte();
  if result == 0 then 
    if Team.inviteStr ~= nil then 
      ShowCenterMessage(Team.inviteStr);      
    end
  elseif result == 1 then
    ShowCenterMessage(string.Get(40142));
  elseif result == 2 then
    ShowCenterMessage(string.Get(40143));
  elseif result == 3 then
    ShowCenterMessage(string.Get(40322));
  elseif result == 4 then
    if Between(SceneManager.sceneId, 12921, 12934) then
      ShowCenterMessage(string.Get(30152));
    elseif SceneManager.sceneId == 10991 then
      ShowCenterMessage(string.Get(30157));
    end
  elseif result == 5 then
    if Between(SceneManager.sceneId, 12921, 12934) then
      ShowCenterMessage(string.Get(30153));
    elseif SceneManager.sceneId == 10991 then
      ShowCenterMessage(string.Get(30158));
    end
  elseif result == 6 then
    ShowCenterMessage(string.Get(20388));
  elseif result == 7 then 
    ShowCenterMessage(string.Get(20755));
  elseif result == 8 then 
    ShowCenterMessage(string.Get(20755));
  end
  Team.inviteStr = nil;
end

--[[ 換隊長
S:013-014 <換隊長> +隊長玩家ID(8) <<+隊員玩家ID(8)>>
]]--
protocolTable[13][14] = function(data)
  local leaderId = data:ReadInt64();
  local members = {};
  while data.length > 0 do
    table.insert(members, data:ReadInt64());
  end

  Team.RemoveMember(leaderId, false);
  for k, v in pairs(members) do
    Team.RemoveMember(v, false);
  end

  local count = data:ReadByte();
  for k, v in pairs(members) do
    Team.AddMember(leaderId, v, false);
  end

  if Role.players[leaderId] ~= nil and Team.GetLeader(leaderId) == Team.GetLeader(Role.playerId) then
    ShowCenterMessage(string.format(string.Get(20387), Role.players[leaderId].name));
  end
end

--[[ 好友
C:014-001 <玩家寄信> +玩家ID(8) +信件種類(1) +內容(?)
C:014-004 <刪除好友> +玩家ID(8)
C:014-005 <發送好友名單邀請> +L(1) +名字(L) +訊息(1)
C:014-006 <回覆好友名單邀請> +玩家ID(8) +結果(1)
  結果 1:接受
  結果 2:拒絕
C:014-007 <好友送禮> +玩家ID(8)
C:014-008 <好友收禮> +玩家ID(8)
C:014-009 <查詢玩家資訊> +玩家ID(8) +L(1) +名字(L)
]]--
protocolTable[14] = {}

--[[ 新增好友
S:014-003 <好友邀請結果> +L(1) +名字(L) +結果(1)
  結果 1:接受
  結果 2:拒絕
  結果 3:無回應
]]--
protocolTable[14][3] = function(data)
  local name = data:ReadString(data:ReadByte());
  local result = data:ReadByte();
  if result == 1 then
    RedDot.Add(ERedDot.FriendAdd);
    ShowCenterMessage(string.Get(50066)..name..string.Get(50067));
  elseif result == 2 then
    ShowCenterMessage(string.Get(50066)..name..string.Get(50068));
  else
    ShowCenterMessage(string.Get(50066)..name..string.Get(50069));
  end
end

--[[ 刪除好友
S:014-004 <刪除好友> +玩家ID(8)
]]--
protocolTable[14][4] = function(data)
  Social.RemoveFriend(data:ReadInt64());
end

--[[ 好友資料
S:014-005 <新增好友> +數量(2) <<+好友資料(?)>>
]]--
protocolTable[14][5] = function(data)
  local count = data:ReadUInt16();

  for i = 1, count do
    local roleId = data:ReadInt64();
    local playerInfo = PlayerInfo.New(roleId, data, false, true);

    Social.AddFriend(roleId, playerInfo, i == count);
  end
end

--[[ 好友信箱已滿
S:014-006 <好友信箱已滿>
]]--
protocolTable[14][6] = function(data)
  ShowCenterMessage(string.Get(50071));
end

--[[ 收到其他的訊息
S:014-007 <收到其他的訊息> +訊息種類(1)
  訊息種類 1:該場景人數過多
  訊息種類 2:邀請成功
  訊息種類 3:重複邀請
  訊息種類 4:對方邀請名單已滿
  訊息種類 5:對方好友名單已滿
  訊息種類 6:好友名單已滿
  訊息種類 7:查無此玩家
]]--
protocolTable[14][7] = function(data)
  local result = data:ReadByte();
  if result == 1 then
    ShowCenterMessage(string.Get(40423));
  elseif result == 2 then
    ShowCenterMessage(string.Get(20279));
  elseif result == 3 then
    ShowCenterMessage(string.Get(20280));
  elseif result == 4 then
    ShowCenterMessage(string.Get(20514));
  elseif result == 5 then
    ShowCenterMessage(string.Get(20382));
  elseif result == 6 then
    ShowCenterMessage(string.Get(10192));
  elseif result == 7 then
    ShowCenterMessage(string.Get(49135));
  end
end

--[[ 新增好友邀請
S:014-008 <新增好友邀請> +數量(2) <<+玩家ID(8) +玩家名片(?) +訊息(1)>>
]]--
protocolTable[14][8] = function(data)
  local count = data:ReadUInt16();

  for i = 1, count do
    Invitation.Add(EInvitation.Friend, data:ReadInt64(), data, i == count);
  end
end

--[[ 刪除好友邀請
S:014-009 <刪除好友邀請> +玩家ID(8)
]]--
protocolTable[14][9] = function(data)
  Invitation.Remove(EInvitation.Friend, data:ReadInt64());
end

--[[ 更新好友功能標記
S:014-012 <更新好友功能標記>  數量(1) + <<+玩家ID(8) +功能標記(1)>>
]]--
protocolTable[14][12] = function(data)
  local count = data:ReadByte();
  for i = 1, count do
    Social.SetFunctionFlag(data:ReadInt64(), data:ReadByte());
  end
end

--[[ 更新好友信任度
S:014-013 <更新好友信任度> +玩家ID(8) +信任度(2)
]]--
protocolTable[14][13] = function(data)
  Social.SetFriendly(data:ReadInt64(), data:ReadUInt16());
end

--[[ 玩家資訊
S:014-014 <玩家資訊> +玩家ID(8) +玩家名片(?) +MaxHP(4) +MaxSP(2) +六圍(4)*6 +裝備數量(1) <<+物品資料(16)>> +稱號(2)
]]--
protocolTable[14][14] = function(data)
  local roleId = data:ReadInt64();
  local playerInfo = PlayerInfo.New(roleId, data);
  local otherInfo = {};
  otherInfo.hp = data:ReadUInt32();
  otherInfo.sp = data:ReadUInt16();
  otherInfo.int = data:ReadInt32();
  otherInfo.atk = data:ReadInt32();
  otherInfo.def = data:ReadInt32();
  otherInfo.hpx = data:ReadInt32();
  otherInfo.spx = data:ReadInt32();
  otherInfo.agi = data:ReadInt32();
  otherInfo.equips = {};
  local count = data:ReadByte();
  for i = 1, count do
    local itemSave = ThingData.New(data);
    if itemDatas[itemId] ~= nil then
      Role.players[roleId]:SetEquip(itemDatas[itemId].fitType, itemId, false);
    end
    otherInfo.equips[itemDatas[itemSave.Id].fitType] = itemSave;
  end
  
  --外顯外觀裝備
  local outfitStyleCount = data:ReadByte();
  for i = 1, outfitStyleCount do
    local itemId = data:ReadUInt16();
    otherInfo.equips[itemDatas[itemId].fitType + Role.maxOutfitStyle] = itemDatas[itemId];
  end
  
  otherInfo.titleId = data:ReadUInt16();
  otherInfo.marriage = data:ReadByte();

  UI.Open(UISocialFunction, playerInfo, nil, false, otherInfo);
end

--[[ 收禮結果
S:014-015 <收禮結果> +結果(1)
  結果 1:成功
  結果 2:未獲得禮物
  結果 3:已領取
  結果 4:已達領取上限
  結果 5:物品ID錯誤
  結果 6:背包空間不足
]]--
protocolTable[14][15] = function(data)
  local result = data:ReadByte();
  if result == 1 then
  
  elseif result == 2 then
    ShowCenterMessage(string.Get(98018));
  elseif result == 3 then
    ShowCenterMessage(string.Get(98017));
  elseif result == 4 then
    ShowCenterMessage(string.Get(10195));
  elseif result == 5 then
    ShowCenterMessage(string.Get(10311));
  elseif result == 6 then
    ShowCenterMessage(string.Get(71328));
  end
end

--[[ 更新在線狀況
S:014-016 <更新在線狀況> +玩家ID(8) +是否在線(1)
]]--
protocolTable[14][16] = function(data)
  local roleId = data:ReadInt64();

  if Social.friends[roleId] == nil then return end

  Social.friends[roleId].online = data:ReadBoolean();
end

--[[ 更新歷史好友最大數量
S:014-017 <更新歷史好友最大數量> +玩家歷史好友最大值(4)
]]--
protocolTable[14][17] = function(data)
  Social.maxRecordFriendCount = data:ReadInt32();
  NotifyManager.Notify("CheckCondition", ECondition.FriendCount);
end

--[[ 武將
C:015-001 <跟隨武將新增> +NPCID(4)
C:015-002 <跟隨武將放逐> +索引(1)
--C:015-004 <上馬> +NPCID(4)
--C:015-005 <下馬>
C:015-006 <跟隨武將改名> +索引(1) +名字(?)
C:015-010 <武將存入馬車> +索引(1)
C:015-011 <武將領出馬車> +索引(1)
C:015-012 <交換武將> +跟隨索引(1) +馬車索引(1)
C:015-013 <> +索引(1)
C:015-014 <> +索引(1)
C:015-015 <> +索引(1) +索引(1)
C:015-016 <武將交易取消>
C:015-017 <二代武將改名> +物品索引(1) +索引(1) +名字(?)
C:015-018 <拒絕快遞開關> +是否拒絕快遞(1)
C:015-019 <拒絕交易開關> +是否拒絕交易(1)
]]--
protocolTable[15] = {}

--[[ 新增隨身武將
S:015-001 <新增隨身武將> +玩家ID(8) +跟隨索引(1) +NPCID(4) +成長類型(1) +是否顯示中央訊息(1)[0.否 1.是]
]]--
protocolTable[15][1] = function(data)
  Role.FollowNpcAppear(data:ReadInt64(), data:ReadByte(), data:ReadInt32(), data:ReadByte(), nil, nil, nil, nil, nil, data:ReadByte() == 1);
end

--[[ 刪除隨身武將
S:015-002 <刪除隨身武將> +玩家ID(8) +跟隨索引(1) +是否顯示中央訊息(1)[0.否 1.是]
]]--
protocolTable[15][2] = function(data)
  Role.FollowNpcDisappear(data:ReadInt64(), data:ReadByte(), data:ReadByte() == 1);
end

--[[ 所有玩家跟隨武將資料
S:015-004 <所有玩家跟隨武將資料> +數量(2) <<+玩家ID(8) +跟隨武將數(1) <<+跟隨索引(1) +NPCID(2) +靈魂ID(2) +騎乘中(1) +成長類型(1) +名字L(1) +名字(名字L)>>>>
]]--
protocolTable[15][4] = function(data)
  local count = data:ReadUInt16();

  for i = 1, count do
    local roleId = data:ReadInt64();
    local followCount = data:ReadByte();

    for j = 1, followCount do
      local followIndex = data:ReadByte();
      local npcId = data:ReadUInt16();
      local soulId = data:ReadUInt16();
      local beenRide = data:ReadBoolean();
      local canGrow = data:ReadByte();
      local name = data:ReadString(data:ReadByte());

      Role.FollowNpcAppear(roleId, followIndex, npcId, canGrow, name, beenRide, soulId);
    end
  end
end

--[[ 玩家上馬
S:015-005 <玩家上馬> +玩家ID(8) +NPCID(2) +靈魂ID(2)
]]--
protocolTable[15][5] = function(data)
end

--[[ 玩家下馬
S:015-006 <玩家下馬> +玩家ID(8)
]]--
protocolTable[15][6] = function(data)
end

--[[ 玩家跟隨武將資料
S:015-007 <玩家跟隨武將資料> +玩家ID(8) +數量(1) <<+跟隨索引(1) +NPCID(2) +靈魂ID(2) +騎乘中(1) +成長類型(1) +名字L(1) +名字(名字L)>>
]]--
protocolTable[15][7] = function(data)
  local roleId = data:ReadInt64();
  local count = data:ReadByte();  
  for i = 1, count do
    local followIndex = data:ReadByte();
    local npcId = data:ReadUInt16();
    local soulId = data:ReadUInt16();
    local beenRide = data:ReadBoolean();
    local canGrow = data:ReadByte();
    local name = data:ReadString(data:ReadByte());

    Role.FollowNpcAppear(roleId, followIndex, npcId, canGrow, name, beenRide, soulId);
  end
end

--[[ 主角隨身武將資料
S:015-008 <主角隨身武將資料> +數量(1) <<+跟隨索引(1) +NPCID(2) +武將資料(?)>>
  武將資料 +經驗值(4)
          +等級(1)
          +Hp(4)
          +Sp(2)
          +Int(2)
          +Atk(2)
          +Def(2)
          +Agi(2)
          +HPX(2)
          +SPX(2)
          +陣亡次數(1)
          +忠誠度(1)
          +成長(1)[0.不可成長 1.可成長 2.任務]
          +技能點數(2)
          +L(1) +名字(L)
          <<+技能等級(1)>>
          <<+物品資料(16)>>
          +昇華丹次數(1)
          +是否可使用特有技(1)
          +魂玉ID(4)
          +HP丹數量(1)
          +SP丹數量(1)
          +UpGradeLv(1)
]]--
protocolTable[15][8] = function(data)
  local count = data:ReadByte();
  
  for i = 1, count do
    Role.FollowNpcAppear(Role.playerId, data:ReadByte(), data:ReadUInt16(), nil, nil, nil, nil, data);
  end
end

--[[ 隨身武將名字改變
S:015-009 <隨身武將名字改變> +玩家ID(8) +跟隨索引(1) +名字(?)
]]--
protocolTable[15][9] = function(data)
  local roleId = data:ReadInt64();
  local followIndex = data:ReadByte();
  local followNpc = Role.GetRole(EHuman.FollowNpc, roleId, followIndex);
  
  if followNpc == nil then return end

  followNpc.data.name = data:ReadString(data.length);
  followNpc:UpdateName();

  if UI.IsVisible(UITeam) then
    UITeam.UpdateFollowNpc();
  end
end

--[[ 馬車武將資料
S:015-010 <馬車武將資料> <<+索引(1) +NPCID(2) +等級(1) +HP(4) +L(1) +名字(L)>>
]]--
protocolTable[15][10] = function(data)
  while data.length > 0 do
    Cart.AddNpc(data:ReadByte(), data:ReadUInt16(), data:ReadByte(), data:ReadUInt32(), data:ReadString(data:ReadByte()));
  end
end

--[[ 刪除馬車武將
S:015-011 <刪除馬車武將> +索引(1)
]]--
protocolTable[15][11] = function(data)
  Cart.RemoveNpc(data:ReadByte());
end

--[[ 馬車開始行動
S:015-012 <馬車開始行動> +行動種類(1)
  行動種類 1:開始運送
  行動種類 2:運送回來
  行動種類 3:取消
]]--
protocolTable[15][12] = function(data)
  --M版隨身客棧功能取代
end

--[[ 戰船資料
S:015-013 <戰船資料> <<+玩家ID(8) +NPCID(2)>>
]]--
protocolTable[15][13] = function(data)
  while data.length > 0 do
    Warship.SetWarship(data:ReadInt64(), data:ReadUInt16());
  end
end

--[[ 戰船資料
S:015-014 <戰船資料> +玩家ID(8) +NPCID(2)
]]--
protocolTable[15][14] = function(data)
  Warship.SetWarship(data:ReadInt64(), data:ReadUInt16());
end

--[[ 主角戰船資料
S:015-015 <主角戰船資料> +玩家ID(8) +NPCID(2) +戰船庫索引(1)
]]--
protocolTable[15][15] = function(data)
  Warship.SetWarship(Role.playerId, data:ReadUInt16(), data:ReadByte());
end

--[[ 使用魂玉置換馬匹
]]--
protocolTable[15][16] = function(data)
  --HumManage.RevUseSoulJade(Data);
end

--[[ 回收某一座城的魂玉
]]--
protocolTable[15][17] = function(data)
  --HumManage.HandleSoulJadeRecover(Data);
end

--[[ 更新主角隨身武將領悟丹
S:015-018 <更新主角隨身武將領悟丹> +索引(1) +領悟丹位置(1) +領悟丹使用次數(1)
]]--
protocolTable[15][18] = function(data)
  local followIndex = data:ReadByte();
  local followNpc = Role.GetRole(EHuman.FollowNpc, Role.playerId, followIndex);
  
  if followNpc == nil then return end

  local attribute = data:ReadByte();
  if attribute == 1 then
    followNpc.data.graspPill.index = 1;
  elseif attribute == 2 then
    followNpc.data.graspPill.index = 2;
  elseif attribute == 3 then
    followNpc.data.graspPill.index = 3;
  elseif attribute == 4 then
    followNpc.data.graspPill.index = 6;
  elseif attribute == 5 then
    followNpc.data.graspPill.index = 4;
  elseif attribute == 6 then
    followNpc.data.graspPill.index = 5;
  else
    followNpc.data.graspPill.index = 0;
  end

  followNpc.data.graspPill.count = data:ReadByte();

  if UI.IsVisible(UIStatus) then
    UIStatus.UpdateUI();
  end
end

--[[ 拒絕快遞開關
S:015-019 <拒絕快遞開關> +種類(1)
  種類 1:自己 +是否拒絕快遞(1)
  種類 2:別人
]]--
protocolTable[15][19] = function(data)
  local kind = data:ReadByte();
  if kind == 1 then
    Setting.expressEnable = not data:ReadBoolean();

    if UI.IsVisible(UISetting) then
      UISetting.UpdateUI();
    end
  elseif kind == 2 then
    Chat.AddMessage(EChannel.System, string.Get(80181));
  end
end

--[[ 武將強化等級
S:015-020 <武將強化等級> +武將索引(1) +強化等級(1)
]]--
protocolTable[15][20] = function(data)
  local followIndex = data:ReadByte();
  local followNpc = Role.GetRole(EHuman.FollowNpc, Role.playerId, followIndex);

  if followNpc == nil then return end

  followNpc.data.upgradeLv = data:ReadByte();

  if UI.IsVisible(UIStatus) and UIStatus.IsCurrentRole(followNpc) then
    UIStatus.UpdateUI();
  end
end

--[[ 更新主角隨身武將永丹資料
S:015-021 <更新主角隨身武將永丹資料> +索引(1) +HP丹數量(1) +SP丹數量(1)
]]--
protocolTable[15][21] = function(data)
  local followIndex = data:ReadByte();
  local followNpc = Role.GetRole(EHuman.FollowNpc, Role.playerId, followIndex);
  
  if followNpc == nil then return end

  followNpc.data.hpPillCount = data:ReadByte();
  followNpc.data.spPillCount = data:ReadByte();

  followNpc:SetAttribute(EAttribute.MaxHp, Calc.GetMaxHp(followNpc));
  followNpc:SetAttribute(EAttribute.MaxSp, Calc.GetMaxSp(followNpc));
  
  if UI.IsVisible(UIStatus) and UIStatus.IsCurrentRole(followNpc) then
    UIStatus.UpdateUI();
  end
end

--[[ 拒絕交易開關
S:015-021 <拒絕交易開關> +種類(1)
  種類 1:自己 +是否拒絕交易(1)
  種類 2:別人
]]--
protocolTable[15][22] = function(data)
  local kind = data:ReadByte();
  if kind == 1 then
    Setting.tradeEnable = not data:ReadBoolean();

    if UI.IsVisible(UISetting) then
      UISetting.UpdateUI();
    end
  elseif kind == 2 then
    Chat.AddMessage(EChannel.System, string.Get(80255));
  end
end

--[[ 機智問答(GM)
]]--
protocolTable[16] = {}

--[[ 戰鬥問答
S:016-001 <戰鬥問答> +L(1) +問題(L) <<+L(1) +答案(L)>>*4
]]--
protocolTable[16][1] = function(data)
  FightField.DoQandA(data);
end

--[[ 戰鬥問答結果
S:016-002 <戰鬥問答結果> +結果(1) 
]]--
protocolTable[16][2] = function(data)
  FightManager.RevQandAResult(data);
end

--[[ 
]]
protocolTable[16][3] = function(data)
  --GmManage.RevGmResult(Data);
end

--[[ 得到某玩家的位置
]]
protocolTable[16][4] = function(data)
  --GmManage.RevLocation(Data);
end

--[[ 比對Client/Server的資料長度
]]
protocolTable[16][5] = function(data)
  --GmManage.RevUserSave(Data);
end

--[[ 查到相似的姓名
]]
protocolTable[16][6] = function(data)
  --GmManage.RevLikeName(Data);
end

--[[ 禁言
S:016-007 <禁言> +原因(1) +禁言到期時間(8)
  原因 1.洗頻禁言 2.洗頻解禁言 3.GM禁言 4.GM解禁言
]]
protocolTable[16][7] = function(data)
  Chat.Ban(data:ReadByte(), DateTime.FromOADate(data:ReadDouble()));
end

--[[ 解除禁言
S:016-008 <解除禁言>
]]
protocolTable[16][8] = function(data)
  --[[
  Chat.AddMessage(EChannel.System, string.Get(40323));
  Chat.banSpeak = false;
  --]]
end

--[[ GM指令失敗原因
]]
protocolTable[16][9] = function(data)
  --GmManage.RevSystemMessage(Data);
end

--[[ 關人名單
]]
protocolTable[16][10] = function(data)
  --GmManage.RevCloseList(Data);
end

--[[ 鎖人名單
]]
protocolTable[16][11] = function(data)
  --GmManage.RevLockList(Data);
end

--[[ 禁言名單
]]
protocolTable[16][12] = function(data)
  --GmManage.RevBanSpeakList(Data);
end

--[[ 解除禁GM頻
S:016-013 <解除禁GM頻>
]]
protocolTable[16][13] = function(data)
  --[[
  Chat.AddMessage(EChannel.System, string.Get(40100));
  Chat.banGmChannel = false;
  --]]
end

--[[ 
]]
protocolTable[16][14] = function(data)
  --GmManage.RevCheckName(Data);
end

--[[ 
]]
protocolTable[16][15] = function(data)
  --GmManage.RevCheckNameNum(Data);
end

--[[ 留言板所有內容
]]
protocolTable[16][16] = function(data)
  --GmManage.RevAllLeaveWord(Data);
end

--[[ 玩家組織資料
]]
protocolTable[16][17] = function(data)
  --GmManage.RevUserOrganInfo(Data);
end

--[[ GM廣播
]]
protocolTable[16][18] = function(data)
  --GmManage.RevBroadcast(Data);
end

--[[ GM指令結果
]]
protocolTable[16][19] = function(data)
  --GmManage.RevMsgInfo(Data);
end

--[[ 機智問答
]]
protocolTable[16][20] = function(data)
  --KC_QuestionForm.RevQuestion(Data);
end

--[[ 機智問答結果
]]
protocolTable[16][21] = function(data)
  --KC_QuestionForm.RevAnswerResult(Data);
end

--[[ 端午問答(易)
]]
protocolTable[16][22] = function(data)
  --WF_day55QuestionForm.RevQuestion(Data);
end

--[[ 端午問答(難)
]]
protocolTable[16][23] = function(data)
  --WF_day55hardQuestion.RevQuestion(Data);
end

--[[ 端午問答結果
]]
protocolTable[16][24] = function(data)
  --WF_Day55EasyForm.RevSelect;
end

--[[ 端午問答得獎
]]
protocolTable[16][25] = function(data)
  --WF_Day55QuestManage.RevMsg(Data);
end

--[[ IP查玩家結果
]]
protocolTable[16][26] = function(data)
  --GmManage.RevFindIDByIP(Data);
end

--[[ 武將改名
C:018-001 <武將改名> +NPCID(4) +名字(?)
]]--

--[[ 出戰
C:019-001 <跟隨武將出戰> +NPCID(4)
C:019-002 <出戰武將收回>
]]--
protocolTable[19] = {}

--[[ 跟隨武將出戰
S:019-001 <跟隨武將出戰> +NPCID(4)
]]--
protocolTable[19][1] = function(data)
  Role.SetFightNpc(data:ReadUInt16());
end

--[[ 出戰武將收回
S:019-002 <出戰武將收回>
]]--
protocolTable[19][2] = function(data)
  Role.SetFightNpc(0);
end

--[[ 跟隨武將出戰
S:019-004 <跟隨武將出戰> +NPCID(2)
]]--
protocolTable[19][4] = function(data)
  Role.SetFightNpc(data:ReadUInt16());
end

--[[ 跟隨武將改名
S:019-005 <跟隨武將改名>
]]--
protocolTable[19][5] = function(data)
end

--[[ 跟隨武將陣亡
S:019-006 <跟隨武將陣亡> <<+索引(1) +是否(1)>>
]]--
protocolTable[19][6] = function(data)
  while data.length > 0 do
    local followIndex = data:ReadByte();
    local isDead = data:ReadBoolean();

    local followNpc = Role.GetRole(EHuman.FollowNpc, Role.playerId, followIndex);
    
    if followNpc ~= nil then
      followNpc:SetIsDead(isDead);
    end
  end
  
  if UI.IsVisible(UITeam) then
    UITeam.UpdateFollowNpc();
  end
end

--[[ 跟隨武將下野
S:019-007 <跟隨武將下野> <<+索引(1) +是否(1)>>
]]--
protocolTable[19][7] = function(data)
  while data.length > 0 do
    local followIndex = data:ReadByte();
    local isRetire = data:ReadBoolean();
    local followNpc = Role.GetRole(EHuman.FollowNpc, Role.playerId, followIndex);
    
    if followNpc ~= nil then
      followNpc.data.isRetire = isRetire;
    end
  end
  
  if UI.IsVisible(UITeam) then
    UITeam.UpdateFollowNpc();
  end
end

--[[ 事件
C:020 <事件觸發> +觸發種類(1) +索引(2)
C:020-006 <事件下一步>
C:020-009 <事件選擇> +選擇碼(1)
]]--
protocolTable[20] = {}

--[[ 一般事件
S:020-001~006 <一般事件> +結果(1) +群組編號(2) +執行順序(1) +結果型態(1) +種類(1) +名稱(2) +屬性(1) +參數(4) +參數(2)
]]--
protocolTable[20][1] = EventManager.ReceiveCommonEvent;
protocolTable[20][2] = EventManager.ReceiveCommonEvent;
protocolTable[20][3] = EventManager.ReceiveCommonEvent;
protocolTable[20][4] = EventManager.ReceiveCommonEvent;
protocolTable[20][5] = EventManager.ReceiveCommonEvent;
protocolTable[20][6] = EventManager.ReceiveCommonEvent;
               
--[[ 事件換場景
S:020-007 <事件換場景>
]]--
protocolTable[20][7] = function(data)
  EventManager.ReceiveChangeSceneEvent();
end

--[[ 事件結束
S:020-008 <事件結束>
]]--
protocolTable[20][8] = function(data)
  EventManager.ReceiveEndEvent(data:ReadByte());
end

--[[ 事件戰鬥,介面
S:020-009 <事件戰鬥,介面>
]]--
protocolTable[20][9] = function(data)
  EventManager.SetBattle(true);
  EventManager.SetSession(false);
end

--[[ 事件物品,人物屬性,技能Lv增減,系統,軍團屬性
S:020-010 <事件物品,人物屬性,技能Lv增減,系統,軍團屬性>
]]--
protocolTable[20][10] = function(data)
  EventManager.SetConduct(true);
  EventManager.SetSession(false);
end

--[[ 事件換圖序/表情動作
S:020-011 <事件換圖序/表情動作>
]]--
protocolTable[20][11] = function(data)
  EventManager.SetConduct(true);
  EventManager.SetSession(false);
end

--[[ 怪物碰撞
S:020-012 <怪物碰撞>
]]--
protocolTable[20][12] = function(data)
  --EventManage.DoingEvent := True;
  EventManager.SetSession(true);
end

--[[ 事件標記
S:020-013 <事件標記>
]]--
protocolTable[20][13] = function(data)
  EventManager.SetSession(false);
  EventManager.SetConduct(true);
end

--[[ 事件武將加入/離開
S:020-014 <事件武將加入/離開>
]]--
protocolTable[20][14] = function(data)
  EventManager.SetSession(false);
  EventManager.SetConduct(true);
end

--[[ 事件金錢
S:020-015 <事件金錢>
]]--
protocolTable[20][15] = function(data)
  EventManager.SetSession(false);
  EventManager.SetConduct(true);
end

--[[ 事件npc隱形
S:020-016 <事件npc隱形>
]]--
protocolTable[20][16] = function(data)
  EventManager.SetSession(false);
  EventManager.SetConduct(true);
end

--[[ 事件問問題
S:020-017 <事件問問題>
]]--
protocolTable[20][17] = function(data)
  EventManager.SetSession(false);
  EventManager.SetConduct(true);
end
               
--[[ 提示NPC為EveStopNpc
S:020-018 <提示NPC為EveStopNpc>
]]--
protocolTable[20][18] = function(data)
  ShowCenterMessage(string.Get(30066), 2);
end
               
--[[ 事件儲值成功
S:020-019 <事件儲值成功> +點數(2)
]]--
protocolTable[20][19] = function(data)
  AudioManager.PlayOnce("AudioClip_WA0014", 0);
  ShowCenterMessage(tostring(data:ReadUInt16())..string.Get(40367)..string.Get(30069), 2);
end

--[[ 活動時間訊息
S:020-020 <活動時間訊息>
]]--
protocolTable[20][20] = function(data)
  if Contains(EventManager.currentContext.triggerKind, EEventTrigger.ClickDoor, EEventTrigger.MeetDoor) then
    if EventManager.currentContext.triggerID == 8 then
      --比武擂台
      ShowCenterMessage(string.Get(30155), 2);
    end
    return;
  end
  
  if Role.mapNpcs[EventManager.currentContext.triggerID].npcId == 15162 then
    --擂台
    ShowCenterMessage(string.Get(30155), 2)
  elseif EventManager.currentContext.triggerID == 4 then
    --團p
    ShowCenterMessage(string.Get(30116), 2)
  elseif EventManager.currentContext.triggerID == 3 then
    --亂鬥
    ShowCenterMessage(string.Get(30154), 2)
  elseif EventManager.currentContext.triggerID == 5 then
    --挑戰賽
    ShowCenterMessage(string.Get(30156), 2)
  elseif EventManager.currentContext.triggerID == 14 then
    --兌換獎品
    ShowCenterMessage(string.Get(30159), 2);
  end  
end
               
--[[ 團p活動訊息
S:020-021 <團p活動訊息>
]]--
protocolTable[20][21] = function(data)
  ShowCenterMessage(string.Get(30116), 2);
end
               
--[[ 獲得屬性點數訊息
S:020-022 <獲得屬性點數訊息> +點數(1)
]]--
protocolTable[20][22] = function(data)
  AudioManager.PlayOnce("AudioClip_WA0014", 0);
  ShowCenterMessage(string.Get(30075)..tostring(data:ReadByte())..string.Get(30077), 2);
end

--[[ 獲得技能點數訊息
S:020-023 <獲得技能點數訊息> +點數(1)
]]--
protocolTable[20][23] = function(data)
  AudioManager.PlayOnce("AudioClip_WA0014", 0);
  ShowCenterMessage(string.Get(30076)..tostring(data:ReadByte())..string.Get(30077), 2);
end
               
--[[ 尋找惡魔巴豆妖活動訊息
S:020-024 <尋找惡魔巴豆妖活動訊息>
]]--
protocolTable[20][24] = function(data)
  ShowCenterMessage(string.Get(30093), 2);
end
               
--[[ 尋找惡魔巴豆妖活動訊息
S:020-025 <尋找惡魔巴豆妖活動訊息>
]]--
protocolTable[20][25] = function(data)
  ShowCenterMessage(string.Get(30094), 2);
end

--[[ 尋找惡魔巴豆妖名次訊息
S:020-026 <尋找惡魔巴豆妖名次訊息> +名次(1) +玩家ID(8) +L(1) +名字(L)
]]--
protocolTable[20][26] = function(data)
  local rank = data:ReadByte();
  local roleId = data:ReadInt64();
  local message = string.Get(30095)..string.Get(30096)..tostring(rank)..string.Get(30097)..data:ReadString(data:ReadByte());

  Chat.AddMessage(EChannel.System, message);
  ShowMarqueeMessage(message);
  
  if roleId == Role.playerId then
    ShowCenterMessage(string.Get(30098)..string.Get(30096)..tostring(rank)..string.Get(30097), 2);
  end
end

--[[ 尋找惡魔巴豆妖錯誤訊息
S:020-027 <尋找惡魔巴豆妖錯誤訊息>
]]--
protocolTable[20][27] = function(data)
  ShowCenterMessage(string.Get(30099), 2);
end
               
--[[ 尋找惡魔巴豆妖結束訊息
S:020-028 <尋找惡魔巴豆妖結束訊息>
]]--
protocolTable[20][28] = function(data)
  Chat.AddMessage(EChannel.System, string.Get(30100));
  ShowMarqueeMessage(string.Get(30100));
end
               
--[[ 尋找惡魔巴豆妖開始訊息
S:020-029 <尋找惡魔巴豆妖開始訊息>
]]--
protocolTable[20][29] = function(data)
  Chat.AddMessage(EChannel.System, string.Get(30101));
  ShowMarqueeMessage(string.Get(30101));
end
               
--[[ 聖誕節活動訊息
S:020-030 <聖誕節活動訊息>
]]--
protocolTable[20][30] = function(data)
  ShowCenterMessage(string.Get(30107), 2);
end

--[[ 尋找惡魔巴豆妖訊息
S:020-031 <尋找惡魔巴豆妖訊息>
]]--
protocolTable[20][31] = function(data)
  local count = data:ReadByte();

  local message = string.Get(30108);
  logError("20-31 count "..tostring(count));
  for i = 1, count do
    message = message..string.Get(30096)..tostring(i)..string.Get(30097).." ";
  end

  message = message..string.Get(30109);
  
  Chat.AddMessage(EChannel.System, message);
  ShowMarqueeMessage(message);
end
               
--[[ 擂台賽錯誤訊息
S:020-032 <擂台賽錯誤訊息>
]]--
protocolTable[20][32] = function(data)
  ShowCenterMessage(string.Get(30110), 2);
end
               
--[[ 新年活動開關
S:020-033 <新年活動開關> +開關(1)
]]--
protocolTable[20][33] = function(data)               
  EventManager.inNewYearEvent = data:ReadBoolean();
end

--[[ 換場違規訊息
S:020-034 <換場違規訊息>
]]--
protocolTable[20][34] = function(data)
  local from = data:ReadUInt16();
  local to = data:ReadUInt16();

  logError("Invalid Change Scene From : "..from.." To : "..to);
end

--[[ 元宵節錯誤訊息
S:020-035 <元宵節錯誤訊息>
]]--
protocolTable[20][35] = function(data)
  ShowCenterMessage(string.Get(30117), 2);
end
               
--[[ 元宵節活動訊息
S:020-036 <元宵節活動訊息> +種類(1)
]]--
protocolTable[20][36] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    Chat.AddMessage(EChannel.System, string.Get(30118));
    ShowMarqueeMessage(string.Get(30118));
  elseif kind == 2 then
    Chat.AddMessage(EChannel.System, string.Get(30119));
    ShowMarqueeMessage(string.Get(30119));
  end
end

--[[ 情人節送花訊息
S:020-037 <情人節送花訊息>
]]--
protocolTable[20][37] = function(data)
  ShowCenterMessage(string.Get(30122), 2);
end
               
--[[ 情人節活動訊息
S:020-038 <情人節活動訊息> +種類(1)
]]--
protocolTable[20][38] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    Chat.AddMessage(EChannel.System, string.Get(30123));
    ShowMarqueeMessage(string.Get(30123));
  elseif kind == 2 then
    Chat.AddMessage(EChannel.System, string.Get(30124));
    ShowMarqueeMessage(string.Get(30124));
  elseif kind == 3 then
    ShowCenterMessage(string.Get(90032), 2);
  end
end

--[[ 不知道啥活動訊息
S:020-039 <不知道啥活動訊息>
]]--
protocolTable[20][39] = function(data)
  ShowCenterMessage(string.Get(30125), 2);
end
               
--[[ 擂台賽活動訊息
S:020-040 <擂台賽活動訊息> +種類(1)
]]--
protocolTable[20][40] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    Chat.AddMessage(EChannel.System, string.Get(30126));
    ShowMarqueeMessage(string.Get(30126));
  elseif kind == 2 then
    Chat.AddMessage(EChannel.System, string.Get(30127));
    ShowMarqueeMessage(string.Get(30127));
  end
end
               
--[[ 搶救二喬活動訊息
S:020-041 <搶救二喬動訊息> +種類(1)
]]--
protocolTable[20][41] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    ShowCenterMessage(string.Get(30149));
  elseif kind == 2 then
    Chat.AddMessage(EChannel.System, string.Get(30150));
    ShowMarqueeMessage(string.Get(30150));
  elseif kind == 3 then
    Chat.AddMessage(EChannel.System, string.Get(30151));
    ShowMarqueeMessage(string.Get(30151));
  end
end

--[[ 事件訊息
S:020-042 <事件訊息> +種類(1)
  種類 1:玩家Exp上升 +上升值(4)
  種類 2:報名Hinet活動訊息 +種類(1)
  種類 3:取消Hinet活動訊息 +種類(1)
  種類 4:玩家陣營值變化+陣營ID(2) + 值(4)  
]]--
protocolTable[20][42] = function(data)
  local kind = data:ReadByte();
  
  if kind == 1 then
    ShowCenterMessage(string.Get(30164)..tostring(data:ReadInt32())..string.Get(20562), 2);
    --Player.SetUpEffect('ExpUP',0);
  elseif kind == 2 then
    local messageKind = data:ReadByte();

    if messageKind == 0 then
      ShowCenterMessage(string.Get(80017)..string.Get(80011), 2);
    elseif messageKind == 1 then
      ShowCenterMessage(string.Get(80014), 2);
    elseif messageKind == 2 then
      ShowCenterMessage(string.Get(80015), 2);
    elseif messageKind == 3 then
      ShowCenterMessage(string.Get(80017)..string.Get(80012), 2);
    elseif messageKind == 4 then
      ShowCenterMessage(string.Get(80017)..string.Get(80012), 2);
    elseif messageKind == 5 then
      ShowCenterMessage(string.Get(80020), 2);
    else
      ShowCenterMessage(string.Get(80017)..string.Get(80012), 2);
    end
  elseif kind == 3 then
    local messageKind = data:ReadByte();

    if messageKind == 0 then
      ShowCenterMessage(string.Get(80018)..string.Get(80011), 2);
    elseif messageKind == 1 then
      ShowCenterMessage(string.Get(80016), 2);
    elseif messageKind == 2 then
      ShowCenterMessage(string.Get(80015), 2);
    elseif messageKind == 3 then
      ShowCenterMessage(string.Get(80019), 2);
    elseif messageKind == 4 then
      ShowCenterMessage(string.Get(80020), 2);
    else
      ShowCenterMessage(string.Get(80018)..string.Get(80012), 2);
    end
  elseif kind == 4 then
    local id = data:ReadUInt16();
    local quant = data:ReadInt32();
    
    if quant > 0 then
      ShowCenterMessage(string.GetMoral(id)..string.Get(21120)..string.Get(71090)..quant);
    else
      ShowCenterMessage(string.GetMoral(id)..string.Get(21120)..string.Get(30035)..math.abs(quant));
    end
  end
end

--[[ Hinet活動訊息
S:020-043 <Hinet活動訊息>
]]--
protocolTable[20][43] = function(data)
  ShowCenterMessage(string.Get(30178), 2);
end
               
--[[ 玩家等待動畫
S:020-044 <玩家等待動畫> +玩家ID(8) +種類(1)
]]--
protocolTable[20][44] = function(data)
  local roleId = data:ReadInt64();

  if Role.players[roleId] == nil then return end

  local kind = data:ReadByte();

  if kind == 1 then
    --Role.players[roleId]:SetWaitEvent;
  elseif kind == 2 then
    --Role.players[roleId]:StopWaitEvent;
  end
end

--[[ 七夕活動訊息
S:020-045 <七夕活動訊息>
]]--
protocolTable[20][45] = function(data)
  ShowCenterMessage(string.Get(80049), 2);
end
               
--[[ 中秋節活動訊息
S:020-046 <中秋節活動訊息> +種類(1)
]]--
protocolTable[20][46] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    Chat.AddMessage(EChannel.System, string.Get(80063));
    ShowMarqueeMessage(string.Get(80063));
  elseif kind == 2 then
    Chat.AddMessage(EChannel.System, string.Get(80064));
    ShowMarqueeMessage(string.Get(80064));
  elseif kind == 3 then
    ShowCenterMessage(string.Get(80062));
  end
end

--[[ 機制問答活動訊息
S:020-047 <機制問答活動訊息> +種類(1)
]]--
protocolTable[20][47] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    Chat.AddMessage(EChannel.System, string.Get(60070));
    ShowMarqueeMessage(string.Get(60070));
  elseif kind == 2 then
    Chat.AddMessage(EChannel.System, string.Get(60071));
    ShowMarqueeMessage(string.Get(60071));
  elseif kind == 3 then
    ShowCenterMessage(string.Get(60072));
  elseif kind == 4 then
    ShowCenterMessage(string.Get(60065));
  end
end

--[[ 武將學習特殊技訊息
S:020-048 <武將學習特殊技訊息> +種類(1)
]]--
protocolTable[20][48] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    ShowCenterMessage(string.Get(90042), 2);
  elseif kind == 2 then
    ShowCenterMessage(string.Get(90043), 2);
  elseif kind == 3 then
    ShowCenterMessage(string.Get(90044), 2);
  end
end

--[[ 武將學習特殊技
S:020-049 <武將學習特殊技> +武將索引(1)
]]--
protocolTable[20][49] = function(data)
  local followIndex = data:ReadByte();  
  local followNpc = Role.GetRole(EHuman.FollowNpc, Role.playerId, followIndex);
  
  if followNpc == nil then return end

  followNpc.data.specialSkillLearned = true;

  if npcDatas[followNpc.npcId] == nil then return end
  if skillDatas[npcDatas[followNpc.npcId].specialSkill] == nil then return end

  ShowCenterMessage(followNpc.name..string.Get(90046)..skillDatas[npcDatas[followNpc.npcId].specialSkill].name, 2);
end

--[[ 端午活動訊息
S:020-050 <端午活動訊息> +種類(1)
]]--
protocolTable[20][50] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    ShowCenterMessage(string.Get(90052), 2);
  elseif kind == 2 then
    ShowCenterMessage(string.Get(90051), 2);
  elseif kind == 3 then
    Chat.AddMessage(EChannel.System, string.Get(90060));
    ShowMarqueeMessage(string.Get(90060));
  elseif kind == 4 then
    Chat.AddMessage(EChannel.System, string.Get(90061));
    ShowMarqueeMessage(string.Get(90061));
  elseif kind == 5 then
    ShowCenterMessage(string.Get(71253), 2);
  end
end

--[[ 活動訊息
S:020-051 <活動訊息> +種類(1)
]]--
protocolTable[20][51] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    ShowCenterMessage(string.Get(90062), 2);
  elseif kind == 2 then
    ShowCenterMessage(string.Get(90063), 2);
  elseif kind == 3 then
    Chat.AddMessage(EChannel.System, string.Get(90064));
  elseif kind == 4 then
    Chat.AddMessage(EChannel.System, string.Get(90065));
  elseif kind == 5 then
    Chat.AddMessage(EChannel.System, string.Get(90062));
  elseif kind == 6 then
    Chat.AddMessage(EChannel.System, string.Get(90063));
  end
end

--[[ 更新週數
S:020-052 <更新週數> +週數(1)
]]--
protocolTable[20][52] = function(data)
  EventManager.weekNum = data:ReadByte();
end

--[[ 烤肉
S:020-053 <烤肉> +種類(1)
  種類 1:開始烤肉
  種類 2:結束烤肉
]]--
protocolTable[20][53] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    --Player.RevBBQ(Data);
  elseif kind == 2 then
    --Player.DisBBQ;
  end
end

--[[ 時間標記
S:020-054 <時間標記> +種類(1)
  種類 1:設定時間標記 +任務ID(2) +剩餘毫秒(4)
  種類 2:釋放時間標記 +任務ID(4)
  種類 3:設定時間結束 +索引(1)
  種類 4:設定限時任務 +任務ID(2) +剩餘分鐘(2)
  種類 5:設定剩餘時間 +索引(1) +剩餘分鐘(1)
]]--
protocolTable[20][54] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    --設定時間標記
    MarkManager.AddTimeMission(data:ReadUInt16(), math.floor(data:ReadInt32() / 60000));
  elseif kind == 2 then
    --釋放時間標記
    MarkManager.RemoveTimeMission(data:ReadInt32());
  elseif kind == 3 then
    --設定時間結束
    MarkManager.SetTimeMission(data:ReadByte(), 0);
  elseif kind == 4 then
    --設定限時任務
    MarkManager.AddTimeMission(data:ReadUInt16(), data:ReadUInt16());
  elseif kind == 5 then
    --設定剩餘時間
    MarkManager.SetTimeMission(data:ReadByte(), data:ReadUInt16());
  end
end

--[[ 仙鬥擂台訊息
S:020-055 <仙鬥擂台訊息>
]]--
protocolTable[20][55] = function(data)
  ShowCenterMessage(string.Get(80094), 2);
end

--[[ 開始修行
S:020-056 <開始修行> +種類(1)
  種類 1:伐木
  種類 2:搗藥
  種類 3:結束修行
]]--
protocolTable[20][56] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    --Player.RevCuttingWood(Data);
  elseif kind == 2 then
    --Player.RevPharmacy(Data);
  elseif kind == 3 then
    --Player.DisPractice;
  end
end

--[[ 不知道啥活動訊息
S:020-057 <不知道啥活動訊息> +種類(1)
]]--
protocolTable[20][57] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    ShowCenterMessage(string.Get(71278), 2);
  elseif kind == 2 then
    ShowCenterMessage(string.Get(60065), 2);
  end
end

--[[ 完成任務獎勵
S:20-100 <完成任務獎勵> +任務標記(2) +獎勵數量(4) <<+獎勵種類(4) +ID(2) +數量(4)>>
  獎勵種類 1:道具 2:金幣 3:經驗值 4:陣營值 5:武將 6:技能 7:屬性點數 8:技能點數 9:元寶 10:武將碎片 11:技能碎片
]]--
protocolTable[20][100] = function(data)
  local missionId = data:ReadUInt16();

  if markDatas[missionId] == nil then return end

  local message = string.Get(20516)..string.AddBrackets(markDatas[missionId].name)..string.Get(20046);
  local count = data:ReadInt32();
  for i = 1, count do
    local kind = data:ReadInt32();
    local id = data:ReadUInt16();
    local quant = data:ReadInt32();

    if kind == 1 then
      message = message.."\n "..itemDatas[id]:GetName(true, true).."* "..quant;
    elseif kind == 2 then
      message = message.."\n "..string.AddBrackets(string.GetCurrencyName(ECurrency.Money))..""..quant;
    elseif kind == 3 then
      local role = Role.GetRole(EHuman.FollowNpc, Role.playerId, id);
      local name = "";
      if role ~= nil then
        name = role.name;
      end
      message = message.."\n "..string.AddBrackets(string.Get(20035))..string.format(string.Get(40476), name, quant);
    elseif kind == 4 then
      if quant > 0 then
        message = message.."\n "..string.AddBrackets(string.GetMoral(id))..string.Get(50312)..string.Get(71090)..quant;
      else
        message = message.."\n "..string.AddBrackets(string.GetMoral(id))..string.Get(50312)..string.Get(30035)..math.abs(quant);
      end
    elseif kind == 5 then
      message = message.."\n "..string.AddBrackets(string.Get(10403))..npcDatas[id].name;
    elseif kind == 6 then
      message = message.."\n "..string.AddBrackets(string.Get(20869))..skillDatas[id].name;
    elseif kind == 7 then
      message = message.."\n "..string.AddBrackets(string.Get(21270)).."* "..quant;
    elseif kind == 8 then
      message = message.."\n "..string.AddBrackets(string.Get(21271)).."* "..quant;
    elseif kind == 9 then
      message = message.."\n "..string.AddBrackets(string.Get(10097)).."* "..quant;
    elseif kind == 10 then
      message = message.."\n "..string.AddBrackets(string.Get(21267)).."* "..quant;
    elseif kind == 11 then
      message = message.."\n "..string.AddBrackets(string.Get(21268)).."* "..quant;
    end
  end
  
  UIMiniMap.MissionCompleted();
  Chat.AddMessage(EChannel.System, message);
end

--[[ MapNpc
]]--
protocolTable[22] = {}

--[[ MapNpc圖序
S:022-001 <MapNpc圖序> +索引(2) +圖序(1)
]]--
protocolTable[22][1] = function(data)
  local index = data:ReadUInt16();

  if Role.mapNpcs[index] == nil then return end

  Role.mapNpcs[index]:SetAnimationForceFrame(data:ReadByte());
end

--[[ MapNpc移動
S:022-002 <MapNpc移動> +索引(2) +座標X(2) +座標Y(2) 
]]--
protocolTable[22][2] = function(data)
  local index = data:ReadUInt16();

  if Role.mapNpcs[index] == nil then return end

  Role.mapNpcs[index]:SetVisible(ERoleVisible.Visible);
  Role.mapNpcs[index]:Move(Vector2.New(data:ReadUInt16(), data:ReadUInt16()), nil, true);
end

--[[ MapNpc隱形
S:022-003 <MapNpc隱形> +索引(2) +消失時間(2)
]]--
protocolTable[22][3] = function(data)
  local index = data:ReadUInt16();
  
  if Role.mapNpcs[index] == nil then return end

  Role.mapNpcs[index]:SetVisible(ERoleVisible.Hide, data:ReadUInt16());
end

--[[ MapNpc初始化
S:022-004 <MapNpc初始化> +數量(2) <<+索引(2) +圖序(1) +戰鬥類型(1) +位置x(2) +位置y(2) +顯示種類(1) +隱藏時間(4)>>
]]--
protocolTable[22][4] = function(data)
  local count = data:ReadUInt16();
  for i = 1, count do
    local index = data:ReadUInt16();
    local anim = data:ReadByte();
    local war = data:ReadByte();
    local x = data:ReadUInt16();
    local y = data:ReadUInt16();
    local kind = data:ReadByte();
    local time = data:ReadUInt32();
    if Role.mapNpcs[index] ~= nil then
      Role.mapNpcs[index]:SetAnimationForceFrame(anim);
      Role.mapNpcs[index]:SetWar(war);
      Role.mapNpcs[index]:SetPosition(Vector2.New(x, y));
      Role.mapNpcs[index]:SetVisible(kind, time);
    end
  end

  MarkManager.ContinueNavigation();
end

--[[ MapNpc瞬移
S:022-005 <MapNpc瞬移> +索引(2) +座標X(2) +座標Y(2) 
]]--
protocolTable[22][5] = function(data)
  local index = data:ReadUInt16();

  if Role.mapNpcs[index] == nil then return end
  
  Role.mapNpcs[index]:Teleport(Vector2.New(data:ReadUInt16(), data:ReadUInt16()));
end

--[[ MapNpc是否顯示
S:022-006 <MapNpc是否顯示> +索引(2) +顯示種類(1)
]]--
protocolTable[22][6] = function(data)
  local index = data:ReadUInt16();

  if Role.mapNpcs[index] == nil then return end

  Role.mapNpcs[index]:SetVisible(data:ReadByte());
end

--[[ MapNpc做表情
S:022-007 <MapNpc做表情> +索引(2) +表情(1)
]]--
protocolTable[22][7] = function(data)
  local index = data:ReadUInt16();

  if Role.mapNpcs[index] == nil then return end

  Role.mapNpcs[index]:PlayEmoji(data:ReadByte() + 100);
end

--[[ MapNpc做動作
S:022-008 <MapNpc做動作> +索引(2) +動作(1)
]]--
protocolTable[22][8] = function(data)
  local index = data:ReadUInt16();
  local action = data:ReadByte();

  if Role.mapNpcs[index] == nil then return end

  Role.mapNpcs[index]:SetAnimationForceId(action);
end

--[[ ANPC對著BNPC做動作
S:022-009 <ANPC對著BNPC做動作> +索引A(2) +動作(1) +索引B(2)
]]--
protocolTable[22][9] = function(data)
  local indexA = data:ReadUInt16();
  local action = data:ReadByte();
  local indexB = data:ReadUInt16();

  if Role.mapNpcs[indexA] == nil then return end
  if Role.mapNpcs[indexB] == nil then return end
  if not Role.mapNpcs[indexA]:CheckAction(action) then return end

  Role.mapNpcs[indexA]:FaceTo(Role.mapNpcs[indexB]);
  Role.mapNpcs[indexA]:SetAnimationForceId(action);
end

--[[ MapNpc移動
S:022-010 <MapNpc移動> +索引(2) +座標X(2) +座標Y(2)
]]--
protocolTable[22][10] = function(data)
  local index = data:ReadUInt16();

  if Role.mapNpcs[index] == nil then return end

  Role.mapNpcs[index]:Move(Vector2.New(data:ReadUInt16(), data:ReadUInt16()), nil, true);
  --不知道跟一般移動有什麼不一樣 Alfie
  --MapNpc[aIdx].AssignMove( FConnect.CharToWord(Copy(Data, 4, 2)), FConnect.CharToWord(Copy(Data, 6, 2)) );
end

--[[ 物品
C:023-002 <拾取場景物品> +索引(1)
C:023-003 <丟棄背包物品> +背包索引(2) +數量(4)
C:023-010 <移動背包物品> +原始背包索引(2) +數量(4) +目標背包索引(2)
C:023-011 <穿上玩家裝備> +背包索引(2)
C:023-012 <卸下玩家裝備> +裝備位置(1) +背包索引(2)
C:023-013 <丟棄玩家裝備> +背包索引(1)
C:023-014 <合成物品> <<+背包索引(2) +數量(4)>>*3 +合成種類(1)
  合成種類 1:合成 2:精煉 3:鑲嵌
C:023-015 <使用物品> +批次使用數量(1) +背包索引(2) +數量(4) +武將索引(1) +使用種類(1)
C:023-016 <丟棄金錢> +數量(4)
C:023-017 <穿上武將裝備> +武將索引(1) +背包索引(2)
C:023-018 <卸下武將裝備> +武將索引(1) +裝備位置(1) +背包索引(2)
C:023-019 <丟棄武將裝備> +武將索引(1) +裝備位置(1)
C:023-020 <對他人使用物品或技能> +熱鍵種類(1) +熱鍵ID(2) +對象種類(1) +對象索引(1) +對象玩家ID(8)
C:023-030 <開始擺攤> +L(1) +攤販名稱(L) +商品數量(1) <<+背包索引(1) +價格(4)>>
C:023-031 <結束擺攤>
C:023-032 <訪問擺攤> +玩家ID(8)
C:023-033 <購買擺攤> +玩家ID(8) +商品索引(1) +購買數量(1)
C:023-034 <城池寶庫存物品> <<+索引(1)>>
C:023-035 <城池寶庫領物品> <<+索引(1)>>
C:023-036 <巴豆背包存物品> <<+索引(1)>>
C:023-037 <巴豆背包領物品> <<+索引(1)>>
C:023-038 <變換髮色 or 膚色> +背包索引(2) +顏色R(1) +顏色G(1) +顏色B(1)
C:023-039 <儲值卡> +L(1) +卡號(L) +L(1) +密碼(L) +金額(4)
C:023-045 <魔豆已爬上豆苗>
C:023-046 <第一次轉生> +頭型(1) +調色盤1(4) +調色盤5(4)
C:023-047 <變換頭型> +背包索引(2) +頭型(1)
C:023-048 <取消蜜蜂丸>
C:023-049 <開啟寶物介面>
C:023-050 <購買寶物> +索引(1) +寶物ID(2) +點數(4)
C:023-051 <巴豆背包存物品> <<+索引(1)>>
C:023-052 <巴豆背包領物品> <<+索引(1)>>
C:023-053 <取消烤肉>
C:023-054 <第二次轉生> +頭型(1) +調色盤1(4) +調色盤5(4) +職業(1)
C:023-055 <開始戳戳樂>
C:023-056 <結束戳戳樂>
C:023-057 <水戰吃寶> +索引(1)
C:023-058 <水戰穿上裝備> +索引(1)
C:023-059 <水戰卸下裝備> +索引(1)
C:023-060 <開始轉蛋>
C:023-073 <記憶傳送符> +kind(1) +傳送索引(1) 1:使用 2:記憶
C:023-075 <屬性轉換符> +背包索引(2) +屬性(1)
C:023-076 <職業轉換符> +背包索引(2) +職業(1)
C:023-077 <暫時交易符> +背包索引(1) +目標索引(1)
C:023-078 <靈石強化> +靈石背包索引(2) +裝備背包索引(2) +符背包索引(2)
C:023-079 <裝備修理> +裝備背包索引(2) +羽毛背包索引(2) +羽毛數量(2)
C:023-080 <神煉化> +石頭種類(1) +背包索引(1)
C:023-081 <第三次轉生> +頭型(1) +調色盤1(4) +調色盤5(4) +職業(1)
C:023-082 <隨身背包存物品> <<+索引(1)>>
C:023-083 <隨身背包領物品> <<+索引(1)>>
C:023-084 <禮物箱領物品> <<+索引(1)>>
C:023-085 <時裝強化> +背包索引(1) +背包索引(1) +背包索引(1)
C:023-086 <天官強化> +符背包索引(2) +裝備背包索引(2) +祝福背包索引(2)
C:023-087 <物品鎖定> 物品背包總類(1) +物品背包索引(2) +武將索引(1) +鎖定(1)[true:不能刪除 false:可以刪除]
C:023-088 <靈石珍珠消除> +背包索引(2) +消除令背包索引(2)
C:023-089 <鑰匙開啟寶箱功能> +寶箱背包索引(2) +鑰匙背包索引(2) +開啟數量(2)
C:023-090 <物品進化功能> +進化物品ID(2) +材料1背包索引(2) +材料2背包索引(2) +機率背包索引(2) +防爆背包索引(2)
C:023-091 <專武強化> +功能(1) +專武背包索引(2) +專武材料背包索引(2)
C:023-092 <升階功能> 背包索引(1) +L(1) +<<背包索引(2)>> +卷軸背包索引(2) +符背包索引(2)
C:023-093 <洗鍊功能> 背包索引(2) +符背包索引(2) + indx(1)
C:023-094 <洗鍊決定> +是否洗鍊(1) 1:確定洗鍊  + 背包索引(2) + indx(1) + 表的Indx(1)
C:023-095 <時裝進化>  +材料1背包索引(2) +材料2背包索引(2) +機率背包索引(2)
C:023-124 <穿顯示時裝外觀>+ 收集冊ID(2) + 部位索引(1)
C:023-125 <脫顯示時裝外觀>+ 部位索引(1)
C:023-126 <從背包直接穿顯示時裝外觀>+ 收集冊ID(2) + 部位索引(1)
C:023-127 <收藏策一鍵穿顯示時裝外觀>+ 收集冊ID(2)
]]--
--物品
protocolTable[23] = {}

--[[ 刪除場景物品
S:023-002 <刪除場景物品> +索引(2) +是我丟的(1)
]]--
protocolTable[23][2] = function(data)
  GdThingManager.RemoveThing(data:ReadUInt16(), data:ReadBoolean());
end

--[[ 新增場景物品
S:023-003 <新增場景物品> +物品編號(2) +座標x(2) +座標y(2) +是我丟的(1) +可撿玩家ID(8)
]]--
protocolTable[23][3] = function(data)
  local itemId = data:ReadUInt16();
  local x = data:ReadUInt16();
  local y = data:ReadUInt16();
  local isMe = 0;
  local canPickId = 0;

  if data.length > 0 then
    isMe = data:ReadByte();

    if isMe == 4 then
      canPickId = data:ReadInt64();
    end
  end

  GdThingManager.AddThing(EGdThing.Item, nil, itemId, x, y, isMe, canPickId);
end

--[[ 所有場景物品
S:023-004 <所有場景物品> <<+種類(1) +索引(2) +物品ID(4) +座標x(2) +座標y(2)>>
]]--
protocolTable[23][4] = function(data)
  while data.length > 0 do
    GdThingManager.AddThing(data:ReadByte(), data:ReadUInt16(), data:ReadInt32(), data:ReadInt16(), data:ReadInt16());
  end
end

--[[ 背包所有物品
S:023-005 <背包所有物品> 是否獲得新物品(1)[0.否 1.是]+數量(2) <<+索引(2) +物品資料(18)>>
]]--
protocolTable[23][5] = function(data)
  local refresh = data:ReadByte();
  local count = data:ReadUInt16();

  for i = 1, count do
    Item.SetBagItem(EThings.Bag, data:ReadUInt16(), ThingData.New(data), false);
  end

  Mounts.OnGetItem();
  
  if refresh == 1 then
    Item.UpdateUI(EThings.Bag, 0, true);
  end
end

--[[ 背包設定物品
S:023-008 <背包設定物品> +索引(2) +物品資料(18) +顯示訊息(1)
]]--
protocolTable[23][8] = function(data)
  Item.SetBagItem(EThings.Bag, data:ReadUInt16(), ThingData.New(data), true, 0, data:ReadBoolean());
end

--[[ 背包減少物品
S:023-009 <背包減少物品> +索引(2) +數量(4)
]]--
protocolTable[23][9] = function(data)
  Item.DelBagItem(EThings.Bag, data:ReadUInt16(), data:ReadInt32());
end

--[[ 背包移動物品
S:023-010 <背包移動物品> ＋原始索引(2) +數量(4) +目標索引(2)
]]--
protocolTable[23][10] = function(data)
  Item.MoveBagItem(data:ReadUInt16(), data:ReadInt32(), data:ReadUInt16());
end

--[[ 所有裝備
S:023-011 <所有裝備> +數量(1) <<+物品資料(18)>>
]]--
protocolTable[23][11] = function(data)
  local count = data:ReadByte();  
  for i = 1, count do
    local itemSave = ThingData.New(data);

    Item.SetBagItem(EThings.Equip, itemDatas[itemSave.Id].fitType, itemSave, false);
  end
end

--[[ 刪除裝備
S:023-012 <刪除裝備> +裝備部位(1) +背包索引(1)
]]--
protocolTable[23][12] = function(data)
  Item.DelBagItem(EThings.Equip, data:ReadByte());
end

--[[ 合成物品
S:023-013 <合成物品> +物品ID(2) +數量(4) +背包索引(2)
]]--
protocolTable[23][13] = function(data)
  while data.length > 0 do
    local itemId = data:ReadUInt16();
    local quant = data:ReadInt32();
    local bagIndex = data:ReadUInt16();
    local sec = 2;

    if UI.IsVisible(UIBag) then
      UIBag.SetBlink(bagIndex, sec);
    end

    if UI.IsVisible(UICompound) then
      UICompound.StartMixEffect(ECompoundEffect.Compound, bagIndex);
    end

    CGTimer.DoFunctionDelay(sec,
      function()
        local itemString = string.format(string.Get(21179), itemDatas[itemId]:GetName(true), quant);
        ShowCenterMessage(itemString);
        Chat.AddMessage(EChannel.System, itemString);
      end
    );
  end
end

--[[ 使用物品成功
S:023-015 <使用物品成功> 物品ID(2) +物品數量(4) +是否顯示(1)[0.不顯示 1.顯示]
]]--
protocolTable[23][15] = function(data)
  AudioManager.PlayOnce("AudioClip_WA0014", 0);
  local itemId = data:ReadUInt16();
  local count = data:ReadInt32();
  local showMessage = data:ReadBoolean();
  local itemData = itemDatas[itemId];

  if showMessage and itemData ~= nil then
    ShowCenterMessage(string.format(string.Get(20060), itemDatas[itemId]:GetName(true)));
  end

  if UI.IsVisible(UIItemInfo) then
    UIItemInfo.UpdateUI();
  end

  if UI.IsVisible(UIHouseFunction) then
    FurnitureManager.SendAskAllFurnitures();
  end
end

--[[ 卸下裝備
S:023-016 <卸下裝備> +裝備部位(1) +背包索引(2)
]]--
protocolTable[23][16] = function(data)
  local fitType = data:ReadByte();
  local bagIndex = data:ReadUInt16();
  
  Item.SetBagItem(EThings.Bag, bagIndex, Item.GetBagItem(EThings.Equip, fitType, 0), true);
  Item.DelBagItem(EThings.Equip, fitType);
end

--[[ 穿上裝備
S:023-017 <穿上裝備> +背包索引(2)
]]--
protocolTable[23][17] = function(data)
  local bagIndex = data:ReadUInt16();
  local bagItem = Item.GetBagItem(EThings.Bag, bagIndex, 0);

  if bagItem == nil then return end

  local equipItem = Item.GetBagItem(EThings.Equip, itemDatas[bagItem.Id].fitType, 0);

  Item.SetBagItem(EThings.Equip, itemDatas[bagItem.Id].fitType, bagItem, true);
  
  if equipItem ~= nil then
    Item.SetBagItem(EThings.Bag, bagIndex, equipItem, true);
  else
    Item.DelBagItem(EThings.Bag, bagIndex);
  end

  if UI.IsVisible(UIItemInfo) then
    UI.Close(UIItemInfo);
  end

  if UI.IsVisible(UIStatus) then
    if Item.IsEquip(itemDatas[bagItem.Id].fitType) then
      UIFrame.SwitchTab(EUIStatusTag.Equip);
    elseif Item.IsStyle(itemDatas[bagItem.Id].fitType) then
      UIFrame.SwitchTab(EUIStatusTag.Style);
    end
  end
end

--[[ 地上丟棄金錢
S:023-018 <地上丟棄金錢> +金額(4) +座標x(2) +座標y(2) +是我丟的(1)
]]--
protocolTable[23][18] = function(data)
  local value = data:ReadInt32();
  local x = data:ReadUInt16();
  local y = data:ReadUInt16();
  local isMe = data.length > 0;

  GdThingManager.AddThing(EGdThing.Money, nil, value, x, y, isMe);
end

--[[ 刪除玩家裝備
S:023-019 <刪除玩家裝備> +索引(1)
]]--
protocolTable[23][19] = function(data)
  Item.DelBagItem(EThings.Equip, data:ReadByte());
end

--[[ 武將所有裝備(已沒在用)
S:023-020 <武將所有裝備>
]]--
protocolTable[23][20] = function(data)
end

--[[ 武將卸下裝備
S:023-021 <武將卸下裝備> +武將索引(1) +裝備部位(1)
]]--
protocolTable[23][21] = function(data)
  local followIndex = data:ReadByte();
  local fitType = data:ReadByte();
  Item.DelBagItem(EThings.Equip, fitType, nil, followIndex);
end

--[[ 武將卸下裝備
S:023-022 <武將卸下裝備到背包> +武將索引(1) +裝備部位(1) +背包索引(2)
]]--
protocolTable[23][22] = function(data)
  local followIndex = data:ReadByte();
  local fitType = data:ReadByte();
  local bagIndex = data:ReadUInt16();

  Item.SetBagItem(EThings.Bag, bagIndex, Item.GetBagItem(EThings.Equip, fitType, followIndex), true);
  Item.DelBagItem(EThings.Equip, fitType, nil, followIndex);
end

--[[ 武將穿上裝備
S:023-023 <武將穿上裝備> +武將索引(1) +背包索引(2)
]]--
protocolTable[23][23] = function(data)
  local followIndex = data:ReadByte();
  local bagIndex = data:ReadUInt16();
  local bagItem = Item.GetBagItem(EThings.Bag, bagIndex, 0);

  if bagItem == nil then return end

  local equipItem = Item.GetBagItem(EThings.Equip, itemDatas[bagItem.Id].fitType, followIndex);

  Item.SetBagItem(EThings.Equip, itemDatas[bagItem.Id].fitType, bagItem, true, followIndex);

  if equipItem ~= nil and equipItem.Id ~= 0 then
    Item.SetBagItem(EThings.Bag, bagIndex, equipItem, true);
  else
    Item.DelBagItem(EThings.Bag, bagIndex);
  end

  if UI.IsVisible(UIItemInfo) then
    UI.Close(UIItemInfo);
  end
end

--[[ 武將穿上裝備
S:023-024 <武將穿上裝備> +武將索引(1) +物品資料(16)
]]--
protocolTable[23][24] = function(data)
  local followIndex = data:ReadByte();
  local itemSave = ThingData.New(data);

  Item.SetBagItem(EThings.Equip, itemDatas[itemSave.Id].fitType, itemSave, true, followIndex);
end

--[[ 拾取場景物品訊息
S:023-25 <拾取場景物品訊息> kind(1) + 0.成功 1.該物品暫時無法撿取 2.距離太遠
]]--
protocolTable[23][25] = function(data)
  GdThing.RevGetThing(data);
end

--[[ 物品限制訊息
S:023-026 <物品限制訊息> +物品ID(2) +種類(1)
]]--
protocolTable[23][26] = function(data)
  local itemId = data:ReadUInt16();

  if itemDatas[itemId] == nil then return end

  local kind = data:ReadByte();

  if kind == 4 then
    ShowCenterMessage(itemDatas[itemId]:GetName(true)..string.Get(40051));
  end
end

--[[ 裝備損壞度
S:023-027 <裝備損壞度> +裝備位置(1) +損壞度(1)
]]--
protocolTable[23][27] = function(data)
  local bagIndex = data:ReadByte();
  local itemSave = Item.GetBagItem(EThings.Equip, bagIndex, 0);

  if itemSave == nil then return end

  itemSave.damage = data:ReadByte();

  if itemDatas[itemSave.Id] == nil then return end
  
  if itemSave.damage == EThingsDurability.Good then
    if Contains(itemSave.Id, 23086, 23087, 23088, 23089, 23135, 23136, 23137, 23138) then
      ShowCenterMessage(itemDatas[itemSave.Id]:GetName(true)..string.Get(40348), 2);
    end
  elseif itemSave.damage == EThingsDurability.Normal then
    ShowCenterMessage(itemDatas[itemSave.Id]:GetName(true)..string.Get(20359), 2);
  elseif itemSave.damage == EThingsDurability.Damaged then
    ShowCenterMessage(itemDatas[itemSave.Id]:GetName(true)..string.Get(20360), 2);
  end
end

--[[ 武將裝備損壞度
S:023-028 <武將裝備損壞度> +武將索引(1) +裝備位置(1) +損壞度(1)
]]--
protocolTable[23][28] = function(data)
  local followIndex = data:ReadByte();
  local followNpc = Role.GetRole(EHuman.FollowNpc, Role.playerId, followIndex);

  if followNpc == nil then return end

  local bagIndex = data:ReadByte();
  local itemSave = Item.GetBagItem(EThings.Equip, bagIndex, followIndex);

  if itemSave == nil then return end

  itemSave.damage = data:ReadByte();

  if itemDatas[itemSave.Id] == nil then return end

  if itemSave.damage == EThingsDurability.Normal then
    ShowCenterMessage(followNpc.name.." "..itemDatas[itemSave.Id]:GetName(true)..string.Get(20359), 2);
  elseif itemSave.damage == EThingsDurability.Damaged then
    ShowCenterMessage(followNpc.name.." "..itemDatas[itemSave.Id]:GetName(true)..string.Get(20360), 2);
  end
end

--[[ 開始擺攤
S:023-030 <開始擺攤> +L(1) +店名(L) +樣式(1) <<+背包索引(2) +價格(4)>>
]]--
protocolTable[23][30] = function(data)
  --[[
  local venderName = data:ReadString(data:ReadByte());
  local venderId = data:ReadByte();

  while data.length > 0 do
    local bagIndex = data:ReadUInt16();
    local price = data:ReadInt32();

    local thingItem = this.GetBagItem(EThings.Bag, bagIndex);
    
    if thingItem ~= nil then
      thingItem.isVender = true;
      thingItem.price = price;
    end
  end
  --]]
end

--[[ 場景擺攤資訊
S:023-031 <場景擺攤資訊> <<+玩家ID(8) +店名(L) +樣式(1)>>
]]--
protocolTable[23][31] = function(data)
  --[[
  while data.length > 0 do
    local roleId = data:ReadInt64();
    local venderName = data:ReadString(data:ReadByte());
    local venderId = data:ReadByte();
  end
  --]]
end

--[[ 結束擺攤
S:023-032 <結束擺攤> +玩家ID(8)
]]--
protocolTable[23][32] = function(data)
  --[[
  local roleId = data:ReadInt64();
  --]]
end

--[[ 擺攤內容
S:023-033 <擺攤內容> +玩家ID(8) +月卡天數(4) +月卡點數(4) +月卡價格(4) <<+背包索引(1) +物品資料(16)>>
]]--
protocolTable[23][33] = function(data)
  --[[
  this.ClearBag(EThings.Vender);

  local roleId = data:ReadInt64();
  local cardDays = data:ReadInt32();
  local cardPoint = data:ReadInt32();
  local cardPrice = data:ReadInt32();

  local count = data.length / 16;
  local options = {};

  for i = 1, count do
    local bagIndex = data:ReadByte();
    local itemSave = ThingData.New(data);

    itemSave.roleId = roleId;
    itemSave.bagIndex = bagIndex;

    this.SetBagItem(EThings.Vender, i, itemSave, false);

    options[i] = this.GetItemEffectString(itemSave.Id);
  end

  if UI.IsVisible(UIShop) then
    UI.Close(UIShop);
  end

  UI.Open(UIShop, EUIShop.Vender, options);
  --]]
end

--[[ 擺攤賣出
S:023-034 <擺攤賣出> +種類(1) +物品ID(2) +數量(4) +價格(4)
]]--
protocolTable[23][34] = function(data)
  --[[
  local kind = data:ReadByte();
  local itemId = data:ReadUInt16();
  local quant = data:ReadInt32();
  local price = data:ReadInt32();
  if kind == 1 then --物品
    ShowCenterMessage(string.Concat(string.Get(40087), itemDatas[itemId]:GetName(true), " ", quant, string.Get(40088)));
  elseif kind == 2 then --月卡
    logError("月卡");
  end
  --]]
end

--[[ 裝備壞掉
S:023-035 <裝備壞掉> 背包索引(1) +物品資料(18) +武將索引(1)
]]--
protocolTable[23][35] = function(data)
  Item.SetBagItem(EThings.Equip, data:ReadByte(), ThingData.New(data), true, data:ReadByte());
end

--[[ 使用物品音效
S:023-036 <使用物品音效>
]]--
protocolTable[23][36] = function(data)
  AudioManager.PlayOnce("AudioClip_WA0014", 0);
end

--[[ 補血補魔訊息
S:023-037 <補血補魔訊息> +使用者玩家ID(8) +玩家ID(8) +補血量(4) +補魔量(2)
]]--
protocolTable[23][37] = function(data)
  local roleAId = data:ReadInt64();

  if Role.players[roleAId] == nil then return end

  local roleBId = data:ReadInt64();

  if Role.players[roleBId] == nil then return end
  
  local upHp = data:ReadUInt32();
  local upSp = data:ReadUInt16();

  if roleAId == roleBId then
    if upHp > 0 then
      Chat.AddMessage(EChannel.System, Role.players[roleAId].name..string.Get(40111)..upHp);
    end

    if upSp > 0 then
      Chat.AddMessage(EChannel.System, Role.players[roleAId].name..string.Get(40112)..upSp);
    end
  else
    if upHp > 0 then
      Chat.AddMessage(EChannel.System, Role.players[roleAId].name..string.Get(40110)..Role.players[roleBId].name..string.Get(40111)..upHp);
    end

    if upSp > 0 then
      Chat.AddMessage(EChannel.System, Role.players[roleAId].name..string.Get(40110)..Role.players[roleBId].name..string.Get(40112)..upSp);
    end
  end
end

--[[ 使用守護者之煙
S:023-038 <使用守護者之煙>+ 增加次數(4)
]]--
protocolTable[23][38] = function(data)
  DefendSmokeShow.Show(data:ReadInt32());
end

--[[ 使用蜜蜂丸
S:023-039 <使用蜜蜂丸> +次數(1)
]]--
protocolTable[23][39] = function(data)
end

--[[ 武將補血補魔訊息
S:023-040 <武將補血補魔訊息> +武將索引(1) +補血量(4) +補魔量(2)
]]--
protocolTable[23][40] = function(data)
  local followIndex = data:ReadByte();
  local followNpc = Role.GetRole(EHuman.FollowNpc, Role.playerId, followIndex);
  
  if followNpc == nil then return end

  local upHp = data:ReadUInt32();
  local upSp = data:ReadUInt16();

  if upHp > 0 then
    Chat.AddMessage(EChannel.System, followNpc.name..string.Get(40111)..upHp);
  end

  if upSp > 0 then
    Chat.AddMessage(EChannel.System, followNpc.name..string.Get(40112)..upSp);
  end
end

--[[ 使用行軍帳結果
S:023-041 <使用行軍帳結果> +結果(1)
  結果 1:成功
  結果 2:不需使用
  結果 3:非隊長
]]--
protocolTable[23][41] = function(data)
  local result = data:ReadByte();
  if result == 0 then
    UI.Close(UIItemInfo);
  elseif result == 1 then
    UI.Close(UIItemInfo);
  elseif result == 2 then
    ShowCenterMessage(string.Get(20498));
  elseif result == 3 then
    ShowCenterMessage("YOU ARE NOT TEAM LEADER !!");
  end
end

--[[ 耶誕節置換物品ID
S:023-042 <耶誕節置換物品ID>
]]--
protocolTable[23][42] = function(data)
  --Player.RevChangeChristmasID;
end

--[[ 清除巴豆包光影
S:023-050 <清除巴豆包光影>
]]--
protocolTable[23][50] = function(data)
  --Se_EquipForm.DoCancelPack;
end

--[[ 清除武將裝備
S:023-051 <清除武將裝備> 
]]--
protocolTable[23][51] = function(data)
  local followIndex = data:ReadByte();
  local bagIndex = data:ReadByte();

  Item.DelBagItem(EThings.Equip, bagIndex, nil, followIndex);
end

--[[ 補血丸訊息
S:023-052 <補血丸訊息> <<+武將索引(1) +物品ID(2) +數量(1)>>
]]--
protocolTable[23][52] = function(data)
  while data.length > 0 do
    local followIndex = data:ReadByte();
    local itemId = data:ReadUInt16();
    local quant = data:ReadByte();

    if itemDatas[itemId] ~= nil then
      if followIndex == 0 then
        Chat.AddMessage(EChannel.System, Role.player.name..string.Get(40314)..itemDatas[itemId]:GetName(true)..quant..string.Get(40315));
      else
        local followNpc = Role.GetRole(EHuman.FollowNpc, Role.playerId, followIndex);
        
        if followNpc ~= nil then
          Chat.AddMessage(EChannel.System, followNpc.name..string.Get(40314)..itemDatas[itemId]:GetName(true)..quant..string.Get(40315));
        end
      end
    end
  end
end

--[[ 更新玩家調色盤
S:023-053 <更新玩家調色盤> +玩家ID(8) +調色盤1(4)
]]--
protocolTable[23][53] = function(data)
  local roleId = data:ReadInt64();

  if Role.players[roleId] == nil then return end

  Role.players[roleId]:SetColor(1, data:ReadInt32());

  if UI.IsVisible(UIMain) then
    UIMain.UpdateIcon();
  end

end

--[[ 放鞭炮
S:023-054 <放鞭炮> <<+座標x(2) +座標y(2)>>
]]--
protocolTable[23][54] = function(data)
  while data.length > 0 do
    Marry.ShowFirework(data:ReadUInt16(), data:ReadUInt16());
  end
end

--[[ 收到骰子
S:023-055 <收到骰子> +玩家ID(8) <<+點數(1)>>
]]--
protocolTable[23][55] = function(data)
  local roleId = data:ReadInt64();

  if Role.players[roleId] == nil then return end

  local count = data.length;

  for i = 1, count do
    --Role.players[roleId]:SetDice(i, data:ReadByte());
  end
end

--[[ 使用物品訊息
S:023-056 <使用物品訊息> +種類(1)
]]--
protocolTable[23][56] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    ShowCenterMessage(string.Get(30165));
  elseif kind == 2 then
    ShowCenterMessage(string.Get(40025));
  elseif kind == 3 then
    ShowCenterMessage(string.Get(40475));
  end
end

--[[ 紅包活動的訊息
S:023-057 <紅包活動的訊息> +種類(1)
]]--
protocolTable[23][57] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    Chat.AddMessage(EChannel.System, string.Get(40361));

  elseif kind == 2 then
    Chat.AddMessage(EChannel.System, string.Get(40362));

  elseif kind == 3 then
    Chat.AddMessage(EChannel.System, string.Get(40384));

  elseif kind == 4 then
    Chat.AddMessage(EChannel.System, string.Get(40385));

  elseif kind == 5 then
    Chat.AddMessage(EChannel.System, string.Get(40408));

  elseif kind == 6 then
    Chat.AddMessage(EChannel.System, string.Get(40409));

  elseif kind == 7 then
    Chat.AddMessage(EChannel.System, string.Get(40410));
    ShowCenterMessage(string.Get(40410));

  elseif kind == 8 then
    Chat.AddMessage(EChannel.System, string.Get(71044));

  elseif kind == 9 then
    Chat.AddMessage(EChannel.System, string.Get(71045));

  elseif kind == 10 then
    Chat.AddMessage(EChannel.System, string.Get(71046));

  elseif kind == 11 then
    Chat.AddMessage(EChannel.System, string.Get(71047));

  elseif kind == 12 then
    Chat.AddMessage(EChannel.System, string.Get(71048));

  elseif kind == 13 then
    Chat.AddMessage(EChannel.System, string.Get(80175));

  elseif kind == 21 then
    Chat.AddMessage(EChannel.System, string.Get(80066));

  elseif kind == 22 then
    Chat.AddMessage(EChannel.System, string.Get(80067));

  elseif kind == 23 then
    Chat.AddMessage(EChannel.System, string.Get(71080));

  elseif kind == 24 then
    Chat.AddMessage(EChannel.System, string.Get(71081));

  elseif kind == 25 then
    Chat.AddMessage(EChannel.System, string.Get(71082));

  elseif kind == 26 then
    Chat.AddMessage(EChannel.System, string.Get(71083));

  elseif kind == 27 then
    Chat.AddMessage(EChannel.System, string.Get(90071));
    
  elseif kind == 28 then
    Chat.AddMessage(EChannel.System, string.Get(90072));

  elseif kind == 29 then
    ShowCenterMessage(string.Get(90072), 2);

  elseif kind == 30 then
    Chat.AddMessage(EChannel.System, string.Get(71100));

  elseif kind == 31 then
    Chat.AddMessage(EChannel.System, string.Get(90074));
    --Player.DisBBQ;

  elseif kind == 32 then
    ShowCenterMessage(string.Get(90074), 2);

  elseif kind == 33 then
    ShowCenterMessage(string.Get(90075), 2);

  elseif kind == 34 then
    ShowCenterMessage(string.Get(90076), 2);

  elseif kind == 35 then
    ShowCenterMessage(string.Get(90077), 2);

  elseif kind == 36 then
    ShowCenterMessage(string.Get(90079), 2);

  elseif kind == 37 then
    Chat.AddMessage(EChannel.System, string.Get(90073));

  elseif kind == 38 then
    ShowCenterMessage(string.Get(90082), 2);

  elseif kind == 39 then
    local subKind = data:ReadByte();
    if subKind == 1 then
      ShowCenterMessage(string.Get(30076).."1"..string.Get(30077), 2);
      Chat.AddMessage(EChannel.System, string.Get(90099)..string.Get(30076).."1"..string.Get(30077));
    elseif subKind == 2 then
      ShowCenterMessage(string.Get(90098).."3"..string.Get(30077), 2);
      Chat.AddMessage(EChannel.System, string.Get(90099)..string.Get(90098).."3"..string.Get(30077));
    elseif subKind == 3 then
      ShowCenterMessage(string.Get(90097).."3"..string.Get(30077), 2);
      Chat.AddMessage(EChannel.System, string.Get(90099)..string.Get(90097).."3"..string.Get(30077));
    end
    
  elseif kind == 40 then
    local subKind = data:ReadByte();    
    if subKind == 1 then
      ShowCenterMessage(string.Get(90113), 2);
    elseif subKind == 2 then
      ShowCenterMessage(string.Get(90114), 2);
    end

  elseif kind == 41 then
    ShowCenterMessage(string.Get(90116), 2);

  elseif kind == 42 then
    ShowCenterMessage(string.Get(90117), 2);

  elseif kind == 43 then
    local subKind = data:ReadByte();    
    if subKind == 1 then
      Chat.AddMessage(EChannel.System, string.Get(90118));
    elseif subKind == 2 then
      Chat.AddMessage(EChannel.System, string.Get(90119));
    end

  elseif kind == 44 then
    local subKind = data:ReadByte();    
    if subKind == 1 then
      Chat.AddMessage(EChannel.System, string.Get(90121));
    elseif subKind == 2 then
      Chat.AddMessage(EChannel.System, string.Get(90122));
    elseif subKind == 3 then
      ShowCenterMessage(string.Get(90122), 2);
    end
    
  elseif kind == 45 then
    ShowCenterMessage(string.Get(90124), 2);

  elseif kind == 46 then
    ShowCenterMessage(string.Get(90131), 2);

  elseif kind == 47 then
    Chat.AddMessage(EChannel.System,string.Get(90132));

  elseif kind == 48 then
    ShowCenterMessage(string.Get(90143), 2);

  elseif kind == 49 then
    local mapNpcIndex = data:ReadByte();
    local name = data:ReadString(data.length);

    if Role.mapNpcs[mapNpcIndex] == nil then return end

    Chat.AddMessage(EChannel.System, Role.mapNpcs[mapNpcIndex].name..string.Get(30170)..name..string.Get(90145));

  elseif kind == 50 then
    ShowCenterMessage(string.Get(80094), 2);

  elseif kind == 51 then
    local subKind = data:ReadByte();
    
    if subKind == 1 then
      ShowCenterMessage(string.Get(71135), 2);
    elseif subKind == 2 then
      Chat.AddMessage(EChannel.System, string.Get(71136));
    elseif subKind == 3 then
      Chat.AddMessage(EChannel.System, string.Get(71137));
    end
    
  elseif kind == 52 then
    local subKind = data:ReadByte();    
    if subKind == 1 then
      Chat.AddMessage(EChannel.System, string.Get(90170));
      ShowMarqueeMessage(string.Get(90170));
    elseif subKind == 2 then
      Chat.AddMessage(EChannel.System, string.Get(90172));
      ShowMarqueeMessage(string.Get(90172));
      --FT_EffectManage.JulySevenEftFlag:= false;
    elseif subKind == 3 then
      Chat.AddMessage(EChannel.System, string.Get(90171));
      ShowMarqueeMessage(string.Get(990171170));
      --FT_EffectManage.GetPlayData(Data);
    end

  elseif kind == 53 then
    local subKind = data:ReadByte();    
    if subKind == 1 then
      Chat.AddMessage(EChannel.System, string.Get(71143));
    elseif subKind == 2 then
      Chat.AddMessage(EChannel.System, string.Get(71144));
    end

  elseif kind == 54 then
    ShowCenterMessage(string.Get(80124), 2);

  elseif kind == 55 then
    local subKind = data:ReadByte();    
    if subKind == 1 then
      ShowCenterMessage(string.Get(80147), 2);
    elseif subKind == 2 then
      ShowCenterMessage(string.Get(80148), 2);
    elseif subKind == 3 then
      ShowCenterMessage(string.Get(80149), 2);
    elseif subKind == 4 then
      local name = data:ReadString(data:ReadByte());
      local itemId = data:ReadUInt16();

      if itemDatas[itemId] == nil then return end
      
      Chat.AddMessage(EChannel.System, name.." "..string.Get(80150).." "..itemDatas[itemId]:GetName(true));
    elseif subKind == 5 then
      ShowCenterMessage(string.Get(80157), 2);
    elseif subKind == 6 then
      ShowCenterMessage(string.Get(80158), 2);
    elseif subKind == 7 then
      ShowCenterMessage(string.Get(80159), 2);
    elseif subKind == 8 then
      ShowCenterMessage(string.Get(30038), 2);
    elseif subKind == 9 then
      ShowCenterMessage(string.Get(80160), 2);
    elseif subKind == 10 then
      ShowTalkMessage(nil, string.Get(80162), Role.mapNpcs[21]);
    end
    
  elseif kind == 56 then
    local mapNpcIndex = data:ReadByte();
    ShowTalkMessage(nil, talkDatas[31141], Role.mapNpcs[mapNpcIndex]);
    
  elseif kind == 57 then
    local subKind = data:ReadByte();    
    if subKind == 1 then
      Chat.AddMessage(EChannel.System, string.Get(80163));
    elseif subKind == 2 then
      Chat.AddMessage(EChannel.System, string.Get(80164));
    elseif subKind == 3 then
      ShowTalkMessage(nil, string.Get(80165), Role.player);
    elseif subKind == 4 then
      ShowCenterMessage(string.Get(80166), 2);
    elseif subKind == 5 then
      ShowCenterMessage(string.Get(80359), 2);
    elseif subKind == 6 then
      ShowCenterMessage(string.Get(80171), 2);
    end

  elseif kind == 58 then
    Chat.AddMessage(EChannel.System, string.Get(90177));

  elseif kind == 59 then
    local subKind = data:ReadByte();    
    if subKind == 1 then
      Chat.AddMessage(EChannel.System, string.Get(71187));
    elseif subKind == 2 then
      Chat.AddMessage(EChannel.System, string.Get(71188));
    elseif subKind == 3 then
      Chat.AddMessage(EChannel.System, string.Get(71189));
    elseif subKind == 4 then
      ShowCenterMessage(string.Get(71188), 2);
    elseif subKind == 5 then
      ShowTalkMessage(nil, string.Get(80176), Role.mapNpcs[15]);
    end

  elseif kind == 60 then
    ShowTalkMessage(nil, talkDatas[34151], Role.mapNpcs[14]);
  
  elseif kind == 61 then
    local subKind = data:ReadByte();    
    if subKind == 1 then
      Chat.AddMessage(EChannel.System, string.Get(71191));
    elseif subKind == 2 then
      Chat.AddMessage(EChannel.System, string.Get(71192));
    elseif subKind == 3 then
      Chat.AddMessage(EChannel.System, string.Get(71193));
    elseif subKind == 4 then
      ShowCenterMessage(string.Get(71193), 2);
    end
  
  elseif kind == 62 then
    local subKind = data:ReadByte();    
    if subKind == 1 then
      ShowCenterMessage(string.Get(71194), 2);
    end
  
  elseif kind == 63 then
    local subKind = data:ReadByte();    
    if subKind == 1 then
      ShowCenterMessage(string.Get(71195), 2);
    elseif subKind == 2 then
      Chat.AddMessage(EChannel.System, string.Get(71196));
    elseif subKind == 3 then
      Chat.AddMessage(EChannel.System, string.Get(71197));
    end    
  
  elseif kind == 64 then
    local subKind = data:ReadByte();    
    if subKind == 1 then
      ShowCenterMessage(string.Get(80020), 2);
    elseif subKind == 2 then
      ShowCenterMessage(string.Get(80223), 2);
    elseif subKind == 3 then
      ShowCenterMessage(string.Get(80234), 2);
    elseif subKind == 4 then
      local value = data:ReadInt32();
      ShowCenterMessage(string.Get(80235)..value, 2);
      --Role.playerData.mobilePoint2 = Role.playerData.mobilePoint2 + value;
    end

  elseif kind == 65 then
    local missionId = data:ReadUInt16();

    if markDatas[missionId] == nil then return end
    
    ShowCenterMessage(string.Get(80222)..markDatas[missionId].name, 2);

  elseif kind == 66 then
    local subKind = data:ReadByte();    
    if subKind == 1 then
      Chat.AddMessage(EChannel.System, string.Get(80238));
    elseif subKind == 2 then
      Chat.AddMessage(EChannel.System, string.Get(80239));
    elseif subKind == 3 then
      Chat.AddMessage(EChannel.System, string.Get(80240));
    elseif subKind == 4 then
      ShowTalkMessage(nil, string.Get(80240), Role.mapNpcs[14]);
    end
  
  elseif kind == 67 then
    local subKind = data:ReadByte();    
    if subKind == 1 then
      Chat.AddMessage(EChannel.System, string.Get(71224));
    elseif subKind == 2 then
      Chat.AddMessage(EChannel.System, string.Get(71225));
    elseif subKind == 3 then
      --Player.InX_Mas_DoorOpen := True;
      Chat.AddMessage(EChannel.System, string.Get(71226));
    elseif subKind == 4 then
      --Player.InX_Mas_DoorOpen := False;
      Chat.AddMessage(EChannel.System, string.Get(71229));
    end
  
  elseif kind == 68 then
    local subKind = data:ReadByte();    
    if subKind == 1 then
      Chat.AddMessage(EChannel.System, string.Get(71227));
    elseif subKind == 2 then
      Chat.AddMessage(EChannel.System, string.Get(71228));
    end
  
  elseif kind == 69 then
    local subKind = data:ReadByte();    
    if subKind == 1 then
      Chat.AddMessage(EChannel.System, string.Get(71230));
    elseif subKind == 2 then
      Chat.AddMessage(EChannel.System, string.Get(71231));
    end
  
  elseif kind == 70 then
    local subKind = data:ReadByte();    
    if subKind == 1 then
      --Player.IsCookingTime:= True;
      Chat.AddMessage(EChannel.System, string.Get(71232));
    elseif subKind == 2 then
      --Player.IsCookingTime:= False;
      Chat.AddMessage(EChannel.System, string.Get(71233));
    elseif subKind == 3 then
      ShowCenterMessage(string.Get(71234), 2);
    elseif subKind == 4 then
      ShowCenterMessage(string.Get(71235), 2);
    end
  
  elseif kind == 71 then
    local subKind = data:ReadByte();    
    if subKind == 1 then
      Chat.AddMessage(EChannel.System, string.Get(71236));
    elseif subKind == 2 then
      Chat.AddMessage(EChannel.System, string.Get(71237));
    end
  
  elseif kind == 72 then
    local subKind = data:ReadByte();    
    if subKind == 1 then
      Chat.AddMessage(EChannel.System, string.Get(71238));
    elseif subKind == 2 then
      Chat.AddMessage(EChannel.System, string.Get(71239));
    elseif subKind == 3 then
      Chat.AddMessage(EChannel.System, string.Get(71240));
    end
  
  elseif kind == 73 then
    local subKind = data:ReadByte();    
    if subKind == 1 then
      Chat.AddMessage(EChannel.System, string.Get(71241));
    elseif subKind == 2 then
      Chat.AddMessage(EChannel.System, string.Get(71242));
    end
  
  elseif kind == 74 then
    local subKind = data:ReadByte();    
    if subKind == 1 then
      Chat.AddMessage(EChannel.System, string.Get(71257));
    end
  
  elseif kind == 75 then
    local subKind = data:ReadByte();    
    if subKind == 1 then
      Chat.AddMessage(EChannel.System, string.Get(71270));
    end
  
  elseif kind == 76 then
    local subKind = data:ReadByte();    
    if subKind == 1 then
      Chat.AddMessage(EChannel.System, string.Get(71272));
    elseif subKind == 2 then
      Chat.AddMessage(EChannel.System, string.Get(71273));
    elseif subKind == 3 then
      Chat.AddMessage(EChannel.System, string.Get(71274));
    end
  
  elseif kind == 77 then
    Chat.AddMessage(EChannel.System, data:ReadString(data.length));
  
  elseif kind == 78 then
    Chat.AddMessage(EChannel.System, data:ReadString(data.length));
  
  elseif kind == 79 then
    ShowCenterMessage(string.Get(71309), 2);
  end
end

--[[ 可否販賣月卡
S:023-058 <可否販賣月卡> +種類(1)
  種類 1:可以販賣 +天數(4) +點數(4)
  種類 2:帳號或密碼錯誤
  種類 3:卡己用過
  種類 4:其他失效
]]--
protocolTable[23][58] = function(data)
  --VendeCardMenu.RevChkVendeCardResult(Data);
end

--[[ 月卡交易取消
S:023-059 <月卡交易取消>
]]--
protocolTable[23][59] = function(data)
  ShowCenterMessage(string.Get(40378), 2);
end

--[[ 網站金錢物品
S:023-063 <網站金錢物品> +金錢(4) <<+索引(1) +物品資料(18) +狀態(1)>>
]]--
protocolTable[23][63] = function(data)
  --SaleNetMenu.RevWebInfo(Data);
end

--[[ 武將昇華丹次數
S:023-066 <武將昇華丹次數> +武將索引(1) +次數(1)
]]--
protocolTable[23][66] = function(data)
  local followIndex = data:ReadByte();
  local followNpc = Role.GetRole(EHuman.FollowNpc, Role.playerId, followIndex);
  
  if followNpc == nil then return end

  followNpc.data.sublimeCount = data:ReadByte();

  if UI.IsVisible(UIStatus) and UIStatus.IsCurrentRole(followNpc) then
    UIStatus.UpdateUI();
  end
end

--[[ 播放魔豆特效
S:023-068 <播放魔豆特效>
]]--
protocolTable[23][68] = function(data)
  if UI.IsVisible(UIStatus) then 
    UI.Close(UIStatus);
  end
  if UI.IsVisible(UIItemInfo)then
    UI.Close(UIItemInfo)
  end

  MagicBeanShow.Start();
end

--[[ 玩家轉職
S:023-069 <玩家轉職> +玩家ID(8) +頭型(1) +調色盤1(4) +調色盤2(4) +幾轉(1) +職業(1)
]]--
protocolTable[23][69] = function(data)
  local roleId = data:ReadInt64();

  if Role.players[roleId] == nil then return end

  Role.players[roleId].data.headStyle = data:ReadByte();
  Role.players[roleId].data.colorTints[1] = data:ReadInt32();
  Role.players[roleId].data.colorTints[2] = data:ReadInt32();
  Role.players[roleId].data.turn = data:ReadByte();
  Role.players[roleId].data.career = data:ReadByte();

  Role.players[roleId]:UpdateAll();

  Role.CartNpcAppear(roleId);

  if roleId == Role.playerId then
    if UI.IsVisible(UIMain) then
      UIMain.UpdateIcon();
      UIMain.UpdateInfo();
    end
  end
end

--[[ 放煙火
S:023-070 <放煙火> +種類(1)
  種類 1:煙火 +樣式(1) +座標x(2) +座標y(2) +數量(1)
  種類 2:倒數 +秒(1)
  種類 3:煙火 +樣式(1) +座標x(2) +座標y(2) +數量(1)
  種類 4:煙火 +座標x(2) +座標y(2) +數量(1) +MapNpc索引(2)
  種類 5.跨年煙火 +目前索引(2)
]]--
protocolTable[23][70] = function(data)
  SceneEffect.GetFireworkData(data);
end

--[[ 改變頭型
S:023-071 <改變頭型> +玩家ID(8) +頭型(1)
]]--
protocolTable[23][71] = function(data)
  local roleId = data:ReadInt64();

  if Role.players[roleId] == nil then return end

  Role.players[roleId]:SetHeadStyle(data:ReadByte());
  if UI.IsVisible(UIMain) then
    UIMain.UpdateIcon();
  end
end

--[[ 丟水球
S:023-072 <丟水球> +使用玩家ID(8) +目標玩家ID(8) +樣式(1)
]]--
protocolTable[23][72] = function(data)
  SceneEffect.GetWaterBallData(data);
end

--[[ 裝備成長經驗值
S:023-073 <裝備成長經驗值> +武將索引(1) +裝備位置(1) +成長經驗值(4)
]]--
protocolTable[23][73] = function(data)
  local followIndex = data:ReadByte();
  local bagIndex = data:ReadByte();
  local itemSave = Item.GetBagItem(EThings.Equip, bagIndex, followIndex);
  
  if itemSave == nil then return end
  
  itemSave.growExp = data:ReadInt32();
  itemSave.growLv = Item.GetGrowLv(itemSave.Id, 0, itemSave.growExp);
end

--[[ 靈性裝備升級
S:023-074 <靈性裝備升級> +武將索引(1) +裝備位置(1)
]]--
protocolTable[23][74] = function(data)
  local followIndex = data:ReadByte();
  local bagIndex = data:ReadByte();
  local itemSave = Item.GetBagItem(EThings.Equip, bagIndex, followIndex);

  if itemSave == nil then return end
  if itemDatas[itemSave.Id] == nil then return end
  if not Contains(itemDatas[itemSave.Id].kind, 57, 62) then return end

  itemSave.damage = 0;

  Chat.AddMessage(EChannel.System, itemDatas[itemSave.Id]:GetName(true)..string.Get(40426));
end

--[[ 開啟虛寶介面
S:023-075 <開啟虛寶介面> +剩餘點數(4) <<+已賣光索引(1)>>
]]--
protocolTable[23][75] = function(data)
  --PointCard_Form.RevItemData(Data);
end

--[[ 購買虛寶結果
S:023-076 <購買虛寶結果> +物品ID(2) +點數(4) +剩餘點數(4) +結果(1)
]]--
protocolTable[23][76] = function(data)
  local itemId = data:ReadUInt16();
  data:ReadInt32();
  local point = data:ReadInt32();
  local result = data:ReadByte();

  Role.SetPoint(point);
  
  if result == 1 then
    Chat.AddMessage(EChannel.System, string.Get(40430)..itemDatas[itemId]:GetName(true)..string.Get(40431)..point..string.Get(40432));
  end
end

--[[ 天珠資訊
S:023-077 <天珠資訊> +可用天珠數(1) <<+啟動索引(1)>>
]]--
protocolTable[23][77] = function(data)
  Role.playerData.turn2BallCount = data:ReadByte();

  table.Clear(Role.playerData.turn2Balls);
  while data.length > 0 do
    Role.playerData.turn2Balls[data:ReadByte()] = true;
  end
  
  if UI.IsVisible(UISkillTree) then
    if UISkillTree.IsCurrentRole(Role.player) then
      UISkillTree.UpdateUI();
    end
  end
end

--[[ 二轉技能
S:023-078 <二轉技能> <<+索引(1) +技能ID(2)>>
]]--
protocolTable[23][78] = function(data)
  table.Clear(Role.playerData.heroSkills);
  while data.length > 0 do
    local index = data:ReadByte() + 5;
    local skillId = data:ReadUInt16();
    
    Role.playerData.heroSkills[index] = skillId;
  end
  
  if UI.IsVisible(UISkillTree) then
    if UISkillTree.IsCurrentRole(Role.player) then
      UISkillTree.UpdateUI();
    end
  end
end

--[[ 轉職訊息
S:023-079 <轉職訊息> +種類(1)
  種類 1:轉職 +職業(1) +名字(?)
  種類 2:補償屬性點 +等級補償(1) +任務補償(1) +太上仙丹補償(1)
  種類 3:補償技能點 +未轉生補償(1) +轉生補償(1) +任務補償(1)
  種類 4:菁英公告 +L(1) +名字(L)
]]--
protocolTable[23][79] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    local career = data:ReadByte();
    local name = data:ReadString(data.length);
    if career == 1 then
      Chat.AddMessage(EChannel.System, string.Get(71084).." "..name.." "..string.Get(30034)..string.Get(90109)..string.Get(90100));
    elseif career == 2 then
      Chat.AddMessage(EChannel.System, string.Get(71084).." "..name.." "..string.Get(30034)..string.Get(90110)..string.Get(90100));
    elseif career == 3 then
      Chat.AddMessage(EChannel.System, string.Get(71084).." "..name.." "..string.Get(30034)..string.Get(90111)..string.Get(90100));
    elseif career == 4 then
      Chat.AddMessage(EChannel.System, string.Get(71084).." "..name.." "..string.Get(30034)..string.Get(90112)..string.Get(90100));
    end
  elseif kind == 2 then
    local levelPoint = data:ReadByte();
    local missionPoint = data:ReadByte();
    local panaceaPoint = data:ReadByte();

    Chat.AddMessage(EChannel.System, string.Get(90101)..string.Get(90105)..string.Get(49073)..string.Get(90102)..tostring(levelPoint + missionPoint + panaceaPoint)..string.Get(20562).."\n"..
                       string.Get(20031)..string.Get(90105)..string.Get(90106)..tostring(levelPoint)..string.Get(20562).."\n"..
                       string.Get(90103)..string.Get(90105)..string.Get(90106)..tostring(missionPoint)..string.Get(20562).."\n"..
                       string.Get(90104)..string.Get(90105)..string.Get(90106)..tostring(panaceaPoint)..string.Get(20562));     --太上仙丹補償得到XXX點
  elseif kind == 3 then
    local turnNoneSkillPoint = data:ReadByte();
    local turnOneSkillPoint = data:ReadByte();
    local missionSkillPoint = data:ReadByte();

    Chat.AddMessage(EChannel.System, string.Get(90101)..string.Get(90105)..string.Get(49072)..string.Get(90102)..tostring(turnNoneSkillPoint + turnOneSkillPoint + missionSkillPoint)..string.Get(20562).."\n"..
                       string.Get(90107)..string.Get(90105)..string.Get(90106)..tostring(turnNoneSkillPoint)..string.Get(20562).."\n"..
                       string.Get(90108)..string.Get(90105)..string.Get(90106)..tostring(turnOneSkillPoint)..string.Get(20562).."\n"..
                       string.Get(90103)..string.Get(90105)..string.Get(90106)..tostring(missionSkillPoint)..string.Get(20562));
  elseif kind == 4 then
    Chat.AddMessage(EChannel.System, string.format(string.Get(71335), data:ReadString(data:ReadByte())));
  end
end

--[[ 開啟戳戳樂介面
S:023-080 <開啟戳戳樂介面>
]]--
protocolTable[23][80] = function(data)
  --CY_HoleGame.appear;
end

--[[ 穿上戰船裝備
S:023-081 <穿上戰船裝備> +種類(1) +索引(1) +裝備位置(1) +物品ID(2)
]]--
protocolTable[23][81] = function(data)
  --Player.RevEquipWaterWarItem(Data);
end

--[[ 卸下戰船裝備
S:023-082 <卸下戰船裝備> +索引(1) +裝備位置(1)
]]--
protocolTable[23][82] = function(data)
  --Player.RevDisEquipWaterWarItem(Data);
end

--[[ 信件物品時間到期被刪除
S:023-083 信件物品時間到期被刪除 + 物品ID(2) + 數量(4)
]]--
protocolTable[23][83] = function(data)
  local itemId = data:ReadUInt16();
  local quant = data:ReadInt32();
  local itemData = itemDatas[itemId];
  if itemData == nil then return end

  ShowCenterMessage(string.format(string.Get(21160), itemData:GetName(true), quant));
  Chat.AddMessage(EChannel.System, string.format(string.Get(21160), itemData:GetName(true), quant));
end

--[[ 天官強化結果
S:023-086 <天官強化結果> +結果(1)
  結果 1:成功 +背包索引(2) +現在階數(1)
  結果 2:失敗 +背包索引(2) +原本階數(1) +現在階數(1)
  結果 3: 物品索引錯誤
  結果 4: 無強化資料
  結果 5: 天官物品錯誤
  結果 6: 強化物品錯誤
  結果 7: 物品等級超過指定等級
  結果 8: 指定等級異常
  結果 9: 刪除天官物品失敗
  結果 10: 刪除強化物品失敗
  結果 11: 天官物品已達上限
]]--
protocolTable[23][86] = function(data)
  local result = data:ReadByte();

  if Contains(result, 1) then
    local itemSave = Item.GetBagItem(EThings.Bag, data:ReadUInt16());
    if itemSave == nil then return end

    itemSave.stoneLv = data:ReadByte();

    if itemSave.stoneLv == 1 then
      ShowCenterMessage(string.format(string.Get(21985), itemDatas[itemSave.Id]:GetName(true)));
    else
      ShowCenterMessage(string.format(string.Get(21986), itemDatas[itemSave.Id]:GetName(true), string.GetChineseNumberLower(itemSave.stoneLv)));
    end

    Chat.AddMessage(EChannel.System, string.format(string.Get(21179), itemDatas[itemSave.Id]:GetName(true), 1));

    if UI.IsVisible(UICompound) then
      if itemSave.stoneLv == Item.maxTianGuanLv then
        UICompound.ClearData();
      else
        UICompound.UpdateUI();
      end

      UICompound.StartMixEffect(ECompoundEffect.Success);
    end
  elseif Contains(result, 2) then
    local itemSave = Item.GetBagItem(EThings.Bag, data:ReadUInt16());
    if itemSave == nil then return end

    local beforeLv = data:ReadByte();
    itemSave.stoneLv = data:ReadByte();

    if itemSave.stoneLv == 1 or beforeLv == itemSave.stoneLv then
      ShowCenterMessage(string.format(string.Get(21997), itemDatas[itemSave.Id]:GetName(true)));
    else
      ShowCenterMessage(string.format(string.Get(21998), itemDatas[itemSave.Id]:GetName(true), string.GetChineseNumberLower(itemSave.stoneLv)));
    end

    Chat.AddMessage(EChannel.System, string.format(string.Get(21179), itemDatas[itemSave.Id]:GetName(true), 1));

    if UI.IsVisible(UICompound) then
      UICompound.UpdateUI();
      UICompound.StartMixEffect(ECompoundEffect.Fail);
    end
  elseif result == 3 then
    ShowCenterMessage(string.Get(22012));
  elseif result == 4 then
    ShowCenterMessage(string.Get(22013));
  elseif result == 5 then
    ShowCenterMessage(string.Get(22012));
  elseif result == 6 then
    ShowCenterMessage(string.Get(22012));
  elseif result == 7 then
    ShowCenterMessage(string.Get(22014));
  elseif result == 8 then
    ShowCenterMessage(string.Get(22015));
  elseif result == 9 then
    ShowCenterMessage(string.Get(22016));
  elseif result == 10 then
    ShowCenterMessage(string.Get(22016));
  elseif result == 11 then
    ShowCenterMessage(string.Get(22017));
  else
    logError("TianGuan Equip Enhance Fail !! result = "..result);
  end
end

--[[ 物品鎖定結果
S:023-087 <物品鎖定結果> +結果(1)
   結果 1:成功 +背包種類(1) +背包索引(2) +武將索引(1) +鎖定(1)[true:不能刪除 false:可以刪除]
   失敗 2:失敗 +背包種類(1) +背包索引(2) +武將索引(1)
]]--
protocolTable[23][87] = function(data)
  local result = data:ReadByte();
  if result == 1 then
    Item.SetItemLock(data:ReadByte(), data:ReadUInt16(), data:ReadByte(), data:ReadBoolean());
  elseif result == 2 then
  end
end

--[[ 靈石珍珠消除結果
S:023-088 <靈石珍珠消除結果> +結果(1)
   結果 1:成功 + 物品ID(2) +消除種類(1) 1:靈石 2.羽毛 3.珍珠
   失敗 2:失敗 + 字串編號(4)
]]--
protocolTable[23][88] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    local itemId = data:ReadUInt16();
    local removeKind = data:ReadByte();

    if itemDatas[itemId] ~= nil then
      if removeKind == 1 then
        ShowCenterMessage(string.format(string.Get(22179), itemDatas[itemId]:GetName(true), string.Get(20475)));
      elseif removeKind == 3 then
        ShowCenterMessage(string.format(string.Get(22179), itemDatas[itemId]:GetName(true), string.Get(20473)));
      end
    end

    if UI.IsVisible(UICompound) then
      UICompound.ClearData();
      UICompound.StartMixEffect(ECompoundEffect.Compound);
    end
  elseif result == 2 then
    ShowCenterMessage(data:ReadInt32());
  end
end

--[[ 鑰匙開啟寶箱功能結果
S:023-089 <鑰匙開啟寶箱功能結果> +結果(1)
   結果 1:成功
   失敗 2:失敗
]]--
protocolTable[23][89] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    if UI.IsVisible(UIItemInfo) then
      UIItemInfo.UpdateUI();
    end
  end
end

--[[ 物品進化結果
S:023-090 <物品進化結果> +結果(1)
  結果 1:成功 +背包索引(2) +進化前物品ID(2) +進化後物品ID(2)
  結果 2:失敗 +進化前物品ID(2) +失敗種類(1)
    失敗種類 1:無損
    失敗種類 2:降級 +進化後物品ID(2) +背包索引(2)
    失敗種類 3:爆炸
  結果 3:材料不足
  結果 4:背包已滿
--]]
protocolTable[23][90] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    local bagIndex = data:ReadUInt16();
    local oriItemId = data:ReadUInt16();
    local evoItemId = data:ReadUInt16();
    
    if itemDatas[oriItemId] ~= nil and itemDatas[evoItemId] ~= nil then
      local message = string.format(string.Get(22298), itemDatas[oriItemId]:GetName(true), itemDatas[evoItemId]:GetName(true));
      ShowCenterMessage(message);
      Chat.AddMessage(EChannel.System, message);
    end

    if UI.IsVisible(UICompound) then
      UI.Close(UIBag);
      UICompound.UpdateUI();
      UICompound.StartMixEffect(ECompoundEffect.Success, bagIndex);
    end
  elseif result == 2 then
    local oriItemId = data:ReadUInt16();
    local failCode = data:ReadByte();

    local message = nil;
    local bagIndex = nil;

    if failCode == 1 then
      if itemDatas[oriItemId] ~= nil then
        message = string.format(string.Get(22299), itemDatas[oriItemId]:GetName(true));
      end
    elseif failCode == 2 then
      local evoItemId = data:ReadUInt16();
      bagIndex = data:ReadUInt16();
      if itemDatas[oriItemId] ~= nil and itemDatas[evoItemId] ~= nil then
        message = string.format(string.Get(22301), itemDatas[oriItemId]:GetName(true), itemDatas[evoItemId]:GetName(true));
      end
    elseif failCode == 3 then
      if itemDatas[oriItemId] ~= nil then
        message = string.format(string.Get(22300), itemDatas[oriItemId]:GetName(true));
      end
    end

    if message ~= nil then
      ShowCenterMessage(message);
      Chat.AddMessage(EChannel.System, message);
    end

    if UI.IsVisible(UICompound) then
      UI.Close(UIBag);
      if failCode == 3 then
        UICompound.ClearData();
      else
        UICompound.UpdateUI();
      end
      UICompound.StartMixEffect(ECompoundEffect.Fail, bagIndex);
    end
  elseif result == 3 then
    ShowCenterMessage(string.Get(22313));
  elseif result == 4 then
    ShowCenterMessage(string.Get(80359));
  end
end

--[[ 專武強化
S:023-091 <專武強化結果> +結果(1)
  結果 1:成功 +強化等級(1)
  結果 2:材料不足
  結果 3:非同把專武，無法強化
  結果 4:強化等級不符，無法強化
  結果 5:強化等級已最高級
]]--
protocolTable[23][91] = function(data)
  ExclusiveWeapon.ReciveEnhance(data);
end

--[[ 升階功能結果
S:023-092 <升階功能結果> +結果(1)
   結果 1:成功 + 背包索引(2) +強化等級(1)      (或者直接跳成功就好 不用傳bagIndex)
   失敗 2:失敗 + 背包索引(2) +強化等級(1)
   失敗 3:失敗
]]--
protocolTable[23][92] = function(data)
  UICompound.ReciveReinforce(data);
end

--[[ 洗鍊功能
S:023-093 <洗鍊功能> +結果(1)
   結果 1:成功 + 背包索引(2) + indx(1) + 表的Indx(1)
   失敗 2:失敗
]]--
protocolTable[23][93] = function(data)
  UICompound.ReciveAffix(data);
end

--[[S:023-094 <洗鍊功能> +結果(1)
結果 1:成功
失敗 2:失敗
]]--
protocolTable[23][94] = function(data)
  UICompound.ReciveAffixResult(data);
end

--[[S:023-095 <時裝強化結果>+結果(1)
  結果 1:成功 +背包索引(2)
      2:失敗 +背包索引(2)
      3:材料不足
      4:背包已滿
      0:亂送物品過來
]]--
protocolTable[23][95] = function(data)
  UICompound.ReciveEvoStyle(data);
end

--[[ 團P發獎品
S:023-100 <團P發獎品> <<+背包索引(1) +物品ID(2) +數量(1)>>
]]--
protocolTable[23][100] = function(data)
  --ThingManage.RevRoundGift(Data);
end

--[[ 團P獎品補發訊息
S:023-101 <團P獎品補發訊息> <<+物品ID(2) +數量(1)>>
]]--
protocolTable[23][101] = function(data)
  local message = "";

  while data.length > 0 do
    local itemId = data:ReadUInt16();
    local quant = data:ReadByte();

    message = message..itemDatas[itemId]:GetName(true)..quant..string.Get(40136).." ";
  end

  ShowCenterMessage(string.Get(40137)..message, 2);
end

--[[ 戳戳樂發獎品
S:023-105 <戳戳樂發獎品> +背包索引(1) +物品ID(2) +數量(1)
]]--
protocolTable[23][105] = function(data)
  --ThingManage.RevHoleGife(Data);
end

--[[ 轉蛋樂
S:023-106 <轉蛋樂> Count(1)+<<NpcIdx(1)+EggKind(1)+aThingID(2)>>
褐轉蛋   38 46131
藍轉蛋   38 46132
紅轉蛋   38 46133
綠轉蛋   38 46134
亮銀轉蛋 38 46135
黃金轉蛋 38 46136
]]
protocolTable[23][106] = function(data)
  Egg.ReciveStartRollEgg(data);
end

--[[ 轉蛋介面
S:23-107<轉蛋介面> +kind(1)
                    1.轉蛋公布欄
                    2.轉蛋介消 +轉蛋介消ID(2) +轉蛋機Npc索引(2)
]]--
protocolTable[23][107] = function(data)
  local kind = data:ReadByte();

  if kind == 2 then
    local uiSellId = data:ReadUInt16();
    UISell.ShowRole(data:ReadUInt16());
    UISell.Launch(uiSellId);
  end
end

--[[ 購買轉蛋結果
S:023-108 <購買轉蛋結果> +剩餘點數(4)
]]--
protocolTable[23][108] = function(data)
--  Chat.AddMessage(EChannel.System, string.Get(20705)..tostring(data:ReadInt32())..string.Get(40432));
end

--[[ 轉蛋加送一顆
S:023-109 <轉蛋加送一顆>
]]--
protocolTable[23][109] = function(data)
  Chat.AddMessage(EChannel.System, string.Get(40446));
end

--[[ 轉蛋相關訊息
S:023-110 <轉蛋相關訊息> +種類(1)
]]--
protocolTable[23][110] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    Chat.AddMessage(EChannel.System, string.format(string.Get(40447), 50));
  elseif kind == 2 then
    Chat.AddMessage(EChannel.System, string.Get(40448));
  elseif kind == 3 then
    Chat.AddMessage(EChannel.System, string.format(string.Get(40467), 50));
  end
end

--[[ 亂鬥戒指訊息
S:023-111 <亂鬥戒指訊息> +種類(1)
]]--
protocolTable[23][111] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    local itemId = data:ReadInt32();
    local name = data:ReadString(data.length);

    Chat.AddMessage(EChannel.System, itemDatas[itemId]:GetName(true)..string.Get(80074)..name);
  elseif kind == 2 then
    Chat.AddMessage(EChannel.System, string.Get(80075));
  elseif kind == 3 then
    Chat.AddMessage(EChannel.System, string.Get(71141));
  elseif kind == 4 then
    Chat.AddMessage(EChannel.System, string.Get(71142));
  end
end

--[[ 所有場景物品
S:023-112 <所有場景物品> <<+種類(1) +索引(2) +物品ID(4) +座標x(2) +座標y(2) +可拾取玩家ID(8)>>
]]--
protocolTable[23][112] = function(data)
  --GdThingManage.InitSceneWaterThing(Data);
end

--[[ 兌換天空競技獎勵
S:023-113 <兌換天空競技獎勵> +玩家ID(8)
]]--
protocolTable[23][113] = function(data)
  --LH_SkyFight.RevExchange(Data);
end

--[[ 免費版轉蛋訊息
S:023-114 <免費版轉蛋訊息> +物品ID(2)
]]--
protocolTable[23][114] = function(data)
  local itemId = data:ReadUInt16();

  if itemDatas[itemId] == nil then return end

  Chat.AddMessage(EChannel.System, string.format(string.Get(80118), itemDatas[itemId]:GetName(true), 1));
end

--[[ 防沉迷訊息
S:023-115 <防沉迷訊息> +種類(1)
  種類 1:獲得經驗值 +經驗值(4)
  種類 2:0-3小時 +時數(1)
  種類 3:4-5小時 +時數(1)
  種類 4:6小時以上 +時數(1)
]]--
protocolTable[23][115] = function(data)
  local kind = data:ReadByte();

  local message = "";
  if kind == 1 then
    message = string.format(string.Get(40476), data:ReadInt32());

    ShowCenterMessage(message, 3);
    Chat.AddMessage(EChannel.System, message);

  elseif kind == 2 then
    local hour = data:ReadUInt16();
    if Between(hour, 0, 2) then
      message = string.format(string.Get(40477), hour);
    else
      message = string.format(string.Get(40478), hour);
    end

    ShowCenterMessage(message, 10);
    Chat.AddMessage(EChannel.System, message);

  elseif kind == 3 then
    local hour = data:ReadUInt16();
    message = string.format(string.Get(40479), hour);

    ShowCenterMessage(message, 10);
    Chat.AddMessage(EChannel.System, message);

  elseif kind == 4 then
    local hour = data:ReadUInt16();
    message = string.format(string.Get(40480), hour);

    ShowCenterMessage(message, 10);
    Chat.AddMessage(EChannel.System, message);
  end
end

--[[ 使用物品訊息
S:023-116 <使用物品訊息> +訊息(4)
]]--
protocolTable[23][116] = function(data)
  ShowCenterMessage(string.Get(data:ReadUInt32()));
end

--[[ 開啟錢莊木人
S:023-117 <開啟錢莊木人>
]]--
protocolTable[23][117] = function(data)
  if UI.IsVisible(UIItemInfo) then
    UI.Close(UIItemInfo);
  end

  if UI.IsVisible(UIStatus) then
    UI.Close(UIStatus);
  end

  UI.Open(UIBank, EBankOpenKind.Item);
end

--[[ 記憶傳送符資料
S:023-118 <記憶傳送符資料> +開啟數量(1) +數量(1) <<+索引(1) +場景ID(2) +座標x(2) +座標y(2)>>
]]--
protocolTable[23][118] = function(data)
  UITeleport.flyPointCount = data:ReadByte();

  local count = data:ReadByte();
  for i = 1, count do
    local index = data:ReadByte();

    UITeleport.flyPoints[index] = {};
    UITeleport.flyPoints[index].sceneId = data:ReadUInt16();
    UITeleport.flyPoints[index].position = Vector2.New(data:ReadUInt16(), data:ReadUInt16());
  end

  if UI.IsVisible(UITeleport) then
    UITeleport.RefreshMemoryPage();
  end
end

--[[ 靈石強化結果
S:023-119 <靈石強化結果> +結果(1)
  結果 1:成功 +背包索引(2)
  結果 2:失敗 +背包索引(2)
  結果 3:功能未開放
  結果 4:功能開關 +強化開關(1) +神煉化開關(1)
  結果 6:神煉化成功 +背包索引(2)
  結果 7:神煉化失敗 +背包索引(2)
  結果 8:神煉化功能未開放
]]--
protocolTable[23][119] = function(data)
  local result = data:ReadByte();

  if Contains(result, 1, 6) then --成功
    local itemSave = Item.GetBagItem(EThings.Bag, data:ReadUInt16());
    if itemSave == nil then return end
  
    if itemSave.stoneLv == 1 then
      ShowCenterMessage(string.format(string.Get(80322), itemDatas[itemSave.Id]:GetName(true)));
    else
      ShowCenterMessage(string.format(string.Get(80323), itemDatas[itemSave.Id]:GetName(true), Compound.GetStoneString(itemSave.stoneAttr), itemSave.stoneLv));
    end
  
    Chat.AddMessage(EChannel.System, string.format(string.Get(21179), itemDatas[itemSave.Id]:GetName(true), 1));
  
    if UI.IsVisible(UICompound) then
      if itemSave.stoneLv == Item.MaxStoneLv then
        UICompound.ClearData();
      else
        UICompound.UpdateUI();
      end
  
      UICompound.StartMixEffect(ECompoundEffect.Success);
    end
  elseif Contains(result, 2, 7) then --失敗
    local itemSave = Item.GetBagItem(EThings.Bag, data:ReadUInt16());
    if itemSave == nil then return end
  
    local beforeLv = data:ReadByte();
    local afterLv = data:ReadByte();
  
    if itemSave.stoneLv == 1 or beforeLv == afterLv then
      ShowCenterMessage(string.format(string.Get(80321), itemDatas[itemSave.Id]:GetName(true)));
    else
      ShowCenterMessage(string.format(string.Get(20859), itemDatas[itemSave.Id]:GetName(true), Compound.GetStoneString(itemSave.stoneAttr), afterLv));
    end
  
    Chat.AddMessage(EChannel.System, string.format(string.Get(21179), itemDatas[itemSave.Id]:GetName(true), 1));
    
    if UI.IsVisible(UICompound) then
      UICompound.UpdateUI();
      UICompound.StartMixEffect(ECompoundEffect.Fail);
    end
  elseif result == 3 then --server回傳功能未開放
    ShowCenterMessage(string.Get(80332));
  elseif result == 8 then --server回傳神煉化功能未開放
    ShowCenterMessage(string.Get(80332));
  end
end

--[[ 裝備修理結果
S:023-120 <裝備修理結果> +結果(1)
]]--
protocolTable[23][120] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    ShowCenterMessage(string.Get(80341));
  end
end

--[[ 設定號角次數
S:023-121 <設定號角次數> +結果(1)
  結果 1:成功 +號角次數(2)
  結果 2:失敗 +錯誤原因(1)
    錯誤原因 1:次數已滿
]]--
protocolTable[23][121] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    Chat.hornCount = data:ReadUInt16();

    if UI.IsVisible(UIMain) then
      UIMain.UpdateBuff();
    end
    
  elseif result == 2 then
    local cause = data:ReadByte();
    if cause == 1 then
      ShowCenterMessage(string.Get(40390));
    end
  end
end

--[[ 學姊活動投票
S:023-122 <學姊活動投票> +功能(1)
  功能 1:<查詢應援次數> +應援次數(4)
  功能 2:<幫她應援> +結果(1)
    結果 1: 可消耗 +使用物品ID(2)
    結果 2: 應援道具不足，應援失敗
    結果 3: 玩家等級未滿120級，應援失敗
    結果 4: 創角時間超過 2019年4/24 00:00，無法使用「學姊加油棒」進行應援
    結果 5: 押注道具不足，押注失敗
  功能 3:<應援結果> +結果(1)
    結果 1: 應援成功
    結果 2: 押注成功
    結果 3: 目前非預測時間
    結果 4: 最少押注數量為10
    結果 5: 伺服器忙碌中請稍後
  功能 4:<更新預測Icon是否顯示>
]]--
protocolTable[23][122] = function(data)
  local kind = data:ReadByte();
  if kind == 1 then
    UISeniorElection.UpdateVotesNumber(data);
  elseif kind == 2 then
    local result = data:ReadByte();
    if result == 1 then
      UISeniorElection.ShowUseTicketAlert(data:ReadUInt16());
    elseif result == 2 then
      ShowCenterMessage(string.Get(22379));
    elseif result == 3 then
      ShowCenterMessage(string.Get(22380));
    elseif result == 4 then
      ShowCenterMessage(string.Get(22435));
    elseif result == 5 then
      ShowCenterMessage(string.Get(22755));
    end
  elseif kind == 3 then
    local result = data:ReadByte();
    if result == 1 then      
      ShowCenterMessage(string.Get(22378));
    elseif result == 2 then
      ShowCenterMessage(string.Get(22756));  
    elseif result == 3 then
      ShowCenterMessage(string.Get(22771));
    elseif result == 4 then
      ShowCenterMessage(string.Get(22792));
    elseif result == 5 then
      ShowCenterMessage(string.Get(71180));
    end
  elseif kind == 4 then
    Function.UpdateVisible();
  end
end

--[[ 城鎮爭奪
  S:023-123 <城鎮爭奪> + Kind(1)
  Kind 1:<玩家資料> + 陣營(1) + 票數(4) + 投票權數(4) + 木樁數(4) + 最大可投木樁數(4)
  Kind 2:<陣營占領資料> + 數量(1) + <<陣營(1)+ 占領數量(2)>
  Kind 3:<城鎮占領資料> + 數量(1) + <<城鎮(2) + 所屬陣營(1)>>
  Kind 4:<城鎮占領資料> + 城鎮(2) + 所屬陣營(1) + 數量(1) + <<陣營(1) + 票數(4)>> + 是否邊界 + 可否投票 + 剩餘時間
  Kind 5:<玩家進入活動(報名)>
  Kind 6:<玩家設定預計投票數>
  Kind 7:<購買挑戰權>
  Kind 8:<顯示投票按鈕>
  Kind 9:<玩家可投票數> + 可投票數(4)
  Kind 10:<通知結果> +結果(1) 
    結果1：<投票成功> 已投票數(4)
    結果10:<活動即將結束>
    結果11:<活動結束>
]]--
protocolTable[23][123] = function(data)
  local kind = data:ReadByte();
  if kind == 1 then   
    local fraction = data:ReadByte();
    local votes = data:ReadUInt32();
    local rights = data:ReadUInt32();
    local stakes = data:ReadUInt32();
    UICityScramble.UpdatePlayerInfo(fraction, votes, stakes, rights);
  elseif kind == 2 then
    local fractionCount = data:ReadByte();
    for var = 1, fractionCount do
      local fraction = data:ReadByte();
      local occupiedCount = data:ReadUInt16();   
      UICityScramble.UpdateFractionInfo(fraction, occupiedCount);
    end    
  elseif kind == 3 then
    local cityCount = data:ReadByte();
    for var = 1, cityCount do
      local cityId = data:ReadUInt16();
      local currentFraction = data:ReadByte();
      UICityScramble.UpdateCityInfo(cityId, currentFraction);
    end
    UICityScramble.SetAllBoundary();
  elseif kind == 4 then
    local cityId = data:ReadUInt16();
    local originalFraction = data:ReadByte();
    local currentFraction = data:ReadByte();
    UICityScramble.UpdateCitySingleInfo(cityId, currentFraction, originalFraction);
    local cityCount = data:ReadByte();
    for var = 1, cityCount do
      local fraction = data:ReadByte();
      local fractionVotes = data:ReadUInt32();   
      UICityScramble.UpdateCityVoteInfo(fraction, fractionVotes);
    end
    local canVote = data:ReadBoolean();
    UICityScramble.UpdatePlaceStakeClick(canVote);
    UICityScramble.ShowSingleCity();
  elseif kind == 5 then 
    UI.Open(UICityScramble);
  elseif kind == 6 then   
    UICityScramble.DoFight();
  elseif kind == 7 then
    UICityScramble.BuyChallengeRight();
  elseif kind == 8 then
    UICityScramble.OnClick_PlaceStake();
  elseif kind == 9 then
    local votable = data:ReadUInt32();
    UICityScramble.SetVotableNum(votable);
  elseif kind == 10 then
    local outcome = data:ReadByte();
    if (outcome < 10) or (outcome > 11) then
      UI.Open(UICityScramble);
    end
    if outcome == 1 then
      local addVotes = data:ReadUInt32();
      CGTimer.DoFunctionDelay(1.5, UICityScramble.ShowAddVoteSuccess);
      ShowCenterMessage(string.format(string.Get(22941), addVotes));
    elseif outcome == 10 then
      ShowCenterMessage(string.Get(22938));      
    elseif outcome == 11 then
      UI.Close(UICityScramble);
    else
      ShowCenterMessage(string.Get(22942));
    end
  elseif kind == 11 then
    UICityScramble.UpdatePie(data);
  elseif kind == 20 then
    local min = data:ReadUInt16();
    ShowCenterMessage(min);
  end
end

--[[ 穿上外顯時裝結果
S:023-124 <穿上外顯時裝結果> 結果(1)
  結果 0:成功 { 物品ID(2)}
  結果 1:失敗 2:收集冊無此物品 3:非時裝物品 4:無此物品 5:部位索引錯誤 6:收集冊無此ID
]]--
protocolTable[23][124] = function(data)
  local result = data:ReadByte();
  
  if result == 0 then
    local itemId = data:ReadUInt16();
    if itemDatas[itemId] == nil then return end
    Item.SetBagItem(EThings.Equip, itemDatas[itemId].fitType + Role.maxOutfitStyle, itemDatas[itemId], true);
    ShowCenterMessage(string.Concat(itemDatas[itemId]:GetName(true), string.Get(50023)));
  else
    logError(string.Concat("Protocol 23-124 Fail !! Error Code = ", result));
  end
  
  if UI.IsVisible(UIItemInfo) then
    UI.Close(UIItemInfo);
  end
  
  if UI.IsVisible(UIBag) then
    UIBag.UpdateUI(true);
  end
end

--[[ 脫下外顯時裝結果
S:023-125 <脫下外顯時裝結果> 結果(1)
  結果 0:成功 { 部位索引(1) }
  結果 1:失敗
]]--
protocolTable[23][125] = function(data)
  local result = data:ReadByte();
  
  if result == 0 then
    local oriFitType = data:ReadByte();
    local fitType = oriFitType + EItemFitType.Equip_Spec + Role.maxOutfitStyle;
    local oldItemId = Item.GetBagItem(EThings.Equip, fitType).Id;
    Item.SetBagItem(EThings.Equip, fitType, nil, true);
    ShowCenterMessage(string.Concat(itemDatas[oldItemId]:GetName(true), string.Get(50024)));
  elseif result == 1 then
    logError("Protocol 23-125 Fail");
  end
  
  if UI.IsVisible(UIItemInfo) then
    UI.Close(UIItemInfo);
  end

  if UI.IsVisible(UIBag) then
    UIBag.UpdateUI(true)
  end
end

--[[ 從背包直接穿上外顯時裝結果
S:023-126 <從背包直接穿上外顯時裝結果> 結果(1)
  結果 1:成功
]]--
protocolTable[23][126] = function(data)
  UIStatus.StoreOutfitStyleFromBag(data);
  
  if UI.IsVisible(UIItemInfo) then
    UI.Close(UIItemInfo);
  end
end

--[[ 收藏策一鍵穿上外顯時裝結果
S:023-127 <穿上外顯時裝結果> +數量(1) <<+物品ID(2)>>
]]--
protocolTable[23][127] = function(data)
  local count = data:ReadByte();
  local itemId = 0;
  for i = 1, count do
    itemId = data:ReadUInt16();
    if itemDatas[itemId] == nil then return end
    Item.SetBagItem(EThings.Equip, itemDatas[itemId].fitType + Role.maxOutfitStyle, itemDatas[itemId], true);
    ShowCenterMessage(string.Concat(itemDatas[itemId]:GetName(true), string.Get(50023)));
  end
end

--[[ 充值暢玩卡
S:023-133 <充值暢玩卡結果> +結果(1)
  結果 1:成功 +時間(8)
  結果 2:失敗 +原因(1)
]]--
protocolTable[23][133] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    DrugBuff.SetTimeBuff(ETimeBuff.VipBenefit, data:ReadDouble());
    
  elseif result == 2 then
    local cause = data:ReadByte();

    if cause == 1 then
      ShowCenterMessage(string.Get(40390));
    elseif cause == 2 then
      ShowCenterMessage(string.Get(80463));
    end
  end
end

--[[ 充值經驗加倍結果
S:023-134 <充值經驗加倍結果> +結果(1)
  結果 1:成功 +時間(8)
  結果 2:失敗 +原因(1)
]]--
protocolTable[23][134] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    DrugBuff.SetTimeBuff(ETimeBuff.DoubleExp, data:ReadDouble());

  elseif result == 2 then
    local cause = data:ReadByte();

    if cause == 1 then
      ShowCenterMessage(string.Get(2000));
    end
  end
end

--[[ 各種到期時間
S:023-135 <各種到期時間> +結果(1) +種類(1)
  結果 1:成功 +時間(8)
  結果 2:失敗
]]--
protocolTable[23][135] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    local kind = data:ReadByte();

    if kind == 1 then
      DrugBuff.SetTimeBuff(ETimeBuff.VipBenefit, data:ReadDouble());
    elseif kind == 2 then
      DrugBuff.SetTimeBuff(ETimeBuff.EquipProtect, data:ReadDouble());
    elseif kind == 3 then
      DrugBuff.SetTimeBuff(ETimeBuff.DoubleExp, data:ReadDouble());
    end

  elseif result == 2 then
    local cause = data:ReadByte();

    if cause == 1 then
      ShowCenterMessage(string.Get(40390));
    elseif cause == 2 then
      ShowCenterMessage(string.Get(80463));
    end
  end
  
end

--[[ 所有禮物箱物品
S:023-145 <所有禮物箱物品> +大小(2) +數量(2) <<+索引(4) +種類(1) +物品資料(16) +存放天數(2) +開始時間(8)>>
]]--
protocolTable[23][145] = function(data)
  --LH_GiftBoxForm.RecvInitData(Data);
end

--[[ 增加禮物箱物品
S:023-146 <增加禮物箱物品> +索引(4) +種類(1) +物品資料(16) +存放天數(2) +開始時間(8)
]]--
protocolTable[23][146] = function(data)
  --LH_GiftBoxForm.RecvAddItem(Data);
end

--[[ 刪除禮物箱物品
S:023-147 <刪除禮物箱物品> +索引(4)
]]--
protocolTable[23][147] = function(data)
  --LH_GiftBoxForm.RecvDelItem(Data);
end

--[[ 時裝合成結果
S:023-148 <時裝合成結果> +結果(1)
  結果 1:成功 +背包索引(1)
  結果 2:失敗 +背包索引(1)
  結果 3:功能未開放
  結果 4:功能未開放
]]--
protocolTable[23][148] = function(data)
  --FMixStoneMenu.RevMixStyleResult(Data);
end

--[[玩家獲得物品訊息
S:023-149 <獲得物品訊息> +數量(2) <<+索引(2) +物品ID(2) +物品數量(4)>>
]]--
protocolTable[23][149] = function(data)
  local count = data:ReadUInt16();
  local itemData, quant;

  for i = 1, count do
    Item.SetItemRedDot(EThings.Bag, data:ReadUInt16());

    itemData = itemDatas[data:ReadUInt16()];
    quant = data:ReadUInt32();

    if itemData ~= nil then
      local messageText = string.Concat(string.Get(40049), quant, string.Get(40050), itemData:GetName(true));
      local chatText = string.format(string.Get(21179), itemData:GetName(true), quant);
      if UIExpSlotMachine.Sacrificing() then
        local text = {};
        text.messageText = messageText;
        text.chatText = chatText;
        Requiem.AppendMessage(text);
      else
        ShowCenterMessage(messageText);
        Chat.AddMessage(EChannel.System, chatText);
      end
    end
  end

  Item.UpdateUI(EThings.Bag, 0, true);
end

--[[
S:023-150 <商城抽卡結果> 數量(2) + <<物品ID(2) +物品數量(4)>>
]]--
protocolTable[23][150] = function(data)
  Mall.ReciveDoroData(data);
end

--[[玩家獲得物品訊息
S:023-151 <獲得禮包rolecount> +數量(2) <<物品ID(2) +物品數量(4)+索引(2) +數值(4) +上限(4)>>
]]--
protocolTable[23][151] = function(data)
  local count = data:ReadUInt16();
  local itemData, quant;
  for i = 1, count do
    itemData = itemDatas[data:ReadUInt16()];
    quant = data:ReadUInt32();
    RoleCount.Set(data:ReadUInt16(), data:ReadInt32(), data:ReadInt32(), i == count);
    if itemData ~= nil then
      ShowCenterMessage(string.format(string.Get(21391), itemData:GetName(true), quant));
      Chat.AddMessage(EChannel.System, string.format(string.Get(21391), itemData:GetName(true), quant));
    end
  end
end

--[[玩家獲得物品訊息
S:023-152 <獲得禮包金錢> +數量(2) <<+物品ID(2) +物品數量(4)>>
]]--
protocolTable[23][152] = function(data)
  local count = data:ReadUInt16();
  local itemData, quant;
  for i = 1, count do
    local itemId = data:ReadUInt16()
    itemData = itemDatas[itemId];
    quant = data:ReadUInt32();

    if itemId == 65351 then
      Role.AddPlayerGold(quant);
    end

    local unit = itemData.attribute[1];
    if itemData ~= nil and unit ~= nil then
      ShowCenterMessage(string.format(string.Get(21391), itemData:GetName(true), quant * unit.value));
      Chat.AddMessage(EChannel.System, string.format(string.Get(21391), itemData:GetName(true), quant * unit.value));
    end
  end
end

--[[玩家獲得獎勵訊息
S:023-153 <獲得獎勵> +活動種類(1) +ID(2) +數量(2) <<+物品ID(2) +物品數量(4)>>
                     活動種類 1 : 祭祀
]]
protocolTable[23][153] = function(data)
  local awardKind = data:ReadByte();
  if awardKind == 1 then
    Requiem.ReceiveSacrificeAward(data);
  end
end



--[[ 標記
]]--
protocolTable[24] = {}

--[[ 新增任務步驟
S:024-001 <新增任務步驟> +任務ID(2) +步驟增加值(1)
]]--
protocolTable[24][1] = function(data)
  MarkManager.AddMissionStep(data:ReadUInt16(), data:ReadByte());
end

--[[ 減少任務步驟
S:024-002 <減少任務步驟> +任務ID(2) +步驟減少值(1)
]]--
protocolTable[24][2] = function(data)
  MarkManager.DecMissionStep(data:ReadUInt16(), data:ReadByte());
end

--[[ 任務已滿訊息
S:024-003 <任務已滿訊息>
]]--
protocolTable[24][3] = function(data)
  ShowCenterMessage(string.Get(30032), 2);
end

--[[ 刪除任務
S:024-004 <刪除任務> +任務ID(2)
]]--
protocolTable[24][4] = function(data)
  MarkManager.RemoveMission(data:ReadUInt16());
end

--[[ 設定任務標記
S:024-005 <設定任務標記> +數量(4) <<+標記索引(2) +標記值(1)>>
]]--
protocolTable[24][5] = function(data)
  local count = data:ReadUInt32();
  for i = 1, count do
    MarkManager.SetMissionFlag(data:ReadUInt16(), data:ReadBoolean(), i == count);
  end
end

--[[ 初始化任務步驟
S:024-006 <初始化任務步驟> +數量(4) <<+索引(1) +任務ID(2) +步驟值(1)>>
]]--
protocolTable[24][6] = function(data)
  MarkManager.InitMissionStep(data);
end

--[[ 初始化任務標記
S:024-007 <初始化任務標記> +數量(2) <<+標記索引(2) +標記值(1)>>
]]--
protocolTable[24][7] = function(data)
  MarkManager.InitMissionFlag(data);
end

--[[ 設定衰神福神
S:024-008 <設定衰神福神> +玩家ID(8)  +小精靈種類(2) +次數(4)
]]--
protocolTable[24][8] = function(data)
  local roleId = data:ReadInt64();

  if Role.players[roleId] == nil then return end

  Role.players[roleId]:SetGhost(data:ReadUInt16(), data:ReadInt32());
  
  if UI.IsVisible(UIElf) then
    UIElf.UpdateCount();
  end
end

--[[ 交易
C:025-001 <交易物品> +玩家ID(8)
C:025-002 <交易物品上傳> +交易金額(4) <<+交易物品背包索引(2)>>
C:025-003 <交易物品確認> +結果(1)
  結果 1:同意
  結果 2:拒絕
C:025-010 <交易武將> +玩家ID(8)
C:025-011 <交易武將上傳> +交易金額(4)+交易武將索引(1)
C:025-012 <交易武將確認> +結果(1)
  結果 1:同意
  結果 2:拒絕
C:025-020 <發送快遞> +快遞ID(4) +玩家ID(8) <<+索引(1) +數量(1)>>*5
C:025-021 <取消快遞>
C:025-031 <情人送禮> +玩家ID(8)
C:025-041 <檢查碼> +檢查碼(1)
C:025-042 <活動檢查碼> +檢查碼(1)
]]--
protocolTable[25] = {}

--[[ 交易物品開始
S:025-001 <交易物品開始> +玩家ID(8)
]]--
protocolTable[25][1] = function(data)
  local roleId = data:ReadInt64();

  if Role.players[roleId] == nil then return end

  UI.Open(UITrade, EUITrade.Item, roleId);
end

--[[ 交易物品取消
S:025-002 <交易物品取消> +原因(1)
]]--
protocolTable[25][2] = function(data)
  local result = data:ReadByte();

  if result == 0 then
    ShowCenterMessage(string.Get(40010), 3);
  elseif result == 1 then
    ShowCenterMessage(string.Get(40011), 3);
  elseif result == 2 then
    ShowCenterMessage(string.Get(40012), 3);
  elseif result == 3 then
    ShowCenterMessage(string.Get(40013), 3);
  elseif result == 4 then
    ShowCenterMessage(string.Get(40014), 3);
  elseif result == 5 then
    ShowCenterMessage(string.Get(40015), 3);
  elseif result == 6 then
    ShowCenterMessage(string.Get(40016), 3);
  elseif result == 7 then
    ShowCenterMessage(string.Get(40017), 3);
  elseif result == 8 then
    ShowCenterMessage(string.Get(40018), 3);
  else
    ShowCenterMessage(string.Get(40019), 3);
  end
  
  UI.Close(UITrade);
end

--[[ 交易物品確認
S:025-003 <交易物品確認> +金錢(4) <<+物品ID(2) +數量(1) +損壞度(1) +屬性(1) +屬性值(1) +抵抗(1) +成長值(4)>>
]]--
protocolTable[25][3] = function(data)
  if UI.IsVisible(UITrade) then
    UITrade.UpdateTarget(data);
  end
end

--[[ 交易武將開始
S:025-010 <交易武將開始> +玩家ID(8)
]]--
protocolTable[25][10] = function(data)
  local roleId = data:ReadInt64();

  if Role.players[roleId] == nil then return end

  UI.Open(UITrade, EUITrade.Npc, roleId);
end

--[[ 交易武將取消
S:025-011 <交易武將取消> +原因(1)
]]--
protocolTable[25][11] = function(data)
  local result = data:ReadByte();

  if result == 0 then
    ShowCenterMessage(string.Get(40010), 3);
  elseif result == 1 then
    ShowCenterMessage(string.Get(40011), 3);
  elseif result == 2 then
    ShowCenterMessage(string.Get(40012), 3);
  elseif result == 3 then
    ShowCenterMessage(string.Get(40013), 3);
  elseif result == 4 then
    ShowCenterMessage(string.Get(40014), 3);
  elseif result == 5 then
    ShowCenterMessage(string.Get(40015), 3);
  elseif result == 6 then
    ShowCenterMessage(string.Get(40016), 3);
  elseif result == 7 then
    ShowCenterMessage(string.Get(40017), 3);
  elseif result == 8 then
    ShowCenterMessage(string.Get(40018), 3);
  elseif result == 9 then
    ShowCenterMessage(string.Get(40071), 3);
  elseif result == 10 then
    ShowCenterMessage(string.Get(40081), 3);
  elseif result == 11 then
    ShowCenterMessage(string.Get(40083), 3);
  elseif result == 12 then
    ShowCenterMessage(string.Get(40304), 3);
  elseif result == 13 then
    ShowCenterMessage(string.Get(40414), 3);
  elseif result == 14 then
    ShowCenterMessage(string.Get(40429), 3);
  elseif result == 15 then
    ShowCenterMessage(string.Get(80285), 3);
  elseif result == 16 then
    local followIndex = data:ReadByte();
    local followNpc = Role.GetRole(EHuman.FollowNpc, Role.playerId, followIndex);
    
    if followNpc == nil then return end

    ShowCenterMessage(string.format(string.Get(80286), RofollowNpc.name)..followNpc.data.worldBossBuff:ToString("yyyy/MM/dd HH:mm:ss"), 3);
  else
    ShowCenterMessage(string.Get(40019), 3);
  end
  
  UI.Close(UITrade);
end

--[[ 交易武將確認
S:025-012 <交易武將確認> +金錢(4) +NPCID(2) +等級(1) +MaxHp(2) +Hp(2) +MaxSp(2) +Sp(2) +L(1) +名字(L) <<+物品ID(2)>>
]]--
protocolTable[25][12] = function(data)
  if UI.IsVisible(UITrade) then
    UITrade.UpdateTarget(data);
  end
end

--[[ 收發快遞
S:025-020 <收發快遞> +NPCID(4) +模式(1)
]]--
protocolTable[25][20] = function(data)
  local npcId = data:ReadInt64();
  local mode = data:ReadByte();

  if mode == 1 then
    Social.StartDeliver(npcId);
  elseif mode == 2 then
    Social.StopDeliver(npcId);
  end
end

--[[ 快遞演出
S:025-021 <快遞演出> +NPCID(4) +模式(1)
]]--
protocolTable[25][21] = function(data)
  local npcId = data:ReadInt64();
  local mode = data:ReadByte();

  if mode ~= 4 then return end

  Social.PlayDeliver(npcId, mode);
end

--[[ 快遞相關訊息
S:025-022 <快遞相關訊息> +種類(1)
]]--
protocolTable[25][22] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    ShowCenterMessage(itemDatas[data:ReadUInt16()]:GetName(true)..string.Get(40214));
  elseif result == 2 then
    ShowCenterMessage(string.Get(40215));
  elseif result == 3 then
    ShowCenterMessage(string.Get(40216));
  elseif result == 4 then
    ShowCenterMessage(string.Get(40217));
  elseif result == 5 then
    ShowCenterMessage(string.Get(40229));
  elseif result == 6 then
    ShowCenterMessage(string.Get(40230));
  end
end

--[[ 收發快遞訊息
S:025-023 <收發快遞訊息> +種類(1) +L(1) +名字(L) +物品ID(2) +數量(1)
]]--
protocolTable[25][23] = function(data)
  local kind = data:ReadByte();
  local name = data:ReadString(data:ReadByte());
  local itemId = data:ReadUInt16();
  local count = data:ReadByte();

  if kind == 1 then
    local message = name..string.Get(40219)..itemDatas[itemId]:GetName(true).." "..count..string.Get(40220);
    ShowCenterMessage(message);
    Chat.AddMessage(EChannel.System, message);

  elseif kind == 2 then
    local message = string.Get(40221)..name..itemDatas[itemId]:GetName(true).." "..count..string.Get(40220);
    ShowCenterMessage(message);
    Chat.AddMessage(EChannel.System, message);
  end
end

--[[ 目前快遞進度
S:025-024 <目前快遞進度> +進度(1)
]]--
protocolTable[25][24] = function(data)
  Social.SetDeliverIndex(data:ReadByte());
end

--[[ 送花相關訊息
S:025-031 <送花相關訊息> +種類(1)
]]--
protocolTable[25][31] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    Chat.AddMessage(EChannel.System, string.Get(40316));
  elseif result == 2 then
    Chat.AddMessage(EChannel.System, string.Get(40319));
  elseif result == 3 then
    ShowCenterMessage(string.Get(40321));
  end
end

--[[ 收到送花
S:025-032 <收到送花> +L(1) +名字(L)
]]--
protocolTable[25][32] = function(data)
  Chat.AddMessage(EChannel.System, string.Get(40317)..data:ReadString(data:ReadByte())..string.Get(40318));
end

--[[ 送花演出
S:025-033 <送花演出> +NPCID(4) +模式(1)
]]--
protocolTable[25][33] = function(data)
  local npcId = data:ReadInt64();
  local mode = data:ReadByte();

  --[[
  if FlowerBado=nil then
    FlowerBado:= THuman.Create(-1);

  FlowerBado.LoadFromNpcID(aNpcID);
  FlowerBado.Speed:=FlowerBado_Speed;
  FlowerBado.Shrink:=5;
  FlowerBado.Faint_Kind:=Status_Shrink;
  
  case FlowerBadoMode of
    FlowerBado_OutInMe:
      begin
        FlowerBado.Arrive:=False;
        FlowerBado.MapX:=MapX;
        FlowerBado.MapY:=MapY;
        FlowerBado.ShowX:=ShowX;
        FlowerBado.ShowY:=ShowY;
        FlowerBado.ObjX:=Ground.MapWidth;
        FlowerBado.ObjY:=MapY;
        FlowerBado.Rj:= FlowerBado.Direction2(FlowerBado.MapX, FlowerBado.MapY, FlowerBado.ObjX, FlowerBado.ObjY);
      end
    FlowerBado_InOutMe:
      begin
        FlowerBado.Arrive:=False;
        FlowerBado.MapX:=MapX+400;
        FlowerBado.MapY:=MapY;
        FlowerBado.ShowX:=ShowX+400;
        FlowerBado.ShowY:=ShowY;
        FlowerBado.ObjX:=MapX;
        FlowerBado.ObjY:=MapY;
        FlowerBado.Rj:= FlowerBado.Direction2(FlowerBado.MapX, FlowerBado.MapY, FlowerBado.ObjX, FlowerBado.ObjY);
      end
  end
  ]]--
end

--[[ 所有送花資訊
S:025-034 <所有送花資訊> <<+玩家ID(8) +物品ID(2)>>
]]--
protocolTable[25][34] = function(data)
  while data.length > 0 do
    local roleId = data:ReadInt64();
    local itemId = data:ReadUInt16();
    
    if Role.players[roleId] ~= nil then
      Role.players[roleId]:SetFlower(itemId);
    end
  end
end

--[[ 檢查碼
S:025-041 <檢查碼> +檢查碼(1)
]]--
protocolTable[25][41] = function(data)
  local code = data:ReadByte();

  Network.cheatSoftCode = bit.bxor(bit.band(Role.player:GetAttribute(EAttribute.KillNum), 255), Network.cheatSoftXOR);

  --C:025-041 檢查碼 + CheatCode(1)
  sendBuffer:Clear()
  sendBuffer:WriteByte(Network.cheatSoftCode);
  Network.Send(25, 41, sendBuffer);
end

--[[ 活動檢查碼
S:025-042 <活動檢查碼>
]]--
protocolTable[25][42] = function(data)
  local index_And = data:ReadByte();
  local index_Xor = data:ReadByte();

  if index_And == 0 then return end
  if index_Xor == 0 then return end

  --C:025-042 <活動檢查碼> +檢查碼(1)
  sendBuffer:Clear();
  sendBuffer:WriteByte(bit.bxor(bit.band(Role.player:GetAttribute(EAttribute.KillNum), Network.activityAndCode[index_And]), Network.activityXorCode[index_Xor]));
  Network.Send(25, 42, sendBuffer);
end

--[[ 金錢
]]--
protocolTable[26] = {}

--[[ 增加金錢
S:026-001 <增加金錢> +金錢(4)
]]--
protocolTable[26][1] = function(data)
  Role.AddPlayerGold(data:ReadInt32());
end

--[[ 減少金錢
S:026-002 <減少金錢> +金錢(4)
]]--
protocolTable[26][2] = function(data)
  Role.DelPlayerGold(data:ReadInt32());
end

--[[ 金錢容量已滿
S:026-003 <金錢容量已滿>
]]--
protocolTable[26][3] = function(data)
  local kind = data:ReadByte();
  if kind == 1 then
    ShowCenterMessage(string.Get(71015), 2);
  elseif kind == 2 then    
    ShowCenterMessage(string.Get(30033), 2);
  end
end

--[[ 初始化金錢
S:026-004 <初始化金錢> +金錢(4) +拍賣金錢(4)
]]--
protocolTable[26][4] = function(data)
  Role.ReceivePlayerGold(data);
end

--[[ 增加拍賣金錢
S:026-005 <增加拍賣金錢> +金錢(4)
]]--
protocolTable[26][5] = function(data)
  Role.AddPlayerSaleGold(data:ReadInt32());
end

--[[ 減少拍賣金錢
S:026-006 <減少拍賣金錢> +金錢(4)
]]--
protocolTable[26][6] = function(data)
  Role.DelPlayerSaleGold(data:ReadInt32());
end

--[[ 金錢相關訊息
S:026-007 <金錢相關訊息> +訊息種類(1)
]]--
protocolTable[26][7] = function(data)
  local result = data:ReadByte();
  
  if result == 1 then
    ShowCenterMessage(string.Get(40397));
  end
end

--[[ 增加水兵值
S:026-008 <增加水兵值> +增加水兵值(2)
]]--
protocolTable[26][8] = function(data)
  Warship.AddSailor(Role.playerId, value);
end

--[[ 增加財寶值
S:026-009 <增加財寶值> +財寶值(2)
]]--
protocolTable[26][9] = function(data)
  Warship.AddJewel(Role.playerId, value);
end

--[[ 增加彈藥值
S:026-010 <增加彈藥值> +彈藥值(2)
]]--
protocolTable[26][10] = function(data)
  Warship.AddArms(Role.playerId, value);
end

--[[ NPC買賣
C:027-001 <買東西> +索引(1) +數量(4)
C:027-002 <賣東西> +len(1) +<<背包索引(2) +數量(4)>>
C:027-003 <賣東西隨身雜貨商> +len(1) +<<背包索引(2) +數量(4)>>
]]--
protocolTable[27] = {}

--[[ 買東西相關訊息
S:027-001 <買東西相關訊息> +種類(1)
]]--
protocolTable[27][1] = function(data)
  local result = data:ReadByte();

  if result == 0 then
    ShowCenterMessage(string.Get(30036), 2);
  elseif result == 1 then
    ShowCenterMessage(string.Get(30037), 2);
  elseif result == 2 then
    ShowCenterMessage(string.Get(30038), 2);
  elseif result == 3 then
    ShowCenterMessage(string.Get(30039), 2);
  elseif result == 4 then
    ShowCenterMessage(string.Get(30040), 2);
  elseif result == 6 then
    ShowCenterMessage(string.Get(40019), 2);
  end
end

--[[ 賣東西相關訊息
S:027-002 <賣東西相關訊息> ) 種類(1) +len(1) +<<背包索引(2)>>
]]--
protocolTable[27][2] = function(data)
  local result, bagIndex;

  result = data:ReadByte();
  if result == 0 then
    ShowCenterMessage(string.Get(30036), 2);
  elseif result == 1 then
    ShowCenterMessage(string.Get(30041), 2);
  elseif result == 2 then
    ShowCenterMessage(string.Get(30042), 2);
  elseif result == 3 then
    ShowCenterMessage(string.Get(30043), 2);
  elseif result == 4 then
    ShowCenterMessage(string.Get(30044), 2);
  elseif result == 6 then
    ShowCenterMessage(string.Get(40019), 2);
  elseif result == 10 then
    ShowCenterMessage(string.Get(10132), 2);
  elseif result == 11 then
    ShowCenterMessage(string.Get(10133), 2);
  elseif result == 12 then
    ShowCenterMessage(string.Get(10134), 2);
  elseif result == 13 then
    ShowCenterMessage(string.Get(21226), 2); --沒有開啟隨身商人
  elseif result == 14 then
    ShowCenterMessage(string.Get(21970), 2); --物品關閉 
  end

  local count = data:ReadByte();
  for i = 1, count do
    bagIndex = data:ReadUInt16();

    if UI.IsVisible(UINpcStore) then
      UINpcStore.ReciveSellResult(result, bagIndex);
    end
  end

  if UI.IsVisible(UINpcStore) then
    UINpcStore.UpdateUI(true);
  end

  if result == 0 and UI.IsVisible(UINpcStore) then
    UI.Close(UINpcStore);
  end
end

--[[ 賣東西
S:27-3 開啟商店NPC介面 +Kind(1)[1.事件 2.隨身雜貨商]
]]--
protocolTable[27][3] = function(data)
--  UI.Open(UIStatus, EUIStatusTag.Sell); --狀態介面的賣出
  if UI.IsVisible(UIStatus) then
    UI.Close(UIStatus);
  end

  if UI.IsVisible(UIItemInfo) then
    UI.Close(UIItemInfo);
  end

  UI.Open(UINpcStore, data:ReadByte());
end

--[[ 技能升級
C:028-001 <玩家技能升級> <<+技能ID(2) +技能等級(1)>>
C:028-002 <武將技能升級> +武將索引(1) +技能ID(2) +技能等級(1)
C:028-005 <二轉技能升級> +長度(4) <<+還不知道是啥(1)>> +長度(4) <<+技能ID(2) +技能等級(1)>> +長度(4) <<+不知道是啥索引(1) +技能ID(2)>>
]]--

--[[ 錢莊相關
]]--
protocolTable[29] = {}

--[[ 開啟錢莊
S:029-006 <開啟錢莊>
]]--
protocolTable[29][6] = function(data)
  UI.Open(UIBank, EBankOpenKind.Npc);
end

--[[ 不知道幹嘛的
]]--
protocolTable[29][7] = function(data)
  --BK_MoneyAccountF.DrawBtnAnimated := False;
end

--[[ 不知道幹嘛的
]]--
protocolTable[29][8] = function(data)
  --BK_MoneyAccountF.SaveBtnAnimated := False;
end

--[[ 錢莊等級
S:029-009 <錢莊等級> +等級(1)
]]--
protocolTable[29][9] = function(data)
  Role.SetBankLv(data:ReadByte());
end

--[[ 錢莊物品
C:030-001 <錢莊領物品> <<+索引(2) +數量(4)>>
C:030-002 <錢莊存物品> <<+索引(2) +數量(4)>>
C:030-003 <錢莊升級>
C:030-004 <錢莊2存物品> <<+索引(1)>>
C:030-005 <錢莊2領物品> <<+索引(1)>>
C:030-006 <水戰錢莊存物品> <<+索引(1)>>
C:030-007 <水戰錢莊領物品> <<+索引(1)>>
C:030-008 <關閉錢莊>
]]--
protocolTable[30] = {}

--[[ 錢莊1物品
S:030-001 <錢莊1物品> <<+索引(2) +物品資料(18)>>
]]--
protocolTable[30][1] = function(data)
  while data.length > 0 do
    Item.SetBagItem(EThings.Bank, data:ReadUInt16(), ThingData.New(data), false);
  end
end

--[[ 錢莊1物品
S:030-004 <錢莊1物品> +索引(2) +物品資料(18)
]]--
protocolTable[30][4] = function(data)
  Item.SetBagItem(EThings.Bank, data:ReadUInt16(), ThingData.New(data));
end

--[[ 錢莊1減少物品
S:030-005 <錢莊1減少物品> +索引(2) +減少數量(4)
]]--
protocolTable[30][5] = function(data)
  Item.DelBagItem(EThings.Bank, data:ReadUInt16(), data:ReadInt32());
end

--[[ 不知道幹嘛的
]]--
protocolTable[30][6] = function(data)
end

--[[錢莊操作失敗
S:030-007 <錢莊操作失敗> +失敗結果(1)[3.存入錢莊失敗, 13錢莊已滿]
]]--
protocolTable[30][7] = function(data)
  local kind = data:ReadByte();

  if kind == 3 then
    ShowCenterMessage(string.Get(80359));  --物品欄已滿
  elseif kind == 13 then
    ShowCenterMessage(string.Get(30045));
  end
end

--[[ 清空錢莊1物品
S:030-008 <清空錢莊1物品>
]]--
protocolTable[30][8] = function(data)
  Item.ClearBag(EThings.Bank)
end

--[[ 水戰錢莊增加物品
S:030-012 <水戰錢莊增加物品> +物品資料(16)
]]--
protocolTable[30][12] = function(data)
  --Item.AddBagItem(EThings.Warship, ThingData.New(data));
end

--[[ 水戰錢莊減少物品
S:030-013 <水戰錢莊減少物品> +索引(1) +減少數量(1)
]]--
protocolTable[30][13] = function(data)
  Item.DelBagItem(EThings.Warship, data:ReadByte(), data:ReadByte());
end

--[[ 客棧
C:031-001 <客棧住宿>
C:031-002 <客棧領武將> +客棧索引(1)
C:031-003 <客棧存武將> +身上索引(1)
C:031-004 <客棧交換武將> +客棧索引(1) +身上索引(1)
C:031-005 <水戰刪除船隻> +索引(1)
C:031-006 <水戰出戰船隻> +索引(1)
C:031-007 <水戰恢復水兵>
C:031-008 <水戰恢復彈藥>
C:031-010 <關閉隨身客讚棧>
]]--
protocolTable[31] = {}

--[[ 住宿結果
S:031-001 <住宿結果> +結果(1)
  結果 0:成功
  結果 1:金錢不足
  結果 2:hp已滿
]]--
protocolTable[31][1] = function(data)
  local result = data:ReadByte();

  if result == 0 then
  elseif result == 1 then
    ShowTalkMessage(nil, string.Get(30018), Role.target);
  elseif result == 2 then
    ShowTalkMessage(nil, string.Get(30019), Role.target);
  end

  EventManager.SetConduct(true);
end

--[[ 住宿確認
S:031-002 <住宿確認>
]]--
protocolTable[31][2] = function(data)
  local cost = data:ReadInt32();
  
  if cost > 0 then
    --城規模3的客棧中特別處理
    local cityId = City.GetCityId(SceneManager.sceneId, ECityScene.Inn);
    if cityId ~= 0 and City.cities[cityId].level == 3 then
      cost = 0;
    end
    
    if SceneManager.sceneId == 10991 then
      cost = 0;
    end

    if SceneManager.sceneId == 49909 then
      cost = 0;
    end

    if Migrant.IsArenaScene(SceneManager.sceneId) then
      cost = 0;
    end

    if Survive.kind ~= ESurvive.None then
      cost = 0;
    end

    if Define.FieldBattle then
      if SceneManager.sceneId == 10994 then
        cost = 0;
      end
    end
  else
    if data:ReadByte() == 0 then
      --不需要住宿
      ShowTalkMessage(nil, string.Get(30019), Role.target);
      EventManager.SetConduct(true);
      return;
    end
  end

  ShowCheckMessage(
    function(result)
      if result then
        --C:031-001 <住宿>
        Network.Send(31, 1);
      else
        ShowTalkMessage(nil, string.Get(30001), Role.target);
        EventManager.SetConduct(true);
      end
    end,
    string.Get(30026)..cost..string.Get(30027),
    Role.target
  );
end

--[[ 客棧存武將
S:031-003 <客棧存武將> +客棧索引(1) +身上索引(1)
]]--
protocolTable[31][3] = function(data)
  Inn.SaveNpc(data:ReadByte(), data:ReadByte());
end

--[[ 客棧刪武將
S:031-004 <客棧刪武將> +客棧索引(1)
]]--
protocolTable[31][4] = function(data)
  Inn.RemoveNpc(data:ReadByte());
end

--[[ 客棧武將資料
S:031-006 <客棧武將資料> <<+客棧索引(1) +NPCID(2) +等級(1) +HP(4) +L(1) +名字(L) +武將狀態(1)>>
]]--
protocolTable[31][6] = function(data)
  while data.length > 0 do
    Inn.SaveNpc(data:ReadByte(), nil, data);
  end
end

--[[ 開啟武將倉庫
S:031-007 <開啟武將倉庫>
]]--
protocolTable[31][7] = function(data)
  if UI.IsVisible(UIItemInfo) then
    UI.Close(UIItemInfo);
  end

  if UI.IsVisible(UIStatus) then
    UI.Close(UIStatus);
  end
  
  UI.Open(UINpcInn);
end

--[[ 已收到領武將協定並停止按鈕動畫
S:031-008 <已收到領武將協定並停止按鈕動畫>
]]--
protocolTable[31][8] = function(data)
end

--[[ 已收到存武將協定並停止按鈕動畫
S:031-009 <已收到存武將協定並停止按鈕動畫>
]]--
protocolTable[31][9] = function(data)
end

--[[ 休息演出
S:031-010 <休息演出> +種類(1)
  種類 1:客棧 2:行軍帳
]]--
protocolTable[31][10] = function(data)
  local kind = data:ReadByte();
  
  UI.Open(UIInn,
    function()
      if kind == 1 then
        ShowTalkMessage(nil, string.Get(30017), Role.target);
      else
      end
    end,
    kind
  );
end

--[[ 已收到交換武將協定並停止動畫
S:031-012 <已收到交換武將協定並停止動畫>
]]--
protocolTable[31][12] = function(data)
end

--[[ 客棧相關訊息
C:031-013 <客棧相關訊息>
]]--
protocolTable[31][13] = function(data)
  ShowCenterMessage(string.Get(30067), 2);
end

--[[ 水戰相關
C:031-014 <水戰相關> +種類(1)
  種類 1:新增水戰船隻 +索引(1) +NPCID(2)
  種類 2:初始水戰船隻
  種類 3:刪除水戰船隻
  種類 4:水戰錢莊物品
]]--
protocolTable[31][14] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    Inn.AddWarship(data:ReadByte(), data:ReadUInt16());
  elseif kind == 2 then
    Inn.InitWarship(data);
  elseif kind == 3 then
    Inn.DelWarship(data:ReadByte());
  elseif kind == 4 then
    while data.length > 0 do
      Item.SetBagItem(EThings.Warship, data:ReadByte(), ThingData.New(data), false);
    end
  end
end

--[[ 客棧等級
S:031-015 <客棧等級> +等級(1)
]]--
protocolTable[31][15] = function(data)
  Inn.Lv = data:ReadByte();
end

--[[ 情感,動作
C:032-001 <使用表情符號> +表情ID(1)
C:032-002 <使用情感動作> +動作ID(1)
C:032-003 <停止情感動作> 
]]--
protocolTable[32] = {}

--[[ 使用表情符號
S:032-001 <使用表情符號> +玩家ID(8) +表情ID(1)
]]--
protocolTable[32][1] = function(data)
  if Role.player.war == EWar.None then
    local roleId = data:ReadInt64();

    if Role.players[roleId] == nil then return end

    Role.players[roleId]:PlayEmoji(data:ReadByte());
  else
    --[[
    idx:=FindID(FConnect.CharToInt(Copy(Data, 2, 4)));
    if idx<>-1 then
    begin
      aEmotion:=Ord(Data[6]);
      FightHum[idx].SetEmotion(aEmotion);
    end
    ]]--
  end
end

--[[ 使用情感動作
S:032-002 <使用情感動作> <<+玩家ID(8) +動作ID(1)>>
]]--
protocolTable[32][2] = function(data)
  while data.length > 0 do
    local roleId = data:ReadInt64();
    local roleRj = data:ReadByte();

    if Role.players[roleId] ~= nil then
      Role.players[roleId]:SetAnimationForceId(Role.RjToAnimationId(roleRj));
    end
  end
end

--[[ PK
C:033-001 <PK開關> +PK開關(1)
C:033-002 <參戰開關> +參戰開關(1)
C:033-003 <登入公告> 開關(1)
]]--
protocolTable[33] = {}

--[[ 要求PK
S:033-001 <要求PK> +結果(1)
  結果 1:對方未開PK開關
  結果 2:對方未開參戰開關
  結果 3:對方戰鬥問答中
  結果 4:特殊戰鬥不能參戰
  結果 5:城門戰,不同盟不能參戰
  結果 6:城門戰,不同軍團不能參戰
  結果 7:該玩家目前在住宿中
  結果 8:此場景不可參戰
  結果 9:同盟不可PK
  結果10:對方無敵狀態中,無法攻擊
]]--
protocolTable[33][1] = function(data)
  local result = data:ReadByte();
  
  if result == 1 then
    ShowCenterMessage(string.Get(20700));
  elseif result == 2 then
    ShowCenterMessage(string.Get(20701));
  elseif result == 3 then
    ShowCenterMessage(string.Get(60025));
  elseif result == 4 then
    ShowCenterMessage(string.Get(60026));
  elseif result == 5 then
    ShowCenterMessage(string.Get(60036));
  elseif result == 6 then
    ShowCenterMessage(string.Get(60037));
  elseif result == 7 then
    ShowCenterMessage(string.Get(40296));
  elseif result == 8 then
    ShowCenterMessage(string.Get(80095));
  elseif result == 9 then
    ShowCenterMessage(string.Get(80500));
  elseif result == 10 then
    ShowCenterMessage(string.Get(21968));
  end
end

--[[ 設定PVP開關
S:033-002 <設定PVP開關> +PK開關(1) +參戰開關(1)
]]--
protocolTable[33][2] = function(data)
  Setting.pkEnable = data:ReadBoolean();
  Setting.client.playOneEnable = data:ReadBoolean();

  if UI.IsVisible(UISetting) then
    UISetting.UpdateUI();
  end
end

--[[ 點數
C:034-001 <查詢點數>
]]--
protocolTable[34] = {}

--[[ 剩餘點數訊息
S:034-001 <剩餘點數訊息> +點數(2)
]]--
protocolTable[34][1] = function(data)
  ShowCenterMessage(string.Get(20705).."\n"..tostring(data:ReadUInt16())..string.Get(20562), 2);
end

--[[ 更新計費方式
S:034-002 <更新計費方式> +計費方式(1) +剩餘點數(2) +包月日期(?)
]]--
protocolTable[34][2] = function(data)
  if Define.Free then return end

  local kind = data:ReadByte();
  local point = data:ReadUInt16();

  if kind == 1 then
    local startTime = data:ReadString(data.length);
    local endTime = startTime + 30;

    local message = string.Get(60005);
    message = message.."\n"..string.Get(60006)..startTime..string.Get(60007)..endTime..string.Get(60008);
    message = message.."\n"..string.Get(60009)..tostring(point)..string.Get(60010);

    ShowCenterMessage(message, 5);
  elseif kind == 2 then
    local startTime = data:ReadString(data.length);
    local endTime = startTime + 30;

    local message = string.Get(60011);
    message = message.."\n"..string.Get(60006)..startTime..string.Get(60007)..endTime..string.Get(60008);
    message = message.."\n"..string.Get(60012)..tostring(point)..string.Get(60013);

    ShowCenterMessage(message, 5);
  elseif kind == 3 then
    local message = string.Get(60014);
    message = message.."\n"..string.Get(60015)..tostring(monCharge)..string.Get(60013);
    message = message.."\n"..string.Get(60009)..tostring(point)..string.Get(60013);
    message = message.."\n"..string.Get(60016)..tostring(monCharge - point)..string.Get(60013);

    ShowCenterMessage(message, 5);
  end
end

--[[ 帳號
C:035-001 <修改密碼暗碼> +L(1) +密碼(L) +L(1) +新密碼(L) +L(1) +暗碼(L) +L(1) +新暗碼(L)
C:035-002 <刪除角色> +L(1) +密碼(L) +L(1) +暗碼(L)
C:035-003 <儲值點數> +L(1) +不知道是啥(L) +L(1) +不知道是啥(L) +羽毛種類(1)
C:035-005 <儲值點數> +L(1) +不知道是啥(L) +L(1) +不知道是啥(L) +儲值種類(1)
]]--
protocolTable[35] = {}

--[[ 修改密碼結果
S:035-001 <修改密碼結果> +結果(1)
]]
protocolTable[35][1] = function(data)
  local result = data:ReadByte();

  if result == 0 then
    ShowCenterMessage(string.Get(20663), 2);
    UILoginAward.CheckShowRedDot();
  elseif result == 1 then
    ShowCenterMessage(string.Get(20660), 2);
    Network.password = "123123";
  elseif result == 2 then
    ShowCenterMessage(string.Get(20661), 2);
  elseif result == 3 then
    ShowCenterMessage(string.Get(20662), 2);
  elseif result == 4 then
    ShowCenterMessage(string.Get(20664), 2);
  elseif result == 5 then
    ShowCenterMessage(string.Get(20665), 2);
  end
end

--[[ 刪除角色結果
S:035-002 <刪除角色結果> +結果(1)
]]
protocolTable[35][2] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    ShowCenterMessage(string.Get(20670), 2);
    --Se_ReadMailForm.DeleteAllMsgLog;
    --Se_MemberReForm.DeleteAllMsgLog;
  elseif result == 2 then
    ShowCenterMessage(string.Get(20671), 2);
  elseif result == 3 then
    ShowCenterMessage(string.Get(20672), 2);
  elseif result == 4 then
    ShowCenterMessage(string.Get(20673), 2);
  elseif result == 5 then
    ShowCenterMessage(string.Get(20674), 2);
  end
end

--[[ 儲值結果
S:035-003 <儲值結果> +結果(1)
]]
protocolTable[35][3] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    ShowCenterMessage(string.Get(20680), 2);
    UILoginAward.CheckShowRedDot();
  elseif result == 2 then
    ShowCenterMessage(string.Get(20681), 2);
  elseif result == 3 then
    ShowCenterMessage(string.Get(20682), 2);
  elseif result == 4 then
    ShowCenterMessage(string.Get(20683), 2);
  elseif result == 5 then
    ShowCenterMessage(string.Get(20684), 2);
  elseif result == 6 then
    ShowCenterMessage(string.Get(20685), 2);
  elseif result == 7 then
    ShowCenterMessage(string.Get(40412), 2);
  elseif result == 8 then
    ShowCenterMessage(string.Get(40442), 2);
  end
end

--[[ 顯示剩餘點數
S:035-004 <顯示剩餘點數> +百位(4) +個位(4) +時間(8)
]]--
protocolTable[35][4] = function(data)
  local pointA = data:ReadInt32();
  local pointB = data:ReadInt32();
  local time = data:ReadDouble();

  local message = string.Get(20750)..tostring(pointA * 100 + pointB);

  if not Define.Free then
    if time ~= 0 then
      message = message.."\n"..string.Get(20751)..DateTime.FromOADate(time):ToString("yyyy/MM/dd HH:mm");
    end

    if Define.Indo then
      local expireTime = data:ReadDouble();

      if expireTime ~= 0 then
        message = message.."\n"..string.Get(40413)..DateTime.FromOADate(expireTime):ToString("yyyy/MM/dd HH:mm");
      end
    end
  else
    if Define.Perfect then
      if time ~= 0 then
        message = message.."\n"..string.Get(20751)..DateTime.FromOADate(time):ToString("yyyy/MM/dd HH:mm");
      end
    end
  end
  
  ShowCenterMessage(message, 10);
  Chat.AddMessage(EChannel.System, message);

  Role.SetPoint(pointA * 100 + pointB, false);
end

--[[ 刷新點數
S:035-005 <顯示剩餘點數> +實點(4) +虛點(4
]]--
protocolTable[35][5] = function(data)
  local real = data:ReadUInt32();
  local virtual = data:ReadUInt32();

  Role.SetPoint(real, false);
  Role.SetLockPoint(virtual, false);
end

--[[ 開啟儲值介面
S:035-006 <開啟儲值介面>
]]--
protocolTable[35][6] = function(data)
  --Se_ReFillForm.PopAppear;
end

--[[ 推薦結果
S:035-007 <推薦結果> +結果(1)
]]--
protocolTable[35][7] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    Chat.AddMessage(EChannel.System, string.Get(20692));
    ShowMarqueeMessage(string.Get(20692));
  elseif result == 2 then
    Chat.AddMessage(EChannel.System, string.Get(20693));
    ShowMarqueeMessage(string.Get(20693));
  end
end

--[[ 被推薦五次點數期限
S:035-008 <被推薦五次點數期限> +期限時間(8)
]]--
protocolTable[35][8] = function(data)
  if Define.Free then return end

  local time = data:ReadDouble();
  
  if time ~= 0 then
    ShowCenterMessage(string.Get(20694)..string.Get(20751)..DateTime.FromOADate(time):ToString("yyyy/MM/dd HH:mm"), 10);
  end
end

--[[ 被推薦獲得點數
S:035-009 <被推薦獲得點數> +點數(4) +點數(4) +期限時間(8)
]]--
protocolTable[35][9] = function(data)
  local pointA = data:ReadInt32();
  local pointB = data:ReadInt32();
  local time = data:ReadDouble();

  if time ~= 0 then
    ShowCenterMessage(string.Get(20695)..tostring(pointA)..tostring(pointB).."\n"..string.Get(20751)..DateTime.FromOADate(time):ToString("yyyy/MM/dd HH:mm"), 10);
  else
    ShowCenterMessage(string.Get(20695)..tostring(pointA)..tostring(pointB), 10);
  end
end

--[[ 通知下次能玩的時間
S:035-010 <通知下次能玩的時間> +時間(8)
]]--
protocolTable[35][10] = function(data)
  if not Define.Viet then return end

  Chat.AddMessage(EChannel.System, string.Get(40451)..DateTime.FromOADate(data:ReadDouble()):ToString("yyyy/MM/dd HH:mm"));
end

--[[ 開啟推薦介面
S:035-011 <開啟推薦介面>
]]--
protocolTable[35][11] = function(data)
  if not Define.Viet then return end
  if not Define.Free then return end
  
  --JC_Referee1.Appear;
end

--[[ 平台商店儲值
C:035-012 <儲值> +平台種類(1)        
                            1.安卓 + signature(?) + originalJson(?) + orderId(?) + productId(?)
                            2.蘋果 + base64EncodedTransactionReceipt(?) + orderId(?) + productId(?)
S:035-012 <儲值結果> + 結果(1) + orderId(?)
]]--
protocolTable[35][12] = function(data)
  IAP.ReciveReciptResult( data:ReadByte(), data:ReadString( data:ReadUInt16() ) );
end

--[[ 更新數值貨幣
S:035-050 <更新數值貨幣> +貨幣種類(1)+值(4)
]]--
protocolTable[35][50] = function(data)
  Role.SetPlayerCurrency(data:ReadByte(), data:ReadUInt32())
  
  if UI.IsVisible(UIMain) then
    UIMain.UpdateMoney();
  end
end

--[[ SERVER啟動型介面
C:036-001 <留言板新增訊息> +訊息(?)
C:036-002 <留言板刪除訊息> +索引(2)
]]--
protocolTable[36] = {}

--[[ 開啟公佈欄
S:036-001 <開啟公佈欄>
]]--
protocolTable[36][1] = function(data)
end

--[[ 更新公佈欄
S:036-002 <更新公佈欄> +內容(?)
]]--
protocolTable[36][2] = function(data)
  --[[
  ShowTalkMessage(
    function()
      EventManager.SetConduct(true);
    end,
    data:ReadString(data.length),
    Role.target
  );
  ]]--
end

--[[ 開啟留言板
S:036-003 <開啟留言板>
]]--
protocolTable[36][3] = function(data)
  UI.Open(UIMessageboard);
end

--[[ 留言板所有訊息
S:036-004 <留言板所有訊息> <<+玩家ID(8) +名字長度(1) +名字(L) +性別(1) +頭型(1) +顏色1(4) +顏色2(4) +時間(8) +訊息長度(L) +訊息(L)>>
]]--
protocolTable[36][4] = function(data)
  while data.length > 0 do
    local roleId = data:ReadInt64();
    local name = data:ReadString(data:ReadByte());
    local sex = data:ReadByte();
    local headStyle = data:ReadByte();
    local colorTints = {};
    colorTints[1] = data:ReadInt32();
    colorTints[2] = data:ReadInt32();
    local time = data:ReadDouble();
    local message = data:ReadString(data:ReadByte());

    Chat.AddLeaveMessage(roleId, name, sex, headStyle, colorTints, time, message);
  end
end

--[[ 留言板新增訊息
S:036-005 <留言板新增訊息> +玩家ID(8) +L(1) +名字(L) +性別(1) +髮型(1) +調色盤1(4) +調色盤2(4) +時間(8) +訊息(?)
]]--
protocolTable[36][5] = function(data)
  local roleId = data:ReadInt64();
  local name = data:ReadString(data:ReadByte());

  local sex = data:ReadByte();
  local headStyle = data:ReadByte();
  
  local colorTints = {};
  colorTints[1] = data:ReadInt32();
  colorTints[2] = data:ReadInt32();

  local time = data:ReadDouble();
  local message = data:ReadString(data.length);

  Chat.AddLeaveMessage(roleId, name, sex, headStyle, colorTints, time, message);
end

--[[ 留言板刪除訊息
S:036-006 <留言板刪除訊息> +訊息索引(2)
]]--
protocolTable[36][6] = function(data)
  Chat.DelLeaveMessage(data:ReadUInt16());
end

--[[ 留言板相關訊息
S:036-007 <留言板相關訊息> +結果(1)
  結果 1:失敗 +原因(1)
]]--
protocolTable[36][7] = function(data)
  local result = data:ReadByte();
  if result == 1 then
    local cause = data:ReadByte();
    if cause == 7 then
      ShowCenterMessage(string.Get(40313), 2);
    end
  end
end

--[[ 排行榜所有排名
S:036-008 <排行榜所有排名> <<+玩家ID(8) +名字長度(1) +名字(L) +等級(1) +性別(1) +頭型(1) +顏色1(4) +顏色2(4)>>
]]--
protocolTable[36][8] = function(data)
  while data.length > 0 do
    local roleId = data:ReadInt64();
    local name = data:ReadString(data:ReadByte());
    local level = data:ReadByte();
    local sex = data:ReadByte();
    local headStyle = data:ReadByte();
    local colorTints = {};
    colorTints[1] = data:ReadInt32();
    colorTints[2] = data:ReadInt32();

    --BK_ChartOrderF
  end
end

--[[ 無界排行榜所有排名
S:036-009 <無界排行榜所有排名> <<+玩家ID(8) +伺服器ID(1) +名字(14) +等級(1)>>
]]--
protocolTable[36][9] = function(data)
  local serverId = data:ReadByte();
  local kind = data:ReadByte();
  local count = data:ReadUInt16();

  --logError("Leadearboard Server : "..serverId.." Kind : "..kind);
  
  for i = 1, count do
    local leaderboardInfo = {};
    leaderboardInfo.roleId = data:ReadInt64();
    leaderboardInfo.serverId = data:ReadByte();
    leaderboardInfo.name = data:ReadString(14);
    leaderboardInfo.score = data:ReadByte();

    Galaxy.AddLeaderboard(serverId, kind, leaderboardInfo, i == count);
  end
end

--[[ 開啟無界排行榜
S:036-010 <開啟無界排行榜>
]]--
protocolTable[36][10] = function(data)
  local count = 0;

  for k, v in pairs(Galaxy.leaderboards) do
    count = count + 1;
  end

  if count == 0 then
    ShowCenterMessage(string.Get(80034));
    EventManager.SetConduct(true);
    return;
  end

  UI.Open(UILeaderboard);
end

--[[ 二轉介面
]]--
protocolTable[36][11] = function(data)
  UI.Open(UITurn, ETrunMode.Reincarnation, 1);
end

--[[ 武將特殊技介面
S:036-012 <武將特殊技介面> +數量(1) <<+可學習武將索引(1)>>
]]--
protocolTable[36][12] = function(data)
  local count = data:ReadByte();

  local followIndexs = {};
  for i = 1, count do
    followIndexs[i] = data:ReadByte();
  end

  UI.Open(UINpcTurn, nil, followIndexs);
end

--[[ 開啟戰功買賣介面
S:036-013 <開啟戰功買賣介面>
]]--
protocolTable[36][13] = function(data)
  local options = {};
  for k, v in pairs(itemDatas) do
    if v.giftDot > 0 and v.kind ~= 66 then
      table.insert(options, k.." "..v.description);
    end
  end
  
  UI.Open(UIShop, EUIShop.KillPoint, options);
end

--[[ 三轉介面
]]--
protocolTable[36][14] = function(data)
  UI.Open(UITurn, ETrunMode.Reincarnation, data:ReadByte(), data:ReadByte());
end

--[[ 開啟水戰奉邑介面
]]--
protocolTable[36][15] = function(data)
  --MR_WBManageOrgManage.Appear;
  --水戰不出先直接送結束事件
  EventManager.SetConduct(true);
end

--[[ 開啟水戰合成介面
]]--
protocolTable[36][16] = function(data)
  --WaterWarMix_Form.Appear;
end

--[[ 開啟水戰船嵨介面
]]--
protocolTable[36][17] = function(data)
  --WaterWarBank_Form.Appear;
end

--[[ 開啟水戰客棧介面
]]--
protocolTable[36][18] = function(data)
  --WaterWarInn_Form.Appear;
end

--[[ 水戰回復水兵、彈藥值介面
]]--
protocolTable[36][19] = function(data)
  --WaterWarAsk_Form.RevWaterWarAskInfo(Ord(Data[2]), CharToInt(Copy(Data,3,4)));
end

--[[ 開啟水戰技能學習介面
]]--
protocolTable[36][20] = function(data)
  --ShipSkillTreeForm.Appear;
end

--[[ 城池商店升級介面
]]--
protocolTable[36][21] = function(data)
  UI.Open(UICityStation);
end

--[[ 特殊城戰道具提領介面
]]--
protocolTable[36][22] = function(data)
  --LH_MEExtractor.Appear;
end

--[[ 二代武將養育介面
]]--
protocolTable[36][23] = function(data)
  --Se_ChildForm.appear;
end

--[[ 龍舟賽公佈欄介面
]]--
protocolTable[36][24] = function(data)
  --LH_DragonBoatStanding.Appear;
end

--[[ 節慶
]]--
protocolTable[36][25] = function(data)
  --MR_FestivalInfoForm.RevSetData(Data);
end

--[[ 團P
C:037-001 <送遠端位址> +位址(?)
]]--
protocolTable[37] = {}

--[[ 團p勝場數
S:037-001 <團p勝場數> +玩家ID(8) +勝場數(2)
]]--
protocolTable[37][1] = function(data)
  local roleId = data:ReadInt64();

  if Role.players[roleId] == nil then return end

  Role.players[roleId]:SetVsWin(data:ReadUInt16());
end

--[[ 團p最高名次
S:037-002 <團p最高名次> +玩家ID(8) +名次(1)
]]--
protocolTable[37][2] = function(data)
  local roleId = data:ReadInt64();

  if Role.players[roleId] == nil then return end

  Role.players[roleId]:SetVsTopNum(data:ReadUInt16());
end

--[[ 團p相關訊息
S:037-003 <團p相關訊息> +種類(1)
]]--
protocolTable[37][3] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    Chat.AddMessage(EChannel.System, string.Get(40294));
    ShowMarqueeMessage(string.Get(40294));
  elseif kind == 2 then
    Chat.AddMessage(EChannel.System, string.Get(40295));
    ShowMarqueeMessage(string.Get(40295));
  elseif kind == 3 then
    Chat.AddMessage(EChannel.System, string.Get(40353));
    ShowMarqueeMessage(string.Get(40353));
  elseif kind == 4 then
    Chat.AddMessage(EChannel.System, string.Get(30180));
    ShowMarqueeMessage(string.Get(30180));
  elseif kind == 5 then
    Chat.AddMessage(EChannel.System, string.Get(30181));
    ShowMarqueeMessage(string.Get(30181));
  elseif kind == 6 then
    Chat.AddMessage(EChannel.System, string.Get(30182));
    ShowMarqueeMessage(string.Get(30182));
  elseif kind == 7 then
    Chat.AddMessage(EChannel.System, string.Get(30183));
    ShowMarqueeMessage(string.Get(30183));
  elseif kind == 8 then
    Chat.AddMessage(EChannel.System, string.Get(71088));
    ShowMarqueeMessage(string.Get(71088));
  elseif kind == 9 then
    Chat.AddMessage(EChannel.System, string.Get(71089));
    ShowMarqueeMessage(string.Get(71089));
  end
end

--[[ 大陸團P分數設定
S:037-004 <大陸團P分數設定> +玩家ID(8) +種類(1) +分數(4)
]]--
protocolTable[37][4] = function(data)
  local roleId = data:ReadInt64();

  if Role.players[roleId] == nil then return end
  
  Role.players[roleId]:SetFieldBattleInfo(data:ReadByte(), data:ReadInt32());
end

--[[ 大陸團P結果
S:037-005 <大陸團P結果> <<+數量(4) <<+組別(4)>> >>*3
]]--
protocolTable[37][5] = function(data)
  for i = 1, 3 do
    local count = data:ReadInt32();
    
    if count > 0 then
      local message = "";

      for j = 1, count do
        message = message..string.Get(30096)..tostring(data:ReadInt32())..string.Get(30162).." ";
      end

      message = string.Get(30096)..tostring(i)..string.Get(30097)..":  "..message;

      Chat.AddMessage(EChannel.System, message);
      ShowMarqueeMessage(message);
    end
  end
end

--[[ 挑戰賽勝場數
S:037-006 <挑戰賽勝場數> +勝場數(1)
]]--
protocolTable[37][6] = function(data)
  local roleId = data:ReadInt64();

  if Role.players[roleId] == nil then return end

  Role.players[roleId]:SetNpcChallenge(data:ReadByte());
end

--修行
protocolTable[38] = {}

--[[ 更新修行值
S:038-001 <更新修行值> +修行值(4)
]]--
protocolTable[38][1] = function(data)
  local value = data:ReadUInt32();
  
  if not player.isPrac then
    ShowCenterMessage(string.Get(90080)..tostring(value - Role.playerData.pracCount), 2);
  end
  
  Role.SetPracCount(value);
end

--[[ 軍團
C:039-001 <創立軍團> +軍團名稱(?)
C:039-002 <邀請加入軍團> +L(1) +名字(L)
C:039-003 <回應加入軍團> +玩家ID(8) +結果(1)
  結果 1:是
  結果 2:否
  結果 3:無回應
C:039-004 <寄信給某成員> +玩家ID(8) +信件種類(1) +內容(?)
C:039-005 <寄信給所有成員> +信件種類(1) +內容(?)
C:039-006 <離開軍團>
C:039-007 <踢出軍團> +玩家ID(8)
C:039-008 <解散軍團>
C:039-009 <設定軍團規章> +軍團規章(?)
C:039-010 <設定副團長> +玩家ID(8)
C:039-011 <解除副團長> +玩家ID(8)
C:039-012 <團長讓位> +玩家ID(8)
C:039-013 <回應擔任團長> +玩家ID(8) +結果(1)
  結果 1:是
  結果 2:否
  結果 3:無回應
C:039-014 <回應擔任副團長> +玩家ID(8) +結果(1)
  結果 1:是
  結果 2:否
  結果 3:無回應
C:039-015 <捐獻資源> +資源數(4) <<+背包索引(2)>>
C:039-016 <設定軍團權限> +權限索引(1) +玩家ID(8) +權限開關(1)
C:039-017 <設定同盟開關> +開關(1) 
C:039-018 <團徽上傳> +團徽資料(?)
C:039-019 <要求更新團徽> <<+軍團ID(4)>>
--C:039-050 <停止生產>
--C:039-051 <停止製造>
C:039-052 <取出武器> <<+武器索引(1) +取出數量(1)>>
C:039-053 <存入武器> <<+背包索引(2)>>
--C:039-054 <停止製毛>
C:039-055 <升級建築> +建築索引(1)
C:039-056 <拆毀建築> +建築索引(1)

C:039-101 <申請加入> +軍團ID(4)
C:039-102 <回覆申請> +玩家ID(8) +結果(1)
  結果 1:同意
  結果 2:拒絕
C:039-103 <回覆罷免> +結果(1)
  結果 1:支持
  結果 2:反對
C:039-104 <使用召集令>
C:039-105 <每日簽到>
C:039-107 <設定軍團介紹> +軍團介紹(?)
C:039-108 <要求軍團列表> +第幾頁(2)
C:039-109 <拒絕加入> +軍團ID(4)
C:039-110 <軍團製造開始> +製造種類(1)
  製造種類 1:器械 +器械種類(1)
  製造種類 2:兵種 +兵種種類(1)
C:039-111 <軍團製造取消> +製造種類(1)
  製造種類 1:器械 2:兵種
C:039-112 <軍團製造完成> +製造種類(1)
  製造種類 1:器械 2:兵種
C:039-119 <軍團BOSS戰入場>
]]--
protocolTable[39] = {}

--[[ 創立軍團
S:039-001 <創立軍團> +結果(1)
  結果 0:成功
  結果 1:名稱不合法
  結果 2:資格不足
  結果 3:重複創團
  結果 4:金幣不足
  結果 5:名稱重複
  結果 255:其他原因
]]--
protocolTable[39][1] = function(data)
  local result = data:ReadByte();
  if result == 0 then
    ShowCenterMessage(string.Get(10298));

    Organization.SetChief(Role.playerId);
    --Organization.SetOrgName(Organization.Id, Se_ArmyCreateForm.NameField.Text);
    Organization.SetDeclaration(string.Get(40159));

    --C:043-004 <要求所有軍團資訊>
    Network.Send(43, 4);
  elseif result == 1 then
    ShowCenterMessage(string.Get(40177));
  elseif result == 2 then
    ShowCenterMessage(string.Get(40178));
  elseif result == 3 then
    ShowCenterMessage(string.Get(40179));
  elseif result == 4 then
    ShowCenterMessage(string.format(string.Get(10268), Organization.createMoney));
  elseif result == 5 then
    ShowCenterMessage(string.Get(40205));
  elseif result == 255 then
    ShowCenterMessage(string.Get(40181));
  end
end

--[[ 軍團資料
S:039-002 <軍團資料> +L(1) +名稱(L) +副團長數(1) +成員數(1) <<+軍團成員資料(?)>> +L(1) +軍團規章(L) +解散時間(8) +創立時間(8) +同盟開關(1) +標記(1) +周活躍度(4) +累積活躍度(4) +BOSS等級(2) +BOSS傷害量(4) +L(1) +同盟軍團名稱(L)
  標記 bit 1:召集令 2:軍團戰報名
]]--
protocolTable[39][2] = function(data)
  Organization.SetData(data);
end

--[[ 邀請加入軍團
S:039-003 <邀請加入軍團> +玩家ID(8) +軍團ID(4) +L(1) +軍團名稱(L) +軍團等級(1) +軍團聲望(4) +L(1) +軍團長名稱(L) +軍團人數(1)
]]--
protocolTable[39][3] = function(data)
  Invitation.Add(EInvitation.Organization, data:ReadInt64(), data);
end

--[[ 邀請加入軍團結果
S:039-004 <邀請加入軍團結果> +L(1) +名字(L) +結果(1)
  結果 1:是
  結果 2:否
  結果 3:無回應
  結果 4:邀請失敗
]]--
protocolTable[39][4] = function(data)
  local name = data:ReadString(data:ReadByte());
  local result = data:ReadByte();

  if result == 1 then
    ShowCenterMessage(name..string.Get(40153));
  elseif result == 2 then
    ShowCenterMessage(name..string.Get(40154));
  elseif result == 3 then
    ShowCenterMessage(name..string.Get(40155));
  elseif result == 4 then
    ShowCenterMessage(name..string.Get(40156));
  end
end

--[[ 軍團移除玩家
S:039-006 <軍團移除玩家> +玩家ID(8)
]]--
protocolTable[39][6] = function(data)
  Organization.RemoveMember(data:ReadInt64());
end

--[[ 軍團移除玩家結果
S:039-007 <軍團移除玩家結果> +結果(1)
  結果 0:離開成功
  結果 1:不在軍團中
  結果 2:團長不可離開
  結果 3:權限(階級)不足
  結果 255:例外錯誤
]]--
protocolTable[39][7] = function(data)
  local result = data:ReadByte();
  if result == 0 then
    local roleId = data:ReadInt64();

    if roleId ~= Role.playerId then
      ShowCenterMessage(string.Get(40183));
    end
    ArmyLuckyBag.RemoveArmy();
  elseif result == 1 then
    ShowCenterMessage(string.Get(40184));
  elseif result == 2 then
    ShowCenterMessage(string.Get(40185));
  elseif result == 3 then
    ShowCenterMessage(string.Get(40186));
  elseif result == 255 then
    ShowCenterMessage(string.Get(40187));
  end
end

--[[ 軍團新增玩家
S:039-008 <軍團新增玩家> +軍團成員資料(?)
]]--
protocolTable[39][8] = function(data)
  local roleId = data:ReadInt64();
  local newMember = Organization.members[roleId] == nil;

  Organization.AddMember(roleId, data);

  if Organization.members[roleId] ~= nil and newMember then
    Chat.AddMessage(EChannel.Organization, string.format(string.Get(21161), Organization.members[roleId].name));
  end
end

--[[ 場景玩家軍團資訊
S:039-009 <場景玩家軍團資訊> +玩家ID(8) +軍團ID(4) +L(1) +軍團名稱(L)
]]--
protocolTable[39][9] = function(data)
  while data.length > 0 do
    local roleId = data:ReadInt64();
    local orgId = data:ReadUInt32();
    local orgName = data:ReadString(data:ReadByte());

    Organization.SetOrgName(orgId, orgName);

    if Role.players[roleId] ~= nil then
      Role.players[roleId]:SetOrganization(orgId);
    end
  end
end

--[[ 軍團解散結果
S:039-010 <軍團解散結果> +結果(1)
  結果 0:解散成功
  結果 1:不在軍團中
  結果 2:團長不可離開
  結果 3:不是團長
  結果 255:例外錯誤
]]--
protocolTable[39][10] = function(data)
  local result = data:ReadByte();
  if result == 0 then
    ShowCenterMessage(string.Get(40188));

    Organization.Dismiss();
  elseif result == 1 then
    ShowCenterMessage(string.Get(40189));
  elseif result == 2 then
    ShowCenterMessage(string.Get(40190));
  elseif result == 3 then
    ShowCenterMessage(string.Get(40191));
  elseif result == 255 then
    ShowCenterMessage(string.Get(40192));
  end
end

--[[ 設定軍團規章
S:039-011 <設定軍團規章> +軍團規章(?)
]]--
protocolTable[39][11] = function(data)
  Organization.SetDeclaration(data:ReadString(data.length));
end

--[[ 設定副團長
S:039-012 <設定副團長> +玩家ID(8)
]]--
protocolTable[39][12] = function(data)
  Organization.AddSubChief(data:ReadInt64());
end

--[[ 解除副團長
S:039-013 <解除副團長> +玩家ID(8)
]]--
protocolTable[39][13] = function(data)
  local roleId = data:ReadInt64();

  Organization.RemoveSubChief(roleId);

  if roleId == Role.playerId then
    Invitation.Remove(EInvitation.OrgMember);
  end

  if Organization.members[roleId] ~= nil then
    Chat.AddMessage(EChannel.Organization, Organization.members[roleId].name..string.Get(21229));
  end
end

--[[ 設定團長
S:039-014 <設定團長> +原團長讓位後職位(1) +玩家ID(8)
]]--
protocolTable[39][14] = function(data)
  Organization.SetChief(data:ReadByte(), data:ReadInt64());
end

--[[ 軍團訊息
S:039-015 <軍團訊息> ＋訊息種類(1)
  訊息種類 1:已在其他軍團中
  訊息種類 2:軍團某職位已滿
  訊息種類 3:軍團不存在
  訊息種類 4:己無空間可放置團員
  訊息種類 5:無法讓位給會員
  訊息種類 6:無法讓位給副團長
  訊息種類 7:該玩家官階不足,無法讓位
  訊息種類 8:該玩家不在線上
  訊息種類 9:對方不願意當副團長
  訊息種類 10:對方無回應
  訊息種類 11:對方不願意當團長
  訊息種類 12:己無空間可放置副團長
  訊息種類 13:金錢不足,捐獻失敗
  訊息種類 14:數量不足,捐獻失敗
  訊息種類 15:物資已滿
  訊息種類 16:該物品不可捐獻
  訊息種類 17:貢獻度滿了
  訊息種類 18:還沒有裝備鋤頭
  訊息種類 19:等級不夠,無法生產
  訊息種類 20:請加入軍團才可以執行生產
  訊息種類 21:你己被禁止上傳團徽
  訊息種類 22:對方忙碌中
  訊息種類 23:身上物己滿,無法放置
  訊息種類 24:需為大型城池才可製作
  訊息種類 25:只有軍團長才可製作
  訊息種類 26:貢獻度不足
  訊息種類 27:尚末開放
  訊息種類 28:等級不足
  訊息種類 29:軍團已解散
  訊息種類 30:無此玩家
  訊息種類 31:邀請成功
  訊息種類 32:加入軍團未滿24小時，無法捐獻
  訊息種類 100:權限不足,無法製造
  訊息種類 101:物資不足,停止製造
  訊息種類 255:無法使用該功能
]]--
protocolTable[39][15] = function(data)
  local result = data:ReadByte();
  if result == 1 then
    ShowCenterMessage(string.Get(40160));
  elseif result == 2 then
    ShowCenterMessage(string.Get(10265));
  elseif result == 3 then
    ShowCenterMessage(string.Get(40162));
  elseif result == 4 then
    ShowCenterMessage(string.Get(40163));
  elseif result == 5 then
    ShowCenterMessage(string.Get(40164));
  elseif result == 6 then
    ShowCenterMessage(string.Get(40165));
  elseif result == 7 then
    ShowCenterMessage(string.Get(40166));
  elseif result == 8 then
    ShowCenterMessage(string.Get(40168));
  elseif result == 9 then
    ShowCenterMessage(string.Get(40197));
  elseif result == 10 then
    ShowCenterMessage(string.Get(40198));
  elseif result == 11 then
    ShowCenterMessage(string.Get(40199));
  elseif result == 12 then
    ShowCenterMessage(string.Get(40222));
  elseif result == 13 then
    ShowCenterMessage(string.Get(40228));
  elseif result == 14 then
    ShowCenterMessage(string.Get(40224));
  elseif result == 15 then
    ShowCenterMessage(string.Get(40225));
  elseif result == 16 then
    ShowCenterMessage(string.Get(40226));
  elseif result == 17 then
    ShowCenterMessage(string.Get(40227));
  elseif result == 18 then
    ShowTalkMessage(nil, string.Get(40238), Role.player);
  elseif result == 19 then
    ShowCenterMessage(string.Get(40241));
  elseif result == 20 then
    ShowCenterMessage(string.Get(40242));
  elseif result == 21 then
    ShowCenterMessage(string.Get(40308));
  elseif result == 22 then
    ShowCenterMessage(string.Get(40067));
  elseif result == 23 then
    ShowCenterMessage(string.Get(80359));
  elseif result == 24 then
    ShowCenterMessage(string.Get(40394));
  elseif result == 25 then
    ShowCenterMessage(string.Get(40395));
  elseif result == 26 then
    ShowCenterMessage(string.Get(40396));
  elseif result == 27 then
    ShowCenterMessage(string.Get(40466));
  elseif result == 28 then
    ShowCenterMessage(string.format(string.Get(21216), Organization.requireLv));
  elseif result == 29 then
    ShowCenterMessage(string.Get(10266));
  elseif result == 30 then
    ShowCenterMessage(string.Get(21030));
  elseif result == 31 then
    ShowCenterMessage(string.Get(20279));
  elseif result == 32 then
    ShowCenterMessage(string.Get(21215));
  elseif result == 100 then
    ShowCenterMessage(string.Get(40246));
  elseif result == 101 then
    ShowCenterMessage(string.Get(40247));
  elseif result == 255 then 
    ShowCenterMessage(string.Get(40167));
  end
end

--[[ 設定解散時間
S:039-016 <設定解散時間> +解散時間(8)
]]--
protocolTable[39][16] = function(data)
  Organization.SetDismissDate(data:ReadDouble());
end

--[[ 重設軍團規章
S:039-017 <重設軍團規章>
]]--
protocolTable[39][17] = function(data)
  Organization.SetDeclaration(string.Get(40159));
end

--[[ 要求擔任副團長
S:039-018 <要求擔任副團長> +玩家ID(8) +L(1) +名字(L)
]]--
protocolTable[39][18] = function(data)
  local roleId = data:ReadInt64();
  local name = data:ReadString(data:ReadByte());

  ShowCheckMessage(
    function(result)
      --C:039-014 <回應擔任副團長> +玩家ID(8) +結果(1)
      sendBuffer:Clear()
      sendBuffer:WriteInt64(roleId);
      if result then
        sendBuffer:WriteByte(1);
      else
        sendBuffer:WriteByte(2);
      end
      Network.Send(39, 14, sendBuffer);
    end,
    name..string.Get(40196),
    nil
  );
end

--[[ 要求擔任團長
S:039-019 <要求擔任團長> +玩家ID(8) +L(1) +名字(L)
]]--
protocolTable[39][19] = function(data)
  local roleId = data:ReadInt64();
  local name = data:ReadString(data:ReadByte());

  ShowCheckMessage(
    function(result)
      --C:039-013 <回應擔任團長> +玩家ID(8) +結果(1)
      sendBuffer:Clear()
      sendBuffer:WriteInt64(roleId);
      if result then
        sendBuffer:WriteByte(1);
      else
        sendBuffer:WriteByte(2);
      end
      Network.Send(39, 13, sendBuffer);
    end,
    name..string.Get(40200),
    nil
  );
end

--[[ 軍團信件已滿
S:039-020 <軍團信件已滿>
]]--
protocolTable[39][20] = function(data)
  ShowCenterMessage(string.Get(50088));
end

--[[ 設定軍團資源
S:039-021 <設定軍團資源> +數量(4) <<+種類(1) +數量(4)>>
]]--
protocolTable[39][21] = function(data)
  local count = data:ReadUInt32();
  for i = 1, count do
    Organization.SetResource(data:ReadByte(), data:ReadInt32());
  end
end

--[[ 捐獻訊息
S:039-022 <捐獻訊息> +結果(1)
]]--
protocolTable[39][22] = function(data)
  local result = data:ReadByte();

  if result == 0 then
    ShowCenterMessage(string.Get(40325));
  elseif result == 1 then
    ShowCenterMessage(string.Get(40326));
  end
end

--[[ 設定捐獻值
S:039-023 <設定捐獻值> +玩家ID(8) +捐獻值(4) +周活躍度(4)
]]--
protocolTable[39][23] = function(data)
  Organization.SetMemberScore(data:ReadInt64(), data:ReadInt32(), data:ReadUInt32());
end

--[[ 設定軍團權限
S:039-024 <設定軍團權限> +權限索引(1) +玩家ID(8) +權限開關(1)
]]--
protocolTable[39][24] = function(data)
  Organization.SetDutyFlag(data:ReadByte(), data:ReadInt64(), data:ReadBoolean());
end

--[[ 軍團任用讓位訊息
S:039-025 <軍團任用讓位訊息> +訊息種類(1) +L(1) +名字(L)
]]--
protocolTable[39][25] = function(data)
  local result = data:ReadByte();
  local name = data:ReadString(data:ReadByte());

  if result == 1 then
    ShowCenterMessage(name..string.Get(40222));
  elseif result == 2 then
    ShowCenterMessage(name..string.Get(40223));
  end
end

--[[ 設定部隊數值
S:039-026 <設定部隊數值> +數量(4) <<+部隊種類(1) +數值(4)>>
]]--
protocolTable[39][26] = function(data)
  local count = data:ReadUInt32();
  for i = 1, count do
    Organization.SetArmy(data:ReadByte(), data:ReadInt32());
  end
end

--[[ 設定武器數值
S:039-027 <設定武器數值> +數量(4) <<+武器種類(1) +數值(4)>>
]]--
protocolTable[39][27] = function(data)
  local count = data:ReadUInt32();
  for i = 1, count do
    Organization.SetWeapon(data:ReadByte(), data:ReadInt32());
  end
end

--[[ 設定同盟開關
S:039-028 <設定同盟開關> +開關(1)
]]--
protocolTable[39][28] = function(data)
  Organization.SetAllySwitch(not data:ReadBoolean());
end

--[[ 軍團錯誤訊息
S:039-029 <軍團錯誤訊息> +訊息種類(1)
]]--
protocolTable[39][29] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    ShowCenterMessage(string.Get(30086));
  elseif result == 2 then
    ShowCenterMessage(string.Get(30087));
  elseif result == 3 then
    ShowCenterMessage(string.Get(30088));
  elseif result == 4 then
    ShowCenterMessage(string.Get(30092));
  elseif result == 5 then
    ShowCenterMessage(string.Get(30102));
  elseif result == 6 then
    ShowCenterMessage(string.Get(30103));
  elseif result == 7 then
    ShowCenterMessage(string.Get(30104));
  elseif result == 8 then
    ShowCenterMessage(string.Get(30105));
  elseif result == 9 then
    ShowCenterMessage(string.Get(30106));
  end
end

--[[ 更新主角團徽
S:039-030 <更新主角團徽> +版本(1) +資料(?)
]]--
protocolTable[39][30] = function(data)
  Organization.SetEnsign(Organization.Id, data:ReadByte(), data:ReadBytes(Organization.ensignDataSize));
  Organization.SaveEnsign();
end

--[[ 載入本地團徽
S:039-031 <載入本地團徽> +數量(2) <<+軍團ID(4) +版本(1)>>
]]--
protocolTable[39][31] = function(data)
  local count =  data:ReadUInt16();  
  for i = 1, count do
    local orgId = data:ReadUInt32()
    local ver = data:ReadByte();

    Organization.SetEnsign(orgId, ver);

    for k, v in pairs(Role.players) do
      if v.data.orgId == orgId then
        Organization.GetEnsign(orgId);
        break;
      end
    end
  end
end

--[[ 更新團徽
S:039-032 <更新團徽> <<+軍團ID(4) +版本(1) +資料(?)>>
]]--
protocolTable[39][32] = function(data)
  while data.length > 0 do
    local orgId = data:ReadUInt32();
    local ver = data:ReadByte();

    Organization.SetEnsign(orgId, ver, data:ReadBytes(Organization.ensignDataSize));
  end

  Organization.SaveEnsign();
end

--[[ 更新主角軍團名稱
S:039-033 <更新主角軍團名稱> +名稱(?)
]]--
protocolTable[39][33] = function(data)
  Organization.SetOrgName(Organization.Id, data:ReadString(data.length));
end

--[[ 重置團徽
S:039-034 <重置團徽> +軍團ID(4) +團徽樣式(1)
]]--
protocolTable[39][34] = function(data)
  Organization.SetDefaultEnsign(data:ReadUInt32(), data:ReadByte());
end

--[[ 軍團生產
S:039-050 <更新軍團生產> +生產種類(1) +值(4)
S:039-051 <開始軍團生產> +生產種類(1) +值(4) +等級(2)
S:039-053 <停止生產>
]]--

--[[ 軍團製造
S:039-054 <更新軍團製造> +製造種類(1) +值(4)
S:039-055 <開始軍團製造> +製造種類(1) +值(4) +等級(1) +進度(2)
S:039-056 <停止製造>
]]--

--[[ 軍團製毛
S:039-057 <更新軍團製毛> +值(4)
S:039-058 <開始軍團製毛> +值(4) +等級(1) +進度(2)
S:039-059 <停止製毛>
]]--

--[[ 更新軍團成員職業
S:039-061 <更新軍團成員職業> +數量(4) +資料長度(4) <<+玩家ID(8) +職業(1)>>
]]--
protocolTable[39][61] = function(data)
  local count = data:ReadInt32();
  local recordLength = data:ReadInt32();

  for i = 1, count do
    local roleId = data:ReadInt64();
    local career = data:ReadByte();

    if Organization.members[roleId] ~= nil then
      Organization.members[roleId].career = career;
    end
  end
end

--[[ 某軍團解散
S:039-062 <某軍團解散> +軍團ID(4)
]]--
protocolTable[39][62] = function(data)
  local orgId = data:ReadUInt32();

  if Organization.orgs[orgId] == nil then return end

  Organization.orgs[orgId]:Destroy();
  Organization.orgs[orgId] = nil;
  
  if orgId == Organization.Id then
    Organization.Dismiss();
  else
    if UI.IsVisible(UIArmy) then
      UIArmy.UpdateUI();
    end
  end
end

--[[ 申請加入結果
S:039-101 <申請加入結果> +軍團ID(4) +結果(1)
  結果 1: 申請成功
  結果 2: 等級不足
  結果 3: 已有軍團
  結果 4: 軍團不存在
  結果 5: 已申請
  結果 6: 對方軍團申請已滿
  結果 7: 申請已達上限
  結果 8: 成功加入軍團
  結果 9: 拒絕加入軍團
]]--
protocolTable[39][101] = function(data)
  local orgId = data:ReadUInt32();
  local result = data:ReadByte();

  if result == 1 then
    ShowCenterMessage(string.Get(10271));

    if UI.IsVisible(UIArmyList) then
      UIArmyList.SetApply(orgId, true);
    end
  elseif result == 2 then
    ShowCenterMessage(string.format(string.Get(10138), Organization.requireLv));
  elseif result == 3 then
    ShowCenterMessage(string.Get(21217));
  elseif result == 4 then
    ShowCenterMessage(string.Get(10266));
  elseif result == 5 then
    ShowCenterMessage(string.Get(10272));
  elseif result == 6 then
    ShowCenterMessage(string.Get(10265));
  elseif result == 7 then
    ShowCenterMessage(string.Get(21218));
  elseif result == 8 then
    ShowCenterMessage(string.Get(40153));
    ArmyLuckyBag.AddArmy();
  elseif result == 9 then
    ShowCenterMessage(string.Get(40154));
  else
    ShowCenterMessage("39-101 Result = "..result);
  end
end

--[[ 回覆申請結果
S:039-102 <回覆申請結果> +玩家ID(8) +選擇(1) +結果(1)
  選擇 1:同意
    結果 1:成功
    結果 2:無軍團
    結果 3:無此人
    結果 4:等級不足
    結果 5:權限不足
    結果 6:失敗
    結果 7:已有軍團
    結果 8:軍團已滿
  選擇 2:拒絕  
    結果 1:成功
]]--
protocolTable[39][102] = function(data)
  local roleId = data:ReadInt64();
  local choose = data:ReadByte();
  local result = data:ReadByte();

  if result == 1 then
  elseif result == 2 then
    ShowCenterMessage(string.Get(10266));
  elseif result == 7 then
    ShowCenterMessage(string.Get(21187));
  elseif result == 8 then
    ShowCenterMessage(string.Get(10265));
  else
    ShowCenterMessage("39-102 Result = "..result);
  end
end

--[[ 罷免資訊
S:039-103 <罷免資訊> +開始時間(8) +L(1) +接任者名稱(L) +有效成員數(1) +支持票數(1) +反對票數(1)
]]--
protocolTable[39][103] = function(data)
  local startTime = data:ReadDouble();

  if startTime ~= 0 then
    Organization.fireInfo = {};
    Organization.fireInfo.endTime = DateTime.FromOADate(startTime):AddHours(48);
    Organization.fireInfo.newCheifName = data:ReadString(data:ReadByte());
    Organization.fireInfo.memberCount = data:ReadByte();
    Organization.fireInfo.agreeCount = data:ReadByte();
    Organization.fireInfo.rejectCount = data:ReadByte();
  else
    Organization.fireInfo = nil;
  end

  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateUI();
  end
end

--[[ 設定軍團介紹
S:039-104 <設定軍團介紹> +軍團介紹(?)
]]--
protocolTable[39][104] = function(data)
  Organization.SetInfo(data:ReadString(data.length));
end

--[[ 設定軍團標記
S:039-105 <設定軍團標記> +軍團標記(1)
]]--
protocolTable[39][105] = function(data)
  Organization.SetFlag(data:ReadByte());
end

--[[ 軍團列表
S:039-108 <軍團列表> +總軍團數(2) +本頁數量(1) <<+軍團ID(4) +L(1) +軍團名稱(L) +軍團等級(1) +軍團聲望(4) +L(1) +軍團長名稱(L) +軍團人數(1) +已申請(1)>>
]]--
protocolTable[39][108] = function(data)
  local armyCount = math.ceil(data:ReadUInt16() / 7);
  local count = data:ReadByte();

  local armyDatas = {};
  for i = 1, count do
    armyDatas[i] = {};
    armyDatas[i].id = data:ReadUInt32();
    armyDatas[i].name = data:ReadString(data:ReadByte());
    armyDatas[i].level = data:ReadByte();
    armyDatas[i].score = data:ReadUInt32();
    armyDatas[i].leaderName = data:ReadString(data:ReadByte());
    armyDatas[i].memberCount = data:ReadByte();
    armyDatas[i].apply = data:ReadBoolean();
  end

  if UI.IsVisible(UIArmyList) then
    UIArmyList.SetData(armyCount, armyDatas);
  end
end

--[[ 申請名單
S:039-109 <申請名單> +數量(2) <<+玩家ID(8) +L(1) +玩家名稱(L) +等級(1) +屬性(1) +轉職(1) +職業(1)>>
]]--
protocolTable[39][109] = function(data)
  local count = data:ReadUInt16();

  for i = 1, count do
    Invitation.Add(EInvitation.OrgMember, data:ReadInt64(), data);
  end
end

--[[ 更新軍團幣
S:039-110 <更新軍團幣> +軍團幣(4)
]]--
protocolTable[39][110] = function(data)
  Role.SetPlayerOrgGold(data:ReadUInt32());
end

--[[ 每日簽到結果
S:039-111 <每日簽到結果> +結果(1)
  結果 1:成功
  結果 2:空間不足
  結果 3:已領
  結果 4:沒軍團
  結果 5:物品關閉
]]--
protocolTable[39][111] = function(data)
  local result = data:ReadByte();
  if result == 1 then
  elseif result == 2 then
    ShowCenterMessage(string.Get(80359));
  elseif result == 3 then
    ShowCenterMessage("39-111 Result = "..result);
  elseif result == 4 then
    ShowCenterMessage("39-111 Result = "..result);
  elseif result == 5 then  
    ShowCenterMessage(string.Get(21970));
  else
    ShowCenterMessage("39-111 Result = "..result);
  end
end

--[[ 更新在線狀況
S:039-112 <更新在線狀況> +玩家ID(8) +是否在線(1)
]]--
protocolTable[39][112] = function(data)
  local roleId = data:ReadInt64();

  if Organization.members[roleId] == nil then return end

  Organization.members[roleId].online = data:ReadBoolean();

  if Organization.members[roleId].online then
    if Organization.IsChief(roleId) then
      Chat.AddMessage(EChannel.Organization, string.format(string.Get(21194), Organization.members[roleId].name));
    elseif Organization.IsSubChief(roleId) then
      Chat.AddMessage(EChannel.Organization, string.format(string.Get(21195), Organization.members[roleId].name));
    elseif Organization.IsMember(roleId) then
      Chat.AddMessage(EChannel.Organization, string.format(string.Get(21196), Organization.members[roleId].name));
    end
  else
    if Organization.IsChief(roleId) then
      Chat.AddMessage(EChannel.Organization, string.format(string.Get(21235), Organization.members[roleId].name));
    elseif Organization.IsSubChief(roleId) then
      Chat.AddMessage(EChannel.Organization, string.format(string.Get(21236), Organization.members[roleId].name));
    elseif Organization.IsMember(roleId) then
      Chat.AddMessage(EChannel.Organization, string.format(string.Get(21237), Organization.members[roleId].name));
    end
  end

  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateUI();
  end
end

--[[ 更新軍團活躍度
S:039-113 <更新軍團活躍度> +周活躍度(4) +累積活躍度(4)
]]--
protocolTable[39][113] = function(data)
  Organization.SetWeekScore(data:ReadUInt32());
  Organization.SetScore(data:ReadUInt32());
end

--[[ 移除軍團申請
S:039-114 <移除軍團申請> +玩家ID(8)
]]--
protocolTable[39][114] = function(data)
  Invitation.Remove(EInvitation.OrgMember, data:ReadInt64());
end

--[[ 更新軍團BOSS
S:039-115 <更新軍團BOSS> +BOSS等級(2) +BOSS傷害量(4)
--]]
protocolTable[39][115] = function(data)
  Organization.SetBossInfo(data:ReadUInt16(), data:ReadUInt32());
end

--[[ 更新團員BOSS傷害量
S:039-116 <更新團員BOSS傷害量> +玩家ID(8) +BOSS傷害量(4)
--]]
protocolTable[39][116] = function(data)
  Organization.SetMemberBossInfo(data:ReadInt64(), data:ReadUInt32());
end

--[[ 軍團BOSS戰資訊
S:039-117 <軍團BOSS戰資訊> +本次傷害(4) +回合數(1)
--]]
protocolTable[39][117] = function(data)
  FightField.worldBossInfo[1] = data:ReadInt32();
  FightField.worldBossInfo[2] = data:ReadByte();
  
  if UI.IsVisible(UIFight) then
    UIFight.UpdateWorldBoss();
  end
end

--[[ 軍團BOSS戰冷卻時間
S:039-118 <軍團BOSS戰冷卻時間> +下次可打時間(8)
--]]
protocolTable[39][118] = function(data)
  local oaDate = data:ReadDouble();

  if oaDate == 0 then
    Organization.SetBossCooldown(nil);
  else
    Organization.SetBossCooldown(DateTime.FromOADate(oaDate));
  end
end

--[[ 軍團BOSS戰入場結果
S:039-119 <軍團BOSS戰入場結果> +結果(1)
  結果 1:成功
  結果 2:冷卻中
  結果 3:次數已達上限
  結果 4:有隊伍
  結果 5:戰鬥中
  結果 6:查無軍團BOSS
  結果 7:加入軍團未滿24小時
--]]
protocolTable[39][119] = function(data)
  local result = data:ReadByte();
  if result == 1 then
    UI.Close(UIArmy);
  elseif result == 2 then
    ShowCenterMessage(string.Get(21974));
  elseif result == 3 then
    ShowCenterMessage(string.Get(10329));
  elseif result == 4 then
    ShowCenterMessage(string.Get(21971));
  elseif result == 5 then
    ShowCenterMessage(string.Get(21806));
  elseif result == 6 then
    ShowCenterMessage(string.Get(21973));
  elseif result == 7 then
    ShowCenterMessage(string.Get(22119));
  else
    logError("39-119 Fail !! Error Code = "..result);
  end
end

--[[ 報名軍團戰
S:039-121 <報名軍團戰> +結果(1)
  結果 0:報名成功
  結果 1:已經報名過了
  結果 2:非報名時間
  結果 3:非團長不能報名
  結果 4:軍團等級不夠
  結果 5:無軍團資料
--]]
protocolTable[39][121] = function(data)
  local result = data:ReadByte();
  if result == 0 then
    ShowCenterMessage(string.Get(80035));
  elseif result == 1 then
    ShowCenterMessage(string.Get(21813));
  elseif result == 2 then
    ShowCenterMessage(string.Get(21814));
  elseif result == 3 then
    ShowCenterMessage(string.Get(21815));
  elseif result == 4 then
    ShowCenterMessage(string.Get(21816));
  elseif result == 5 then
    ShowCenterMessage(string.Get(21817));
  else
    logError("Rigist Fail !! Error Code = "..result);
  end
end

--[[ 軍團戰設定出戰
S:039-122 <軍團戰設定出戰> +玩家ID(8) +結果(1)
  結果 0:設定成功
  結果 1:該成員已不在軍團內
  結果 2:無設定權限
  結果 3:無軍團資料
  結果 4:超過出戰人數上限
--]]
protocolTable[39][122] = function(data)
  local playerId = data:ReadInt64();
  local result = data:ReadByte();
  if result == 0 then
  elseif result == 1 then
    ShowCenterMessage(string.Get(21818));
  elseif result == 2 then
    ShowCenterMessage(string.Get(21819));
  elseif result == 3 then
    ShowCenterMessage(string.Get(21817));
  elseif result == 4 then
    ShowCenterMessage(string.Get(21845));
  else
    logError("Set Battle Fail !! Error Code = "..result);
  end
end

--[[ 點選旗子加入隊伍
S:039-124 <點選旗子加入隊伍> +結果(1)
  結果 0:加入隊伍成功
  結果 1:該軍團沒有報名軍團戰
  結果 2:非開戰時間
  結果 3:沒被設定可出戰
  結果 4:軍團等級不夠
  結果 5:無軍團資料
  結果 6:已有隊伍
  結果 7:人數已滿
  結果 8:已在對戰中
  結果 9:旗號錯誤
  結果 10:配對資料錯誤
--]]
protocolTable[39][124] = function(data)
  local result = data:ReadByte();
  if result == 0 then
    ShowCenterMessage(string.Get(21821));
  elseif result == 1 then
    ShowCenterMessage(string.Get(21822));
  elseif result == 2 then
    ShowCenterMessage(string.Get(21823));
  elseif result == 3 then
    ShowCenterMessage(string.Get(21824));
  elseif result == 4 then
    ShowCenterMessage(string.Get(21816));
  elseif result == 5 then
    ShowCenterMessage(string.Get(21817));
  elseif result == 6 then
    ShowCenterMessage(string.Get(21825));
  elseif result == 7 then
    ShowCenterMessage(string.Get(10330));
  elseif result == 8 then
    ShowCenterMessage(string.Get(21826));
  elseif result == 9 then
    ShowCenterMessage(string.Get(21827));
  elseif result == 10 then
    ShowCenterMessage(string.Get(21828));
  else
    logError("Click Flag Fail !! Error Code = "..result);
  end
end

--[[ 旗子狀態
S:039-125 <旗子狀態> +旗子號碼(1) +狀態(1) +倒數秒數(1) +左數(1) +右數(1)
--]]
protocolTable[39][125] = function(data)
  if SceneManager.sceneId ~= Activity.orgWarSceneId then return end

  local index = data:ReadByte();
  local state = data:ReadByte();
  local seconds = data:ReadByte();
  local leftCount = data:ReadByte();
  local rightCount = data:ReadByte();

  if Role.mapNpcs[index] ~= nil then
    Role.mapNpcs[index]:SetOrgWarInfo(state, seconds, leftCount, rightCount);
  end

  if Role.mapNpcs[index + Activity.orgWarFlagCount] ~= nil then
    Role.mapNpcs[index + Activity.orgWarFlagCount]:SetOrgWarInfo(state, seconds, leftCount, rightCount);
  end
end

--[[ 軍團戰場中顯示軍團積分
S:039-126 <軍團戰場中顯示軍團積分> +軍團ID(4) +分數(2) +軍團ID(4) +分數(2)
--]]
protocolTable[39][126] = function(data)
  if SceneManager.sceneId ~= Activity.orgWarSceneId then return end

  local orgIdA = data:ReadUInt32();
  local scoreA = data:ReadUInt16();
  local orgIdB = data:ReadUInt32();
  local scoreB = data:ReadUInt16();

  if orgIdA == Organization.Id then
    UIMain.UpdateDungeonInfo(string.Concat(string.Get(21810), "\n", string.Get(21811), " : ", scoreA, "\n", string.Get(21812), " : ", scoreB));
  else
    UIMain.UpdateDungeonInfo(string.Concat(string.Get(21810), "\n", string.Get(21811), " : ", scoreB, "\n", string.Get(21812), " : ", scoreA));
  end
end

--[[ 進入軍團戰場分區
S:039-129 <進入軍團戰場分區> +結果(1)
  結果 0:可進入軍團戰場
  結果 1:該軍團沒有報名軍團戰
  結果 2:非開戰時間
  結果 3:沒被設定可出戰
  結果 4:軍團等級不夠
  結果 5:無軍團資料
  結果 6:種子隊伍不須要進入戰場
--]]
protocolTable[39][129] = function(data)
  local result = data:ReadByte();
  if result == 0 then
  elseif result == 1 then
    ShowCenterMessage(string.Get(21822));
  elseif result == 2 then
    ShowCenterMessage(string.Get(21823));
  elseif result == 3 then
    ShowCenterMessage(string.Get(21824));
  elseif result == 4 then
    ShowCenterMessage(string.Get(21816));
  elseif result == 5 then
    ShowCenterMessage(string.Get(21817));
  elseif result == 6 then
    ShowCenterMessage(string.Get(21848));
  else
    logError("Join Battle Field Fail !! Error Code = "..result);
  end
end

--[[ 軍團戰場分區開啟時間
S:039-130 <軍團戰場分區開啟時間> +時間(8)
--]]
protocolTable[39][130] = function(data)
  if SceneManager.sceneId ~= Activity.orgWarSceneId then return end

  Activity.SetEndTime(DateTime.FromOADate(data:ReadDouble()), Activity.orgWarMinutes);
end

--[[ 軍團戰場回合倒數
S:039-132 <軍團戰場回合倒數> +回合(1)
--]]
protocolTable[39][132] = function(data)
  if SceneManager.sceneId ~= Activity.orgWarSceneId then return end

  FightField.worldBossInfo[1] = 0;
  FightField.worldBossInfo[2] = data:ReadByte();

  if UI.IsVisible(UIFight) then
    UIFight.UpdateWorldBoss();
  end
end

--[[ 軍團製造資訊
S:039-133 <軍團製造資訊> <<+製造種類(1) +完成時間(8)>>
製造種類 1:器械 +器械種類(1)
製造種類 2:兵種 +兵種種類(1)
--]]
protocolTable[39][133] = function(data)
  while data.length > 0 do
    Organization.SetProduction(data:ReadByte(), data:ReadByte(), data:ReadDouble());
  end
end

--[[ 軍團製造開始結果
S:039-134 <軍團製造開始結果> +結果(1)
  結果 1:成功 +製造種類(1)
    製造種類 1:器械 +器械種類(1)
    製造種類 2:兵種 +兵種種類(1)
  結果 2:權限不足
  結果 3:資源不足
  結果 4:已達上限
  結果 5:已在製造中
--]]
protocolTable[39][134] = function(data)
  local result = data:ReadByte();
  if result == 1 then
    local kind = data:ReadByte();
    ShowCenterMessage(string.format(string.Get(22031), string.GetProductionText(kind)));

    local unit = data:ReadByte();
    if armyProductionDatas[kind] == nil then return end
    if armyProductionDatas[kind][unit] == nil then return end
    if npcDatas[armyProductionDatas[kind][unit].npcId] == nil then return end
    
  elseif result == 2 then
    ShowCenterMessage(string.Get(40246));
  elseif result == 3 then
    ShowCenterMessage(string.Get(40247));
  elseif result == 4 then
    ShowCenterMessage(string.Get(21684));
  else
    ShowCenterMessage("Army Prodution Start Fail !! Result = "..result);
  end
end

--[[ 軍團製造取消結果
S:039-135 <軍團製造取消結果> +結果(1)
  結果 1:成功
--]]
protocolTable[39][135] = function(data)
  local result = data:ReadByte();
  if result == 1 then
  else
    ShowCenterMessage("Army Prodution Cancel Fail !! Result = "..result);
  end
end

--[[ 軍團製造領取結果
S:039-136 <軍團製造領取結果> +結果(1)
  結果 1:成功 +製造種類(1)
    製造種類 1:器械 +器械種類(1)
    製造種類 2:兵種 +兵種種類(1)
  結果 2:權限不足
  結果 3:資源不足
  結果 4:已達上限
  結果 5:尚未完成
  結果 6:無製造內容
--]]
protocolTable[39][136] = function(data)
  local result = data:ReadByte();
  if result == 1 then
    ShowCenterMessage(string.Get(22033));

    local kind = data:ReadByte();
    local unit = data:ReadByte();
    if armyProductionDatas[kind] == nil then return end
    if armyProductionDatas[kind][unit] == nil then return end
    if npcDatas[armyProductionDatas[kind][unit].npcId] == nil then return end
    
  elseif result == 2 then
    ShowCenterMessage(string.Get(40246));
  elseif result == 3 then
    ShowCenterMessage(string.Get(40247));
  elseif result == 4 then
    ShowCenterMessage(string.Get(21684));
  else
    ShowCenterMessage("Army Prodution Done Fail !! Result = "..result);
  end
end

--[[ 熱鍵
C:040-001 <設定熱鍵> +種類(1) +ID(2) +索引(1)
]]--
protocolTable[40] = {}

--[[ 查詢熱鍵資料
S:040-001 <查詢熱鍵資料> +<<總頁數(1) + 按鈕數(1)+<<ID(2)>>>>
]]--
protocolTable[40][1] = function(data)
  local hotkeyData = {};
  local index = -1;

  for k = 1, 2 do
    hotkeyData[k] = {};
    hotkeyData[k].maxPages =  data:ReadByte();
    hotkeyData[k].maxElements = data:ReadByte();
    hotkeyData[k].ids = {};

    for i = 1, hotkeyData[k].maxPages do
      for j = 1, hotkeyData[k].maxElements do 
        index = Hotkey.GetDataIndex(i, hotkeyData[k].maxElements, j);
        hotkeyData[k].ids[index] = data:ReadUInt16();
      end
    end
  end
  Hotkey.InitViewData(hotkeyData);
end

--[[ 設定熱鍵資料
S:040-002 <設定熱鍵資料> +結果(1)
]]--
protocolTable[40][2] = function(data)
local result = data:ReadByte();
  if result == 0 then
    local save = {};

    save.type = data:ReadByte();
    save.page = data:ReadByte();
    save.index = data:ReadByte();
    save.id = data:ReadUInt16();
    
    local index;
    
    if save.type == 1 then
      index = Hotkey.GetDataIndex(save.page, Hotkey.playerSkills.maxElements, save.index);
      Hotkey.playerSkills.ids[index] = save.id;
    elseif save.type == 2 then
      index = Hotkey.GetDataIndex(save.page, Hotkey.items.maxElements, save.index);
      Hotkey.items.ids[index] = save.id;
    end

    Hotkey.OnSettingFinsh();
    
    ShowCenterMessage(string.Get(10307)); --設定成功
  elseif result == 1 then
    ShowCenterMessage(string.Get(10308)); --分頁錯誤
  elseif result == 2 then
    ShowCenterMessage(string.Get(10309)); --位置錯誤
  elseif result == 3 then
    ShowCenterMessage(string.Get(10310)); --技能錯誤
  elseif result == 4 then
    ShowCenterMessage(string.Get(10311)); --物品錯誤
  elseif result == 5 then
    ShowCenterMessage(string.Get(10312)); --快捷列錯誤
  end
end

--[[ 城戰
C:041-001 <指定駐紮NPC> +索引(1)
C:041-002 <取消駐紮NPC>
C:041-003 <選擇戰術> +戰術(1)
C:041-004 <提領特殊道具> +特殊道具(1)
]]--
protocolTable[41] = {}

--[[ 駐紮NPC出現
S:041-001 <駐紮NPC出現> <<+索引(1) +NPCID(4) +HP(2) +軍團ID(4) +位置X(4) +位置Y(4) +L(1) +軍團名稱(L)>>
]]--
protocolTable[41][1] = function(data)
  while data.length > 0 do
    local index = data:ReadByte();
    local npcId = data:ReadInt32();
    local hp = data:ReadUInt16();
    local orgId = data:ReadUInt32();
    local position = Vector2.New(data:ReadInt32(), data:ReadInt32());
    local orgName = data:ReadString(data:ReadByte());

    Organization.SetOrgName(orgId, orgName);

    Role.GuardNpcAppear(index, npcId, hp, orgId, position);
  end
end

--[[ 玩家指定駐紮NPC
S:041-002 <玩家指定駐紮NPC> <<+玩家ID(8) +索引(1)>>
]]--
protocolTable[41][2] = function(data)
  while data.length > 0 do
    local roleId = data:ReadInt64();
    local guardIndex = data:ReadByte();
    
    if Role.players[roleId] ~= nil then
      Role.players[roleId]:Guard(guardIndex);
    end
  end
end

--[[ 玩家取消駐紮NPC
S:041-003 <玩家取消駐紮NPC> <<+玩家ID(8)>>
]]--
protocolTable[41][3] = function(data)
  while data.length > 0 do
    local roleId = data:ReadInt64();

    if Role.players[roleId] ~= nil then
      Role.players[roleId]:Guard(0);
    end
  end
end

--[[ 駐紮NPC瞬移
S:041-004 <駐紮NPC瞬移> +索引(1) +坐標X(2) +坐標Y(2)
--]]
protocolTable[41][4] = function(data)
  local guardIndex = data:ReadByte();

  if Role.guardNpcs[guardIndex] ~= nil then
    Role.guardNpcs[guardIndex]:Teleport(Vector2.New(data:ReadUInt16(), data:ReadUInt16()));
  end
end

--[[ 城池資料
S:041-005 <城池資料> <<＋索引(1) +城池等級(1) +戰鬥中(1) +L(1) +佔領的軍團名稱(L) +佔領軍團長玩家ID(8) +副軍團長玩家ID(8)*2 +盟軍軍團長玩家ID(8) +副軍團長玩家ID(8)*2 +軍團ID(4) +L(1) +同盟軍團名稱(L) +同盟軍團ID(4)
]]--
protocolTable[41][5] = function(data)
  while data.length > 0 do
    City.SetCityData(data:ReadByte(), data);
  end
end

--[[ 城池的訊息
S:041-006 <城池的訊息> +結果(1)
  結果 1:你不可以進入該城
  結果 2:隊伍必需為同軍團或是同盟國才能進入
  結果 3:無軍團身份不可進入
  結果 4:攻城期間,不可放置木欄或箭塔
  結果 5:休息不足三分鐘,不可出營帳 +剩餘秒數(4)
  結果 6:攻方人數過多,請稍後進入
  結果 7:該城己結束戰爭,不能再攻打該城
  結果 8:該城尚未開放
  結果 9:城戰時間,暫無法使用
  結果 10:無法組隊
  結果 11:守方使用天譴旗
  結果 12:使用萬眾一心令牌
  結果 13:使用銅牆鐵壁令牌
  結果 14:使用神形俱迷令牌
  結果 15:城門告急
  結果 16:無法對該目標使用(魂玉)
]]--
protocolTable[41][6] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    ShowCenterMessage(string.Get(40252));
  elseif result == 2 then
    ShowCenterMessage(string.Get(40253));
  elseif result == 3 then
    ShowCenterMessage(string.Get(40254));
  elseif result == 4 then
    ShowCenterMessage(string.Get(40256));
  elseif result == 5 then
    ShowCenterMessage(string.Get(40257));
  elseif result == 6 then
    ShowCenterMessage(string.Get(40260));
  elseif result == 7 then
    ShowCenterMessage(string.Get(40261));
  elseif result == 8 then
    ShowCenterMessage(string.Get(40262));
  elseif result == 9 then
    ShowCenterMessage(string.Get(40263));
  elseif result == 10 then
    ShowCenterMessage(string.Get(40063));
  elseif result == 11 then
    if City.cities[City.cityId] ~= nil then
      Chat.AddMessage(EChannel.Organization, string.format(string.Get(40469), Organization.GetOrgName(City.cities[City.cityId].orgId)));
    end
  elseif result == 12 then
    if City.cities[City.cityId] ~= nil then
      Chat.AddMessage(EChannel.Organization, string.format(string.Get(40470), Organization.GetOrgName(City.cities[City.cityId].orgId)));
    end
  elseif result == 13 then
    if City.cities[City.cityId] ~= nil then
      Chat.AddMessage(EChannel.Organization, string.format(string.Get(40471), Organization.GetOrgName(City.cities[City.cityId].orgId)));
    end
  elseif result == 14 then
    if City.cities[City.cityId] ~= nil then
      Chat.AddMessage(EChannel.Organization, string.format(string.Get(40472), Organization.GetOrgName(City.cities[City.cityId].orgId)));
    end
  elseif result == 15 then
    Chat.AddMessage(EChannel.Organization, string.Get(40473));
  elseif result == 16 then
    ShowCenterMessage(string.Get(40468));
  end
end

--[[ 駐紮NPC消失
S:041-007 <駐紮NPC消失> <<+索引(1) +是否消失演出(1)>>
]]--
protocolTable[41][7] = function(data)
  while data.length > 0 do
    Role.GuardNpcDisappear(data:ReadByte(), data:ReadBoolean());
  end
end

--[[ 清除所有駐紮NPC
S:041-008 <清除所有駐紮NPC>
]]--
protocolTable[41][8] = function(data)
  for k, v in pairs(Role.guardNpcs) do
    Role.GuardNpcDisappear(k, false);
  end
end

--[[ 城戰最新訊息
S:041-009 <城戰最新訊息> +訊息種類(1)
  訊息種類 1.攻城戰預告
  訊息種類 2.攻城戰開始
  訊息種類 3.城池前哨站遭到擊破 +城池ID(1)
  訊息種類 4.攻城成功 +城池ID(1) +軍團名稱(?)
  訊息種類 5.守城成功 +城池ID(1) +軍團名稱(?)
  訊息種類 6.攻城戰結束
  訊息種類 7.大漠攻城戰開始
  訊息種類 8.大漠攻城戰結束
  訊息種類 9.Npc攻下XX城 +城池ID(1)
  訊息種類 10.城池發現神秘通道
  訊息種類 11.王城秘道活動結束
  訊息種類 12.打敗亡靈之首 +玩家名稱(?)
  訊息種類 13:軍團暗殺公告 +軍團名稱(?)
]]--
protocolTable[41][9] = function(data)
  local kind = data:ReadByte();
  local message = "";

  if kind == 1 then
    message = string.Get(40266);

  elseif kind == 2 then
    message = string.Get(40267);

  elseif kind == 3 then
    local cityId = data:ReadByte();

    if City.cities[cityId] == nil then return end
    
    message = string.Get(City.cities[cityId].name)..string.Get(40268);

  elseif kind == 4 then
    local cityId = data:ReadByte();

    if City.cities[cityId] == nil then return end

    message = data:ReadString(data.length)..string.Get(40269)..string.Get(City.cities[cityId].name)..string.Get(40270);

  elseif kind == 5 then
    local cityId = data:ReadByte();

    if City.cities[cityId] == nil then return end

    message = data:ReadString(data.length)..string.Get(40271)..string.Get(City.cities[cityId].name);

  elseif kind == 6 then
    message = string.Get(40272);

  elseif kind == 7 then
    message = string.Get(40302);

  elseif kind == 8 then
    message = string.Get(40303);

  elseif kind == 9 then
    local cityId = data:ReadByte();

    if City.cities[cityId] == nil then return end

    message = string.Get(40349)..string.Get(City.cities[cityId].name);

  elseif kind == 10 then
    message = string.Get(71172);

  elseif kind == 11 then
    message = string.Get(71173);

  elseif kind == 12 then
    message = string.Get(71084)..data:ReadString(data.length)..string.Get(71174);
    
  elseif kind == 13 then
    message = data:ReadString(data.length)..string.Get(71178);
  end

  if message == "" then return end

  Chat.AddMessage(EChannel.Organization, message);
end

--[[ 軍團長打下器械訊息
S:041-010 <軍團長打下器械訊息> +獲得金錢(2)
]]--
protocolTable[41][10] = function(data)
  ShowCenterMessage(string.Get(40273)..data:ReadUint16()..string.Get(40274));
end

--[[ 顯示所在城池資訊
S:041-011 <顯示所在城池資訊> +城池等級(1) +L(1) +擁有軍團名稱(L) +農業值(4) +畜業值(4) +礦業值(4) +林業值(4) +修築值(4) +前哨站HP(2) +城門HP(2)
]]--
protocolTable[41][11] = function(data)
  local cityId = City.GetCityId(SceneManager.sceneId, ECityScene.Base);

  if City.cities[cityId] == nil then return end

  local cityName = string.Get(City.cities[cityId].name);
  local cityLv = data:ReadByte();

  local message = string.Get(40279)..string.GetCityLevelText(cityLv).."\n";
  message = message..string.Get(40283)..data:ReadString(data:ReadByte()).."\n";

  --開發度
  message = message..string.Get(40284).."\n";
  if City.maxPrac[cityLv + 1] ~= nil then
    message = message..string.Get(40285)..data:ReadUInt32().."/"..City.maxPrac[cityLv + 1][ECityPrac.Farming].."\n";
    message = message..string.Get(40286)..data:ReadUInt32().."/"..City.maxPrac[cityLv + 1][ECityPrac.Livestock].."\n";
    message = message..string.Get(40287)..data:ReadUInt32().."/"..City.maxPrac[cityLv + 1][ECityPrac.Mining].."\n";
    message = message..string.Get(40288)..data:ReadUInt32().."/"..City.maxPrac[cityLv + 1][ECityPrac.Forestry].."\n";
    message = message..string.Get(40289)..data:ReadUInt32().."/"..City.maxPrac[cityLv + 1][ECityPrac.Build].."\n";
  else
    message = message..string.Get(40285)..data:ReadUInt32().."/-----\n";
    message = message..string.Get(40286)..data:ReadUInt32().."/-----\n";
    message = message..string.Get(40287)..data:ReadUInt32().."/-----\n";
    message = message..string.Get(40288)..data:ReadUInt32().."/-----\n";
    message = message..string.Get(40289)..data:ReadUInt32().."/-----\n";
  end

  --城門強度
  message = message..string.Get(40290).."\n";
  message = message..string.Get(40291)..data:ReadUInt16().."\n";
  message = message..string.Get(40292)..data:ReadUInt16().."\n";

  UI.Open(UITutorialHint, 0, nil, cityName, message, function() EventManager.SetConduct(true) end);
end

--[[ 越過城牆狀態
S:041-012 <越過城牆狀態> +是否越過城牆(1)
]]--
protocolTable[41][12] = function(data)
  City.isCrossWall = data:ReadBoolean();
end

--[[ 越過城牆變換座標
S:041-013 <越過城牆變換座標> +玩家ID(8) +座標X(4) +座標Y(4) +是否越過城牆(1)
]]--
protocolTable[41][13] = function(data)
  local roleId = data:ReadInt64();
  local position = Vector2.New(data:ReadInt32(), data:ReadInt32());
  local isCrossWall = data:ReadBoolean();
  
  local members = Team.GetMember(roleId, true);
  for k, v in pairs(members) do
    v:Teleport(position);

    if v.index == Role.playerId then
      City.isCrossWall = isCrossWall;
    end
  end
end

--[[ 解除上下駐紮NPC鎖定
S:041-014 <解除上下駐紮NPC鎖定>
]]--
protocolTable[41][14] = function(data)
  City.guardLock = EGuardLock.None;
end

--[[ 顯示所有城池的佔領軍團
S:041-015 <顯示所有城池的佔領軍團>
]]--
protocolTable[41][15] = function(data)
  local message = "";

  for i = 1, City.maxCity do
    message = message..string.Get(City.cities[i].name)..":";

    if City.cities[i].orgId ~= 0 then
      message = message..Organization.GetOrgName(City.cities[i].orgId).."\n";
    else
      message = message..string.Get(60064).."\n";
    end
  end

  ShowTalkMessage(
    function()
      EventManager.SetConduct(true);
    end,
    message,
    Role.target
  );
end

--[[ 外國NPC出現
S:041-020 <外國NPC出現> +索引(1) +NPCID(4) +座標X(2) +座標Y(2) +戰鬥形式(1)
]]--
protocolTable[41][20] = function(data)
  while data.length > 0 do
    Role.ForeignNpcAppear(data:ReadByte(), data:ReadInt32(), Vector2.New(data:ReadUInt16(), data:ReadUInt16()), data:ReadByte());
  end
end

--[[ 外國NPC移動
S:041-021 <外國NPC移動> +索引(1) +座標X(2) +座標Y(2)
]]--
protocolTable[41][21] = function(data)
  local index = data:ReadByte();
  
  if Role.foreignNpcs[index] == nil then return end

  Role.foreignNpcs[index]:Move(Vector2.New(data:ReadUInt16(), data:ReadUInt16()));
end

--[[ 外國NPC消失
S:041-022 <外國NPC消失> +索引(1)
]]--
protocolTable[41][22] = function(data)
  Role.ForeignNpcDisappear(data:ReadByte());
end

--[[ 特殊道具剩餘數量
S:041-023 <特殊道具剩餘數量> <<+種類(1) +數量(1)>>
]]--
protocolTable[41][23] = function(data)
  --LH_MEExtractor.RevItemCount(Data);
end

--[[ 畫面出現城戰倒數計時
S:041-050 <畫面出現城戰倒數計時> +倒數秒數(1)
]]--
protocolTable[41][50] = function(data)
  City.countDownSeconds = data:ReadByte();
end

--[[ 設定觀戰中玩家
S:041-051 <設定觀戰中玩家> <<+玩家ID(8)>>
]]--
protocolTable[41][51] = function(data)
  while data.length > 0 do
    local roleId = data:ReadInt64();

    if roleId == Role.playerId then
      --TODO 關掉不該有的操作介面
    end

    if Role.players[roleId] ~= nil then
      if not Role.players[roleId].data.isWatching then
        Role.players[roleId].data.isWatching = true;
        Role.players[roleId]:Initialize();
      end
    end
  end
end

--[[ 更新城池商店等級
S:041-052 <更新城池商店等級> +數量(1) <<＋城池ID(1) +商店等級(1)*6>>
]]--
protocolTable[41][52] = function(data)
  local count = data:ReadByte();
  for i = 1, count do
    local cityId = data:ReadByte();

    for i = 1, City.maxCityStation do
      City.SetStationLv(cityId, i, data:ReadByte(), false);
    end
  end

  if UI.IsVisible(UICityStation) then
    UICityStation.UpdateUI();
  end
end

--[[ 攻城器械倒數訊息
S:041-053 <攻城器械倒數訊息> ＋場景ID(2) +NPCID(2) +倒數分鐘(2)
]]--
protocolTable[41][53] = function(data)
  local sceneId = data:ReadUInt16();

  local cityName = nil;
  for k, cityInfo in pairs(City.cities) do
    if cityInfo.fight.sceneId == sceneId then
      cityName = string.Get(cityInfo.name);
      break;
    end
  end
  
  if cityName == nil then return end

  local npcId = data:ReadUInt16();
  if npcDatas[npcId] == nil then return end

  local minutes = data:ReadUInt16();
  if minutes > 0 then
    Chat.AddMessage(EChannel.Organization, string.format(string.Get(40490), cityName, npcDatas[npcId].name, minutes));
  else
    Chat.AddMessage(EChannel.Organization, string.format(string.Get(40491), cityName, npcDatas[npcId].name));
  end
end

--[[ 重置技能屬性
C:042-001 <重置技能> +技能ID(2) +背包索引(1)
C:042-002 <重置屬性> +屬性(1) +背包索引(1)
]]--
protocolTable[42] = {}

--[[ 重置技能結果
S:042-001 <重置技能結果> +結果(1)
]]--
protocolTable[42][1] = function(data)
  local result = data:ReadByte();
  
  if result == 0 then
    ShowCenterMessage(string.Get(30079));
    AudioManager.PlayOnce("AudioClip_WA0014", 0);
  elseif Contains(result, 1, 2, 3, 5, 6, 255) then
    ShowCenterMessage(string.Get(30080));
  elseif result == 4 then
    ShowCenterMessage(string.Get(30081));
  end

  --BK_SkillRegressF.Disappear;
end

--[[ 重置屬性結果
S:042-002 <重置屬性結果> +結果(1)
]]--
protocolTable[42][2] = function(data)
  local result = data:ReadByte();
  
  if result == 0 then
    ShowCenterMessage(string.Get(30079));
    AudioManager.PlayOnce("AudioClip_WA0014", 0);
  elseif Contains(result, 1, 3, 4, 255) then
    ShowCenterMessage(string.Get(30080));
  elseif result == 2 then
    ShowCenterMessage(string.Get(30081));
  end

  --BK_AttrRegressF.Disappear;
end

--[[ 屬性道具訊息
S:042-003 <屬性道具訊息> +種類(1) +種類增加點數(2) +剩餘次數(1)
]]--
protocolTable[42][3] = function(data)
  local kind = data:ReadByte(); 

  if string.GetAttribute(kind) ~= nil then    
    Chat.AddMessage(EChannel.System, string.format(string.Get(71091), string.GetAttribute(kind), tostring(data:ReadUInt16()), tostring(data:ReadByte())));
  elseif kind == 7 then
    ShowCenterMessage(string.Get(71093), 2);
  elseif kind == 8 then
    ShowCenterMessage(string.Get(71094), 2);
  end
end

--[[ 領悟丹訊息
S:042-004 <領悟丹訊息> +種類(1)
]]--
protocolTable[42][4] = function(data)
  local kind = data:ReadByte();

  if string.GetAttribute(kind) ~= nil then
    Chat.AddMessage(EChannel.System, string.Get(20023)..string.Get(71182)..string.Get(80011).."_"..string.GetAttribute(kind));
  end
end

--[[ 同盟
C:043-001 <邀請締結同盟> +軍團ID(4)
C:043-002 <回應締結同盟邀請> +軍團ID(4) +結果(1)
C:043-003 <離開同盟>
C:043-004 <要求所有軍團資訊>
]]--
protocolTable[43] = {}

--[[ 締結同盟邀請
S:043-001 <締結同盟邀請> +軍團ID(4) +L(1) +軍團名稱(L)
]]--
protocolTable[43][1] = function(data)
  local orgId = data:ReadUInt32();
  local orgName = data:ReadString(data:ReadByte());

  ShowCheckMessage(
    function(result)
      --C:043-002 <回應締結同盟邀請> +軍團ID(4) +結果(1)
      sendBuffer:Clear();
      sendBuffer:WriteUInt32(orgId);
      if result then
        sendBuffer:WriteByte(1);
      else
        sendBuffer:WriteByte(2);
      end
      Network.Send(43, 2, sendBuffer);
    end,
    string.Get(20860)..orgName..string.Get(20861),
    nil
  );
end

--[[ 同盟邀請結果
S:043-002 <同盟邀請結果> +軍團ID(4) +L(1) +軍團名稱(L) +L(1) +軍團長名字(L) +結果(1)
  結果 1:同意 +同盟ID(4)
  結果 2:拒絕
  結果 3:無回應
  結果 4:失敗
  結果 5:同盟開關未開啟
]]--
protocolTable[43][2] = function(data)
  local orgId = data:ReadUInt32();
  local orgName = data:ReadString(data:ReadByte());
  local name = data:ReadString(data:ReadByte());
  
  local showText = orgName.." "..name;

  local result = data:ReadByte();
  if result == 1 then
    showText = showText..string.Get(20862);

    local allyId = data:ReadUInt32();

    if Organization.orgs[orgId] == nil then return end

    Organization.orgs[orgId].allyId = allyId;
    Organization.orgs[Organization.Id].allyId = allyId;

    if UI.IsVisible(UIArmy) then
      UIArmy.UpdateAlly();
    end
  elseif result == 2 then
    showText = showText..string.Get(20863);
  elseif result == 3 then
    showText = showText..string.Get(20864);
  elseif result == 4 then
    showText = showText..string.Get(20865);
  elseif result == 5 then
    showText = showText..string.Get(20866);
  end

  ShowTalkMessage(nil, showText, nil);
end

--[[ 離開同盟結果
S:043-003 <離開同盟結果> +結果(1)
  結果 0:成功
  結果 1:無同盟
  結果 2:權限不足
  結果 255:其他錯誤
]]--
protocolTable[43][3] = function(data)
  local result = data:ReadByte();

  if result == 0 then
    ShowCenterMessage(string.Get(20870));

    local count = 0;
    local orgId = 0;
    for k, orgInfo in pairs(Organization.orgs) do
      if k ~= Organization.Id and orgInfo.allyId == Organization.orgs[Organization.Id].allyId then
        count = count + 1;
        orgId = k;
      end
    end

    --只剩一個軍團在此同盟才解散同盟
    if count == 1 then
      Organization.orgs[orgId].allyId = 0;
    end

    Organization.orgs[Organization.Id].allyId = 0;
    Organization.SetAllyName("");
    
    if UINewChat.GetChannel() == EChannel.Ally then
      UINewChat.ChangeChannel(EChannel.Scene);
    end
  elseif result == 1 then
    ShowCenterMessage(string.Get(20871));
  elseif result == 2 then
    ShowCenterMessage(string.Get(20872));
  elseif result == 255 then
    ShowCenterMessage(string.Get(20873));
  end
end

--[[ 所有軍團資訊
S:043-004 <所有軍團資訊> <<+軍團ID(4) +L(1) +軍團名稱(L) +L(1) +團長名字(L) +同盟ID(4) +成員數(1) +軍團長是否在線(1)>>
]]--
protocolTable[43][4] = function(data)
  while data.length > 0 do
    Organization.SetOrgInfo(data:ReadUInt32(), data:ReadString(data:ReadByte()), data:ReadString(data:ReadByte()), data:ReadUInt32(), data:ReadByte(), data:ReadBoolean(), data.length <= 0);
  end
end

--[[ 軍團離開同盟
S:043-005 <軍團離開同盟> +軍團ID(4)
]]--
protocolTable[43][5] = function(data)
  local orgId = data:ReadUInt32();

  if Organization.orgs[orgId] == nil then return end

  Organization.orgs[orgId].allyId = 0;

  if UI.IsVisible(UIArmy) then
    UIArmy.UpdateAlly();
  end
end

--[[ 同盟相關訊息
S:043-006 <同盟相關訊息> +種類(1)
]]--
protocolTable[43][6] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    ShowCenterMessage(string.Get(30089), 2);
  elseif kind == 2 then
    ShowCenterMessage(string.Get(30090), 2);
  elseif kind == 3 then
    ShowCenterMessage(string.Get(30091), 2);
  end
end

--[[ 軍團長在線資訊
S:043-007 <軍團長在線資訊> <<+軍團ID(4) +軍團長是否在線(1)>>
]]--
protocolTable[43][7] = function(data)
  while data.length > 0 do
    Organization.SetChiefOnline(data:ReadUInt32(), data:ReadBoolean(), data.length <= 0);
  end
end

--[[ 更新同盟軍團名稱
S:043-008 <更新同盟軍團名稱> +L(1) +同盟軍團名稱(L)
--]]
protocolTable[43][8] = function(data)
  Organization.SetAllyName(data:ReadString(data:ReadByte()));
end

--[[ 武將轉生
C:044-001 <武將轉生> +武將索引(1)
C:044-002 <學習特有技> +武將索引(1)
C:044-003 <武將二轉> +武將索引(1)
]]--
protocolTable[44] = {}

--[[ 武將轉生訊息
S:044-001 <武將轉生訊息> +種類(1)
]]--
protocolTable[44][1] = function(data)
  local kind = data:ReadByte();

  if kind == 0 then
    ShowCenterMessage(string.Get(21070), 2);
  elseif kind == 1 then
    ShowCenterMessage(string.Get(21071), 2);
  elseif kind == 2 then
    ShowCenterMessage(string.Get(21072), 2);
  elseif kind == 3 then
    ShowCenterMessage(string.Get(21073), 2);
  elseif kind == 4 then
    ShowCenterMessage(string.Get(21074), 2);
  elseif kind == 5 then
    ShowCenterMessage(string.Get(21075), 2);
  elseif kind == 6 then
    ShowCenterMessage(string.Get(21076), 2);
  elseif kind == 7 then
    ShowCenterMessage(string.Get(21077), 2);
  elseif kind == 8 then
    ShowCenterMessage(string.Get(21078), 2);
  elseif kind == 9 then
    ShowCenterMessage(string.Get(90033), 2);
  elseif kind == 10 then
    ShowCenterMessage(string.Get(71104), 2);
  elseif kind == 11 then
    ShowCenterMessage(string.Get(71105), 2);
  elseif kind == 255 then
    ShowCenterMessage(string.Get(21079), 2);
  end
end

--[[ 開啟武將轉生介面
S:044-002 <開啟武將轉生介面>
]]--
protocolTable[44][2] = function(data)
  UI.Open(UINpcTurn, 1);
end

--[[ 開啟武將二轉介面
S:044-003 <開啟武將二轉介面>
]]--
protocolTable[44][3] = function(data)
  UI.Open(UINpcTurn, 2);
end

--[[ 結婚
C:045-001 <發喜帖> +數量 <<+玩家ID(8)>> +內容(?)
C:045-002 <送禮金> +玩家ID(8) +禮金(4)
C:045-003 <回應求婚> +玩家ID(8) +是否願意(1)
C:045-004 <更新資料>
]]--
protocolTable[45] = {}

--[[ 結婚結果
S:045-001 <結婚結果> +結果(1)
  結果 0:結婚成功 +配偶玩家ID(8) +結婚時間(8)
  結果 1:不可同性別
  結果 2:有人等級不足
  結果 3:有人已結過婚
  結果 4:Server紀錄飽和
  結果 6:有人沒有結婚標記
  結果 255:例外錯誤
]]--
protocolTable[45][1] = function(data)
  local result = data:ReadByte();

  if result == 0 then
    Marry.partnerId = data:ReadInt64();
    Marry.marryDate = data:ReadDouble();

    ShowCenterMessage(string.Get(21090), 2);
  elseif result == 1 then
    ShowCenterMessage(string.Get(21091), 2);
  elseif result == 2 then
    ShowCenterMessage(string.Get(21092), 2);
  elseif result == 3 then
    ShowCenterMessage(string.Get(21093), 2);
  elseif result == 4 then
    ShowCenterMessage(string.Get(21094), 2);
  elseif result == 5 then
    ShowCenterMessage(string.Get(21095), 2);
  elseif result == 255 then
    ShowCenterMessage(string.Get(21079), 2);
  end
end

--[[ 離婚結果
S:045-002 <離婚結果> +結果(1)
  結果 0:離婚成功
  結果 1:玩家單身
  結果 255:例外錯誤
]]--
protocolTable[45][2] = function(data)
  local result = data:ReadByte();

  if result == 0 then
    Marry.partnerId = 0;
    Marry.marryDate = nil;
    Marry.celebrationLv = 0;

    ShowCenterMessage(string.Get(21080), 2);
  elseif result == 1 then
    ShowCenterMessage(string.Get(21081), 2);
  elseif result == 255 then
    ShowCenterMessage(string.Get(21079), 2);
  end
end

--[[ 結婚資訊
S:045-003 <結婚資訊> +配偶玩家ID(8) +結婚時間(8) +婚禮等級(1)
]]--
protocolTable[45][3] = function(data)
  Marry.partnerId = data:ReadInt64();
  Marry.marryDate = data:ReadDouble();
  Marry.celebrationLv = data:ReadByte();
end

--[[ 開啟發喜帖介面
S:045-004 <開啟發喜帖介面>
]]--
protocolTable[45][4] = function(data)
  --Se_WeddingFriendList.Appear;
end

--[[ 開啟發禮金介面
S:045-005 <開啟發禮金介面>
]]--
protocolTable[45][5] = function(data)
  --Se_CoupleList.appear;
end

--[[ 結婚送禮金結果
S:045-006 <結婚送禮金結果> +結果(1)
  結果 0:送禮金成功
  結果 1:對方不在線上
  結果 2:對方已經完婚
  結果 3:你沒有這麼多錢可以發
  結果 4:對方收不下這麼多禮金
  結果 255:例外錯誤
]]--
protocolTable[45][6] = function(data)
  local result = data:ReadByte();

  if result == 0 then
    ShowCenterMessage(string.Get(21096), 2);
  elseif result == 1 then
    ShowCenterMessage(string.Get(21097), 2);
  elseif result == 2 then
    ShowCenterMessage(string.Get(21098), 2);
  elseif result == 3 then
    ShowCenterMessage(string.Get(21099), 2);
  elseif result == 255 then
    ShowCenterMessage(string.Get(21079), 2);
  end
end

--[[ 求婚確認
S:045-007 <求婚確認> +性別(1) +L(1) +名字(L) +NPC索引(2)
]]--
protocolTable[45][7] = function(data)
  local sex = data:ReadByte();
  local name = data:ReadString(data:ReadByte());
  local index = data:ReadUInt16();

  if Role.mapNpcs[index] == nil then return end

  local message = "";
  if sex == 1 then
    message = string.Get(30142).." "..name..""..string.Get(30143);
  else
    message = string.Get(30140).." "..name..""..string.Get(30141);
  end
    
  ShowCheckMessage(
    function(result)
      --C:045-003 <回應求婚> +玩家ID(8) +是否願意(1)
      sendBuffer:Clear();
      sendBuffer:WriteInt64(roleId);
      if result then
        sendBuffer:WriteByte(1);
      else
        sendBuffer:WriteByte(2);
      end
      Network.Send(45, 3, sendBuffer);
    end,
    message,
    Role.mapNpcs[index]
  );
end

--[[ 結婚求婚結果
S:045-008 <結婚求婚結果> +結果(1)
]]--
protocolTable[45][8] = function(data)
  local result = data:ReadByte();

  if result == 2 then
    ShowCenterMessage(string.Get(30144), 2);
  end
end

--[[ 結婚禮金
S:045-009 <結婚禮金> +L(1) +名字(L) +金額(4)
]]--
protocolTable[45][9] = function(data)
  ShowCenterMessage(string.Get(21100)..data:ReadString(data:ReadByte())..string.Get(21101)..tostring(data:ReadInt32())..string.Get(40141), 2);
end

--[[ 結婚喜帖
S:045-010 <結婚喜帖> +玩家ID(8) +L(1) +名字(L) +時間(8) +內容(?)
]]--
protocolTable[45][10] = function(data)
  local roleId = data:ReadInt64();
  local name = data:ReadString(data:ReadByte());
  local time = data:ReadDouble();
  local message = data:ReadString(data.length);

  --Se_Invatation.Appear(roleId, name..#13..message, time);
end

--[[ 結婚公告
S:045-011 <結婚公告> +L(1) +A名字(L) +L(1) +B名字(L)
]]--
protocolTable[45][11] = function(data)
  local message = string.Get(30145)..data:ReadString(data:ReadByte())..string.Get(30146)..data:ReadString(data:ReadByte())..string.Get(30147);
  Chat.AddMessage(EChannel.System, message);
  ShowMarqueeMessage(message);
end

--[[ 結婚所有夫妻資料
S:045-012 <結婚所有夫妻資料> +數量(4) <<+A玩家ID(8) +B玩家ID(8)>>
]]--
protocolTable[45][12] = function(data)
  local count = data:ReadInt32();
  for i = 1, count do
    Marry.AddPartner(data:ReadInt64(), data:ReadInt64());
  end
end

--[[ 結婚典禮等級
S:045-013 <結婚典禮等級> +等級(1)
]]--
protocolTable[45][13] = function(data)
  Marry.celebrationLv = data:ReadByte();
end

--[[ 結婚彩球
S:045-014 <結婚彩球> <<+玩家ID(8)>>
]]--
protocolTable[45][14] = function(data)
  while data.length > 0 do
    local roleId = data:ReadInt64();

    if Role.players[roleId] ~= nil then
      EffectLight.New(10247, 80, 1, 14, 14, EEffectLightTracer.StandAni, Role.players[roleId].position.x + 9, Role.players[roleId].position.y, 255, true, 0, nil, nil, nil, nil, true);
    end
  end
end

--[[ 即將結婚公告
S:045-015 <即將結婚公告> +L(1) +A名字(L) +L(1) +B名字(L)
]]--
protocolTable[45][15] = function(data)
  local message = data:ReadString(data:ReadByte())..string.Get(30146)..data:ReadString(data:ReadByte())..string.Get(30148);
  Chat.AddMessage(EChannel.System, message);
  ShowMarqueeMessage(message);
end

--[[ 結婚配偶資料
S:045-016 <結婚配偶資料> +玩家名片(?) +職業(1)
]]--
protocolTable[45][16] = function(data)
  Marry.partner = PlayerInfo.New(data:ReadInt64(), data);
  Marry.partner.career = data:ReadByte();
  --btn_Career.SetAttr(partnerHum.Element, partnerHum.Turn_Kind, partnerHum.Career_Kind);
end

--[[ 移民
C:046-001 <移民>
]]--
protocolTable[46] = {}

--[[ 移民結果
S:046-001 <移民結果> +目標伺服器ID(1) +移民結果(1) +目標伺服器結果(1) +密碼(4)
]]--
protocolTable[46][1] = function(data)
  local serverId = data:ReadByte();
  local migrantResult = data:ReadByte();
  local serverResult = data:ReadByte();
  local password = data:ReadInt32();

  if Network.servers[serverId] == nil then return end

  local message = "";

  --移民/返鄉 成功
  if (Contains(migrantResult, 1, 2) and Contains(serverResult, 2, 3)) or (migrantResult == 0 and serverResult == 7) then
    Game.Logout();
    
    if Migrant.IsGalaxyServer(Network.serverId) or Migrant.IsGalaxyServer(serverId) then
      --換到GalaxyServer/換回GameServer處理
      Network.password = tostring(password);      
    else
      --非無界擂台Server.為一般移民
      message = string.Get(80010)..string.Get(80013).." "..Network.servers[serverId].name.." "..string.Get(80011);
    end

    Network.conectCode = 0;
    Network.Connect(Network.servers[serverId].host, 6614);
  else
    --失敗
    message = string.Get(80010)..string.Get(80012);
    
    if migrantResult == 1 then
      --移民資料新增成功
    elseif migrantResult == 2 then
      --移民資料修改成功
    elseif migrantResult == 3 then
      --移民資料飽和
      message = message..string.Get(30171);
    elseif migrantResult == 4 then
      --移民申請中
      message = message..string.Get(30174);
    elseif migrantResult == 5 then
      --目的Server關閉
      message = message..":"..string.Get(30175);
    elseif migrantResult == 6 then
      --來源與移民Server失去聯繫
    elseif migrantResult == 7 then
      --錢不夠
      message = message..string.Get(30184);
    elseif migrantResult == 8 then
      --未完成之前申請動作
      message = message.."+"..string.Get(30176);
    elseif migrantResult == 9 then
      --消去原本在Buffer的資料
    elseif migrantResult == 10 then
      --重新申請,不管之前到哪
      message = message..string.Get(30185);
    elseif migrantResult == 255 then
      --例外錯誤
    end

    if serverResult == 1 then
      --人數已滿
      message = message..string.Get(30173);
    elseif serverResult == 2 then
      --可新增 success
    elseif serverResult == 3 then
      --可覆蓋 success
    elseif serverResult == 4 then
      --玩家連線中fail
    elseif serverResult == 5 then
      --目前資料不可被來源Server覆蓋fail
      message = message..string.Get(30172);
    elseif serverResult == 6 then
      --找不到玩家的Save資料 fail
      message = message..string.Get(30177);
    elseif serverResult == 7 then
      --返鄉設定成功 success
    elseif serverResult == 8 then
      --目的Server關閉
      message = message..":"..string.Get(30175);
    elseif serverResult == 9 then
      --目前移民資料保存中
      message = message..string.Get(30186);
    elseif serverResult == 255 then
      --例外錯誤 fail
    end
  end

  if message ~= "" then
    ShowCenterMessage(message, 2);
  end
end

--[[ 移民相關訊息
S:046-002 <移民相關訊息> +種類(1)
]]--
protocolTable[46][2] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    ShowCenterMessage(string.Get(71097), 2);
  elseif kind == 2 then
    ShowCenterMessage(string.Get(71205), 2);
  elseif kind == 3 then
    ShowCenterMessage(string.Get(71206), 2);
  elseif kind == 4 then
    ShowCenterMessage(string.Get(71207), 2);
  end
end

--[[ 移民確認
S:046-003 <移民確認> +伺服器ID(1)
]]--
protocolTable[46][3] = function(data)
  local serverId = data:ReadByte();

  if Network.servers[serverId] == nil then return end

  ShowCheckMessage(
    function(result)
      if result then
        --C:046-001 <移民>
        Network.Send(46, 1);
      end
    end,
    string.Get(80247)..Network.servers[serverId].name,
    Role.target
  );
end

--[[ 副本
C:047-002 <創建房間> +副本ID(2)
C:047-022 <領周副本全通獎勵>
]]--
protocolTable[47] = {}
--[[ 要求房間列表
S:047-001 <要求房間列表> +數量(2)+<<房間編號(4) +房間名稱長度(1) +房間名稱(?) +房長ID(8) +是否需要密碼(1) +副本編號(2) +當前人數(1)>>
]]--
protocolTable[47][1] = function(data)
  Dungeon.ReciveRoomData(data);
end

--[[ 創建房間結果
S:047-002 <創建房間結果> +結果(1) +長度(1) + 密碼(?)
]]--
protocolTable[47][2] = function(data)
  Dungeon.ReciveCreateDungeon(data);
end

--[[ 加入房間結果
S:047-003 <加入房間結果> +結果(1) +房間序號(4) +房間人數(1) <<+玩家ID(8) +L(1) +玩家名稱(L) +等級(1) +性別(1) +頭型(1) +色盤值(帽,髮,膚)(4) +色盤值(衣,配一,鞋)(4) <<+裝備ID(2)>> +稱號(2) +是否準備(1)>>
+副本ID(2) ]]--
protocolTable[47][3] = function(data)
  Dungeon.ReciveJoinRoom(data);
end

--[[ 重置次數結果
S:047-004 <重置次數結果> +結果(1)
]]--
protocolTable[47][4] = function(data)
  Dungeon.ReciveResetCount(data);
end

--[[ 掃蕩結果
S:047-005 <掃蕩結果> +結果(1) +副本編號(2)+獎勵數量(1)+<<+獎勵ID(2) +數量(2)>>
]]--
protocolTable[47][5] = function(data)
  Dungeon.ReciveSkipResult(data);
end

--[[ 設定房間密碼
S:047-006 <設定房間密碼> +長度(1) +密碼(?)
]]--
protocolTable[47][6] = function(data)
  Dungeon.ReciveSetPassword(data);
end

--[[ 設定房間名稱
S:047-007 <設定房間名稱> +長度(1) +名稱(?)
]]--
protocolTable[47][7] = function(data)
  Dungeon.ReciveSetRoomName(data);
end

--[[ 邀請某人結果
S:047-008 <邀請某人結果> +結果(1)
]]--
protocolTable[47][8] = function(data)
  local result = data:ReadByte();
  Dungeon.ReciveInviteResult(result);  
end

--[[ 發布招募資訊結果
S:047-009 <發布招募資訊結果> +結果(1)
]]--
protocolTable[47][9] = function(data)
  local result = data:ReadByte();
  if result  == 0 then 
    ShowCenterMessage(string.Get(20166));
  else    
    logError("Send Dungeon Recurit Fail");
  end
end

--[[ 玩家離開組隊房間
S:047-010 <玩家離開組隊房間> +RoleID(8) +原因(1)
]]--
protocolTable[47][10] = function(data)
  Dungeon.RecivePlayerLeave(data);
end

--[[ 準備/取消準備
S:047-011 <準備/取消準備> +RoleID(8) +是否準備(1)
]]--
protocolTable[47][11] = function(data)
  Dungeon.RecivePlayerPrePare(data);
end

--[[ 副本結束 
S:047-012 <副本結束> +結果(1) +副本編號(2) +數量(1) <<+獎勵ID(2) +數量(2)>>
]]--
protocolTable[47][12] = function(data)
  Dungeon.ReciveDungeonResult(data);
end

--[[ 通知某人加入房間 
S:047-013 <通知某人加入房間> +玩家ID(8) +L(1) +玩家名稱(L) +等級(1) +性別(1) +頭型(1) +色盤值(帽,髮,膚)(4) +色盤值(衣,配一,鞋)(4) <<+裝備ID(2)>> +稱號(2)
]]--
protocolTable[47][13] = function(data)
  Dungeon.RecivePlayerJoinRoom(data);
end

--[[ 通知新任房長
S:047-014 <通知新任房長> +RoleID(8)
]]--
protocolTable[47][14] = function(data)
  Dungeon.ReciveChangeRoomOwner(data);
end

--[[ 收到邀請加入副本 
S:047-015 <收到邀請加入副本> +房間序號(4) +副本ID(2) +房長ID(8) +長度(1) +房長名(?) +等級(1) +轉生(1) +屬性(1) +三轉屬性(1) +職業(1) +是否密碼(1)
]]--
protocolTable[47][15] = function(data)
  local inviteData = DungeonInvitation.New(data);

  Invitation.Add(EInvitation.Dungeon, inviteData.roleId, inviteData);
end

--[[ 公開招募 
S:047-016 <收到公開招募> +頻道種類(1) +房間序號(4) +副本ID(2) +房長ID(8) +長度(1) +房長名(?)
]]--
protocolTable[47][16] = function(data)
  Dungeon.ReciveDungeonRecurit(data);
end

--[[ 踢成員結果
S:047-017 <踢成員結果> +結果(1)
]]--
protocolTable[47][17] = function(data)
  local result = data:ReadByte();
  if result  == 0 then 

  else
    logError("Send Dungeon KickPlayer Fail");
  end
end

--[[ 收到副本開始時間 
S:047-018 <收到副本開始時間> +時間(8)
]]--
protocolTable[47][18] = function(data)
  Dungeon.ReciveEndTime(data);
end

--[[副本準備失敗 條件未達成   
S:047-019 <副本準備失敗 條件未達成> +結果(1)
]]--
protocolTable[47][19] = function(data)
  --顯示中央訊息 "不符合限制條件，無法進入關卡！ 
  local result = data:ReadByte();
  if result == 3 then
    ShowCenterMessage(string.Get(22544)); --未帶出戰NPC 5/30限制一定要帶出戰NPC
   else
    ShowCenterMessage(string.Get(22414));
  end
end

--[[ 控制關閉副本介面
S:047-020 <控制關閉副本介面> +副本ID(2)
]]--
protocolTable[47][20] = function(data)
  local dungeonData = Dungeon.GetData(data:ReadInt16());
  if UI.IsVisible(UIDungeon) and (dungeonData.kind == 3) then 
    UI.Close(UIDungeon);
  end
end

--[[ 領全通獎結果
S:047-022 <領全通獎結果>
]]--
protocolTable[47][22] = function(data)
  --如果介面開著 更新介面 
  if UI.IsVisible(UIDungeon) then     
    UIDungeon.UpdateInfo()
  end
end

--[[ 永恆地層
C:048-001 <開戰> + 層級(4) + 難度(1)
C:048-002 <強化玩家能力> + 類別(1)
C:048-003 <重置>  + 類別(1)
]]--
protocolTable[48] = {}

--[[ 永恆地層開戰
S:048-001 <開戰> + 開戰結果(1)
]]--
protocolTable[48][1] = function(data)
  local result = data:ReadByte();
  if result == 3 then
    ShowCenterMessage(string.Get(21971));  --組隊中，無法入場！
  else
    UI.Close(UIEternalDungeon);
  end
end

--[[ 永恆地層強化玩家能力
S:048-002 <戰鬥結果> + 結果(1)
]]--
protocolTable[48][2] = function(data)
  local layer = data:ReadInt32();
  local result = data:ReadByte();
  UIEternalDungeon.OverBattle(result);
  UI.Open(UIEternalDungeon);
end

--[[ 永恆地層報名
S:048-003 <報名>
]]--
protocolTable[48][3] = function(data)
  UI.Open(UIEternalDungeon);
end

--[[ 永恆地層最快通關玩家
S:048-006 <最快通關玩家> + 樓層(4) + <<玩家名稱(?) + 通關時間(8)>>
]]--
protocolTable[48][4] = function(data)
  local layer = data:ReadInt32();
  local count = data:ReadInt32();
  UIEternalDungeon.UpdateInfo(layer);
  UIEternalDungeon.SetRecord(count, data);
end

--[[ 戰鬥
C:050-001 <使用特技> +發招行(1) +發招列(1) +目標行(1) +目標列(1) +技能ID(2) +減查碼(1) +減查碼(1)
C:050-002 <使用道具> +發招行(1) +發招列(1) +目標行(1) +目標列(1) +物品ID(2) +減查碼(1) +減查碼(1)
]]--
protocolTable[50] = {}

--[[ 戰鬥使用特技
S:050-001 <戰鬥使用特技> <<+長度(2) +攻擊者行(1) +攻擊者列(1) +技能ID(2) +場地(1) +數目(1) <<+目標行(1) +目標列(1) +攻擊結果(1) +目標動作(1) +數目(1) <<+屬性種類(1) +質(4) +正負(1)>> >>
]]--
protocolTable[50][1] = function(data)
  FightField.DecShowStartTick(3.1);
  FightManager.AllSoulWarriorVisible(ERoleVisible.Hide);
  FightManager.RevAttackSkill(data);
end

--[[ 戰鬥使用物品
S:050-002 <戰鬥使用物品> <<+行(1) +列(1) +物品ID(2) +數量(1) +目標行(1) +目標列(1)>>
]]--
protocolTable[50][2] = function(data)
  --FightManage.RevApplyUseItem(Data);
end

--戰鬥
protocolTable[51] = {}

--[[ 戰鬥中立即修改數值
S:051-001 <戰鬥中立即修改數值> <<+行(1) +列(1) +數值種類(2) +數值(4)>>
]]--
protocolTable[51][1] = function(data)
  FightManager.RevChangeAttrib(data);
end

--戰鬥
protocolTable[52] = {}

--[[ 戰鬥開始倒數計時
S:052-001 <戰鬥開始倒數計時>
--]]
protocolTable[52][1] = function(data)
  FightField.SetCountDown();
  FightManager.AllSoulWarriorVisible(ERoleVisible.Visible);
end

--[[ 戰鬥軍師回魔
S:052-002 <戰鬥軍師回魔> +隊伍(1) +魔量(2)
]]--
protocolTable[52][2] = function(data)
  FightField.AddTeamSp(data:ReadByte(), data:ReadInt16());
end

--戰鬥
protocolTable[53] = {}

--[[ 戰鬥狀態回復
S:053-001 <戰鬥狀態回復> <<+行(1) +列(1) +狀態種類(1) +技能ID(2)>>
]]--
protocolTable[53][1] = function(data)
  FightManager.RevRestoreStatus(data);
end

--[[ 戰鬥被打扒(不用做事)
]]--    
protocolTable[53][2] = function(data)
end

--[[ 戰鬥被打飛
S:053-003 <戰鬥被打飛> +行(1) +列(1)
]]--    
protocolTable[53][3] = function(data)
  FightManager.RevFlyOut(data);
end

--[[ 戰鬥掉寶
S:053-004 <戰鬥掉寶> +物品ID(2) +掉寶行(1) +掉寶列(1) <<+得寶行(1) +得寶列(1)>>
]]--    
protocolTable[53][4] = function(data)
  FightManager.RevFlyTreasure(data);
end

--[[ 戰鬥動作設定完成
S:053-005 <戰鬥動作設定完成> +行(1) +列(1)
]]--
protocolTable[53][5] = function(data)
  FightManager.RevActSetOK(data);
end

--[[ 戰鬥助陣訊息
S:053-006 <戰鬥助陣訊息> +類型(1) +被幫助玩家ID(8) +助陣者玩家ID(8)
]]--
protocolTable[53][6] = function(data)
  FightManager.RevHelpMsg(data);
end

--[[ 戰鬥換行列
S:053-007 <戰鬥換行列> +從行(1) +從列(1) +到行(1) +到列(1)
]]--
protocolTable[53][7] = function(data)
  FightManager.RevChgColmRow(data);
end

--[[ 更新城戰殺敵數
S:053-008 <更新殺敵數> +殺敵數(2)
]]--
protocolTable[53][8] = function(data)
  FightManager.RevKillEmyNum(data);
end

--[[ 生存戰場記錄
S:053-009 <生存戰場記錄> +殺敵數(2) +死亡數(2)
]]--
protocolTable[53][9] = function(data)
  Survive.killCount = data:ReadUInt16();
  Survive.dieCount = data:ReadUInt16();
end

--[[ 生存戰場前三名
S:053-010 <生存戰場前三名> <<+L(1) +名字(L) +分數(2)>>
]]--
protocolTable[53][10] = function(data)
  for i = 1, 3 do
    if data.length <= 0 then return end

    --LiveWinner[i].name = data:ReadString(data:ReadByte());
    --LiveWinner[i].score = data:ReadUInt16();
  end
end

--[[ 生存戰場排行榜
S:053-011 <生存戰場排行榜> <<+名次(1) +L(1) +名字(L)>>
]]--
protocolTable[53][11] = function(data)
  local count = 0;
  while data.length > 0 do
    if count > 20 then return end

    local rank = data:ReadByte();
    local name = data:ReadString(data:ReadByte());

    if rank == 1 then
      Chat.AddMessage(EChannel.System, string.Get(40419)..name);
    elseif rank == 2 then
      Chat.AddMessage(EChannel.System, string.Get(40420)..name);
    elseif rank == 3 then
      Chat.AddMessage(EChannel.System, string.Get(40421)..name);
    end

    count = count + 1;
  end
end

--[[ 物品效果
S:053-013 <物品效果> +物品ID(2) +次數(1) +模式(1)
]]--
protocolTable[53][13] = function(data)
  local itemId = data:ReadUInt16();
  local count = data:ReadByte();
  local mode = data:ReadByte();
  
  logError(string.format("Receive Item Effect Id = %d Count = %d Mode = %d", itemId, count, mode));
  --[[
  Player.CastInfo.ItemID = itemId;
  Player.CastInfo.RoundCnt = count;

  if Player.CastInfo.RoundCnt == 0 then
    fillchar(Player.CastInfo, sizeof(Player.CastInfo), 0);
    Se_InputBar.CastInfoBmpIndex = -1;
    return;
  end

  Se_InputBar.CastInfoBmpIndex:=se_CtrlImgDB.GetBmpIndex( tostring(itemDatas.findItem( Player.CastInfo.ItemID ).BoySGID) );

  if mode == 1 then
    ShowCenterMessage(string.Get(40314)+' '+itemDatas:GetName(Player.CastInfo.ItemID)+' '+tostring(Player.CastInfo.RoundCnt)+' '+string.Get(40456), 2);  --使用xx次戰鬥
  end
  ]]--
end

--[[ 戰鬥內變身
S:053-014 <戰鬥內變身> +行(1) +列(1) +NPCID(2)
]]--
protocolTable[53][14] = function(data)
  FightManager.RevChangeBody(data);
end

--[[ 戰鬥Buff狀態
S:053-015 <戰鬥Buff> +行(1) +列(1) +Buff種類(1) +回合數(1) +效果數值(2)
]]--
protocolTable[53][15] = function(data)
  FightManager.RevBuffStatus(data);
end

--[[ 藥劑增益資料
S:053-016 <藥劑增益資料> +種類(1)
  種類 1:已開格子數量 +數量(1)
  種類 2:藥劑增益資料 +資料數量(1) <<+ID(1) +COUNT(2)>>
]]--
protocolTable[53][16] = function(data)
  local kind = data:ReadByte();
  
  if kind == 1 then
    DrugBuff.SetOpenCount(data:ReadByte());
  elseif kind == 2 then
    DrugBuff.SetData(data);
  end
end

protocolTable[53][17] = function(data)
  ShowCenterMessage(string.Get(80359));  --背包已滿
end

--[[ 設定團p亂戰物品使用次數
S:053-018 <團p物品使用次數> +數量(1)
]]--
protocolTable[53][18] = function(data)
  FightField.SetPvpItemCount(data:ReadByte());
end

--伺服器
protocolTable[54] = {};

--[[ 伺服器燈號
S:064 <伺服器燈號> +伺服器ID(1) +燈號(1)
]]--
protocolTable[54][0] = function(data)
  while data.length > 0 do
    --Se_SelectServer.RecServerSignal(data:ReadByte(), data:ReadByte());
  end
end

--[[ 網咖代號
C:055-001 <網咖輸入代號> +代號(?)
]]--
protocolTable[55] = {}

--[[ 網咖開啟介面
S:055-001 <網咖開啟介面>
]]--
protocolTable[55][1] = function(data)
  --Se_CafeIDForm.Appear;
end

--[[ 網咖輸入代號結果
S:055-002 <網咖輸入代號結果> +結果(1)
]]--
protocolTable[55][2] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    ShowCenterMessage(string.Get(20710), 2);
  elseif result == 2 then
    ShowCenterMessage(string.Get(20711), 2);
    --Se_CafeIDForm.Appear;
  end
end

--XOR
protocolTable[56] = {}

--[[ 不知道幹嘛沒做事
]]--
protocolTable[56][1] = function(data)
end

--[[ 小遊戲
C:057-001 <離開小遊戲>
]]--
protocolTable[57] = {}

--[[ 進入小遊戲
]]--
protocolTable[57][1] = function(data)
  local kind = data:ReadByte();
  --SportManage.Open(kind);

  if kind == 3 then
    --取得基本賭金
    local subKind = data:ReadByte();
    if subKind == 1 then
      --RE_ZMChessMain.BaseBet := 100;
    elseif subKind == 2 then
      --RE_ZMChessMain.BaseBet := 1000;
    end
  end
end

--[[ 離開小遊戲
]]--
protocolTable[57][2] = function(data)
  --SportManage.Close;
end

--[[ 小遊戲相關訊息
S:057-002 <小遊戲相關訊息> +種類(1)
]]--
protocolTable[57][3] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    ShowCenterMessage(string.Get(80056));
  elseif kind == 2 then
    ShowCenterMessage(string.Get(80057)..string.Get(80056));
  end
end

--[[ 比大小(博奕小遊戲)
C:058-001 <比大小下注> +大小(1) +金額(4)
]]--
protocolTable[58] = {}

--[[ 下注結果
]]--
protocolTable[58][1] = function(data)
  --RE_BiDaXiaoObj.RevMessage( Data ) ;
end

--[[ 骰子
C:059-001 <丟骰子> +金額(4)
]]--
protocolTable[59] = {}

--[[ 骰子控制權  
]]--
protocolTable[59][1] = function(data)
  --SBDManager.RevWhoControl(Data);
end

--[[ 骰子所擲點數  
]]--
protocolTable[59][2] = function(data)
  --SBDManager.RevDice_Num(Data);
end

--[[ 骰子輸贏  
]]--
protocolTable[59][3] = function(data)
  --SBDManager.RevWinner(Data);
end

--[[ 麻將
C:060-001 <一般操作> +種類(1)
  種類 1:吃
  種類 2:胡
  種類 3:摸
  種類 4:取消
  種類 5:更新
  種類 6:發牌
  種類 7:出牌 +索引(1)
C:060-002 <繼續牌局>
C:060-003 <離開牌局>
C:060-004 <報名牌局> + 基本賭金(1)
]]--
protocolTable[60] = {}

--[[ Server給傳送者
S:060-001 <Server給傳送者> +功能(1)
  功能 1:自己胡 +放槍的玩家idx(1)
  功能 2:自己吃 +丟棄的棋數(1) +棋友[1]的棋數(1) +棋友[2]的棋數(1) +棋友[3]的棋數(1) +棋友[4]的棋數(1) +吃進來的牌(1)
  功能 3:取消
  功能 4:自己摸 +未開開棋數(1) +棋友[1]的棋數(1) +棋友[2]的棋數(1) +棋友[3]的棋數(1) +棋友[4]的棋數(1) +摸到的牌(1)
  功能 5:出明牌 +未開張數(1) +棋友[1]的棋數(1) +棋友[2]的棋數(1) +棋友[3]的棋數(1) +棋友[4]的棋數(1) +桌上打出去的牌(1) +輪到的玩家ididx(1) +自己打出第幾張牌(1)
  功能 6:發牌給我 +目前的玩家(1) +棋友[1]的棋數(1) +棋友[2]的棋數(1) +棋友[3]的棋數(1) +棋友[4]的棋數(1)
  功能 7:加入等待中的棋局, 選擇繼續棋局 +取得自己所坐的位置(1)
  功能 8:自己剛加入棋局 +取得自己的座位(1) +目前有幾個玩家(1) <<+該棋友的AryIdx(1) +該棋友的id(8) +該棋友的money(4) +該棋友的名稱(?) +該棋友的性別(1) +該棋友的頭型(1) +該棋友的色盤值(帽,髮,膚)(4) +該棋友的色盤值(衣,配一,鞋)(4)>>
--]]
protocolTable[60][1] = function(data)
  -- 如自摸棋介面非開啟狀態則跳出
  if (not UI.IsVisible(UIChessMahjong)) then
    return;
  end
  -- 取得功能idx
  local funcIdx = data:ReadByte();
  if (funcIdx == ChessConstant.FUNCBTN_BINGO) then
    -- 自己胡
    local revBeBingoPlayer = data:ReadByte();
    UIChessMahjong.RevToBingo(revBeBingoPlayer);
  elseif (funcIdx == ChessConstant.FUNCBTN_EAT) then
    -- 自己吃
    local revOpenPieceNum = data:ReadByte();
    local revAllPieceNum = {};
    for i = 1, 4 do
      revAllPieceNum[i] = data:ReadByte();
    end
    local revEatPiece = data:ReadByte();
    UIChessMahjong.RevToEat(revOpenPieceNum, revAllPieceNum, revEatPiece);
  elseif (funcIdx == ChessConstant.FUNCBTN_CANCEL) then
    -- 取消
    UIChessMahjong.RevToSenderCancel();
  elseif (funcIdx == ChessConstant.FUNCBTN_MO) then
    -- 自己摸
    local revUnOpenPieceNum = data:ReadByte();
    local revAllPieceNum = {};
    for i = 1, 4 do
      revAllPieceNum[i] = data:ReadByte();
    end
    local revMoPiece = data:ReadByte();
    UIChessMahjong.RevToMo(revUnOpenPieceNum, revAllPieceNum, revMoPiece);
  elseif (funcIdx == ChessConstant.FUNCBTN_PIECE) then
    -- 出明牌
    local revOpenPieceNum = data:ReadByte();
    local revAllPieceNum = {};
    for i = 1, 4 do
      revAllPieceNum[i] = data:ReadByte();
    end
    local revOpenPiece = data:ReadByte();
    local revNowPlayerIdx = data:ReadByte();
    --紀錄自己打出第幾張牌. (因應時限到server自動幫忙出牌)
    local revPieceClicked =  data:ReadByte();
    UIChessMahjong.StopCountdown();
    UIChessMahjong.RevToPiece(revOpenPieceNum, revAllPieceNum, revOpenPiece, revNowPlayerIdx, revPieceClicked);
  elseif (funcIdx == ChessConstant.FUNC_DEAL) then
    -- 發牌給我
    local revNowPlayerIdx = data:ReadByte();
    local revPieceAry = {};
    for i = 1, 4 do
      revPieceAry[i] = data:ReadByte();
    end
    UIChessMahjong.RevToSenderDeal(revNowPlayerIdx, revPieceAry);
  elseif (funcIdx == ChessConstant.FUNC_JOIN) then
    -- 加入等待中的棋局. 選擇繼續棋局server的回傳
    local revIdIdx = data:ReadByte();
    UIChessMahjong.RevToSenderJoin(revIdIdx);
  elseif (funcIdx == ChessConstant.FUNC_JUSTIN) then
    -- 自己剛加入棋局
    local revIdIdx = data:ReadByte();
    local revPos = {};
    local revAllID = {};
    local revAllMoney = {};
    local revAllName = {};
    local revAllPatt = {};
    local playerCountInChess = data:ReadByte();
    for i = 1, playerCountInChess do
      local position = data:ReadByte();
      revPos[i] = position;
      revAllID[position] = data:ReadInt64();
      revAllMoney[position] = data:ReadInt32();
      revAllName[position] = data:ReadString(data:ReadByte());
      revAllPatt[position] = {};
      revAllPatt[position].sex = data:ReadByte();
      revAllPatt[position].headStyle = data:ReadByte();
      revAllPatt[position].colorTints = {};
      revAllPatt[position].colorTints[1] = data:ReadInt32();
      revAllPatt[position].colorTints[2] = data:ReadInt32();
    end
    UIChessMahjong.RevToSenderJustIn(revIdIdx, revPos, revAllID, revAllMoney, revAllName, revAllPatt);
  elseif (funcIdx == ChessConstant.FUNC_QUIT) then
    -- 自己離開棋局
    UI.Close(UIChessMahjong);
  end
  UIChessMahjong.FinishRevToSender(funcIdx);
end

--[[ Server給非傳送者
S:060-002 <Server給非傳送者> +功能(1)
  功能 1:別人胡 +胡的玩家idx(1) +放槍玩家idx(1) +胡牌組合1(1) +胡牌組合2(1) +胡牌組合3(1)
  功能 2:別人吃牌 +未開的棋數(1) +棋友[1]的棋數(1) +棋友[2]的棋數(1) +棋友[3]的棋數(1) +棋友[4]的棋數(1)
  功能 3:別人摸牌 +未開的棋數(1) +棋友[1]的棋數(1) +棋友[2]的棋數(1) +棋友[3]的棋數(1) +棋友[4]的棋數(1) +輪到的玩家ididx(1)
  功能 4:別人出明牌 +已開的棋數(1) +棋友[1]的棋數(1) +棋友[2]的棋數(1) +棋友[3]的棋數(1) +棋友[4]的棋數(1) +打出去的牌(1) +輪到的玩家ididx(1)
  功能 5:發牌給別人 +未開的棋數(1) +棋友[1]的棋數(1) +棋友[2]的棋數(1) +棋友[3]的棋數(1) +棋友[4]的棋數(1)
  功能 6:別人加入等待中的棋局 +該棋友的AryIdx(1) +該棋友的id(8) +該棋友的money(4) +該棋友的名稱(?) +該棋友的性別(1) +該棋友的頭型(1) +該棋友的色盤值(帽,髮,膚)(4) +該棋友的色盤值(衣,配一,鞋)(4)
  功能 7:離開棋局 +該棋友的AryIdx(1)
]]--
protocolTable[60][2] = function(data)
  -- 如自摸棋介面非開啟狀態則跳出
  if (not UI.IsVisible(UIChessMahjong)) then
    return;
  end
  -- 取得功能idx
  local funcIdx = data:ReadByte();

  if (funcIdx == ChessConstant.FUNCBTN_BINGO) then
    -- 別人胡
    local revBingoPlayer = data:ReadByte();
    local revBeBingoPlayer = data:ReadByte();
    local revBingoStruct = {};
    for i = 1, 3 do
      revBingoStruct[i] = data:ReadByte();
    end
    UIChessMahjong.RevToBingo(revBeBingoPlayer, revBingoPlayer, revBingoStruct);
  elseif (funcIdx == ChessConstant.FUNCBTN_EAT) then
    -- 別人吃牌
    local revOpenPieceNum = data:ReadByte();
    local revAllPieceNum = {};
    for i = 1, 4 do
      revAllPieceNum[i] = data:ReadByte();
    end
    UIChessMahjong.RevToEat(revOpenPieceNum, revAllPieceNum);
  elseif (funcIdx == ChessConstant.FUNCBTN_MO) then
    -- 別人摸牌
    local revUnOpenPieceNum = data:ReadByte();
    local revAllPieceNum = {};
    for i = 1, 4  do
      revAllPieceNum[i] = data:ReadByte();
    end
    UIChessMahjong.RevToMo(revUnOpenPieceNum, revAllPieceNum);
  elseif (funcIdx == ChessConstant.FUNCBTN_PIECE) then
    -- 別人出明牌
    local revOpenPieceNum = data:ReadByte();
    local revAllPieceNum = {};
    for i = 1, 4  do
      revAllPieceNum[i] = data:ReadByte();
    end
    local revOpenPiece = data:ReadByte();
    local revNowPlayerIdx = data:ReadByte();
    UIChessMahjong.RevToPiece(revOpenPieceNum, revAllPieceNum, revOpenPiece, revNowPlayerIdx);
  elseif (funcIdx == ChessConstant.FUNC_DEAL) then
    -- 發牌給別人
    local revUnOpenPieceNum = data:ReadByte();
    local revAllPieceNum = {};
    for i = 1, 4  do
      revAllPieceNum[i] = data:ReadByte();
    end
    UIChessMahjong.RevToOtherDeal(revUnOpenPieceNum, revAllPieceNum);
  elseif (funcIdx == ChessConstant.FUNC_JOIN) then
    -- 別人加入等待中的棋局
    local revPos = data:ReadByte();
    local revID = data:ReadInt64();
    local revMoney = data:ReadInt32();
    local revName = data:ReadString(data:ReadByte());
    local revPatt = {};
    revPatt.sex = data:ReadByte();
    revPatt.headStyle = data:ReadByte();
    revPatt.colorTints = {};
    revPatt.colorTints[1] = data:ReadInt32();
    revPatt.colorTints[2] = data:ReadInt32();
    UIChessMahjong.RevToOtherJoin(revPos, revID, revMoney, revName, revPatt);
  elseif (funcIdx == ChessConstant.FUNC_QUIT) then
    -- 玩家離開棋局
    local revPos = data:ReadByte();
    UIChessMahjong.RevToOtherQuit(revPos);
  end
end

--[[ 棋局狀態通知
S:060-002 <棋局狀態通知> +功能(1)
  功能 1:棋局開始 +莊家idx(1)
  功能 2:理牌時間
  功能 3:遊戲正式開始 +目前第一手摸牌玩家idx(1)
  功能 4:遊戲結算或流局 <<+張數(1) <<+結算牌id(1)>> >>
  功能 5:棋局是因違規離線結束 +離開玩家idx(1)
]]--
protocolTable[60][3] = function(data)
  -- 如自摸棋介面非開啟狀態則跳出
  if (not UI.IsVisible(UIChessMahjong)) then
    return;
  end

  local gameType = data:ReadByte();
  --該狀態不是合法的
  if not ((ChessConstant.GAME_START <= gameType) and (gameType <= ChessConstant.GAME_SORTTIME)) then
    return;
  end
  UIChessMahjong.BeginRevToAll(gameType);

  if (gameType == ChessConstant.GAME_START) or (gameType == ChessConstant.GAME_CONTI) then
    -- 棋局開始
    local revBankerIdx = data:ReadByte();
    UIChessMahjong.RevToAllStartOrConti(gameType, revBankerIdx);
  elseif (gameType == ChessConstant.GAME_SORTTIME) then
    -- 理牌時間
    UIChessMahjong.RevToAllSortTime();
  elseif (gameType == ChessConstant.GAME_RUNNING) then
    -- 遊戲正式開始
    local revNowPlayerIdx = data:ReadByte();
    UIChessMahjong.RevToAllRunning(revNowPlayerIdx);
  elseif (gameType == ChessConstant.GAME_RESULT) or (gameType == ChessConstant.GAME_OUTPIECE) then
    -- 遊戲結算或流局
    local revAllPieceAry = {};
    local revPieceNum = {};
    for  i = 1, ChessConstant.ZMCHESS_PLAYERNUM do
      local pieceNum = data:ReadByte();
      revPieceNum[i] = pieceNum;
      revAllPieceAry[i] = {};
      for  j = 1, pieceNum  do
        revAllPieceAry[i][j] = data:ReadByte();
      end
    end
    UIChessMahjong.RevToAllResultOrOutPiece(gameType, revPieceNum, revAllPieceAry);
  elseif (gameType == ChessConstant.GAME_PLAYERQUIT) then
    -- 棋局是因違規離線結束
    local revQuitPlayerAryIdx = data:ReadByte();
    UIChessMahjong.RevToAllEndSincePlayerQuit(revQuitPlayerAryIdx);
  end
end

--[[ 收到報名後的Server通知
S:060-004 <報名結果> +結果(1)
]]--
protocolTable[60][4] = function(data)
  local responce = data:ReadByte();

  if (responce == 0) then
    --透過活動介面確認活動時間後，Server通知開啟介面
    UIChessMahjong.SignUp();
  elseif(responce == 1) then
    --報名成功
    ShowCenterMessage(string.Get(80035));
  elseif(responce == 2) then
    --已在報名清單中
    ShowCenterMessage(string.Get(80036));
  elseif(responce == 3) then
    --已在某棋局中
    ShowCenterMessage(string.Get(80037));
  elseif(responce == 4) then
    --現金不足
    ShowCenterMessage(string.Get(80047));
  elseif(responce == 5) then
    --現金太多
    ShowCenterMessage(string.Get(80048));
  elseif(responce == 6) then
    --自摸棋暫停使用中
    ShowCenterMessage(string.Get(80051));
  elseif(responce == 11) then
    --*** 組隊報名才會發生 ***
    --組隊人數超過4人
    ShowCenterMessage(string.Get(80038));
  elseif(responce == 12) then
    --其中有人已在報名清單中
    ShowCenterMessage(string.Concat(string.Get(80046), string.Get(80036)));
  elseif(responce == 13) then
    --其中有人已在棋局中
    ShowCenterMessage(string.Concat(string.Get(80046), string.Get(80037)));
  elseif(responce == 14) then
    --其中有人現金不足
    ShowCenterMessage(string.Concat(string.Get(80046), string.Get(80047)));
  elseif(responce == 15) then
    --其中有人現金太多
    ShowCenterMessage(string.Concat(string.Get(80046), string.Get(80048)));
  elseif(responce == 16) then
    --組隊不得報名
    ShowCenterMessage(string.Get(80050));
  elseif(responce == 255) then
    --其他錯誤
    ShowCenterMessage(string.Get(80045));
  end
end

--[[ 樂透
C:061-001 <樂透下注> +號碼(1)*6
]]--
protocolTable[61] = {}

--[[ 樂透新增下注
S:061-001 <樂透新增下注> +新舊(1) +號碼(1)*5
]]--
protocolTable[61][1] = function(data)
  data:ReadByte();
  Lottery.AddTicket(data);
end

--[[ 樂透總獎金
S:061-002 <樂透總獎金> +獎金(4)
]]--
protocolTable[61][2] = function(data)
  Lottery.award = data:ReadInt32();
end

--[[ 樂透下注結果
S:061-003 <樂透下注結果> +結果(1)
  結果 1:已截止
  結果 2:失敗
  結果 3:成功
]]--
protocolTable[61][3] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    ShowCenterMessage(string.Get(71024));
  elseif result == 2 then
    ShowCenterMessage(string.Get(71025));
  elseif result == 3 then
    ShowCenterMessage(string.Get(71026));
  end
end

--[[ 樂透開獎號碼
S:061-004 <樂透開獎號碼> +號碼(1)*5 +特別號(1)
]]--
protocolTable[61][4] = function(data)
  local message = string.Get(71027);

  for i = 1, Lottery.maxNumberCount do
    message = message..tostring(data:ReadByte())..string.Get(71029);
  end

  message = message..string.Get(71030)..tostring(data:ReadByte());

  Chat.AddMessage(EChannel.System, message);
end

--[[ 樂透相關訊息
S:061-005 <樂透相關訊息> +種類(1)
]]--
protocolTable[61][5] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    ShowCenterMessage(string.Get(71031), 2.2);
  elseif kind == 2 then
    ShowCenterMessage(string.Get(71032));
  elseif kind == 3 then
    ShowCenterMessage(string.Get(71033));
  elseif kind == 4 then
    ShowCenterMessage(string.Get(71034));
  elseif kind == 5 then
    ShowCenterMessage(string.Get(71024));
  elseif kind == 6 then
    ShowCenterMessage(string.Get(71036));
  elseif kind == 7 then
    ShowCenterMessage(string.Get(71035));
  elseif kind == 8 then
    ShowCenterMessage(string.Get(71038));
  elseif kind == 9 then
    ShowCenterMessage(string.Get(40137));
  end
end

--[[ 下注資料
]]--
protocolTable[61][7] = function(data)
  --MachineManager.RevMakebet(Data);
end

--[[ 獎項資料

]]--
protocolTable[61][8] = function(data)
  --MachineManager.RevStageData(Data);
end

--[[ 開獎號碼

]]--
protocolTable[61][9] = function(data)
  --MachineManager.RevBallNumData(Data);
end

--[[ 樂透中獎人
S:061-010 <樂透中獎人> +名字(?)
]]--
protocolTable[61][10] = function(data)
  Chat.AddMessage(EChannel.System, string.Get(71037)..data:ReadString(data.length));
end

--[[ 鄉勇訊息
S:061-011 <鄉勇訊息> +種類(1) +名次(1) +名字(?)
]]--
protocolTable[61][11] = function(data)
  local kind = data:ReadByte();
  local index = data:ReadByte();
  local name = data:ReadString(data.length);

  if kind == 1 then
    Chat.AddMessage(EChannel.System, string.Get(71084)..name..string.Get(71085)..tostring(index)..string.Get(71087));
  elseif kind == 2 then
    Chat.AddMessage(EChannel.System, string.Get(71084)..name..string.Get(71085)..tostring(index)..string.Get(71086));
  end
end

--生存戰役
protocolTable[62] = {}

--[[ 生存戰場相關訊息
S:062-001 <生存戰場相關訊息> +種類(1)
]]--
protocolTable[62][1] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    Chat.AddMessage(EChannel.System, string.Get(40415));
  elseif kind == 2 then
    Chat.AddMessage(EChannel.System, string.Get(40416));
  elseif kind == 3 then
    ShowCenterMessage(string.Get(40418), 2);
  elseif kind == 4 then
    ShowCenterMessage(string.Get(40417), 2);
  elseif kind == 5 then
    ShowCenterMessage(string.Get(71145), 2);
  elseif kind == 6 then
    ShowCenterMessage(string.Get(71175), 2);
  end
end

--[[ 生存戰場活人數
S:062-002 <生存戰場活人數> +人數(2)
]]--
protocolTable[62][2] = function(data)
  Survive.lifeCount = data:ReadUInt16();
end

--[[ 戰役系統
C:063-001 <殺敵點兌換> +物品ID(2)
C:063-002 <參加戰役> +戰役ID(1) +玩家ID(8) 
C:063-003 <參加水戰> +戰役ID(1)
]]--
protocolTable[63] = {}

--[[ 戰役系統訊息
S:063-001 <戰役系統訊息> +種類(1)
  種類 1:戰役準備開始
  種類 2:戰役即將開始
  種類 3:戰役結束 +戰役ID(1) +結果(1)
  種類 4:軍帳損壞 +戰役ID(1)
  種類 5:援軍出陣 +戰役ID(1) +NPCID(4)
  種類 6:武將頻死 +NPCID(4)
  種類 7:武將戰敗 +戰役ID(1) +NPCID(4)
  種類 8:玩家獲賞 +L(1) +名字(L)
]]--
protocolTable[63][1] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    Chat.AddMessage(EChannel.System, string.Get(71050));

  elseif kind == 2 then
    Chat.AddMessage(EChannel.System, string.Get(71051));

  elseif kind == 3 then
    local battleId = data:ReadByte();

    if battleDatas[battleId] == nil then return end

    local result = data:ReadByte();

    if result == 1 then
      Chat.AddMessage(EChannel.System, battleDatas[battleId].name..string.Get(71054));
    elseif result == 2 then
      Chat.AddMessage(EChannel.System, battleDatas[battleId].name..string.Get(71055));
    end

  elseif kind == 4 then
    local battleId = data:ReadByte();
    
    if battleDatas[battleId] == nil then return end

    Chat.AddMessage(EChannel.System, battleDatas[battleId].name..string.Get(71058)..string.Get(71059));

  elseif kind == 5 then
    local battleId = data:ReadByte();
    
    if battleDatas[battleId] == nil then return end

    local npcId = data:ReadInt32();

    if npcDatas[npcId] == nil then return end

    Chat.AddMessage(EChannel.System, battleDatas[battleId].name..string.Get(90034)..npcDatas[npcId].name..string.Get(90035));

  elseif kind == 6 then
    local npcId = data:ReadInt32();

    if npcDatas[npcId] == nil then return end

    local hp = data:ReadUInt16();
    
    if hp == 5000 then
      Chat.AddMessage(EChannel.System, npcDatas[npcId].name..string.Get(90041));
    elseif hp == 10000 then
      Chat.AddMessage(EChannel.System, npcDatas[npcId].name..string.Get(90040));
    end

  elseif kind == 7 then
    local battleId = data:ReadByte();
    
    if battleDatas[battleId] == nil then return end
    
    local npcId = data:ReadInt32();

    if npcDatas[npcId] == nil then return end

    Chat.AddMessage(EChannel.System, battleDatas[battleId].name..string.Get(71058)..npcDatas[npcId].name..string.Get(71077));

  elseif kind == 8 then
    Chat.AddMessage(EChannel.System, string.Get(71084)..data:ReadString(data:ReadByte())..string.Get(71098));
  end
end

--[[ 戰役中央訊息
S:063-002 <戰役中央訊息> +種類(1)
]]--
protocolTable[63][2] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    ShowCenterMessage(string.Get(71052));
  elseif kind == 2 then
    ShowCenterMessage(string.Get(71053));
  elseif kind == 3 then
    ShowCenterMessage(string.Get(71057));
  elseif kind == 4 then
    ShowCenterMessage(string.Get(71056));
  elseif kind == 5 then
    ShowCenterMessage(string.Get(71068));
  elseif kind == 6 then
    ShowCenterMessage(string.Get(71069));
  elseif kind == 7 then
    ShowCenterMessage(string.Get(71066));
  elseif kind == 8 then
    ShowCenterMessage(string.Get(71067));
  elseif kind == 9 then
    ShowCenterMessage(string.Get(71079));
  elseif kind == 10 then
    ShowCenterMessage(string.Get(71190));
  end
end

--[[ 參加戰役
S:063-003 <參加戰役> +戰役ID(1)
]]--
protocolTable[63][3] = function(data)
  Battle.battleId = data:ReadByte();
end

--[[ 玩家戰役殺敵點
S:063-004 <玩家戰役殺敵點> +殺敵點(4)
]]--
protocolTable[63][4] = function(data)
  Battle.killPoint = data:ReadInt32();
end

--[[ 玩家累計戰役殺敵點
S:063-005 <玩家累計戰役殺敵點> +殺敵點(4)
]]--
protocolTable[63][5] = function(data)
  Battle.accumulateKillPoint = data:ReadInt32();
end

--[[ 個人單場殺敵數
S:063-006 <個人單場殺敵數> +殺敵數(4)
]]--
protocolTable[63][6] = function(data)
  Battle.enemyKilledCount = data:ReadInt32();
end

--[[ 更新NPC血量
S:063-007 <更新NPC血量> +索引(1) +HP(2)
]]--
protocolTable[63][7] = function(data)
  local index = data:ReadByte();
  
  if Role.mapNpcs[index] == nil then return end

  Role.mapNpcs:SetAttribute(EAttribute.Hp, data:ReadUInt16());
end

--[[ 顯示戰役說明
S:063-008 <顯示戰役說明> +戰役ID(1)
]]--
protocolTable[63][8] = function(data)
  local battleId = data:ReadByte();
  --MR_BattleHelp.SetFormKind(battleId);
  --MR_BattleHelp.Appear;
end

--[[ 參加水戰
S:063-010 <參加水戰> +戰役ID(1)
]]--
protocolTable[63][10] = function(data)
  Warship.battleId = data:ReadByte();
end

--[[ 水戰系統訊息
S:063-011 <水戰系統訊息> +種類(1)
  種類 1:戰役準備開始
  種類 2:戰役即將開始
  種類 3:戰役結束
  種類 4:武將戰敗 +戰役ID(1) +場次(1) +NPCID(4)
  種類 5:戰況 +戰役ID(1) +場次(1)
  種類 6:援軍出陣 +戰役ID(1) +NPCID(4)
]]--
protocolTable[63][11] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    Chat.AddMessage(EChannel.System, string.Get(71112));

  elseif kind == 2 then
    --MR_WaterBattleInFor.ReSetInfo;
    Chat.AddMessage(EChannel.System, string.Get(71113));

  elseif kind == 3 then
    Chat.AddMessage(EChannel.System, string.Get(71114));

  elseif kind == 4 then
    local battleId = data:ReadByte();
    
    if waterBattleDatas[battleId] == nil then return end

    local battleIndex = data:ReadByte();
    local npcId = data:ReadInt32();
    
    if npcDatas[npcId] == nil then return end
    
    Chat.AddMessage(EChannel.System, waterBattleDatas[battleId].name..string.Get(71117)..battleIndex..string.Get(71118)..string.Get(71058)..npcDatas[npcId].name..string.Get(71077));

    if Warship.battleId == battleId then
      --MR_WaterBattleInFor.AddInfoStr(Str);
    end

  elseif kind == 5 then
    local battleId = data:ReadByte();
    
    if waterBattleDatas[battleId] == nil then return end

    local battleIndex = data:ReadByte();

    Chat.AddMessage(EChannel.System, waterBattleDatas[battleId].name..string.Get(71117)..battleIndex..string.Get(71118)..string.Get(71058)..string.Get(90137));

    if Warship.battleId == battleId then
      --MR_WaterBattleInFor.AddInfoStr(Str);
    end

  elseif kind == 6 then
    local battleId = data:ReadByte();
    
    if waterBattleDatas[battleId] == nil then return end

    local battleIndex = data:ReadByte();
    local npcId = data:ReadInt32();
    
    if npcDatas[npcId] == nil then return end

    Chat.AddMessage(EChannel.System, waterBattleDatas[battleId].name..string.Get(71117)..battleIndex..string.Get(71118)..string.Get(71058)..string.Get(90138)..npcDatas[npcId].name..string.Get(90035));

    if Warship.battleId == battleId then
      --MR_WaterBattleInFor.AddInfoStr(Str);
    end
  end
end

--[[ 水戰中央訊息
S:063-012 <水戰中央訊息> +種類(1)
]]--
protocolTable[63][12] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    ShowCenterMessage(string.Get(71108));
  elseif kind == 2 then
    ShowCenterMessage(string.Get(71109));
  elseif kind == 2 then
    ShowCenterMessage(string.Get(71110));
  elseif kind == 2 then
    ShowCenterMessage(string.Get(71111));
  elseif kind == 2 then
    ShowCenterMessage(string.Get(71115));
  elseif kind == 2 then
    ShowCenterMessage(string.Get(71057));
  elseif kind == 2 then
    ShowCenterMessage(string.Get(71053));
  elseif kind == 2 then
    ShowCenterMessage(string.Get(71052));
  elseif kind == 2 then
    ShowCenterMessage(string.Get(71068));
  elseif kind == 2 then
    ShowCenterMessage(string.Get(71069));
  elseif kind == 2 then
    ShowCenterMessage(string.Get(71066));
  elseif kind == 2 then
    ShowCenterMessage(string.Get(71067));
  elseif kind == 2 then
    ShowCenterMessage(string.Get(71130));
  elseif kind == 2 then
    ShowCenterMessage(string.Get(71190));
  end
end

--[[ 水戰奉邑訊息
S:063-013 <水戰奉邑訊息> +種類(1)
]]--
protocolTable[63][13] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    ShowCenterMessage(string.Get(71132));
  elseif kind == 2 then
    ShowCenterMessage(string.Get(71133));
  end
end

--[[ 水戰奉邑排行
S:063-020 <水戰奉邑排行> +排名(1) +序號(4) +軍團名稱(14) +累計擊殺點(4)
]]--
protocolTable[63][20] = function(data)
  local rank = data:ReadByte();

  local info = {};
  info.serialNo = data:ReadUInt32();
  info.title = data:ReadString(14);
  info.accumulateKillPoint = data:ReadInt32();

  Warship.leaderboard[rank] = info;
end

--[[ 水戰戰場人數
]]--
protocolTable[63][21] = function(data)
  --MR_WaterBattleHelp.RevRoomCountData(Data);
end

--[[ 水戰秀戰役說明
]]--
protocolTable[63][22] = function(data)
  --MR_WaterBattleHelp.RevHelpData(Data);
end

--[[ 水戰系統
C:064-001 <水戰攻擊> +目標種類(1) +目標玩家ID(8) +技能ID(2)
C:064-002 <水戰求救>
]]--
protocolTable[64] = {}

--[[ 水戰攻擊
]]--
protocolTable[64][1] = function(data)
  --WarWaterManage.RevAttack(Data);
end

--[[ 水戰發信
]]--
protocolTable[64][2] = function(data)
  --se_MapFrame.Signalling(Data);
end

--[[ 水戰NPC的血量
S:064-003 <水戰NPC的血量> <<+索引(1) +HP(2)>>
]]--
protocolTable[64][3] = function(data)
  while data.length > 0 do
    local index = data:ReadByte();
    local hp = data:ReadUInt16();

    if Role.mapNpcs[index] ~= nil then
      Role.mapNpcs[index]:SetAttribute(EAttribute.Hp, hp);
    end
  end
end

--[[ 機關盒
C:065-001 <啟動機關盒> +玩家HP%下限(1) +玩家SP%下限(1) +武將HP%下限(1) +武將SP%下限(1) +HP補品不足回城(1) +SP補品不足回城(1) +玩家死亡回城(1) +武將死亡回城(1) +自動行走(1) +自動使用經驗物品(1)+出戰武將自動換鉛錘(1)
C:065-002 <暫停機關盒> 
C:065-003 <確認時數> 
C:065-004 <移除晶石> +晶石ID(2) +背包索引(2)
C:065-005 <飛回紀錄點>
C:065-006 <移除經驗瓶> +索引(1)
C:065-007 <設定經驗瓶順序> +索引(1)
]]--
protocolTable[65] = {}

--[[ 啟動機關盒
S:065-001 <啟動機關盒>
]]--
protocolTable[65][1] = function(data)
  MachineBox.SetAutoFight(true);
end

--[[ 暫停機關盒
S:065-002 <暫停機關盒>
]]--
protocolTable[65][2] = function(data)  
  ShowCenterMessage(string.Get(20730));
  MachineBox.SetAutoFight(false);
end

--[[ 場景新增玩家小寵物
]]--
protocolTable[65][3] = function(data)
  Role.PetAppear(data:ReadInt64(), data:ReadByte())
end

--[[ 收到該場景舊玩家的小寵物
]]--
protocolTable[65][4] = function(data)
  while data.length > 0 do
    Role.PetAppear(data:ReadInt64(), data:ReadByte())
  end
end

--[[ 開啟機關盒介面
S:065-005 <開啟機關盒介面>
]]--
protocolTable[65][5] = function(data)
--  ShowCenterMessage(string.Get(98027), 1);
end

--[[ 機關盒晶石資料
S:065-006 <機關盒晶石資料> <<+索引(1) +晶石ID(2) +數量(2)>>
]]--
protocolTable[65][6] = function(data)
  MachineBox.RevUseSpar(data);
end

--[[ 機關盒訊息
S:065-007 <機關盒訊息>
]]--
protocolTable[65][7] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    ShowCenterMessage(string.Get(80112));
  elseif kind == 2 then
    ShowCenterMessage(string.Get(80113));
  end
end

--[[ 機關盒晶石擴充數量
S:065-008 <機關盒晶石擴充數量> +數量(1) +是否顯示訊息(1)
]]--
protocolTable[65][8] = function(data)
  MachineBox.RevSparExtendNum(data)
end

--[[ 機關盒晶石移除訊息
S:065-009 <機關盒晶石移除訊息>
]]--
protocolTable[65][9] = function(data)
  ShowCenterMessage(string.Get(80292));
end

--[[ 機關盒進行補給
S:065-010<機關盒吃補品> +Kind(1)[0.不需檢查補品不足回城 1.需要檢查補品不足回城]
--]]
protocolTable[65][10] = function(data)
  MachineBox.Supply(data:ReadBoolean());
end

--[[ 收到經驗瓶
--S:065-011 收到經驗瓶 +優先索引(1)+ <<+索引(1) +經驗瓶ID(2) +經驗值(4)>>
]]--
protocolTable[65][11] = function(data)
  MachineBox.RevExpBottle(data);
end

--[[ 更新經驗瓶
--S:065-012 更新經驗瓶 +索引(1) +經驗值(4)
]]--
protocolTable[65][12] = function(data)
  MachineBox.UpdateExpBottle(data);
end

--[[ 設定經驗瓶
--S:065-013 設定經驗瓶  1:成功 +索引(1)
]]--
protocolTable[65][13] = function(data)
  MachineBox.SetExpBottle(data);
end

--[[ 機關盒經驗瓶擴充數量
S:065-014 <機關盒經驗瓶擴充數量> +數量(1) +是否顯示訊息(1)
]]--
protocolTable[65][14] = function(data)
  MachineBox.RevExpExtendNum(data);
end

--[[ 賣虛寶(免費版)
C:066-001 <購買虛寶> +商店種類(1) +主項(1) +細項(1) +品項(1) +ID(2) +點數(2) +組(2)
C:066-002 <更新虛寶數量> +主項(1) +細項(1) +頁號(1) --功能拿掉不會再傳了
C:066-003 <開啟虛寶介面>
C:066-011 <開啟戳戳樂>
C:066-012 <戳戳戳樂>
C:066-013 <結束戳戳樂>
C:066-031 <確定扣點升級>
C:066-032 <取消扣點升級>
C:066-033 <確定武將扣點升級>
C:066-034 <購買增益狀態欄位>
C:066-035 <購買背包欄位>
]]--
protocolTable[66] = {}

--[[ 虛寶販售數量刷新
S:066-001 <虛寶販售數量刷新> +主類(1) +副類(1) +頁次(1)+ Count(1)+ <<數量(1)>>
]]--
protocolTable[66][1] = function(data)
--功能拿掉不會再做事了
end

--[[ 虛寶開啟介面
S:066-002 <虛寶開啟介面> +點數(4)
]]--
protocolTable[66][2] = function(data)
--功能拿掉不會再做事了
end

--[[ 虛寶購買結果
S:066-003 <虛寶購買結果> +物品ID(2) +結果(1)
]]--
protocolTable[66][3] = function(data)
  local itemId = data:ReadUInt16();

--  Role.SetPoint(data:ReadInt32());

  local result = data:ReadByte();
  if result == 1 then
    UIMall.RefreshItemPage();
    Mall.ClearDoro();
  elseif result == 2 then
    ShowCenterMessage(string.Get(90152)..itemDatas[itemId]:GetName(true)..string.Get(90153));
    
    if UI.IsVisible(UIDoro) then
      UIDoro.OnClick_Close();
    end
  end
end

--[[ 虛寶相關訊息
S:066-004 <虛寶相關訊息> +種類(1)
                          種類 1.伺服器忙碌中,請稍後再試 
                          種類 2.虛寶伺服器下線更新中 
                          種類 3.商品資料庫不符 
                          種類 4.限量商品已交割完畢 
                          種類 5.身上空間不夠
                          種類 6.戰鬥中不能買
                          種類 7.次數已滿
                          種類 8.幣值錯誤
                          種類 9.需擁有限時獎勵包標記才可購買
                          種類 10.物品關閉
                          種類 11.購買標記不符
                          種類 12.時間不符
                          種類 255.功能關閉
]]--
protocolTable[66][4] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    ShowCenterMessage(string.Get(90154), 2);
  elseif kind == 2 then
    ShowCenterMessage(string.Get(90155), 2);
  elseif kind == 3 then
    ShowCenterMessage(string.Get(80178), 2);
  elseif kind == 4 then
    ShowCenterMessage(string.Get(80179), 2);
  elseif kind == 5 then
    ShowCenterMessage(string.Get(90150), 2);
  elseif kind == 6 then
    ShowCenterMessage(string.Get(90147), 2);
    if UI.IsVisible(UIDoro) then
      UIDoro.ReopenBuyMore();
    end
  elseif kind == 7 then
    ShowCenterMessage(string.Get(20709), 2);
  elseif kind == 8 then
    ShowCenterMessage(string.Get(21134), 2);
  elseif kind == 9 then
    ShowCenterMessage(string.Get(21844), 2);
  elseif kind == 10 then
    ShowCenterMessage(string.Get(21970), 2);
  elseif kind == 11 then
    ShowCenterMessage(string.Get(22155), 2);
  elseif kind == 12 then
    ShowCenterMessage(string.Get(22156), 2);
  elseif kind == 255 then
    ShowCenterMessage(string.Get(71278), 2);
  end

  Mall.ClearDoro();
end

--[[ 戳戳樂開啟介面
]]--
protocolTable[66][11] = function(data)
  --LH_HoleGameForm.RevOpenForm(Data);
end

--[[ 戳戳樂可以戳開第no洞
]]--
protocolTable[66][12] = function(data)
  --LH_HoleGameForm.RevDoHole(Data);
end

--[[ 戳戳樂相關訊息
]]--
protocolTable[66][14] = function(data)
  --LH_HoleGameForm.RevMessage(Data);
end

--[[ 扣點升級確認
S:066-031 <扣點升級確認> +等級(1) +點數(4)
]]--
protocolTable[66][31] = function(data)
  local level = data:ReadByte();
  local point = data:ReadInt32();

  ShowCheckMessage(
    function(result)
      if result then
        --C:066-031 <確定扣點升級>
        Network.Send(66, 31);
      else
        --C:066-032 <取消扣點升級>
        Network.Send(66, 32);
      end
    end,
    string.format(string.Get(80243), Role.player:GetAttribute(EAttribute.Lv), Role.player:GetAttribute(EAttribute.Lv) + level)..string.format(string.Get(80244), point),
    Role.target
  );
end

--[[ 扣點升級訊息
S:066-032 <扣點升級訊息> +種類(1)
]]--
protocolTable[66][32] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    ShowCenterMessage(string.Get(80223), 2);
  elseif kind == 2 then
    ShowCenterMessage(string.Get(80246), 2);
  elseif kind == 3 then
    ShowCenterMessage(string.Get(80245), 2);
  elseif kind == 4 then
    ShowCenterMessage(string.Get(80253), 2);
  end
end

--[[ NPC扣點升級確認
S:066-033 <NPC扣點升級確認> +NPCID(2) +等級(1) +點數(4)
]]--
protocolTable[66][33] = function(data)
  local npcId = data:ReadUInt16();
  local level = data:ReadByte();
  local point = data:ReadInt32();

  local followNpc = Role.GetFollowNpc(Role.playerId, npcId);

  if followNpc ~= nil then
    ShowCheckMessage(
      function(result)
        if result then
          --C:066-033 <確定扣點升級武將>
          Network.Send(66, 33);
        else
          --C:066-032 <取消扣點升級>
          Network.Send(66, 32);
        end
      end,
      string.format(string.Get(80252), followNpc.name, string.format(string.Get(80243), followNpc:GetAttribute(EAttribute.Lv), followNpc:GetAttribute(EAttribute.Lv) + level), point),
      Role.target
    );
  else
    --C:066-032 <取消扣點升級>
    Network.Send(66, 32);
  end
end

--[[ 改運換名符
C:067-001 <檢查名字> +L(1) +名字(L)
]]--
protocolTable[67] = {}

--[[ 檢查名字結果
S:067-001 <檢查名字結果> +結果(1)
  結果 0:改名詢問成功，進入介消
  結果 1:無此角色
  結果 2:名稱重複
  結果 3:名稱不符規定
  結果 4:名字合法，但無道具或元寶(由介消處理)
  結果 5:新名字與舊名相同
  結果 6:超過改名次數上限(2019不設限)
]]--
protocolTable[67][1] = function(data)
  local kind = data:ReadByte();
  if kind == 0 then
    UISell.Launch(42);
  elseif kind == 1 then
    ShowCenterMessage(string.Get(22328));
  elseif kind == 2 then
    ShowCenterMessage(string.Get(50040));
  elseif kind == 3 then
    ShowCenterMessage(string.Get(50041));
  elseif kind == 4 then
  elseif kind == 5 then
    ShowCenterMessage(string.Get(22319));
  elseif kind == 6 then
  end
end

--[[ 某玩家改名
S:067-002 <某玩家改名> +玩家ID(8) +L(1) +名字(L)
]]--
protocolTable[67][2] = function(data)
  local roleId = data:ReadInt64();
  local name = data:ReadString(data:ReadByte());

  Organization.UpdateMemberName(roleId, name);
  Social.UpdateFriendName(roleId, name);
  Social.UpdateBlackName(roleId, name);

  if Role.players[roleId] == nil then return end

  Role.players[roleId].data.name = name;
  Role.players[roleId]:UpdateName();
end

--[[ 天行異能
C:068-001 <使用晶石天行異能> +場景ID(2) +NO(1)
C:068-002 <使用卷軸天行異能> +場景ID(2) +NO(1) +背包索引(2)
]]--
protocolTable[68] = {}

--[[ 使用晶石天行異能結果
]]--
protocolTable[68][1] = function(data)
  MachineBox.RecvWarp(data);
end

--[[ 使用卷軸天行異能結果
]]--
protocolTable[68][2] = function(data)
  MachineBox.RecvSkyWarp(data);
end

--[[ 二代武將
C:069-001 <刪二代武將技能> +技能ID(2) +技能索引(1) +背包索引(1)
C:069-002 <刪二代武將技能> +技能種類(1) +背包索引(1)
]]--
protocolTable[69] = {}

--[[ 二代武將相關訊息
S:069-001 <二代武將相關訊息> +種類(1)
]]--
protocolTable[69][1] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    Chat.AddMessage(EChannel.System, string.Get(80209));
  elseif kind == 2 then
    Chat.AddMessage(EChannel.System, string.Get(80210));
  elseif kind == 3 then
    Chat.AddMessage(EChannel.System, string.Get(80211));
  elseif kind == 4 then
    Chat.AddMessage(EChannel.System, string.Get(80212));
  elseif kind == 5 then
    Chat.AddMessage(EChannel.System, string.Get(80217));
  elseif kind == 6 then
    Chat.AddMessage(EChannel.System, string.Get(80218));
  end
end

--[[ 二代武將餵養訊息
S:069-002 <二代武將餵養訊息> +數量(1) <<+種類(1) +數值(4)>>
]]--
protocolTable[69][2] = function(data)
  local count = data:ReadByte();

  if count == 0 then return end

  local message = string.Get(71200);
  for i = 1, count do
    local kind = data:ReadByte();
    local value = data:ReadUInt32();
    
    if i ~= 1 then
      message = message..string.Get(71199);
    end

    message = message..tostring(value)..string.GetAttribute(kind)..string.Get(20035);

    --Se_ChildForm.ActionOldTime:=GetTickCount;
    --Se_ChildForm.ActionStep:=0;
    
    if kind == EAttribute.Int then
      --[[
      if Se_ChildForm.Action == Child_Action_normal then
        Se_ChildForm.Action = Child_Action_spell;
      end
      ]]--
    elseif kind == EAttribute.Atk then
      --[[
      if Se_ChildForm.Action == Child_Action_normal then
        Se_ChildForm.Action = Child_Action_Attack;
      end
      ]]--
    elseif kind == EAttribute.Def then
      --[[
      if Se_ChildForm.Action == Child_Action_normal then
        Se_ChildForm.Action = Child_Action_Attack;
      end
      ]]--
    elseif kind == EAttribute.Agi then
      --[[
      if Se_ChildForm.Action == Child_Action_normal then
        Se_ChildForm.Action = Child_Action_Walk;
      end
      ]]--
    elseif kind == EAttribute.Hpx then
      --[[
      if Se_ChildForm.Action == Child_Action_normal then
        Se_ChildForm.Action = Child_Action_Happy;
      end
      ]]--
    elseif kind == EAttribute.Spx then
      --[[
      if Se_ChildForm.Action == Child_Action_normal then
        Se_ChildForm.Action = Child_Action_Happy;
      end
      ]]--
    end
  end

  ShowCenterMessage(message, 4);
end

--[[ 二代武將飽食度
S:069-003 <二代武將飽食度> +飽食度(2)
]]--
protocolTable[69][3] = function(data)
  if Role.playerData.child == nil then return end

  Role.playerData.child.stodge = data:ReadUInt16();
  if Role.playerData.child.stodge == 0 then
    Role.playerData.child.kind = EChild.Died;

    ShowCenterMessage(string.Get(90186), 2);
  end
end

--[[ 二代武將滿意度
S:069-004 <二代武將滿意度> +滿意度(2)
]]--
protocolTable[69][4] = function(data)
  if Role.playerData.child == nil then return end
  
  Role.playerData.child.satiation = data:ReadUInt16();
end

--[[ 二代武將數值
S:069-005 <二代武將數值> +種類(1) +經驗(1) +數值(2)
]]--
protocolTable[69][5] = function(data)
  if Role.playerData.child == nil then return end

  local kind = data:ReadByte();

  if kind == EAttribute.Int then
    Role.playerData.child.intExp = data:ReadByte(); --知力EXP
    Role.playerData.child.int = data:ReadUInt16(); --*知力
  elseif kind == EAttribute.Atk then
    Role.playerData.child.atkExp = data:ReadByte(); --攻擊力EXP
    Role.playerData.child.atk = data:ReadUInt16(); --*攻擊力
  elseif kind == EAttribute.Def then
    Role.playerData.child.defExp = data:ReadByte(); --防禦力EXP
    Role.playerData.child.def = data:ReadUInt16(); --*防禦力
  elseif kind == EAttribute.Agi then
    Role.playerData.child.agiExp = data:ReadByte(); --敏捷EXP
    Role.playerData.child.agi = data:ReadUInt16(); --*敏捷
  elseif kind == EAttribute.Hpx then
    Role.playerData.child.hpxExp = data:ReadByte(); --Hp上升EXP
    Role.playerData.child.hpx = data:ReadUInt16(); --*Hp上升幅度
  elseif kind == EAttribute.Spx then
    Role.playerData.child.spxExp = data:ReadByte(); --Sp上升EXP
    Role.playerData.child.spx = data:ReadUInt16(); --*Sp上升幅度
  end
end

--[[ 二代武將技能
S:069-006 <二代武將技能> +索引(1) +技能ID(2) +等級(1)
]]--
protocolTable[69][6] = function(data)
  if Role.playerData.child == nil then return end

  local index = data:ReadByte();
  local skillId = data:ReadUInt16();
  local skillLv = data:ReadByte();
  
  Role.playerData.child.skills[index].Id = skillId;
  Role.playerData.child.skills[index].Lv = skillLv;

  if skillDatas[skillId] ~= nil then
    if skillLv == 1 then
      AudioManager.PlayOnce("AudioClip_WA0014", 0);
      ShowCenterMessage(string.Get(50042)..skillDatas[skillId].name..string.Get(50043), 4);
    elseif skillLv > 1 then
      AudioManager.PlayOnce("AudioClip_WA0014", 0);
      ShowCenterMessage(skillDatas[skillId].name..string.Get(20461), 4);
    end
  end
end

--[[ 二代武將資料
S:069-007 <二代武將資料> +L(2) +武將資料(L)
]]--
protocolTable[69][7] = function(data)
  local length = data:ReadUInt16();

  if length ~= 93 then return end

  Role.playerData.child = ChildData.New(data);

  if Role.playerData.child.kind == EChild.Died then
    ShowCenterMessage(string.Get(90186), 2);
  end
end

--[[ 二代武將使用次數
S:069-008 <二代武將使用次數> +次數(2)
]]--
protocolTable[69][8] = function(data)
  if Role.playerData.child == nil then return end

  Role.playerData.child.childItemCount = data:ReadUInt16();

  if Role.playerData.child.childItemCount >= 400 then
    Role.playerData.child.kind = EChild.Adults;
  end
end

--[[ 二代武將資料
S:069-009 <二代武將資料> +武將索引(1) +L(2) +武將資料(L)
]]--
protocolTable[69][9] = function(data)
  local followIndex = data:ReadByte();
  local length = data:ReadUInt16();

  if length ~= 93 then return end

  Role.playerData.child = ChildData.New(data);

  Role.SetChildNpc(followIndex);
end

--[[ 二代武將消去技能
S:069-010 <二代武將消去技能> +種類(1) +結果(1) +索引(1)
]]--
protocolTable[69][10] = function(data)
  if Role.playerData.child == nil then return end

  local kind = data:ReadByte();
  local result = data:ReadByte();
  local index = data:ReadByte();

  if result == 1 then
    ShowCenterMessage(string.Get(80206));
  elseif Contains(result, 1, 2, 5, 255) then
    ShowCenterMessage(string.Get(80207));
    return;
  end

  if kind == 1 then
    Role.playerData.child.skills[index].Id = 0;
    Role.playerData.child.skills[index].Lv = 0;
  elseif kind == 2 then
    for i = 1, 3 do
      Role.playerData.child.skills[i + (index - 1) * 3].ID = 0;
      Role.playerData.child.skills[i + (index - 1) * 3].Lv = 0;
    end
  end
  
  --LH_ChildSkillDelF.SelItemIdx := 0;
end

--[[ 二代武將種類
S:069-011 <二代武將種類> +種類(1)
]]--
protocolTable[69][11] = function(data)
  if Role.playerData.child == nil then return end

  Role.playerData.child.kind = data:ReadByte();
end

--[[ 龍舟賽
C:070-001 <龍舟按下>
C:070-002 <龍舟放開>
]]--
protocolTable[70] = {}

--[[ 龍舟活動訊息
S:070-001 <龍舟活動訊息> +種類(1)
  種類 1:比賽開始公告
  種類 2:比賽結束公告 +時間(2)
  種類 3:活動結束公告
  種類 4:目前不在活動時間內
  種類 5:目前不在比賽時間內 +開始日期(8) +結束日期(8) +開始時間(2) +結束時間(2)
  種類 6:中途棄權
  種類 7:送勝利者公告 +玩家ID(8)
  種類 8:無參賽卷訊息
]]--
protocolTable[70][1] = function(data)
  local kind = data:ReadByte();

  if kind == 1 then
    Chat.AddMessage(EChannel.System, string.Get(80232));
  elseif kind == 2 then
    local time = data:ReadUInt16();
    Chat.AddMessage(EChannel.System, string.format(string.Get(80232), math.floor(time / 100), time % 100));
  elseif kind == 3 then
    DragonBoat.ActivityEnd();
  elseif kind == 4 then
    local npcIndex = 1;
    if SceneManager.sceneId == 63000 then
      npcIndex = 8;    
    end           
    ShowTalkMessage(nil, string.Get(80273), Role.mapNpcs[npcIndex]);
  elseif kind == 5 then
    local startDate = DateTime.FromOADate(data:ReadDouble());
    local endDate = DateTime.FromOADate(data:ReadDouble());
    local startTime = data:ReadUInt16();
    local endTime = data:ReadUInt16();
    local npcIndex = 1;
    if SceneManager.sceneId == 63000 then
      npcIndex = 8;    
    end       
    ShowTalkMessage(nil, string.format(string.Get(80229), startDate:ToString("MM"), startDate:ToString("dd"), endDate:ToString("MM"), endDate:ToString("dd"), math.floor(startTime / 100), startTime % 100, math.floor(endTime / 100), endTime % 100), Role.mapNpcs[npcIndex]);
  elseif kind == 6 then
    ShowTalkMessage(nil, string.Get(80230), Role.mapNpcs[1]);
  elseif kind == 7 then
    local roleId = data:ReadInt64();
    if Role.players[roleId] == nil then return end
    Chat.AddMessage(EChannel.System, string.Concat(string.Get(71084), " ", Role.players[roleId].name, " ", string.Get(20502), ",", string.Get(80231)));
  elseif kind == 8 then
    DragonBoat.ShowNextMessage();
  end
end

--[[ 龍舟活動開始
S:070-002 <龍舟活動開始>
]]--
protocolTable[70][2] = function(data)
  DragonBoat.ActivityStart();
end

--[[ 龍舟玩家移動
S:070-003 <龍舟玩家移動> +數量(1) <<+玩家ID(8) +坐標X(2) +坐標Y(2) +速度(1)>>
]]--
protocolTable[70][3] = function(data)
  local count = data:ReadByte();

  for i = 1, count do
    local roleId = data:ReadInt64();
    local position = Vector2.New(data:ReadUInt16(), data:ReadUInt16());
    local speed = data:ReadByte();

    if Role.players[roleId] ~= nil then
      Role.players[roleId].data.dragonBoatSpeed = speed * 0.95;
      Role.players[roleId]:UpdateSpeed();
      Role.players[roleId]:Move(position, nil, true);
    end
  end
end

--[[ 龍舟放映動畫
S:070-004 <龍舟放映動畫> +動畫編號(2)
]]--
protocolTable[70][4] = function(data)
  --只有勝利者會收到此協定
  MoviePlayer.PlayMovie(data:ReadUInt16());
end

--[[ 龍舟比賽結束
S:070-005 <龍舟比賽結束> +數量(1) <<+玩家ID(8)>>
]]--
protocolTable[70][5] = function(data)
  --只有失敗者會收到此協定
  local count = data:ReadByte();
  for i = 1, count do
    local roleId = data:ReadInt64();
    
    if Role.players[roleId] ~= nil then
      Role.players[roleId].data.dragonBoatSpeed = 0;
      Role.players[roleId]:UpdateSpeed();
      Role.players[roleId]:StopMove();
    end
  end

  UIDragonBoat.RaceEnd();
end

--[[ 龍舟名次表
S:070-006 <龍舟名次表> +數量(1) <<+L(1) +名字(L) +勝場數(1)>>
]]--
protocolTable[70][6] = function(data)
  --LH_DragonBoatStanding.RevDragonBoatRank
end

--[[ 龍舟比賽倒數開始
S:070-007 <龍舟比賽倒數開始>
]]--
protocolTable[70][7] = function(data)
  UIDragonBoat.RaceCountDown();
end

--[[ 龍舟勝場數
S:070-008 <龍舟勝場數> +勝場數(1)
]]--
protocolTable[70][8] = function(data)
  --Player.DragonBoatWinNum := Ord(Data[2]);
end

--[[ 防沉迷
C:071-001 <防沉迷資料> +L(1) +名字(L) +年(2) +月(1) +日(1) +身分證(?)
]]--
protocolTable[71] = {}

--[[ 
]]--
protocolTable[71][1] = function(data)
  --[[
  if FCtrl.GameStart then
    joOnLineTip.SetCloseShowForm(Se_Undeviating, 9)
  else
    FCtrl.WallowDelayShow = true;
  end
  ]]--
end

--[[ 防沉迷啟動
S:071-002 <防沉迷啟動>
]]--
protocolTable[71][2] = function(data)
  ShowCenterMessage(string.Get(80242), 3);
end

--[[ 小瑪莉
C:072-001 <小瑪莉換盤>
C:072-002 <小瑪莉啟動>
C:072-003 <小瑪莉加倍啟動>
C:072-004 <小瑪莉投幣>
C:072-005 <小瑪莉開介面>
]]--
protocolTable[72] = {}

--[[ 小瑪莉換盤
S:072-001 <小瑪莉換盤> <<+物品ID(2) +數量(1) +索引(1) +機率(2)>>*16
]]--
protocolTable[72][1] = function(data)
  table.Clear(UISlotMachine.awards);

  local probabilitySum = 0;
  for i = 1, UISlotMachine.maxSlotItem do
    local award = {};
    
    award.itemId = data:ReadUInt16();
    award.count = data:ReadByte();
    award.slotIndex = data:ReadByte();
    
    local probability = data:ReadUInt16();
    
    --[[計算顯示用機率
    if probability > 10000 then
      probability = probability * 0.1;
    elseif probability < 10 then
      probability = probability * 100;
    elseif probability < 100 then
      probability = probability * 10;
    end]]--

    if i == 1 then
      probability = 1;
    elseif i <= 3 then
      probability = 2;
    elseif i <= 6 then
      probability = 5;
    else
      probability = 8;
    end
   
    award.pr = probability;

    --機率總和
    probabilitySum = probabilitySum + probability;
    
    UISlotMachine.awards[i] = award;
  end

  --計算顯示用機率
  for i = 1, UISlotMachine.maxSlotItem do
    UISlotMachine.awards[i].pr = UISlotMachine.awards[i].pr / probabilitySum;
  end

  if UI.IsVisible(UISlotMachine) then
    UISlotMachine.UpdateUI();
  end
end

--[[ 小瑪莉得寶
S:072-002 <小瑪莉得寶> +數量(1) <<+索引(1)>>
]]--
protocolTable[72][2] = function(data)
  if UI.IsVisible(UISlotMachine) then
    UISlotMachine.StartTurn(data);
  end
end

--[[ 小瑪莉訊息
S:072-003 <小瑪莉訊息> +種類(1)
  種類 1:告知Client要加物品
  種類 2:換盤次數不足
  種類 3:轉轉幣不足
  種類 4:投幣達上限
  種類 5:扣除轉轉幣失敗
  種類 6:身上空間不足
  種類 10:在無界不能使用
  種類 11:被關
  種類 12:戰鬥中
]]--
protocolTable[72][3] = function(data)
  UISlotMachine.RevSlotMessage(data);
end

--[[ 小瑪莉開介面
S:072-004 <小瑪莉開介面>
]]--
protocolTable[72][4] = function(data)
  --MR_Slotform.Appear;
end

--[[ 小瑪莉開到好寶
S:072-005 <小瑪莉開到好寶>
]]--
protocolTable[72][5] = function(data)
  --MR_Slotform.RevGetGoodData(Data);
end

--[[ 小瑪莉投幣數
S:072-006 <小瑪莉投幣數> +投幣數(1)
]]--
protocolTable[72][6] = function(data)
  UISlotMachine.coin = data:ReadUInt16();

  if UI.IsVisible(UISlotMachine) then
    UISlotMachine.UpdateCoin();
  end
end

--[[ 世界Boss戰
C:073-002 <開啟世界Boss戰排行榜>
C:073-006 <世界Boss戰領取階段獎勵>
]]--
protocolTable[73] = {}

--[[ 世界Boss戰訊息
S:073-001 <世界Boss戰訊息> +種類(1)
  種類 1:活動開始訊息
  種類 2:活動結束訊息
  種類 3:活動中訊息 ＋訊息種類(1)
    訊息種類 1:使用物品 +物品ID(2)
    訊息種類 2:前10名
    訊息種類 3:參加獎
    訊息種類 4:隔日補發
    訊息種類 5:累計排行榜特殊名次
    訊息種類 6:得到積分加倍
  種類 4:活動開始時間 +開始時間(8)
  種類 5:排行榜更新剩餘時間 +剩餘tick數(4)
]]--
protocolTable[73][1] = function(data)
  local kind = data:ReadByte();
  if kind == 1 then
    WorldBoss.active = true;
    WorldBoss.topScore = 0;
    WorldBoss.summationScore = 0;

    if UI.IsVisible(UIMain) then
      UIMain.UpdateBuff();
    end

    Chat.AddMessage(EChannel.System, string.Get(80277));
    ShowMarqueeMessage(string.Get(80277));

  elseif kind == 2 then
    WorldBoss.active = false;

    if UI.IsVisible(UIMain) then
      UIMain.UpdateBuff();
    end

    Chat.AddMessage(EChannel.System, string.Get(80278));
    ShowMarqueeMessage(string.Get(80278));

  elseif kind == 3 then
    local messageKind = data:ReadByte();
    if messageKind == 1 then
      WorldBoss.scoreRateItemId = data:ReadUInt16();
      Chat.AddMessage(EChannel.System, itemDatas[WorldBoss.scoreRateItemId]:GetName(true).." "..string.Get(80275));
    elseif messageKind == 2 then
      Chat.AddMessage(EChannel.System, string.format(string.Get(80279), data:ReadByte()));
    elseif messageKind == 3 then
      Chat.AddMessage(EChannel.System, string.Get(80280));
    elseif messageKind == 4 then
      Chat.AddMessage(EChannel.System, string.Get(80281));
    elseif messageKind == 5 then
      Chat.AddMessage(EChannel.System, string.format(string.Get(71300), data:ReadByte()));
    elseif messageKind == 6 then
      WorldBoss.scoreRateItemId = 0;
      local sumRate = data:ReadUInt16();
      --[[
      Player.isUpString := 'Score x';
      Player.isUpValue := sumRate;
      Chat.AddMessage(EChannel.System, string.format(string.Get(71307), WorldBoss.newScore, sumRate, sumRate * WorldBoss.newScore));
      ]]--
    end

  elseif kind == 4 then
    WorldBoss.actTime = DateTime.FromOADate(data:ReadDouble());
    WorldBoss.revTime = CGTimer.serverTime;

  elseif kind == 5 then
    WorldBoss.waitUpdateTick = CGTimer.time + (data:ReadUInt32() * 0.001);
  end
end

--[[ 世界Boss戰排行榜
S:073-002 <世界Boss戰排行榜> +種類(1) +時間(8) <<+名字(14) +伺服器ID(1) +分數(4)>>*10
aBoardKind(1)+BoardData(rClientRankDataAry)aBoardKind:1.上次世界排名 2.本次世界排名 3.本地排名
]]--
protocolTable[73][2] = function(data)
  --RevWBossRank(Copy(Data, 2, Length(Data)- 1));
end

--[[ 更新世界Boss戰分數
S:073-003 <更新世界Boss戰分數> +類型(1)
  類型 1:最新分數 +分數(4)
  類型 2:最高分數 +分數(4)
  類型 3:累計分數 +分數(4)
  類型 4:自己名次及前一名分數 +自己名次(4) +前一名分數(4)
]]--
protocolTable[73][3] = function(data)
  local kind = data:ReadByte();
  if kind == 1 then
    WorldBoss.newScore = data:ReadInt32();
    if WorldBoss.newScore > WorldBoss.topScore then
      WorldBoss.topScore = WorldBoss.newScore;
    end
    ShowCenterMessage(string.format(string.Get(80276), WorldBoss.newScore));
    Chat.AddMessage(EChannel.System, string.format(string.Get(80276), WorldBoss.newScore));
  elseif kind == 2 then
    WorldBoss.topScore = data:ReadInt32();
  elseif kind == 3 then
    WorldBoss.summationScore = data:ReadInt32();
  elseif kind == 4 then
    WorldBoss.rank = data:ReadInt32();
    WorldBoss.lastRankScore = data:ReadInt32();
  end
end

--[[ 世界Boss戰資訊
S:073-004 <世界Boss戰資訊> +本次傷害(4) +回合數(1)
]]--
protocolTable[73][4] = function(data)
  if Contains(Role.player.war, EWar.Guest, EWar.WorldBoss) then
    FightField.worldBossInfo[1] = data:ReadInt32();
    FightField.worldBossInfo[2] = data:ReadByte();

    if UI.IsVisible(UIFight) then
      UIFight.UpdateWorldBoss();
    end
  end
end

--[[ 武將強化
C:074-001 <武將強化> +武將索引(1) +NPCID(2)
C:074-002 <武將確定強化>
C:074-003 <武將取消強化>
]]--
protocolTable[74] = {}

--[[ 武將強化成功
S:074-002 <武將強化成功>
]]--
protocolTable[74][2] = function(data)
  --[[
  FNpc_ID  := 0;        //強化中NPCID
  fillchar(UpgradeAttr, sizeof(UpgradeAttr), 0);

  if Se_MainStatus.Button[1].IsAnimated then
    Se_MainStatus.Button[1].IsAnimated:=False;
  end
  ]]--
  ShowCenterMessage(string.Get(80263));
end

--[[ 武將取消強化
S:074-003 <武將取消強化>
]]--
protocolTable[74][3] = function(data)
  --[[
  FNpc_ID  := 0;        //強化中NPCID
  fillchar(UpgradeAttr, sizeof(UpgradeAttr), 0);

  if Se_MainStatus.Button[1].IsAnimated then
    Se_MainStatus.Button[1].IsAnimated:=False;
  end
  ]]--
end

--[[ 武將經驗拉拉
C:076-001 <拉拉投代幣>
C:076-002 <拉拉開獎> +注數(1) +武將索引(1) +NPCID(2)
C:076-005 <拉拉更新彩金>
C:076-006 <拉拉更新代幣>
]]--
protocolTable[76] = {}

--[[ 更新拉霸幣
S:076-001 <更新拉霸幣> +拉霸幣(1)
]]--
protocolTable[76][1] = function(data)
  --RevCoinQuant(aData);
end

--[[ 開獎結果
S:076-002 <開獎結果> +數量(1) <<+種類(1) +經驗值(4) +不知道是啥(1)*3>>
]]--
protocolTable[76][2] = function(data)
  UIExpSlotMachine.OpenLottery(data);
  --HandleOpenLottery(aData);
end

--[[ 拉中彩金訊息
S:076-003 <拉中彩金訊息> +經驗值(4) +L(1) +名字(L) 
]]--
protocolTable[76][3] = function(data)
  local exp = data:ReadInt32();
  local name = data:ReadString(data:ReadByte());

  if Role.player.name == name then return end

  local message = string.format(string.Get(80439), name, exp);

  Chat.AddMessage(EChannel.System, message);
  ShowMarqueeMessage(message);
end

--[[ 功能未開放
S:076-004 <功能未開放>
]]--
protocolTable[76][4] = function(data)
  --HandleNotOpen;
end

--[[ 更新彩金累金經驗
S:076-005 <更新彩金累金經驗> +經驗值(4)
]]--
protocolTable[76][5] = function(data)
  UIExpSlotMachine.ReceiveExp(data);
  --RevExpJp(aData);
end

--[[ 活動相關
C:077-003 <傳送入場> +活動ID(2)
C:077-011 <活動協定> +活動種類(1)
  種類 16: <官府徵召> + Kind(1)
    種類 2: <進貢> + 貢品索引(1)
    種類 3: <兌獎> + 獎勵索引(1)
  種類 25: <活動兌換> + Kind(1)
  種類 97: <搶紅包活動> + Kind(1)
                          種類 1: <搶紅包> + 紅包索引(1)
                          種類 2: 查全部盤面
  種類122:<領通用任務獎勵> +id(2)
  種類128:<通行證相關> + 種類(1)
                        種類 0:詢問通行證功能開啟
                        種類 1:一鍵領通行證獎勵
]]--
protocolTable[77] = {}

--[[ 活動開始時間
S:077-001 <活動開始時間> +活動ID(2) +開始時間(8) +結束時間(8)
]]--
protocolTable[77][1] = function(data)
  local activityId = data:ReadUInt16();
  if activityTimes[activityId] == nil then return end
  if activityTimes[activityId][1] == nil then return end
  activityTimes[activityId][1].serverStartTime = DateTime.FromOADate(data:ReadDouble());
  activityTimes[activityId][1].serverCloseTime = DateTime.FromOADate(data:ReadDouble());
end

--[[ 活動狀態
S:077-002 <活動狀態> +活動ID(2) +狀態(1)
  狀態 0:無 1:開始 2:結束 3:報名
]]--
protocolTable[77][2] = function(data)
  local activityId = data:ReadUInt16();
  local state = data:ReadByte();

  if activityTimes[activityId] == nil then return end
  if activityTimes[activityId][1] == nil then return end

  activityTimes[activityId][1].state = state;

  if UI.IsVisible(UIActivity) then
    UIActivity.UpdateState();
  end
  
  if activityId == 117 or activityId == 118 then
    if state == 2 then
      BattlePass.UpdateRedDot();
    end
  end

  if state == 2 then  --活動結束
    if Contains(activityId, 82, 95) then  --數來寶(軍團紅包), 分紅紅包
      ArmyLuckyBag.UpdateOpen();
    end
  end
end

--[[ 入場結果
S:077-003 <入場結果> +結果(1)
  結果 0:成功
  結果 1:需導航 +目的場景ID(2) +目的座標X(2) +目的座標Y(2)
  結果 2:無此活動ID
  結果 3:目的場景錯誤
  結果 4.活動尚未開始
  結果 5.組隊中傳送失敗
]]--
protocolTable[77][3] = function(data)
  local result = data:ReadByte();
  
  if result == 0 then
    MarkManager.StopNavigation();
  elseif result == 1 then
    local sceneId = data:ReadUInt16();
    local position = Vector2.New(data:ReadUInt16(), data:ReadUInt16());

    MarkManager.StartNavigation(0, sceneId, 1, position);
  elseif result == 2 then
  elseif result == 3 then
  elseif result == 4 then
  elseif result == 5 then 
    ShowCenterMessage(string.Get(20518));
  end
end

--[[ 官府徵招
S:077-011 <活動協定> + 活動種類(1)
  種類 16: <官府徵召> + Kind(1)
    種類 1: <活動狀態> + 狀態(1)[0.無 1.開啟 2.結束]+活動組別(2)
    種類 2: <進貢結果> + 結果(1)
    種類 3: <兌獎結果> + 所選獎勵(1)+Count(1)+<<ItemID(2)+Num(1)>>
  種類 25: <活動兌換> + Kind(1)
    種類 1: <活動狀態> + 狀態(1)[0.無 1.開啟 2.結束]+活動組別(2)+OverTime(4)
    種類 2: <兌換結果> + 結果(1)
  種類 27: <史詩戰役> + Kind(1)
    種類 1: <活動狀態> + 狀態(1)[0.無 1.開啟 2.結束 3.關閉]
  種類 97: <搶紅包活動> + Kind(1) 
                          種類 0: <紅包盤面狀態> 紅包索引(1) + 紅包ID(4) + 玩家姓名(?) + 到期時間(8) + 剩餘數量(1)
.                         種類 1: <發紅包> + Kind(1) 
                                                  1.發送成功, 
                                                  2.無所屬軍團，不可使用, 
                                                  3.入團未滿8小時，不能發福袋, 
                                                  4.本日軍團福袋發放數量已額滿, 
                                                  5.發送的福袋未被領取完畢，請勿重複發放。
                                                  6.玩家發紅包 +玩家ID(8)
                          種類 2: <搶紅包結果> + Kind(1)
                                                      1.搶成功, 
                                                      2.入團未滿8小時，不能搶福袋, 
                                                      3.搶到紅包後需等待30秒才能再點擊, 
                                                      4.福袋已經被搶完囉！, 
                                                      5.本日已達領取上限。
                                                      6.你已經搶過這個福袋了
  種類122:<領通用任務獎勵> +結果(1)
    結果 0=未知失敗
        1=成功 + 任務ID(2)
        2=未符合資格 + 任務ID(2)
        3=以領過 + 任務ID(2)
        255=功能未開啟
  種類128:<通行證相關> +結果(1)+種類(1)
    結果 0=失敗
        1=成功
        255=功能未開啟
    種類 0=詢問通行證功能開啟
        1=一鍵領通行證獎勵
]]--
protocolTable[77][11] = function(data)
  local kind = data:ReadByte();
  if kind == 16 then
    local result = data:ReadByte();

    if result == 1 then
      local state = data:ReadByte();

      if state == 0 then

      elseif state == 1 then 
      --LH_GovRequireFrom.RequireGroup := FConnect.ReadWord(aMsg);

      Chat.AddMessage(EChannel.System, string.Get(71322));

      --FOnTime := True;
      --FIsRewardTime := True;
      --SetActButton;
      elseif state == 2 then
      --if FOnTime then
        Chat.AddMessage(EChannel.System, string.Get(71323));
        --FOnTime := False;
      end

      --FIsRewardTime := True;
      --SetActButton;
    elseif result == 2 then
      local state = data:ReadByte();

    if result == 0 then
      ShowCenterMessage(string.Get(71327));
    end

    if Role.player:GetAttribute(EAttribute.GovRequireValue) >= Role.maxGovRequireValue then
      --LH_GovRewardFrom.Appear;
    end

    elseif result == 3 then
      local reward = data:ReadByte();

      local count = data:ReadByte();
      for i = 1, count do
        data:ReadInt16();
        data:ReadByte();
      end
       --[[
    FRewardIdx := FConnect.ReadByte(aMsg);
    for i := 1 to Max_GovRewardGroupItem do
      aItemID := FConnect.ReadWord(aMsg);
      aQuant := FConnect.ReadByte(aMsg);
      FRewardItem[i].SetData(aItemID, aQuant);
      FRewardItem[i].Left := Human[i].MapX - AbsLeftTopPoint.x-16;
      FRewardItem[i].Top := Human[i].MapY-AbsLeftTopPoint.y-40-4;
      FRewardItem[i].ColorF := Clr_NearDark;
    end
    FRewardItem[FRewardIdx].Visible := True;
    FDoOpenOther := True;
    FOpenIdx := 1;
    
    if not FOnTime then
      Se_MainStatus.ShowActGovReauireButton(False);
    end
    ]]--
    end
  elseif kind == 25 then
    local result = data:ReadByte();

    if result == 1 then
      local state = data:ReadByte();

      if state == 0 then

      elseif state == 1 then
      --AL_SwapItemFrom.RequireGroup := FConnect.ReadWord(aMsg);
      --AL_SwapItemFrom.overTime :=  FConnect.ReadDWord(aMsg);
      Chat.AddMessage(EChannel.System, string.Get(80472));
      --FOnTime := True;
      --SetActButton;
      elseif state == 2 then
      --if FOnTime then
        Chat.AddMessage(EChannel.System, string.Get(80470));
        --FOnTime := False;
      --end
      --AL_SwapItemFrom.overTime := 0;
      --SetActButton;
      end
      local activityGroup = data:ReadInt16();
      local overTime = data:ReadInt32();

    elseif result == 2 then
      local state = data:ReadByte();
      ShowCenterMessage(string.Get(80471));
    
    end
  elseif kind == 27 then
    local result = data:ReadByte();

    if result == 0 then
    
    elseif result == 1 then
      Chat.AddMessage(EChannel.System, string.format(string.Get(80482), GetActName(kind)));
        --FBattleArray[aActIdx] := 1;
    elseif result == 2 then
      --if FBattleArray[aActIdx] = 0 then return end

        Chat.AddMessage(EChannel.System, string.format(string.Get(80483), GetActName(kind)));
        --FBattleArray[aActIdx] := 0;
    elseif result == 3 then
      Chat.AddMessage(EChannel.System, string.Get(80484));
    --FOnTime := False;
    --FIsClose := True;
    end
  elseif kind == 97 then
    ArmyLuckyBag.ReciveData(data, 1);
  elseif kind == 118 then
    ArmyLuckyBag.ReciveData(data, 2);
  elseif kind == 122 then
    MissionAward.ReceiveMissionAward(data);
  elseif kind == 128 then
    local result = data:ReadByte();
    local kind = data:ReadByte();
    if result == 255 then
      BattlePass.ReceiveFunctionOpen(false);
      RedDot.Remove(ERedDot.BattlePass);
      if UI.IsVisible(UIBattlePass)then
        UI.Close(UIBattlePass)
      end
    elseif kind == 0 and result ~= 0 then
      BattlePass.ReceiveFunctionOpen(true);
    elseif result ~= 0 then
      BattlePass.UpdateRedDot();
      if UI.IsVisible(UIBattlePass)then
        UIBattlePass.UpdateUI(true);
        ShowCenterMessage(string.Get(23860));
        ShowCenterMessage(string.Get(23861));
        UIBattlePass.CheckShowWarning();
      end
    end
  end
end

--[[ 生死鬥殺人數
S:077-012 <生死鬥殺人數> +玩家ID(8) +生命值(2) +殺人數(2)
--]]
protocolTable[77][12] = function(data)
  local roleId = data:ReadInt64();

  if Role.players[roleId] == nil then return end

  Role.players[roleId]:SetDeathMatch(data:ReadUInt16(), data:ReadUInt16());
end

--[[ 生死鬥及時排行榜
S:077-013  <生死鬥即時排行榜> +數量(1) +<<玩家名稱(?) + 殺人數(2)>>
--]]
protocolTable[77][13] = function(data)
  UIMiniMap.ReciveDeathMatchData(data);
end

--[[ 七星命盤
C:078-001 <命盤升級> +等級(1)
]]--
protocolTable[78] = {}

--[[ 命盤資料
S:078-001 <命盤等級> +是否為升級(1) +等級(1)*7
]]--
protocolTable[78][1] = function(data)
  Astrolabe.SetLv(data);
end

--[[ 座騎
C:079-001 <上座騎>
C:079-002 <下座騎>
C:079-003 <座騎升級> +背包索引(2)
C:079-004 <座騎投點> +種類(1) +背包索引(2)
C:079-005 <座騎穿裝> +背包索引(2)
C:079-006 <座騎脫裝> +裝備部位(1) +背包索引(2)
C:079-007 <座騎切換> +NPCID(2)
]]--
protocolTable[79] = {}

--[[ 座騎資料
S:079-001 <座騎資料> +等級(1) +點數(2)*6 +數量(1) <<+物品資料(16)>> +NPCID(2)
]]--
protocolTable[79][1] = function(data)
  Mounts.SetData(data);
end

--[[ 設定座騎等級
S:079-002 <設定座騎等級> +等級(1)
]]--
protocolTable[79][2] = function(data)
  Mounts.SetLevel(data:ReadByte());
end

--[[ 設定座騎點數
S:079-003 <設定座騎點數> +種類(1) +點數(2)
]]--
protocolTable[79][3] = function(data)
  Mounts.SetAttributePoint(data:ReadByte(), data:ReadUInt16(), i == count);
end

--[[ 穿上座騎裝備
S:079-004 <穿上座騎裝備> +背包索引(2)
]]--
protocolTable[79][4] = function(data)
  local bagIndex = data:ReadUInt16();
  local bagItem = Item.GetBagItem(EThings.Bag, bagIndex, 0);

  if bagItem == nil then return end

  local equipItem = Item.GetBagItem(EThings.Mounts, itemDatas[bagItem.Id].fitType, 0);

  Item.SetBagItem(EThings.Mounts, itemDatas[bagItem.Id].fitType, bagItem, true);
  
  if equipItem ~= nil then
    Item.SetBagItem(EThings.Bag, bagIndex, equipItem, true);
  else
    Item.DelBagItem(EThings.Bag, bagIndex);
  end

  if UI.IsVisible(UIItemInfo) then
    UI.Close(UIItemInfo);
  end
end

--[[ 卸下座騎裝備
S:079-005 <卸下座騎裝備> +裝備部位(1) +背包索引(2)
]]--
protocolTable[79][5] = function(data)
  local fitType = data:ReadByte();
  local bagIndex = data:ReadUInt16();
  
  Item.SetBagItem(EThings.Bag, bagIndex, Item.GetBagItem(EThings.Mounts, fitType), true);
  Item.DelBagItem(EThings.Mounts, fitType);

  if UI.IsVisible(UIItemInfo) then
    UI.Close(UIItemInfo);
  end
end

--[[ 切換座騎
S:079-006 <切換座騎> +NPCID(2)
]]--
protocolTable[79][6] = function(data)
  Mounts.SetCurrent(data:ReadUInt16());
end

--[[ 設定玩家座騎
S:079-007 <設定玩家座騎> +玩家ID(8) +NPCID(2)
]]--
protocolTable[79][7] = function(data)
  local roleId = data:ReadInt64();

  if Role.players[roleId] == nil then return end

  Role.players[roleId]:Ride(data:ReadUInt16());
end

--[[ 坐騎數值
S:079-008 <坐騎數值> +數量(1) <<+種類(1) +正負號(1) +數值(4) +參數(4)>>
--]]
protocolTable[79][8] = function(data)
  local count = data:ReadByte();
  for i = 1, count do
    local attrKind = data:ReadByte();
    local sign = data:ReadByte();
    local attrValue = data:ReadInt32();
    local attrArg = data:ReadInt32();
    
    if sign == 2 then
      attrValue = attrValue * -1;
    end

    Mounts.SetAttribute(attrKind, attrValue, attrArg);
  end
end

--[[ 每日登入獎勵
C:080-001 <領獎> +種類(1)
]]--
protocolTable[80] = {}

--[[ 領取登入獎勵
S:080-001 <領取登入獎勵> +結果(1)
  結果 0:成功 +簽到天數(1) +len(1) +<itemID(2) +quant(2)>
  結果 1:失敗
]]--
protocolTable[80][1] = function(data)
end

--[[ 登入獎勵資料
S:080-002 <登入獎勵資料> 簽到天數(1) +累積登入天數(2)
]]--
protocolTable[80][2] = function(data)
end

--[[ 通用標記
]]--
protocolTable[81] = {}

--[[ 永標改變
S:081-001 <永標改變> +數量(4) <<+索引(2) +值(1)>>
]]--
protocolTable[81][1] = function(data)
  local count = data:ReadUInt32();
  for i = 1, count do
    BitFlag.Set(data:ReadUInt16(), data:ReadBoolean());
  end
end

--[[ 全部永標
S:081-002 <全部永標> +Size(2) +永標陣列(?)
]]--
protocolTable[81][2] = function(data)
  BitFlag.Init(data);
end

--[[
]]--
protocolTable[82] = {}
--[[ 成就
C:082-001 <完成成就> +Count(1)[最大10筆] +<<成就ID(2)>>
C:082-002 <成就領獎> +成就ID(2)
]]--

--[[ 成就完成
S:082-001 <完成成就> +結果(1)
                      結果 0: 成功 +成就ID(2)
                      結果 1: 無成就資料
                      結果 2: 已完成
                      結果 3: 條件不通過
                      結果 4: 成就資料錯誤
]]--
protocolTable[82][1] = function(data)
  Achievement.ReciveCompleteAchievement(data);
end

--[[ 成就領獎
S:082-002 <成就領獎> +結果(1)
                      結果 0: 成功 +成就ID(2)
                      結果 1: 失敗
]]--
protocolTable[82][2] = function(data)
  Achievement.ReciveGetAchievement(data);
end

--[[ 信件
C:083-001 <領取附件> +數量(4) <<+信件ID(4)>>
C:083-002 <刪除信件> +數量(4) <<+信件ID(4)>>
C:083-003 <已讀信件> +數量(4) <<+信件ID(4)>>
]]--
protocolTable[83] = {}

--[[ 新增信件
S:083-001 <新增信件> +數量(4) <<+信件ID(4) +時間(8) +狀態(1) +L(2) +內容(L) +附件數量(1) <<+附件種類(1)>> >>
  狀態 0:未讀 1:已讀 2:已領
  附件種類 1:物品 +物品資料(?)
  附件種類 2:武將 +武將資料(?)
]]--
protocolTable[83][1] = function(data)
  local count = data:ReadUInt32();
  for i = 1, count do
    Social.AddMail(data:ReadUInt32(), data, i == count);
  end
end

--[[ 領取信件
S:083-002 <領取信件> +數量(4) <<+信件ID(4)>>
]]--
protocolTable[83][2] = function(data)
  local count = data:ReadUInt32();
  for i = 1, count do
    Social.TakeMail(data:ReadUInt32(), i == count);
  end
end

--[[ 刪除信件
S:083-003 <刪除信件> +數量(4) <<+信件ID(4)>>
]]--
protocolTable[83][3] = function(data)
  local count = data:ReadUInt32();
  for i = 1, count do
    Social.RemoveMail(data:ReadUInt32(), i == count);
  end
end

--[[ 已讀信件
S:083-004 <已讀信件> +數量(4) <<+信件ID(4)>>
]]--
protocolTable[83][4] = function(data)
  local count = data:ReadUInt32();
  for i = 1, count do
    Social.ReadMail(data:ReadUInt32(), i == count);
  end
end

--[[ 信件訊息
S:083-005 <信件訊息> +種類(1)
  種類 4:空間不足
  種類 5:已領過
  種類 6:已刪除
  種類 7:過期
  種類 8:金錢容量不足
  種類 9:物品關閉
]]--
protocolTable[83][5] = function(data)
  local result = data:ReadByte();
  
  if result == 4 then
    ShowCenterMessage(string.Get(80359));
  elseif result == 5 then
    ShowCenterMessage(string.Get(20901));
  elseif result == 6 then
    ShowCenterMessage(string.Get(20902));
  elseif result == 7 then
    ShowCenterMessage(string.Get(20903));
  elseif result == 8 then
    ShowCenterMessage(string.Get(21560));
  elseif result == 9 then
    ShowCenterMessage(string.Get(21970));
  else
    ShowCenterMessage("83-5 Kind = "..result);
  end
end

--[[ 介面消費相關
C:084-001 <查詢介消資料> +介消編號(2)
C:084-002 <使用介消> +總類(1) +介消編號(2) 總類1:物品 2:點數 +L(1) +<<背包引(1) + 數量(2)>> +arg
C:084-002 <使用介消> +總類(1)1 +介消編號(2) +L(1) +<<背包索引(1) + 數量(2)>> +<<arg(2)>> * ?
C:084-002 <使用介消> +總類(1)1 +介消編號(2) 背包索引(1) +<<arg(2)>> * ?
C:084-002 <使用介消> +總類(1)2 +介消編號(2) +<<arg(2)>> * ?
]]--
protocolTable[84] = {}

--[[ 回傳介消資料
S:084-001 <回傳介消資料> +介消編號(2) +結果(1)
  0:無法使用 +原因(1)
  1:元寶 +數量(4)
  2:綁元 +數量(4)
  3:遊戲幣(銅幣) +數量(4)
  255: +使用物品ID(2) +使用物品數量(1)
]]--
protocolTable[84][1] = function(data)
  UISell.ReceiveQuery(data);
end

--[[ 回傳介消結果
S:084-002 <回傳介消結果> +介消編號(2) +結果(1)
]]--
protocolTable[84][2] = function(data)
  UISell.UISellResult(data);
end

--[[ 玩家計數相關
]]--
protocolTable[85] = {}

--[[ 回傳玩家計數資料
S:085-001 <回傳玩家計數資料> +數量(4) <<+索引(2) +數值(4) +上限(4)>>
]]--
protocolTable[85][1] = function(data)
  local count = data:ReadUInt32();
  for i = 1, count do
    RoleCount.Set(data:ReadUInt16(), data:ReadInt32(), data:ReadInt32(), i == count);
  end

  --跨日時會更新資料、介面有開要重新刷新
  if UI.IsVisible(UIMall) then
    UIMall.RefreshItemPage();
  end

  if UI.IsVisible(UIActivity) then
    UIActivity.UpdateOpenTime();
  end
end

--[[ 回傳多個玩家計數資料
S:085-002 <回傳玩家計數資料> +數量(2) <<+索引(2) +數值(4)>>
]]--
protocolTable[85][2] = function(data)
  local count = data:ReadUInt16();
  for i = 1, count do
    RoleCount.Set(data:ReadUInt16(), data:ReadUInt32(), data:ReadInt32(), i == count);
  end

  --跨日時會更新資料、介面有開要重新刷新
  if UI.IsVisible(UIMall) then   
    UIMall.RefreshItemPage();
  end 
end

--[[
S:085-003 <藏龍寶箱下次刷新時間> 時間(8)
]]--
protocolTable[85][3] = function(data)
  UILoginAward.DragonBoxTime = DateTime.FromOADate(data:ReadDouble());
end

--[[ 派遣相關
C:086-001 <查詢客棧武將資料>
C:086-002 <派遣武將出發> +客棧武將索引(1)
C:086-005 <完成派遣> +進度條索引(1)
]]--
protocolTable[86] = {}

--[[ 回傳武將資料完成
S:086-001 <回傳武將資料完成>
]]--
protocolTable[86][1] = function(data)
  Dispatch.ReciveOpenUI();
end

--[[ 回傳派遣武將結果
S:086-002 <派遣武將結果> +結果(1)
                          結果 1:成功
                          結果 2:派遣種類錯誤
                          結果 3:序列已滿
                          結果 4:派遣種類重複
                          結果 5:武將索引錯誤
                          結果 6:武將忙碌中
                          結果 7:派遣次數已滿
]]--
protocolTable[86][2] = function(data)
  local kind = data:ReadByte();
  if kind == 1 then
    ShowCenterMessage(string.Get(21186));
    UIDispatch.UpdateDispatchSucess();
    Dispatch.AddSliderListener();
  elseif kind == 2 then
    ShowCenterMessage(string.Get(21145));
  elseif kind == 3 then
    ShowCenterMessage(string.Get(21146));
  elseif kind == 4 then
    ShowCenterMessage(string.Get(21147));
  elseif kind == 5 then
    ShowCenterMessage(string.Get(21148));
  elseif kind == 6 then
    ShowCenterMessage(string.Get(21149));
  elseif kind == 7 then
    ShowCenterMessage(string.Get(21189));
  else
    ShowCenterMessage("Dispatch fail kind : "..kind);
  end
end

--[[ 更新派遣資料
S:086-003 <更新派遣資料> +數量(1) +<<+進度條索引(1) + 開始時間(8) + 結束時間(8) +派遣種類(1) +客棧武將索引(1) +效果索引1(1) +效果索引2(1)>>
]]--
protocolTable[86][3] = function(data)
  Dispatch.ReciveDispatchSave(data);
end

--[[ 更新派遣效果
S:086-004 <更新派遣效果> +派遣串表索引(1) +效果索引1(1) +效果索引2(1)
]]--
protocolTable[86][4] = function(data)
  Dispatch.ReciveDispatchEffect(data);
end

--[[ 領取派遣獎勵
S:086-005 <領取派遣獎勵> +結果(1)
                         結果 1:成功
                         結果 2:派遣種類錯誤
                         結果 3:武將索引錯誤
                         結果 4:尚未完成
                         結果 5:背包空間不足
                         結果 6:物品關閉
]]--
protocolTable[86][5] = function(data)
  local kind = data:ReadByte();
  if kind == 1 then
    ShowCenterMessage(string.Get(21136));
    RedDot.Remove(ERedDot.Dispatch);

    if UI.IsVisible(UIDispatch) then
      Dispatch.SwitchGetAwardPage();
    end
    
    Dispatch.AddSliderListener();
  elseif kind == 2 then
    ShowCenterMessage(string.Get(21145));
  elseif kind == 3 then
    ShowCenterMessage(string.Get(21148));
  elseif kind == 4 then
    ShowCenterMessage(string.Get(21190));
  elseif kind == 5 then
    ShowCenterMessage(string.Get(80359));
  elseif kind == 6 then
    ShowCenterMessage(string.Get(21970));    
  else
    ShowCenterMessage("Dispatch Compelete fail kind : "..kind);
  end
end

--[[
S:086-006 <更新派遣最大數量> +數量(1)
]]--
protocolTable[86][6] = function(data)
  Dispatch.ReciveBarCount(data);
end

--[[ 福利相關
C:087-001 <查詢福利資料> +種類(1)
C:087-002 <福利領獎> + 福利種類(1) + 時間(4) + 數量(1)
C:087-003 <要離線經驗資料>
C:087-004 <查詢軍團資源活動資料>
C:087-005 <查詢搖錢樹狀態>
C:087-006 <收成果實>
C:087-007 <收成>
C:087-008 <栽培>
]]--
protocolTable[87] = {}

--[[ 回傳福利領獎結果
S:087-002 <福利領獎結果> + 福利種類(1) + 結果(1)
  結果 0:成功
  結果 1:種類錯誤
  結果 2:已領取
  結果 3:條件未達成
  結果 4:背包已滿
  結果 5:時間錯誤
  結果 6:目前不是活動時間
  結果 7:獎勵錯誤
]]--
protocolTable[87][2] = function(data)
  UILoginAward.ReciveAward(data);
end

--[[ 離線經驗資料結果
S:087-002 <離線經驗資料結果> 數量(1) +<<倍率(2) +金錢](4)>>
]]--
protocolTable[87][3] = function(data)
  UILoginAward.ReciveExpData(data);
end

--[[ 搖錢樹狀態
S:087-005 <搖錢樹狀態> +等級(1) +果實數(1) +栽培時間(8)
]]--
protocolTable[87][5] = function(data)
  UILoginAward.ReciveMoneyTree(data);
end

--[[ 收成果實結果
S:087-006 <收成結果> +result(1) 1:成功 2:失敗
]]--
protocolTable[87][6] = function(data)
  UILoginAward.ReciveFruit(data);
end

--[[ 收成結果
S:087-007 <收成結果> +result(1) 1:成功  +栽培時間(8) 2:失敗
]]--
protocolTable[87][7] = function(data)
  UILoginAward.ReciveHarvest(data);
end

--[[ 限時優惠資料
S:087-008 <限時優惠資料> + ItemID(4) + 數量(4) + 原價(4) + 折價(4) + 結束時間(8)
]]--
protocolTable[87][8] = function(data)
  UILimitedTimeSale.ReciveData(data);
end

--[[ 清除限時優惠資料
S:087-009 <清除限時優惠資料>
]]--
protocolTable[87][9] = function(data)
  UILimitedTimeSale.ReciveClearData();
end

--[[ 清除限時優惠資料
S:087-010 限時免單 + 可免單次數(4) + 總免單額度(4) + 免單觸發金額(4) + 免單觸發機率(4) + 免單金額觸發額度(4) + 免單金額上限(4) + 結束時間(8)
]]--
protocolTable[87][10] = function(data)
  UIPurchaseFree.ReceiveData(data);
end

--[[ 清除限時優惠資料
S:087-011 限時免單活動關閉
]]--
protocolTable[87][11] = function(data)
  UIPurchaseFree.CloseEvent();
end

--[[ 清除限時優惠資料
S:087-012 限時免單該筆交易免費資訊 + 免單金額(4) + 應消費金額(4) + 實際消費金額
]]--
protocolTable[87][12] = function(data)
  UIPurchaseFree.ReceiveOutcome(data);
end

--[[ 排行榜
C:088-001 <查詢排行榜> +排行榜ID(1) +頁次(1)
]]--
protocolTable[88] = {}

--[[ 排行榜資料
S:088-001 <排行榜資料> +排行榜ID(1) +頁次(1) +總頁數(1) +目前名次(1) +資訊參數數量(1) <<+資訊參數(4)>> +數量(1) <<+名次(1) +變動(1) +玩家ID(8) +L(1) +姓名(L) +等級(1) +屬性(1) +轉生類別(1) +職業(1) +資訊參數數量(1) <<+資訊參數(4)>>>>
  變動 0:不變 1:上升 2:下降
]]--
protocolTable[88][1] = function(data)
  local leaderboardId = data:ReadByte();
  local page = data:ReadByte();
  local maxPage = data:ReadByte();
  local myRank = data:ReadByte();
  local myScoreInfo = {};

  local infoCount = data:ReadByte();
  for i = 1, infoCount do
    myScoreInfo[i] = data:ReadInt32();
  end

  local rankInfos = {};
  local count = data:ReadByte();
  for i = 1, count do
    local rankInfo = {};
    rankInfo.rank = data:ReadByte();
    rankInfo.state = data:ReadByte();
    rankInfo.roleId = data:ReadInt64();
    rankInfo.name = data:ReadString(data:ReadByte());
    rankInfo.level = data:ReadByte();
    rankInfo.element = data:ReadByte();
    rankInfo.turn3Info = {};
    rankInfo.turn3Info.element = data:ReadByte();
    rankInfo.turn = data:ReadByte();
    rankInfo.career = data:ReadByte();
    rankInfo.scoreInfo = {};

    if rankInfo.turn >= 3 then
      rankInfo.level = rankInfo.level + Role.playerMaxLv;
    end

    local infoCount = data:ReadByte();
    for j = 1, infoCount do
      rankInfo.scoreInfo[j] = data:ReadInt32();
    end

    rankInfos[i] = rankInfo;
  end

  if UI.IsVisible(UILeaderboard) then
    UILeaderboard.UpdateUI(leaderboardId, page, maxPage, myRank, myScoreInfo, rankInfos);
  end
end

--[[ 熔爐
C:089-001 <查詢熔爐商品資料>
C:089-002 <購買商品>  +購買種類(1) +格子(1) +物品ID(2)   購買種類 1.武將2.裝備
C:089-003 <分解物品>  +count(1) <<+背包索引(2) +數量(4) >>  種類 1.武將2.裝備
]]--
protocolTable[89] = {}

--[[ 熔爐資料
S:089-001 <熔爐商品資料> 結果(1)
                          結果(1) 1:成功 +碎片比率(8) + 碎片活動比率(8) +是否要開介面(1) +count(1) + <<商品種類(1) +是否暴擊(1) +count(1) <<+物品ID(2) +數量(4)>>>>
                          結果 2:失敗
]]--
protocolTable[89][1] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    UIFurnace.ReciveShopData(data);
  end
end

--[[ 購買結果
S:089-002 <購買結果>結果(1)
                      1.成功 +物品ID(2)
                      錯誤訊息 2:kind錯誤 3:slot錯誤 4:物品資料錯誤 5:已購買
]]--
protocolTable[89][2] = function(data)
  UIFurnace.ReciveBuy(data);
end

--[[ 分解結果
S:089-003 <分解結果>結果(1)
                  0.成功 +count(1) +<<物品ID(2) +商品種類(1) +碎片數量(4)>>
                  1.失敗 +種類(1) +物品ID(2)
]]--
protocolTable[89][3] = function(data)
  UIFurnace.ReciveDismantle(data);
end

--[[ 兌換卡
C:090-001 <兌換> +兌換物品ID(2) +選取數量(1) <<+選取索引(1)>>
C:090-002 <專五兌換> +兌換物品ID(2) +選取數量(1) <<+選取索引(1)>>
]]--
protocolTable[90] = {}

--[[ 兌換
S:90-001 <兌換卡使用結果> + 結果(1)
                  1.成功
                  2.兌換卡錯誤
                  3.獎品選取索引錯誤
                  4.獎品選取樣數超過
                  5.獎品選取樣數不足
                  6.背包空間不足
                  7.使用卡片錯誤
]]--
protocolTable[90][1] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    if UI.IsVisible(UIItemInfo) then
      UIItemInfo.UpdateUI();
    end
  elseif result == 2 then
    ShowCenterMessage(string.Get(21164)); -- 兌換卡錯誤
  elseif result == 3 then
    ShowCenterMessage(string.Get(21165)); -- 獎品選取索引錯誤
  elseif result == 4 then
    ShowCenterMessage(string.Get(21166)); -- 獎品選取樣數超過
  elseif result == 5 then
    ShowCenterMessage(string.Get(21167)); -- 獎品選取樣數不足
  elseif result == 6 then
    ShowCenterMessage(string.Get(80359)); -- 背包空間不足
  elseif result == 7 then
    ShowCenterMessage(string.Get(21168)); -- 使用卡片錯誤
  end
end

--[[ 專武兌換
S:90-002 <專武製作書使用結果> + 結果(1)
                  1.成功
                  2.製作書錯誤
                  3.獎品選取索引錯誤
                  4.獎品選取樣數超過
                  5.獎品選取樣數不足
                  6.背包空間不足
                  7.使用卡片錯誤
]]--
protocolTable[90][2] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    if UI.IsVisible(UIItemInfo) then
      UIItemInfo.UpdateUI();
    end
  elseif result == 2 then
    ShowCenterMessage(string.Get(21164)); -- 製作書錯誤
  elseif result == 3 then
    ShowCenterMessage(string.Get(21165)); -- 獎品選取索引錯誤
  elseif result == 4 then
    ShowCenterMessage(string.Get(21166)); -- 獎品選取樣數超過
  elseif result == 5 then
    ShowCenterMessage(string.Get(21167)); -- 獎品選取樣數不足
  elseif result == 6 then
    ShowCenterMessage(string.Get(80359)); -- 背包空間不足
  elseif result == 7 then
    ShowCenterMessage(string.Get(21168)); -- 使用卡片錯誤
  elseif result == 8 then 
    ShowCenterMessage(string.Get(22701)); -- 專武碎片不足
  end
end


--[[ 九宮格
C:091-002 完成任務 數量(1) + <<種類(1)+ 索引(1) +任務ID(2)>>
C:091-003 領取獎勵 九宮格ID(2)+ 索引(1)[1.橫一, 2.橫二, 3.橫三, 4.直一, 5.直二, 6.直三, 7.全部] +任務ID(2)
--]]
protocolTable[91] = {}

--[[ 九宮格資料
S:091-001 九宮格資料 數量(1) + <<九宮格ID(2)+ 難度(1) +9*<<任務ID(2)+ 任務參數(DWord) +  是否完成(1)[0.否 1.是]>>>>
--]]
protocolTable[91][1] = function(data)
  Jiugongge.SetJiugongge(data);
end

--[[ 完成任務回應
S:091-002 完成任務回應 結果(1)[0.失敗 1.成功 +九宮格ID(2) +索引(1)]
--]]
protocolTable[91][2] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    Jiugongge.SetJiugonggeMissionCompleted(data:ReadUInt16(), data:ReadByte())
  end
end

--[[ 領取獎勵回應
S:091-003 領取獎勵回應 結果(1)[0.失敗 1.成功 +九宮格ID(2)+索引(1)]
--]]
protocolTable[91][3] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    Jiugongge.SetJiugonggeAwardIsReceived(data:ReadUInt16(), data:ReadByte())
  elseif result == 2 then
    ShowCenterMessage(string.Get(21471));
  elseif result == 3 then
    ShowCenterMessage(string.Get(21472));
  elseif result == 4 then
    ShowCenterMessage(string.Get(98017));
  elseif result == 5 then
    ShowCenterMessage(string.Get(80359));
  elseif result == 6 then
    ShowCenterMessage(string.Get(21970));
  end
end

--[[ 九宮格單筆資料
S:091-004 九宮格單筆資料 九宮格ID(2)+ 索引(1)+ 任務ID(2 + 任務參數(DWord))+ 是否完成(1)[0.否 1.是]
]]--
protocolTable[91][4] = function(data)
  Jiugongge.SetJiugonggeSingle(data);
end

--[[ 戳戳樂
C:092-003 <戳戳樂領獎> +格子位置(1)
]]--
protocolTable[92] = {}

--[[ 戳戳樂玩家投幣數
S:092-001 <戳戳樂玩家投幣數> +投幣數(2)                               
]]--
protocolTable[92][1] = function(data)
  local coin = data:ReadUInt16();
  UIPoke.coin = coin;
  if UI.IsVisible(UIPoke)then 
    UIPoke.UpdateUI();
  end
end

--[[ 戳戳樂資料
S:092-002 <戳戳樂資料> +數量(1) +<<編號(1) +獎勵類別(1) +物品ID(2) +數量(4) +格子編號(1) +中獎機率權重(2)>>
]]--
protocolTable[92][2] = function(data)
  local count = data:ReadByte();
  table.Clear(UIPoke.awards);
  for i = 1, count do 
    local award = {};
    award.id = data:ReadByte();
    award.kind = data:ReadByte();
    award.itemId = data:ReadUInt16();
    award.count = data:ReadUInt32();
    award.index = data:ReadByte();
    award.prWeight = data:ReadUInt16();
    UIPoke.awards[award.id] = award;
  end  
  UIPoke.UpdatePr();
  if UI.IsVisible(UIPoke)then 
    UIPoke.UpdateUI();
  end
end

--[[ 戳戳樂開獎
S:092-003 <戳戳樂開獎> +結果(1)
                            1.成功 +編號(1) +格子編號(1)
                            2.失敗 +失敗訊息(1)
]]--
protocolTable[92][3] = function(data)
  local result = data:ReadByte();
  if result == 1 then 
    local id = data:ReadByte();
    if UIPoke.awards[id] ~= nil then 
      UIPoke.awards[id].index = data:ReadByte();
      UIPoke.PlayPokeAnimation(id, UIPoke.awards[id].index);
      UIPoke.UpdatePr();
    end
  elseif result == 2 then 
    --失敗
    local failKind = data:ReadByte();
    if failKind == 2 then  --預設
      ShowCenterMessage(string.Get(80392));      
    elseif failKind == 3 then  --已戳過
      ShowCenterMessage(string.Get(22460));
    elseif failKind == 4 then  --投幣不足
      ShowCenterMessage(string.Get(22498));
    elseif failKind == 5 then  --盤面已滿
      ShowCenterMessage(string.Get(22499));
    elseif failKind == 6 then   --骰錯
      ShowCenterMessage(string.Get(80041));      
    end
  end
end

--[[大富翁
C: 093-000 <要求大富翁資料>
C: 093-001 <骰骰子> +指定點數(1)
]]--
protocolTable[93] = {}

--[[
S:093-000 <大富翁資料> +所在位子(1)
]]--
protocolTable[93][0] = function(data)
  Monopoly.ReceiveProgress(data);
end

--[[S:093-001<骰骰子> +結果(1) +所在位子(1)
                      0.未知錯誤
                      1.成功
                      2.非活動時間
                      3.骰子不足
                      4.背包已滿
                      5.時間未到
]]--
protocolTable[93][1] = function(data)
  Monopoly.ReceiveRollDiceResult(data)
end


--[[ 收集冊
C:095-001 <領取武將收集獎勵> +收集冊武將編號(2)
C:095-002 <儲存外觀裝備> +收集冊外觀編號(2) +外觀部位(1)
C:095-003 <取出外觀裝備> +收集冊外觀編號(2) +外觀部位(1)
C:095-006 <升級卡片組合> +卡片組合編號(1)
C:095-007 <裝備卡片組合> +卡片組合編號(1)
C:095-007 <卸下卡片組合> +卡片組合編號(1)
C:095-011 <領多個收集武將獎勵> +數量(1) +收集冊武將編號(2)
C:095-012 <NFT卡片放入> +卡片物品編號(2)
C:095-013 <NFT卡片取出> +卡片物品編號(2)
C:095-014 <NFT坐騎放入> +坐騎npc編號(2)
C:095-015 <NFT坐騎取出> +坐騎物品編號(2)
C:095-021 <NFT閃耀值更新> +閃耀值(2)
]]--
protocolTable[95] = {}

--[[ 領取武將收集獎勵
S:095-001 <領取武將收集獎勵> +結果(1)
                               0.失敗 
                               1.成功 
]]--
protocolTable[95][1] = function(data)
  local result = data:ReadByte();
  if result == 1 then 
    if UI.IsVisible(UICollectBook) then 
      UICollectBook.UpdateList();
    end
  else
    local kind = data:ReadByte();
    if kind == 4 then 
      ShowCenterMessage(string.Get(80359)); -- 背包空間不足
    elseif kind == 5 then
      ShowCenterMessage(string.Get(21970)); -- 物品關閉
    else
      logError(string.Concat("Protocol 95-1 fail ", kind));
    end
  end
end

--[[ 塞時裝
S:095-002 <塞時裝> +結果(1)
                      0.失敗 
                      1.成功 
]]--
protocolTable[95][2] = function(data)
  local result = data:ReadByte();
  if result == 1 then
    CollectStyle.ReciveStoreStyle();
  else
    logError("Protocol 95-2 fail : " .. result);
  end
end

--[[ 領時裝
S:095-003 <領時裝> +結果(1)
                       0.失敗 
                       1.成功  
]]--
protocolTable[95][3] = function(data)
  local result = data:ReadByte();
  if result == 1 then 
    CollectStyle.ReciveTakeStyleOut();
  else
    local kind = data:ReadByte();
    if kind == 6 then 
      ShowCenterMessage(string.Get(80359)); -- 背包空間不足
    else
      logError(string.Concat("Protocol 95-3 fail kind:", kind));
    end
  end
end

--[[ 收時裝資料
S:095-004 <收時裝資料> +數量(1) + <<資料(1)>>
]]--
protocolTable[95][4] = function(data)
  CollectStyle.InitData(data);  
end

--[[ 更新時裝資料
S:095-005 <更新時裝資料> +索引(1) + 資料(1)
]]--
protocolTable[95][5] = function(data)
  CollectStyle.UpdateData(data);
end

--[[ 卡片升級
S:095-006 <卡片升級> +結果(1)
]]--
protocolTable[95][6] = function(data)
  local result = data:ReadByte();
  if result == 1 then
    CollectCard.OnReciveLvUp(data);
  else
    logError("Protocol 95-6 fail : " .. result);
  end
end

--[[ 裝備卡片組合
S:095-007 <裝備卡片組合> +結果(1)
]]--
protocolTable[95][7] = function(data)
  local result = data:ReadByte();
  if result == 1 then
    ShowCenterMessage(string.format(string.Get(21493), string.Get(collectCardDatas[data:ReadByte()].name)));
  else
    logError("Protocol 95-7 fail : " .. result);
  end
end

--[[ 卸下卡片組合
S:095-008 <卸下卡片組合> +結果(1)
]]--
protocolTable[95][8] = function(data)
  local result = data:ReadByte();
  if result == 1 then
    ShowCenterMessage(string.format(string.Get(21494), string.Get(collectCardDatas[data:ReadByte()].name)));
  else
    logError("Protocol 95-8 fail : " .. result);
  end
end

--[[ 當前裝備中卡片組合資料
S:095-009 <當前裝備中卡片組合資料> +上限(1) +數量(1) +<<組合ID(1)>>
]]--
protocolTable[95][9] = function(data)
  CollectCard.ReciveEquipCard(data);
end

--[[ 擁有的卡片組合資料
S:095-010 <擁有的卡片組合資料> +數量(1) +<<組合ID(1) + 等級(1)>>
]]--
protocolTable[95][10] = function(data)
  CollectCard.ReciveCardData(data);
end

--[[ 一鍵領取武將獎勵
S:095-011 <一鍵領取武將獎勵> +結果(1)
                               0.失敗 
                               1.成功 
                               2.其他 +種類(1)
]]--
protocolTable[95][11] = function(data)
  local result = data:ReadByte();
  if result == 1 then 
    if UI.IsVisible(UICollectBook) then 
      UICollectBook.UpdateList();
    end
  elseif result == 2 then 
    local kind = data:ReadByte();
    if kind == 4 then 
      ShowCenterMessage(string.Get(80359));
    elseif kind == 5 then
      ShowCenterMessage(string.Get(21970));
    end
  end
end

--[[ NFT卡片放入
S:095-012 <NFT卡片放入> +結果(1) 0.失敗 1.成功 + 卡片ID(2)
]]--
protocolTable[95][12] = function(data)
  local result = data:ReadByte();
  
  if result == 1 then
    local cardId = data:ReadUInt16();
    if UI.IsVisible(UICollectBook) then
      UICollectBook.UpdateInfo();
    end
    UICollectBook.ShowShineShine(cardId, true);
  else
    logError(" 095-012 : " .. result);
  end
end

--[[ NFT卡片取出
S:095-013 <NFT卡片取出> +結果(1) 0.失敗 1.成功卡片ID(2)
]]--
protocolTable[95][13] = function(data)
  local result = data:ReadByte();
  if result == 1 then
    local cardId = data:ReadUInt16();
    if UI.IsVisible(UICollectBook) then
      UICollectBook.UpdateInfo();
      UICollectBook.ShowShineShine(cardId, false);
    end
  else
    logError(" 095-013 : " .. result);
  end
end

--[[ NFT坐騎放入
S:095-014 <NFT坐騎放入> +結果(1) 0.失敗 1.成功+ 坐騎NpcID(2)
]]--
protocolTable[95][14] = function(data)
  local result = data:ReadByte();
  if result == 1 then
    local mountId = data:ReadUInt16();
    if UI.IsVisible(UICollectBook) then
      UICollectBook.UpdateInfo();
    end
    UICollectBook.ShowShineShine(mountId, true);
  else
    logError(" 095-014 : " .. result);
  end
end

--[[ NFT坐騎取出
S:095-015 <NFT坐騎取出> +結果(1) 0.失敗 1.成功 坐騎NpcID(2)
]]--
protocolTable[95][15] = function(data)
  local result = data:ReadByte();
  if result == 1 then
    local mountId = data:ReadUInt16();
    if UI.IsVisible(UICollectBook) then
      UICollectBook.UpdateInfo();
      UICollectBook.ShowShineShine(mountId, false);
    end
  else
    logError(" 095-15 : " .. result);
  end
end

--[[ NFT閃耀值更新
S:095-021 <NFT閃耀值更新> +閃耀值(2)
]]--
protocolTable[95][21] = function(data)
  UICollectBook.SetSummary(data:ReadUInt16());
end

--[[ 拍賣場
C:096-001 <上架商品> +商品種類(1)
  商品種類 1:物品 +背包索引(2) +數量(2) +價格(4)
  商品種類 2:武將 +武將索引(1) +價格(4)
C:096-002 <下架商品> +商品序號(4)
C:096-003 <購買商品> +商品序號(4)
C:096-004 <查詢分類> +主類別(1) +子類別(1) +開始索引(1)
C:096-005 <查詢商品簡易資料> +排序方式(1) +商品種類(1)
  排序方式 1:價格低至高 2:價格高至低
  商品種類 1:物品 +物品ID(2) +開始索引(1)
  商品種類 2:武將 +武將ID(2) +開始索引(1)
C:096-006 <查詢商品詳細資料> +商品序號(4)
]]--
protocolTable[96] = {}

--[[ 上架結果
S:096-001 <上架結果> +結果(1)
  結果 0:成功
  結果 1.拍賣空間已滿
  結果 2.商品錯誤
  結果 3.商品不可拍賣
--]]
protocolTable[96][1] = function(data)
  local result = data:ReadByte();
  if result == 0 then
    ShowCenterMessage(string.Get(80387));
  elseif result == 1 then
    ShowCenterMessage(string.Get(80406));
  elseif result == 2 then
    ShowCenterMessage(string.Get(80407));
  elseif result == 3 then
    ShowCenterMessage(string.Get(80407));
  else
    logError("96 - 1 Error Code = "..result);
  end
end

--[[ 下架結果
S:096-002 <下架結果> +結果(1)
  結果 0:成功
  結果 1.空間已滿
  結果 2.商品不存在
--]]
protocolTable[96][2] = function(data)
  local result = data:ReadByte();
  if result == 0 then
    ShowCenterMessage(string.Get(80393));
  elseif result == 1 then
    ShowCenterMessage(string.Get(80359));
  elseif result == 2 then
    ShowCenterMessage(string.Get(80394));
  else
    logError("96 - 2 Error Code = "..result);
  end
end

--[[ 購買結果
S:096-003 <購買結果> +結果(1)
  結果 0:成功
  結果 1.空間已滿
  結果 2.商品不存在
  結果 3.金錢不足
--]]
protocolTable[96][3] = function(data)
  local result = data:ReadByte();
  if result == 0 then
  elseif result == 1 then
    ShowCenterMessage(string.Get(80359));
  elseif result == 2 then
    ShowCenterMessage("96 - 3 Error Code = "..result);
  elseif result == 3 then
    ShowCenterMessage("96 - 3 Error Code = "..result);
  else
    logError("96 - 3 Error Code = "..result);
  end
end

--[[ 查詢分類結果
S:096-004 <查詢分類結果> +主類別(1) +子類別(1) +數量(1) <<+商品種類(1) +商品ID(2) +數量(2)>>
  主類別 1:商品清單 +子類別(1) +數量(1) <<+商品簡易資料(?)>>
    商品簡易資料 +商品序號(4) +價格(4) +到期時間(8) +狀態(1) +商品種類(1)
      狀態 1:上架中 2:販賣中 3:已賣出 4:已過期
      商品種類 1:物品 +物品ID(2) +數量(2)
      商品種類 2:武將 +武將ID(2) +等級(1)
  主類別 2~7:其他 +子類別(1) +數量(1) <<+商品種類(1) +商品ID(2) +數量(2)>>
--]]
protocolTable[96][4] = function(data)
  local mainTag = data:ReadByte();
  local subTag = data:ReadByte();
  local products = {};
  local count = data:ReadByte();
  if mainTag == 1 then
    for i = 1, count do
      products[i] = {};
      products[i].sn = data:ReadUInt32();
      products[i].price = data:ReadUInt32();
      products[i].time = DateTime.FromOADate(data:ReadDouble());
      products[i].state = data:ReadByte();
      products[i].kind = data:ReadByte();
      products[i].id = data:ReadUInt16();
  
      if products[i].kind == EAuctionProduct.Item then
        products[i].count = data:ReadUInt16();
      elseif products[i].kind == EAuctionProduct.Npc then
        products[i].level = data:ReadByte();
      end
    end
  else
    for i = 1, count do
      products[i] = {};
      products[i].kind = data:ReadByte();
      products[i].id = data:ReadUInt16();
      products[i].count = data:ReadUInt16();
    end
  end

  if UI.IsVisible(UIAuction) then
    UIAuction.UpdateUI(mainTag, subTag, EAuctionProduct.None, 0, products);
  end
end

--[[ 查詢商品結果
S:096-005 <查詢商品結果> +商品種類(1) +商品ID(2) +數量(1) <<+商品簡易資料(?)>>
  商品簡易資料 +商品序號(4) +價格(4) +到期時間(8) +商品種類(1)
    商品種類 1:物品 +物品ID(2) +數量(2)
    商品種類 2:武將 +武將ID(2) +等級(1)
--]]
protocolTable[96][5] = function(data)
  local kind = data:ReadByte();
  local id = data:ReadUInt16();
  local products = {};
  local count = data:ReadByte();
  for i = 1, count do
    products[i] = {};
    products[i].sn = data:ReadUInt32();
    products[i].price = data:ReadUInt32();
    products[i].time = DateTime.FromOADate(data:ReadDouble());
    products[i].kind = data:ReadByte();
    products[i].id = data:ReadUInt16();

    if products[i].kind == EAuctionProduct.Item then
      products[i].count = data:ReadUInt16();
    elseif products[i].kind == EAuctionProduct.Npc then
      products[i].level = data:ReadByte();
    end
  end

  if UI.IsVisible(UIAuction) then
    UIAuction.UpdateUI(nil, nil, kind, id, products);
  end
end

--[[ 查詢商品詳細結果
S:096-006 <查詢商品詳細結果> +商品序號(4) +價格(4) +到期時間(8) +商品種類(1)
  商品種類 1:物品 +物品資料(?)
  商品種類 2:武將 +武將資料(?)
--]]
protocolTable[96][6] = function(data)
  local sn = data:ReadUInt32();
  local price = data:ReadUInt32();
  local time = DateTime.FromOADate(data:ReadDouble());
  local kind = data:ReadByte();

  if products[i].kind == EAuctionProduct.Item then
    local itemSave = ThingData.New(data);
    UIItemInfo.Show(itemSave.Id, itemSave);
  elseif products[i].kind == EAuctionProduct.Npc then
    local npcInfo = NpcInfo.New(data);
    UI.Open(UINpcInfo, npcInfo);
  end
end

--[[ 限時副本
C:097-001 <進入限時副本> +副本ID(1)
C:097-002 修改限時副本任務階段 +階段(1)
]]--
protocolTable[97] = {}

--[[ 進入結果
S:097-001 <進入結果> +結果(1)
  結果 0:成功
  結果 1.等級不足
  結果 2.時間已滿
  結果 3.戰鬥中
  結果 4.事件中
  結果 5.組隊中
  結果 6.已在該場景
--]]
protocolTable[97][1] = function(data)
  local result = data:ReadByte();
  if result == 0 then
  elseif result == 1 then
    ShowCenterMessage(string.Get(10328));
  elseif result == 2 then
    ShowCenterMessage(string.Get(21766));
  elseif result == 3 then
    ShowCenterMessage(string.Get(80099));
  elseif result == 4 then 
    ShowCenterMessage(string.Get(21767));
  elseif result == 5 then 
    ShowCenterMessage(string.Get(20518));    
  elseif result == 6 then 
    ShowCenterMessage(string.Get(21763));    
  else
    logError("97 - 1 Error Code = "..result);
  end
end

--[[ prize
C:098-001 <查詢活動資訊>
C:098-002 <查詢玩家活動資料> +serial(4)
]]--
protocolTable[98] = {}

--[[ 活動資訊
S:098-001 L(4) + <<活動編號(4) + actType(4) + actKind(4) + 開始時間(8) + 結束時間(8) + 目前這活動是否關閉(1) + L(1) + 活動名稱(L) +  L(4) + <<lowp(4) + highp(4) + L(4) +<<物品編號(2) + 數量(4) >> + L(4) + <<Reserve(4)>> >> >>
--]]
protocolTable[98][1] = function(data)
  UILoginAward.RecivePrize(data);
end

--[[ 送玩家資料
S:098-002 serial(4) + TotalSum(4) + DaySum(4) + count(4) + <<ruleValye(2)>>
--]]
protocolTable[98][2] = function(data)
  UILoginAward.ReciveRolePrize(data);
end

--[[ 關閉指定活動
S:098-003 serial(4)
--]]
protocolTable[98][3] = function(data)
  UILoginAward.ReciveClosePrize(data);
end

--[[ 全伺服器累計數值
S:098-004 <全伺服器累計數值> +數量(1) <<+索引(1) + 數值(8)>>
--]]
protocolTable[98][4] = function(data)
  UILoginAward.ReciveServerCollect(data);
end

--[[ 資料對戰
C:099-001 <刷新對手>
C:099-002 <查詢可用武將>
C:099-003 <設定出戰隊伍> +數量(1) <<+位置索引(1) +NPCID(2) +技能(2)*5>>
C:099-004 <領取排名獎勵>
C:099-005 <領取今日積分獎勵>
C:099-006 <選擇對手> +對手種類(1) +對手索引(1)
--]]
protocolTable[99] = {}

--[[ 玩家資訊
S:099-001 <玩家資訊> +階級(1) +積分(4) +排名(4) +昨天排名(4) +排名獎勵可領(1) +今日積分(4) +今日積分已領次數(1) +NPC對戰次數(1)
--]]
protocolTable[99][1] = function(data)
  DataFight.SetPlayerData(data:ReadByte(), data:ReadInt32(), data:ReadInt32(), data:ReadInt32(), data:ReadBoolean(), data:ReadInt32(), data:ReadByte(), data:ReadByte());
end

--[[ 對手資訊
S:099-002 <對手資訊> +數量(1) <<+索引(1) +玩家ID(8) +玩家名片(?) +階級(1) +積分(4)>>
--]]
protocolTable[99][2] = function(data)
  local count = data:ReadByte();

  for i = 1, count do
    local index = data:ReadByte();
    local roleId = data:ReadInt64();
    local playerInfo = PlayerInfo.New(roleId, data);
    playerInfo.class = data:ReadByte();
    playerInfo.score = data:ReadInt32();
    playerInfo.index = index;

    DataFight.AddEnemy(playerInfo, i == count);
  end
end

--[[ 對戰記錄
S:099-003 <對戰記錄> +數量(1) <<+索引(1) +玩家ID(8) +玩家名片(?) +階級(1) +積分(4) +積分變動(4) +對戰時間(8) +已復仇(1)>>
--]]
protocolTable[99][3] = function(data)
  local count = data:ReadByte();

  for i = 1, count do
    local index = data:ReadByte();
    local roleId = data:ReadInt64();
    local playerInfo = PlayerInfo.New(roleId, data);
    playerInfo.class = data:ReadByte();
    playerInfo.score = data:ReadInt32();
    playerInfo.result = data:ReadInt32();
    playerInfo.time = DateTime.FromOADate(data:ReadDouble());
    playerInfo.revenged = data:ReadBoolean();
    playerInfo.index = index;

    DataFight.AddHistory(playerInfo, i == count);
  end
end

--[[ 可用武將
S:099-004 <可用武將> +數量(1) <<+NPCID(2) +等級(1) +HP(4) +覺醒技等級(1) +強化技等級(1) +專武技數量(1) <<+專武技能ID(2)>> >>
--]]
protocolTable[99][4] = function(data)
  local npcInfos = {};
  local count = data:ReadByte();

  for i = 1, count do
    local npcInfo = {};
    npcInfo.npcId = data:ReadUInt16();
    npcInfo.level = data:ReadByte();
    npcInfo.hp = data:ReadUInt32();

    local npcData = npcDatas[npcInfo.npcId];

    npcInfo.extraSkills = {};
    local specialSkillLv = data:ReadByte();
    if specialSkillLv > 0 and npcData ~= nil then
      table.insert(npcInfo.extraSkills, npcData.specialSkill);
    end

    local upgradeSkillLv = data:ReadByte();
    if upgradeSkillLv > 0 and npcData ~= nil then
      table.insert(npcInfo.extraSkills, npcData.upgradeSkill);
    end

    local weaponSkillCount = data:ReadByte();
    for j = 1, weaponSkillCount do
      table.insert(npcInfo.extraSkills, data:ReadUInt16());
    end

    table.insert(npcInfos, npcInfo);
  end

  if UI.IsVisible(UIDataFight) then
    UIDataFight.ShowTeamList(npcInfos);
  end
end

--[[ 出戰隊伍
S:099-005 <出戰隊伍> +數量(1) <<+位置索引(1) +NPCID(2) +等級(1) +HP(4) +覺醒技等級(1) +強化技等級(1) +專武技數量(1) <<+專武技能ID(2)>> +技能(2)*5>>
--]]
protocolTable[99][5] = function(data)
  DataFight.ClearTeam();

  local count = data:ReadByte();
  for i = 1, count do
    local index = data:ReadByte();
    local npcId = data:ReadUInt16();
    local level = data:ReadByte();
    local hp = data:ReadUInt32();

    local npcData = npcDatas[npcId];

    local extraSkills = {};
    local specialSkillLv = data:ReadByte();
    if specialSkillLv > 0 and npcData ~= nil then
      table.insert(extraSkills, npcData.specialSkill);
    end

    local upgradeSkillLv = data:ReadByte();
    if upgradeSkillLv > 0 and npcData ~= nil then
      table.insert(extraSkills, npcData.upgradeSkill);
    end

    local weaponSkillCount = data:ReadByte();
    for j = 1, weaponSkillCount do
      table.insert(extraSkills, data:ReadUInt16());
    end

    local skills = {};
    for j = 1, DataFight.maxTeamSkill do
      table.insert(skills, data:ReadUInt16());
    end

    DataFight.SetTeam(index, npcId, level, hp, extraSkills, skills);
  end
end

--[[ 選擇對手結果
S:099-006 <選擇對手結果> +結果(1)
  結果 0:成功
  結果 1:失敗原因
--]]
protocolTable[99][6] = function(data)
  local result = data:ReadByte();
  if result == 0 then
    UI.Close(UIDataFight);
  else

  end
end

--[[ 金手指
C:100-001 <加金錢> +玩家ID(8) +金錢(4)
C:100-002 <加物品> +玩家ID(8) +物品ID(4) +物品數量(4)
C:100-003 <加經驗> +玩家ID(8) +武將索引(4) +經驗值(4)

C:100-005 <加武將> +玩家ID(8) +NPCID(4)
C:100-006 <標記步驟> +玩家ID(8) +標記ID(4) +步驟(4)
C:100-007 <標記完成> +玩家ID(8) +標記ID(4) +完成(4)
C:100-008 <加技能> +玩家ID(8) +技能ID(4) +等級(4)
C:100-009 <換場景> +玩家ID(8) +場景ID(4) +X(4) +Y(4) +座標字串(4)

C:100-011 <加軍團資源> +玩家ID(8) +資源種類(4) +數量(4)
C:100-012 <加官勳> +玩家ID(8) +官勳(4)
C:100-013 <清永標> +玩家ID(8) +永標(4) +數值(4)
C:100-014 <加物品信> +玩家ID(8) +物品ID(4) +物品數量(4)
C:100-015 <加元寶> +玩家ID(8) +實點(4) +虛點(4)
C:100-016 <設陣營值> +玩家ID(8) +陣營(4)(1魏 2蜀 3吳 4黃巾 5遊俠) +數值(4)
C:100-017 <顯示RoleCount> +玩家ID(8) +種類(4) +索引(4)
C:100-018 <設定好友好感度> +玩家ID(8) +索引(4) +數值(4)
C:100-019 <指定戰鬥> +玩家ID(8) +戰鬥編號(4)
C:100-020 <加Combo表獎勵> +玩家ID(8) +ComboPrizeID(4) +扣物品(4)
C:100-021 <客棧武將經驗> +玩家ID(8) +索引(4) +數值(4)
C:100-022 <設定RoleCount> +玩家ID(8) +索引(4) +數值(4)
C:100-023 <修改現有HP/SP> +玩家ID(8) +武將索引(4) +HP(4) +SP(4)
C:100-024 <世界BOSS獎勵測試> +玩家ID(8) +單次傷害名次(4) +累積傷害名次(4) +累積傷害(4)
C:100-025 <設定忠誠度> +玩家ID(8) +武將索引(4) +忠誠度(4)
C:100-026 <坐騎升級> +玩家ID(8) +種類(4) +等級(4)
C:100-027 <增加最大好友數量> +玩家ID(8) +數量(4)
C:100-028 <設定卡片組合等級> +玩家ID(8) +組合索引(4) +等級(4)
C:100-029 <熔爐盤面> +玩家ID(8) +商店種類(4) +獎勵類別(4)
C:100-030 <進入戰鬥> +玩家ID(8) +NPC編號(4)
C:100-031 <裝備損壞> +玩家ID(8) +武將索引(4) +裝備索引(4) +設定損壞度(4)
C:100-032 <設定九宮格> +玩家ID(8) +九宮格種類(4) +九宮格流水號(4)
C:100-033 <點擊觸發事件> +玩家ID(8) +Npc索引(4) +地塊索引(4)

C:100-60 <清空靈魂背包> +玩家ID(8)
C:100-61 <以指定數值新增靈魂(不指定填0)> +玩家ID(8) +物品ID(4) +等級(4) +星等(4) +知力(4) +攻擊力(4) +防禦力(4) +敏捷(4) +HP上升(4) +SP上升(4)+技能ID(4) +技能ID(4) +技能ID(4) +技能ID(4)

C:100-101 <賽亞人> +玩家ID(8)
C:100-102 <血魔全滿> +玩家ID(8)
C:100-103 <進戰鬥> +玩家ID(8)
C:100-104 <清物品欄> +玩家ID(8)
C:100-105 <加場景標記> +玩家ID(8)
C:100-106 <清座騎資料> +玩家ID(8)
C:100-107 <跳過新手場景> +玩家ID(8)
--]]
protocolTable[100] = {}

--[[
S:100-017 <RoleCount資料> + 數量(2) + <<+ 索引(2) + 數值(4)>>
]]--
protocolTable[100][17] = function(data)
  local count = data:ReadUInt16();
  for i = 1, count do
    local index = data:ReadUInt16();
    local value = data:ReadInt32();
    log("RoleCount: Index: "..index.." Value:  Server: "..value.." Client: "..RoleCount.Get(index));
  end
end

--[[
S:100-045: 第X回合(2)+使用行為樹的NPC數量(1)+ <<Index(1)+NPCID(2)+行為編號(2)+節點編號(4)>>
]]--
protocolTable[100][45] = function(data)
  local round = data:ReadUInt16();
  local count = data:ReadByte();
  for i = 1, count do
    local index = data:ReadByte();
    local npcId = data:ReadUInt16();
    local behaviorId = data:ReadUInt16();
    local nodeId = data:ReadInt32();
    local npcName = npcDatas[npcId].name;
    -- Log顯示: [BehaviorTree]第X回合,Index,NPCID,NPC名稱,行為編號,節點編號
    logWarn(string.Concat("[BehaviorTree]",round,",",index,",",npcId,",",npcName,",",behaviorId,",",nodeId));
  end
end

--[[
S:100-060: 結果(1) 1:成功
]]--
protocolTable[100][60] = function(data)
  local result = data:ReadByte();
  if result == 1 then
    Item.ClearBag(EThings.Soul);
    Item.ClearBag(EThings.EquippedSoul);
  end
end

--[[ SERVER清資料
]]--
protocolTable[101] = {}

--[[ 日清
S:101-001 <日清>
]]--
protocolTable[101][1] = function(data)
  Dungeon.InitAvailableDungeonDatas(); --每次次數更新紅點更新
end

--[[ 周清
S:101-002 <周清>
]]--
protocolTable[101][2] = function(data)
  Organization.WeeklyClear();
end

--[[ 月清
S:101-003 <月清>
]]--
protocolTable[101][3] = function(data)
end

--[[ 寶庫物品
C:102-001 <寶庫領物品> <<+索引(1) +數量(4)>>
C:102-002 <寶庫存物品> <<+索引(2) +數量(4)>>
]]--
protocolTable[102] = {}

--[[ 寶庫物品
S:102-001 <寶庫物品> <<+索引(1) +物品資料(18)>>
]]--
protocolTable[102][1] = function(data)
  while data.length > 0 do
    Item.SetBagItem(EThings.Storage, data:ReadByte(), ThingData.New(data), false);
  end
end

--[[ 寶庫物品
S:102-004 <寶庫物品> +索引(1) +物品資料(18)
]]--
protocolTable[102][4] = function(data)
  Item.SetBagItem(EThings.Storage, data:ReadByte(), ThingData.New(data));
end

--[[ 寶庫減少物品
S:102-005 <寶庫減少物品> +索引(1) +減少數量(4)
]]--
protocolTable[102][5] = function(data)
  Item.DelBagItem(EThings.Storage, data:ReadByte(), data:ReadInt32());
end

--[[寶庫操作失敗
S:102-007 <寶庫操作失敗> +失敗結果(1)[3.存入寶庫失敗, 13寶庫已滿]
]]--
protocolTable[102][7] = function(data)
  local kind = data:ReadByte();

  if kind == 3 then
    ShowCenterMessage(string.Get(80359));  --物品欄已滿
  elseif kind == 13 then
    ShowCenterMessage(string.Get(22856));  --寶庫已滿
  elseif kind == 14 then
    ShowCenterMessage(string.Get(22870));  --非可堆疊的物品
  end
end

--[[ 清空寶庫物品
S:102-008 <清空寶庫物品>
]]--
protocolTable[102][8] = function(data)
  Item.ClearBag(EThings.Storage)
end

----
--[[ 上拍物品
C:103-001 <上拍領物品> <<+索引(1) +數量(4)>>
C:103-002 <上拍存物品> <<+索引(1) +數量(4)>>
]]--
protocolTable[103] = {}

--[[ 上拍物品
S:103-001 <上拍物品> <<+索引(1) +物品資料(18)>>
]]--
protocolTable[103][1] = function(data)
  while data.length > 0 do
    Item.SetBagItem(EThings.Web, data:ReadByte(), ThingData.New(data), false);
  end
end

--[[ 上拍物品
S:103-004 <上拍物品品> +索引(1) +物品資料(18)
]]--
protocolTable[103][4] = function(data)
  Item.SetBagItem(EThings.Web, data:ReadByte(), ThingData.New(data));
end

--[[ 上拍減少物品
S:103-005 <上拍減少物品> +索引(1) +減少數量(4)
]]--
protocolTable[103][5] = function(data)
  Item.DelBagItem(EThings.Web, data:ReadByte(), data:ReadInt32());
end

--[[上拍操作失敗
S:103-007 <上拍操作失敗> +失敗結果(1)[3.存入上拍失敗, 13上拍已滿]
]]--
protocolTable[103][7] = function(data)
  local kind = data:ReadByte();
  
  if kind == 3 then
    ShowCenterMessage(string.Get(80359));  --物品欄已滿
  elseif kind == 13 then
    ShowCenterMessage("upload item is full");  --上拍已滿
  elseif kind == 14 then
    ShowCenterMessage(string.Get(22870));  --非可堆疊的物品
  end
end

--[[ 清空上拍物品
S:103-008 <清上拍庫物品>
]]--
protocolTable[103][8] = function(data)
  Item.ClearBag(EThings.Web)
end

--[[
C:105-001 <要求玩家個人資料> +玩家ID(8)
C:105-002 <設定玩家資料> +設定類型(1)
                        1.個性簽名 +字串長度(1) +字串(?)
                        2.自訂印象 +字串長度(1) +字串(?)
                        3.喜好 +字串長度(1) +字串(?)
                        4.星座 +星座編號(1)
                        5.生日 +月(1) +日(1)
                        6.居住地 +字串長度(1) +字串(?)
                        7.興趣 +字串長度(1) +字串(?)
C:105-003 <送禮> +對象ID(4) +禮物ID(2) +數量(2) +kind(1)
C:105-004 <要求排行榜資料> +kind(1)
C:105-005 <要求魅力值獎勵領獎> +獎勵累計值(4)
C:105-006 <要求贈禮人回饋領獎> +獎勵累計值(4)
C:105-008 <要求歷史禮物總量> +玩家ID(8)
C:105-009 <要求送禮紀錄> +玩家ID(8)
]]--
protocolTable[105] = {}

--[[
S:105-001 <傳送玩家個人資訊> +玩家ID(8) +結婚狀態(1) +星座(1) +出生月(1) +出生日(1) +魅力值(8) +個性簽名長度(1) +個性簽名(?) +自訂印象長度(1) +自訂印象(?) +喜好字串長度(1) +喜好(?) +居住地字串長度(1) +居住地(?) +興趣字串長度(1) +興趣(?)
                          +數量(1) +好友資料紀錄<<玩家ID(8) +玩家名字長度(1) +玩家名字(?) +好感度(4)>>
]]--
protocolTable[105][1] = function(data)
  HouseBoard.SetProfileAndFriendData(data);
end

--[[
S:105-002 <設定資訊> +結果(1)
]]--
protocolTable[105][2] = function(data)
  local result = data:ReadByte();

  UIHouseBoard.RefreshProfileData(result);
end

--[[
S:105-003 <贈與禮物處理結果> +結果(1)
                           1 贈送成功
                           8 無資料
                           9 達每日消費上限
                           14 未一轉
]]--
protocolTable[105][3] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    UISouvenirShop.SendSuccess();
  elseif result == 8 then
    ShowCenterMessage(string.Get(10132));
  elseif result == 9 then
    ShowCenterMessage(string.Get(23554));
  elseif result == 14 then
    ShowCenterMessage(string.Get(40106));
  else
    ShowCenterMessage(string.Get(23415));
  end
end

--[[
S:105-004 <回傳排行榜資料> 種類(1) +玩家排名(2) +玩家分數(4)
                        +數量(2) +<<UID(8) +玩家名字長度(1) +玩家名字(?) +玩家等級(1) +轉升等級(1) +三轉屬性(1) +屬性(1) +職業(1) +時間(8) +分數(4)>>
]]--
protocolTable[105][4] = function(data)
  local kind = data:ReadByte();
  local playerRank = data:ReadInt16();
  local playerScore = data:ReadInt32();
  local count = data:ReadByte();

  local rankInfos = {};

  for i = 1, count do
    rankInfos[i] = {};
    rankInfos[i].roleId = data:ReadInt64();
    rankInfos[i].name = data:ReadString(data:ReadByte());
    rankInfos[i].level = data:ReadByte();
    rankInfos[i].turn = data:ReadByte();
    rankInfos[i].turn3Info = {};
    rankInfos[i].turn3Info.element = data:ReadByte();
    rankInfos[i].element = data:ReadByte();
    rankInfos[i].career = data:ReadByte();
    rankInfos[i].time = data:ReadDouble();
    rankInfos[i].scoreInfo = data:ReadInt32();
  end

  if UI.IsVisible(UIHouseBoardFunction) then
    UIHouseBoardFunction.UpdateRank(kind, playerRank, playerScore, rankInfos);
  end
end

--[[
S:105-005 <要求魅力值獎勵領獎> +結果(1)
                            1 領取成功
                            2 資料不存在
                            3 已領取
                            4 魅力值不足
                            5 背包已滿
                            7 未一轉
]]--
protocolTable[105][5] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    UICharmFeedback.UpdateCharmFeedback();
  elseif result == 2 then
    ShowCenterMessage(string.Get(21528));
  elseif result == 3 then
    ShowCenterMessage(string.Get(98017));
  elseif result == 4 then
    logError(string.Get(23553));
  elseif result == 5 then
    ShowCenterMessage(string.Get(23621));
    UICharmFeedback.UpdateCharmFeedback();
  elseif result == 7 then
    ShowCenterMessage(string.Get(40106));
  end
end

--[[
S:105-006 <要求贈禮人回饋領獎> +結果(1)
                            1 領取成功
                            2 資料不存在
                            3 已領取
                            4 經驗值不足
                            5 背包已滿
                            7 未一轉
                            9 活動時間結束
]]--
protocolTable[105][6] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    UICharmFeedback.UpdateGiftFeedback();
  elseif result == 2 then
    ShowCenterMessage(string.Get(21528));
  elseif result == 3 then
    ShowCenterMessage(string.Get(98017));
  elseif result == 4 then
    logError(string.Get(23552));
  elseif result == 5 then
    ShowCenterMessage(string.Get(23621));
    UICharmFeedback.UpdateGiftFeedback();
  elseif result == 7 then
    ShowCenterMessage(string.Get(40106));
  elseif result == 9 then
    ShowCenterMessage(string.Get(20377));
  end
end

--[[
S:105-008 <歷史禮物總量> +資料筆數(1) <<玩家名字長度(1) +玩家名字(?) +禮物ID(2) +數量(4)>>
]]--
protocolTable[105][8] = function(data)
  HouseBoard.SetGiftWallData(data);
end

--[[
S:105-009 <送禮紀錄> +數量(1) <<玩家ID(8) +玩家名字長度(1) +玩家名字(?) +禮物ID(2) +數量(2) +時間(8)>>
]]--
protocolTable[105][9] = function(data)
  HouseBoard.SetReceiveData(data);
end

--[[
S:105-010 <被贈與禮物> +UID(8) +玩家名字長度(1) +玩家名字(?) +禮物ID(2) +數量(1) +時間(8)
]]--
protocolTable[105][10] = function(data)
  HouseBoard.AddReceiveData(data);
end


--[[
C:106-001 <要求房屋資料> +玩家ID(8) +房屋編號(1) +樓層(1)
C:106-002 <進入小屋> +玩家ID(8) +房屋編號(1) +樓層(1)
C:106-003 <設定武將> +<<武將ID(2)>>*4 +小屋編號(1) +樓層(1)
C:106-004 <小屋擴建>
C:106-005 <設定小屋資料> +名稱字串長度(1) +名稱(?) +簽名字串長度(1) +簽名(?)
C:106-006 <小屋家具> +房屋編號(1) +樓層(1) +家具數量(4) +家具資料<<家具ID(2) +家具座標X(1) +家具座標Y(1) +家具座標Z(1) +家具方向(1)>>
C:106-007 <要求小屋分數資料>
C:106-008 <要求玩家背包家具資料>
C:106-009 <小屋玩家瞬移> +房間主人ID(8) +房屋編號(1) +樓層(1) +玩家ID(8) +座標X(2) +座標Y(2)
C:106-010 <家具互動> 房間主人ID(1) +房屋編號(1) +樓層(1) +玩家ID(8) +家具座標X(1) +家具座標Y(1) +家具座標Z(1) +家具類型(1) +是否互動(1)
C:106-011 <領取轉蛋卷> +房屋主人ID(8) +kind(1) +房屋編號(1) +樓層(1)
C:106-012 <離開小屋>
C:106-013 <小屋總等級> +小屋總等級(1)
--]]
protocolTable[106] = {}

--[[
S:106-001 <小屋場景資料> +玩家ID(8) +房屋編號(1) +樓層(1) +房屋名稱長度(1) +房屋名稱(?) +小屋簽名長度(1) +小屋簽名(?) +房屋擴建等級(1) +一般扭蛋卷可否領取(1) +高級扭蛋卷可否領取(1)
                         +<<進駐武將ID(2)>> * 4 +家具數量(4) + 家具資料<<家具ID(4) +家具座標X(1) +家具座標Y(1) +家具座標Z(1) +家具方向(1)>>
--]]
protocolTable[106][1] = function(data)
  local houseOwnerId = data:ReadInt64();
  local house = data:ReadByte();
  local floor = data:ReadByte();
  local houseName = data:ReadString(data:ReadByte());
  local houseSign = data:ReadString(data:ReadByte());
  local houseLevel = data:ReadByte();
  local normalWelfare = data:ReadByte();
  local advanceWelfare = data:ReadByte();
  local houseWarriors = {};

  for i = 1, 4 do
    houseWarriors[i] = data:ReadUInt16();
  end

  local furnitureCount = data:ReadInt32();
  local furnitureData = {};

  if furnitureCount > 0 then
    for i = 1, furnitureCount do
      furnitureData[i] = {};
      furnitureData[i].Id = data:ReadUInt16();
      furnitureData[i].blockX = data:ReadByte();
      furnitureData[i].blockY = data:ReadByte();
      furnitureData[i].blockZ = data:ReadByte();
      furnitureData[i].direction = data:ReadByte();
    end
  end

  HouseManager.SetHouseOwnerId(houseOwnerId);
  HouseManager.SetCurrentHouseAndFloor(house, floor);
  UIHouseSetting.SetHouseInfo(houseName, houseSign);
  HouseManager.SetTotalLevel(houseLevel);
  UIHouseFunction.ReceiveWelfareData(normalWelfare, EHouseWelfare.Normal);
  UIHouseFunction.ReceiveWelfareData(advanceWelfare, EHouseWelfare.Advanced);
  WarriorInHouse.ReceiveHouseWarrior(houseWarriors);
  FurnitureManager.ReceiveFurnitureData(furnitureData);
  HouseManager.ReceiveHouseInfo(houseName);
end

--[[
S:106-002 <進入小屋結果> +結果(1) +房屋編號(1) +樓層(1)
          1:成功
          2:失敗
          3:房間人數過多
          9:請先離開副本房間
          10:已經有隊伍不得進入
--]]
protocolTable[106][2] = function(data)
  local result = data:ReadByte();
  local house = data:ReadByte();
  local floor = data:ReadByte();

  logError(" result : " .. result);
  if result == 1 then
    HouseManager.SetCurrentHouseAndFloor(house, floor);
    HouseManager.ReceiveEnterHouse();
    HouseManager.SetIsInHouse(true);
  elseif result == 2 then
    ShowCenterMessage(string.Get(23604));
  elseif result == 3 then
    ShowCenterMessage(string.Get(23605));
  elseif result == 9 then
    ShowCenterMessage(string.Get(21243));
  elseif result == 10 then
    ShowCenterMessage(string.Get(10316));
  elseif result == 11 then
    ShowCenterMessage(string.Get(24119));
  end
end

--[[
S:106-003 <設定武將結果> +結果(1)
          1:成功
          2:失敗
          5:小屋分數不足
--]]
protocolTable[106][3] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    if UI.IsVisible(UIHouseSettingFunction) then
      UI.Close(UIHouseSettingFunction);
    end
  else
    ShowCenterMessage(string.Get(23606));
    WarriorInHouse.SetPreNpcData();
  end
end

--[[
S:106-004 <小屋擴建結果> +結果(1)
          1:成功
          2:失敗
--]]
protocolTable[106][4] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    HouseManager.SendAskHouseTotalLevel();
  else
    ShowCenterMessage(string.Get(23607));
  end
end

--[[
S:106-005 <設定小屋資料> +結果(1)
          1:成功
          2:失敗
--]]
protocolTable[106][5] = function(data)
  local result = data:ReadByte();
  UIHouseSetting.UpdateHouseInfo(result);
end

--[[
S:106-006 <設定小屋家具> +結果(1)
          1:成功
          2:失敗
          4:家具數量超過上限
          7:擺放傢俱數量大於身上有的傢俱
--]]
protocolTable[106][6] = function(data)
  local result = data:ReadByte();
  
  if result ~= 1 then
    ShowCenterMessage(string.Get(23603));
    --重新跟S要家具資料，更新放置失敗的家具
    HouseManager.SendAskFurnitureData(HouseManager.GetHouseOwnerId());
  end

  HouseEditorManager.Close();
end

--[[
S:106-007 <小屋分數資料> +小屋數量(1) + <<小屋編號(1) +樓層(1) +分數(2) +<<小屋武將ID(2)>> * 4>>
--]]
protocolTable[106][7] = function(data)
  local count = data:ReadByte();
  for i = 1, count do
    local house = data:ReadByte();
    local floor = data:ReadByte();
    local score = data:ReadUInt16();
    HouseManager.SetFloorScore(house, floor, score);
    WarriorInHouse.SetNpcData(house, floor, data);
  end

  WarriorInHouse.GetSortedCombination();

  if UIHouseSetting.HasSendRequest() then
    UI.Open(UIHouseSetting);
  end
end

--[[
S:106-008 <小屋背包家具> +家具數量(4) +家具資料 <<家具ID(2) +家具總數量(1) +家具使用數量(1)>>
--]]
protocolTable[106][8] = function(data)
  local furnitureCount = data:ReadUInt32();
  local furniture = {};
  FurnitureManager.ClearFurnituresInBag();

  if furnitureCount > 0 then
    for i = 1, furnitureCount do
      local id = data:ReadUInt16();
      local totalCount = data:ReadByte();
      local sceneCount = data:ReadByte();
      furniture[id] = totalCount;
      FurnitureManager.SetFurnitureAmount(id, totalCount - sceneCount);
    end
    FurnitureManager.SetAllFurnituresTable(furniture);
  end

  if UI.IsVisible(UIHouseFunction) then
    UIHouseFunction.CheckRedDot();
  end
end

--[[
S:106-009 <小屋玩家瞬移> +玩家ID(8) +座標X(2) +座標Y(2)
--]]
protocolTable[106][9] = function(data)
  local roleId = data:ReadInt64();
  local x = data:ReadUInt16();
  local y = data:ReadUInt16();
  local position = Vector2.New(x, y);
  if Role.players[roleId] == nil then return end
  Role.players[roleId]:Teleport(position, true, true);
  --收到有玩家傳送，強制檢查一次
  FurnitureManager.CheckAllFurnituresInteractive();
end

--[[
S:106-010 <小屋家具互動> +玩家ID(8) +家具座標X(1) +家具座標Y(1) +家具座標Z(1) +家具類型(1) +是否互動(1)
--]]
protocolTable[106][10] = function(data)
  local id = data:ReadInt64();
  local x = data:ReadUInt16();
  local y = data:ReadUInt16();
  local z = data:ReadUInt16();
  local kindType = data:ReadByte();
  local interactive = data:ReadBoolean();
  FurnitureManager.ReceiveFurnitureInteractive(id, x, y, z ,kindType, interactive);
end

--[[
S:106-011 <領取轉蛋卷> +結果(1)
          0:失敗
          1:成功
          5:當日領取達上限
--]]
protocolTable[106][11] = function(data)
  local result = data:ReadByte();

  if result == 5 then
    ShowCenterMessage(string.Get(23620));
  elseif result ~= 1 then
    ShowCenterMessage(string.Get(23614));
  end

  UIHouseFunction.ReceiveResult();
end

--[[
S:106-012 <離開場景> +結果(1)
          0:失敗
          1:成功
--]]
protocolTable[106][12] = function(data)
  local result = data:ReadByte();
  if result == 1 then
    HouseManager.SetIsInHouse(false);
  else
    ShowCenterMessage(string.Get(23610));
  end
end

--[[
S:106-013 <小屋總等級> +結果(1) +小屋總等級(1)
          0:失敗
          1:成功
--]]
protocolTable[106][13] = function(data)
  local result = data:ReadByte();
  local houseLevel = data:ReadByte();

  if result == 1 then
    HouseManager.SetTotalLevel(houseLevel);
  end
end

--[[
S:106-014 <玩家訪問好友小屋狀態> +數量(4) + <<UID(8)>>
--]]
protocolTable[106][14] = function(data)
  local count = data:ReadInt32();
  Social.ClearVisitedFriendsTable();

  if count > 0 then
    for i = 1, count do
      local playerId = data:ReadInt64();
      Social.AddVisitedFriends(playerId);
    end
  end
end

--[[ 小精靈
C:107-002<編制取消出戰> +小精靈no(2)
C:107-003<取消出戰> +小精靈no(2)
C:107-004<餵食> +小精靈no(2) +bagIndex(1) +數量(2)
C:107-005 <查詢所有小精靈資料>
]]--

protocolTable[107] = {}

--[[
S:107-001<新增(獲得)小精靈> +小精靈no(2)
--]]
protocolTable[107][1] = function(data)
  local elfId = data:ReadUInt16();
  if elfDatas[elfId] ~= nil then
    ShowCenterMessage(string.Concat(string.Get(30034), string.Get(elfDatas[elfId].name)));
  end
end

--[[
S:107-002<編制出戰> +小精靈no(2) +結果(1) 1:成功
--]]
protocolTable[107][2] = function(data)
  UIElf.RecElfTeam(data);
end

--[[
S:107-003<取消出戰> +小精靈no(2) +結果(1) 1:成功
--]]
protocolTable[107][3] = function(data)
  UIElf.RecElfUnTeam(data);
end

--[[
S:107-004 <餵食>  +小精靈no(2) +結果(1)  1:成功
--]]
protocolTable[107][4] = function(data)
  local result = data:ReadByte();
  if result == 1 then
    ShowCenterMessage(string.Get(23761));
    UIElf.RefreshElf();
  end
end

--[[
S:107-005 <查詢所有小精靈資料> +出戰的小精靈id(2) +餵食量(4)  +數量(1) <<+小精靈no(2) +lv(2) +Exp(4)>>
--]]
protocolTable[107][5] = function(data)
  UIElf.RecElfSave(data);
end

--[[
S:107-006 <更新小精靈資料> +小精靈no(2) +lv(2) +Exp(4)
--]]
protocolTable[107][6] = function(data)
  UIElf.UpdateElfSave(data);
end

--[[ 神話裝相關
C:108-001 <神話裝升級> 背包索引(2) +L(1) +<<背包索引(2))>>
C:108-002 <神話裝裝符文> 背包索引(2) + 背包索引(2)
C:108-003 <神話裝重置> 背包索引(2) + 背包索引(2)
--]]

protocolTable[108] = {}

--[[
S:108-001<神話裝升級> +結果(1)
--]]
protocolTable[108][1] = function(data)
  UIGodskin.RecUpgradeResult(data);
end

--[[
S:108-002<神話裝符文> +結果(1)
                          1:成功 +神話裝背包索引(2) +符文背包索引(2) +子屬性*4
                          2:符文星級高於物品
                          3:錢不夠
                          4:找不到對應提升的子屬性
--]]
protocolTable[108][2] = function(data)
  UIGodskin.RecEnchantResult(data);
end

--[[
S:108-003<神話裝重製> +結果(1)
                          1:成功 +神話裝背包索引(2) +子屬性*4
                          2:槌子的星級不足
                          3:槌子數量不足
--]]
protocolTable[108][3] = function(data)
  UIGodskin.RecRemakeResult(data);
end

--[[ Web市場相關
C:109-000 <詢問可上傳格數>
C:109-001 <詢問拍賣資訊>
C:109-002 <物品封存至Web> 數量(1)<<+種類(1)+Data(?)>>
C:109-003 <領取web物品> 拍賣SN(8) --寄0為全部領取
--]]

protocolTable[109] = {}
--[[
S:109-000 <更新可上傳格數> 結果(1) +數量(4)
結果 1: 成功
結果 2: 失敗(等待web)
結果 252: 失敗(網頁被鎖)
結果 253: 失敗(功能未開放 or 自創帳號無法使用市集)
結果 255: 傳送太頻繁
--]]
protocolTable[109][0] = function(data)
  local result = data:ReadByte();
  if result == 1 then
    local limit = data:ReadInt32();
    Market.UpdateWebSlotLimit(limit)
  elseif result == 2 then
    logError("Waiting for web response")
  elseif result == 252 then
    ShowCenterMessage(string.Get(23969));
    if UI.IsVisible(UIMarket) and not UI.IsVisible(UITeach) then
      UI.Close(UIMarket);
    end
    return;
  elseif result == 253 then
    ShowCenterMessage(string.Get(71336));
    if UI.IsVisible(UIMarket) and not UI.IsVisible(UITeach) then
      UI.Close(UIMarket);
    end
    return;
  elseif result == 255 then
    logError("Sending request too frequently")
    local refrshCountTime = 5; --詢問上傳數量太頻繁重新顯示數字時間;
    CGTimer.DoFunctionDelay(refrshCountTime, function() Market.UpdateWebSlotLimit(nil) end);
  else
    logError("109-0 out of known result : ".. tostring(result))
  end
  
  if UI.IsVisible(UIMarket) then
    UIMarket.UpdateUI(true);
  else
    UI.Open(UIMarket);
  end
end

--[[
S:109-001 <詢問拍賣資訊> 結果(1) +數量(1)<<種類(1)+拍賣SN(8)+Data(?)>>
結果 0: 失敗
結果 1: 成功
結果 252: 失敗(網頁被鎖)
結果 253: 失敗(功能未開放 or 自創帳號無法使用市集)
結果 254: 等待Web回應
結果 255: 傳送太頻繁
種類 1: NFT幣&點數 +NFT幣(4) +點數(4)
種類 2: 背包物品 +背包物品資料(?)
種類 3: 靈魂 +靈魂資料(?)
種類 4: NPC +NPC資料(?)
--]]
protocolTable[109][1] = function(data)
  local result = data:ReadByte();
  if result == 1 then
    Market.ClearWithdraw();
    local count = data:ReadByte();
    local tsGold;
    local kind;
    local webSN;
    local bagCount;
    local itemSave;
    local npcData;
    for i = 1, count do
      kind = data:ReadByte();
      webSN = data:ReadInt64();
      if kind == EWebMarketKind.Currency then
        tsGold = data:ReadInt32();
        Market.SetGold(tsGold)
    
      elseif kind == EWebMarketKind.BagItem then
        itemSave = ThingData.New(data)
        UIMarket.SetWithdrawCategory(kind, itemSave);
        itemSave.webSN = webSN;
        bagCount = Item.GetBagCount(EThings.Web);
        Item.SetBagItem(EThings.Web, bagCount + 1, itemSave, false);
    
      elseif kind == EWebMarketKind.Soul then
        UIMarket.SetWithdrawCategory(kind);
        itemSave = SoulThing.New(data);
        itemSave.webSN = webSN;
        bagCount = Item.GetBagCount(EThings.Web);
        Item.SetBagItem(EThings.Web, bagCount + 1, itemSave, false);
    
      elseif kind == EWebMarketKind.Npc then
        npcData = NpcWebInfo.New(data);
        npcData.webSN = webSN;
        UIMarket.SetWithdrawCategory(kind);
        Market.ReceiveWebNpcData(npcData);
        
      else
        logError("109-1 out of known kind : ".. tostring(kind))
      end
    end
    
    if UI.IsVisible(UIMarket) then
      UIMarket.UpdateUI(true);
    end

  elseif result == 252 then
    ShowCenterMessage(string.Get(23969));
    if UI.IsVisible(UIMarket) and not UI.IsVisible(UITeach) then
      UI.Close(UIMarket);
    end
    return;
  elseif result == 253 then
    if UI.IsVisible(UIMarket) and not UI.IsVisible(UITeach) then
      UI.Close(UIMarket);
    end
  elseif result == 255 then
    logError("Sending request too frequently")
  else
    logError("109-1 out of known result : ".. tostring(result))
  end
end

--[[
S:109-002 <物品封存至Web> +結果(1) <<+失敗在第幾筆(1)>>
結果 1: 成功
結果 2: 失敗(已滿最大封存數量)
結果 3: 失敗(物品錯誤) +失敗在第幾筆(1)
結果 4: 失敗(金額錯誤 or 還在處理上筆金額)
結果 5: 失敗(Rolecount不夠)
結果 252: 失敗(網頁被鎖)
結果 253: 失敗(功能未開放 or 自創帳號無法使用市集)
結果 254: 等待Web回應
結果 255: 傳送太頻繁
--]]
protocolTable[109][2] = function(data)
  local result = data:ReadByte();
  if result == 1 then
    Market.UploadSuccess();
  elseif result == 2 then
    if UI.IsVisible(UIMarket) then
      UIMarket.OpenWarning(string.Get(23733), string.GetColorText(string.Get(23734), Color.Red));
    end
  elseif result == 3 then
    local failIndex = data:ReadByte();
    Market.UploadFail(failIndex);
  elseif result == 4 then
    if UI.IsVisible(UIMarket) then
      UIMarket.OpenWarning(string.Get(23902), string.GetColorText(string.Get(23903), Color.Red));
    end
  elseif result == 5 then
    if UI.IsVisible(UIMarket) then
      UIMarket.OpenWarning(string.Get(23899), string.GetColorText(string.Get(23884), Color.Red));
    end
  elseif result == 252 then
    ShowCenterMessage(string.Get(23969));
    if UI.IsVisible(UIMarket) and not UI.IsVisible(UITeach) then
      UI.Close(UIMarket);
    end
    return;
  elseif result == 253 then
    if UI.IsVisible(UIMarket) and not UI.IsVisible(UITeach)then
      UI.Close(UIMarket);
    end
  elseif result == 254 then
    if UI.IsVisible(UIMarket) then
      UIMarket.OpenWarning(string.Get(23727), string.GetColorText(string.Get(23751), Color.Red));
    end
  elseif result == 255 then
    if UI.IsVisible(UIMarket) then
      UIMarket.OpenWarning(string.Get(23727), string.GetColorText(string.Get(23728), Color.Red));
    end
  else
    logError("109-2 out of known result : ".. tostring(result))
  end
end

--[[
S:109-003 <從Web領取物品> +結果(1)
結果 1: 成功
結果 2: 失敗
結果 3: 失敗(背包已滿)
結果 4: 失敗(重複NPC)
結果 252: 失敗(網頁被鎖)
結果 253: 失敗(功能未開放 or 自創帳號無法使用市集)
結果 255: 傳送太頻繁
--]]
protocolTable[109][3] = function(data)
  local result = data:ReadByte();
  
  if result == 1 then
    if UI.IsVisible(UIMarket) then
      UIMarket.OpenWarning(string.Get(23731),string.GetColorText(string.Get(23732), Color.Red));
    end
  elseif result == 252 then
    ShowCenterMessage(string.Get(23969));
    if UI.IsVisible(UIMarket) and not UI.IsVisible(UITeach) then
      UI.Close(UIMarket);
    end
    return;
  elseif result == 253 then
    if UI.IsVisible(UIMarket) and not UI.IsVisible(UITeach) then
      UI.Close(UIMarket);
    end
  elseif result == 255 then
    logError("Sending request too frequently")
  else
    if UI.IsVisible(UIMarket) then
      UIMarket.OpenWarning(string.Get(23725),string.GetColorText(string.Get(23726), Color.Red));
    end
  end
end
--[[鎮魂&祭祀
C:111-000 <確認功能開啟>
C:111-002 <刷新Boss> Boss位置(1)
C:111-004 <鎮魂> Boss位置(1)
C:111-005 <祭祀> 倍率/消耗(1) + 數量(1)
]]
protocolTable[111] = {}

--[[
S:111-000 <鎮魂功能開關> +功能開關(1) [0:關 1:開]
]]--
protocolTable[111][0] = function(data)
  local switch = data:ReadBoolean();
  Requiem.ReceiveOpenUIResult(switch);
end

--[[
S:111-001 <刷新鎮魂Boss> +數量(1) <<位置(1) + ID(2)>>
]]
protocolTable[111][1] = function(data)
  local count = data:ReadByte();

  for i = 1, count do
    local slot = data:ReadByte();
    local id = data:ReadUInt16();
    Requiem.ReceiveBoss(slot, id);
  end
  UIRequiem.UpdateBossInfo();
  Requiem.UpdateRedDot();
end

--[[
S:111-002 <刷新結果> 種類(1)
              1:成功
              2:魂點不足
              3:不可刷新
              4:位置錯誤
              255:功能關閉
]]
protocolTable[111][2] = function(data)
  local result = data:ReadByte();
  Requiem.ReceiveRefreshBossResult(result);
end

--[[
S:111-003 <更新魂點> 魂點(2)
]]
protocolTable[111][3] = function(data)
  Requiem.UpdateSoulPoints(data:ReadUInt16());
end

--[[
S:111-004 <鎮魂結果> 種類(1)
                    0: 未知錯誤
                    1: 成功
                    2: 等級不夠
                    3: 未出戰武將
                    4: 組隊中
                    5: 背包滿
                    6: 該地圖無法挑戰
                    7: 沒有Boss存在
                    8: 戰鬥中
                    255:功能關閉
]]

protocolTable[111][4] = function(data)
  local result = data:ReadByte();
  Requiem.ReceiveRequiemResult(result);
end

--[[
S:111-005 <祭祀結果> 種類(1)
	                1:成功
	                2:祭祀次數不足
	                3:背包滿
	                4:倍率錯誤
	                255:功能關閉
]]
protocolTable[111][5] = function(data)
  local result = data:ReadByte();
  Requiem.ReceiveSacrificeResult(result);
end

--[[  靈魂
C:120-001 <裝備靈魂> Kind(1) + 武將ID(2) + 跟隨武將索引(1) + SN(8) Kind=1.裝備 2.卸下
C:120-002 <合成靈魂> SN1(8) + SN2(8) + SN3(8)
C:120-003 <強化靈魂> 使用次數(1) + SN(8)
C:120-004 <突破靈魂> 主靈魂SN(8) + 材料SN(8)
C:120-005 <技能等級靈魂> 主靈魂SN(8) + 材料SN(8)
C:120-006 <洗鋉靈魂> Kind(1) +
                            1.洗鋉數值 + SN(8)
                            2.確定洗鍊 + SN(8)
C:120-007 <鎖頭> Lock(1) + SN(8) Lock = 0不鎖 1.鎖
C:120-008 <靈魂背包>
C:120-009 <刪除靈魂背包>
C:120-010 送它去挖礦 +SoulSN(8);
]]--
protocolTable[120] = {}

--[[
S:120-001 <裝備> + Kind(1) + WID(2) + SN(8)
                  1.裝備
                  2.卸下
]]--
protocolTable[120][1] = function(data)
  local kind = data:ReadByte();
  local npcId = data:ReadUInt16();
  local sn = data:ReadInt64();

  if kind == 1 then
    UISoul.ReceiveEquip(npcId, sn);
  elseif kind == 2 then
    UISoul.ReceiveTakeOff(npcId, sn);
  end
end

--[[
S:120-002 <合成> + rSoul(?)
]]--
protocolTable[120][2] = function(data)
  local soulData = SoulThing.New(data);
  UISoul.ReceiveCompound(soulData);
end

--[[
S:120-003 <強化> + rSoul(?)
]]--
protocolTable[120][3] = function(data)
  local soulData = SoulThing.New(data);
  UISoul.ReceiveIntensify(soulData);
end

--[[
S:120-004 <突破> + SN(8) + 星數(1)
]]--
protocolTable[120][4] = function(data)
  local sn = data:ReadInt64();
  local starLv = data:ReadByte();

  UISoul.ReceiveBreakThrough(sn, starLv);
end

--[[
S:120-005 <技能等級> + rSoul(?)
]]--
protocolTable[120][5] = function(data)
  local soulData = SoulThing.New(data);
  UISoul.ReceiveSkillLv(soulData);
end

--[[
S:120-006 <洗鋉> + Kind(1) + SN(8) + SoulValues(?)
                1.洗鋉數值
                2.確定洗鍊
                3.保留
]]--
protocolTable[120][6] = function(data)
  local kind = data:ReadByte();

  if kind == 3 then
    UISoul.UpdateStayAff();
    return;
  end

  local sn = data:ReadInt64();
  local temp = {};

  for i = 1, 6 do
    temp[i] = data:ReadUInt16();
  end

  UISoul.ReceiveAffination(kind, sn, temp);
end

--[[
S:120-007 <鎖頭> + Flag(1) + SN(8)
]]--
protocolTable[120][7] = function(data)
  local kind = data:ReadByte();
  local sn = data:ReadInt64();

  UISoulInfo.SetLock(kind, sn);
end

--[[
S:120-008 <靈魂背包> + Count(1) + <<rSoul(?)>> + 結果(1)
                                                1.登入
                                                2.鈕蛋
                                                3.信件
                                                4.金手指
                                                5.Web取商品
]]--
protocolTable[120][8] = function(data)
  local count = data:ReadByte();
  local soulList = {};

  for i = 1, count do
    local soulData = SoulThing.New(data);

    table.insert(soulList, soulData);
  end

  local result = data:ReadByte();
  local equipIndex = 1;
  local soulIndex = 1;

  for i = 1, count do
    if result == 1 then
      if soulList[i].equipId ~= 0 then
        Item.SetBagItem(EThings.EquippedSoul, equipIndex, soulList[i], false);
        equipIndex = equipIndex + 1;
      else
        Item.SetBagItem(EThings.Soul, soulIndex, soulList[i], false);
        soulIndex = soulIndex + 1;
      end
    else
      local index = 1;

      while Item.GetBagItem(EThings.Soul, index) ~= nil do
        index = index + 1;
      end

      Item.SetBagItem(EThings.Soul, index, soulList[i], false);

      local message = string.format(string.Get(21179), itemDatas[soulList[i].Id]:GetName(true), 1);
      ShowCenterMessage(message);
      Chat.AddMessage(EChannel.System, message);

      if UI.IsVisible(UISoul) then
        UISoul.UpdateUI();
      end
    end
  end
end

--[[
S:120-009 <刪除靈魂背包> + Count(1) + <<SN(8)>> + 來源(1)
                                                17.Web封存物品
]]--
protocolTable[120][9] = function(data)
  local count = data:ReadByte();
  local bag = Item.GetBag(EThings.Soul);
  for i = 1, count do
    local sn = data:ReadInt64();
    for k, v in pairs(bag) do
      if v.sn == sn then
        Item.DelBagItem(EThings.Soul, k, nil, 0, false);
      end
    end
  end
  
  local result = data:ReadByte();
  
  if result == 17 then -- Web封存刪靈魂
  end
end

--[[
S:120-255 <錯誤訊息> + 結果(1)
                     1.無此玩家
                     2.無此靈魂
                     3.靈魂上鎖
                     4.挖礦中
                     5.洗鍊中不能使用
                     6.已達裝備上限
                     7.武將ID錯誤
                     8.武將有裝備靈魂
                     9.裝備/卸下錯誤
                     10.元素不同
                     11.靈魂編號錯誤
                     12.無此武將
                     13.靈魂材料重覆
                     14.靈魂品質不同
                     15.刪除失敗
                     16.次數有誤
                     17.超過等級上限
                     18.物品不足
                     19.吞食幣不足
                     20.靈魂編號不同
                     21.靈魂等級達上限
                     22.無相同技能
                     23.無洗鍊SN
                     24.跟之前洗鍊SN不同
                     25.無此功能
                     26.戰鬥中
                     255.錯誤
]]--
protocolTable[120][255] = function(data)
  local result = data:ReadByte();

  if result == 1 then
    logError("無此靈魂")
  elseif result == 2 then
    logError("無此靈魂")
  elseif result == 3 then
    ShowCenterMessage(string.Get(23712));
  elseif result == 4 then
    logError("挖礦中")
  elseif result == 5 then
    logError("洗鍊中不能使用")
  elseif result == 6 then
    logError("已達裝備上限")
  elseif result == 7 then
    logError("武將ID錯誤")
  elseif result == 8 then
    logError("武將有裝備靈魂")
  elseif result == 9 then
    logError("裝備/卸下錯誤")
  elseif result == 10 then
    logError("元素不同")
  elseif result == 11 then
    logError("靈魂編號錯誤")
  elseif result == 12 then
    logError("無此武將")
  elseif result == 13 then
    logError("靈魂材料重覆")
  elseif result == 14 then
    logError("靈魂品質不同")
  elseif result == 15 then
    logError("刪除失敗")
  elseif result == 16 then
    logError("次數有誤")
  elseif result == 17 then
    logError("超過等級上限")
  elseif result == 18 then
    logError("物品不足")
  elseif result == 19 then
    ShowCenterMessage(string.Get(23686));
  elseif result == 20 then
    logError("靈魂編號不同")
  elseif result == 21 then
    ShowCenterMessage(string.Get(20582));
  elseif result == 22 then
    logError("無相同技能")
  elseif result == 23 then
    logError("無洗鍊SN")
  elseif result == 24 then
    logError("跟之前洗鍊SN不同")
  elseif result == 25 then
    ShowCenterMessage(string.Get(71336));
  elseif result == 26 then
    ShowCenterMessage(string.Get(21806));
  elseif result == 255 then
    logError("Error");
  end
end


--[[ 挖礦場
C:170-001 <礦場資訊> +礦場編號(1)
C:170-002 <進礦場> +礦場編號(1)
C:170-010 <填充礦機耐久> +背包索引(2) +ItemID(2) +使用數量(1) +礦機Indx(1)
C:170-011 <設定挖礦狀態> +礦場編號(1)
]]--
protocolTable[170] = {}

--[[
S:170-001 礦場資訊  +res(1) +礦場編號(1)+總剩餘礦量(8)+最後設定的時間(8)+<<礦機資訊(?)>>*4 +已達今日上限(1)
]]--
protocolTable[170][1] = function(data)
  local res = data:ReadByte();
  if res == 1 then
    UI.Open(UIMine);
    local type = data:ReadByte();
    local lastMining = data:ReadInt64();
    local setTime = data:ReadDouble();

    local machinesData = {};

    for i = 4, 1, -1 do
      machinesData[i] = {};
      machinesData[i].full = data:ReadUInt16();
      machinesData[i].skin = data:ReadUInt16();
    end

    local dateLimit = data:ReadByte();

    if dateLimit == 1 then
      dateLimit = true;
    elseif dateLimit == 0 then
      dateLimit = false;
    end

    UIMine.SetData(type, lastMining, setTime, machinesData, dateLimit);
  elseif res == 255 then
    ShowCenterMessage(string.Get(71336));
  end
end

--[[
S:170-002 礦場資訊  +res(1) +礦場編號(1)+總剩餘礦量(8)+挖礦人數(4) +是否挖礦(1)
]]--
protocolTable[170][2] = function(data)
  local res = data:ReadByte();
  if res == 1 then
    local type = data:ReadByte();
    local lastMining = data:ReadInt64();
    local people = data:ReadInt32();
    local mine = data:ReadByte();

    UIMine.SetMining(mine);

    UIMain.UpdateMiningPercent(type, lastMining);
  elseif res == 255 then
    ShowCenterMessage(string.Get(71336));
  end
end

--[[
S:170-010 <填充礦機耐久> +res(1);
                        0=失敗
                        1=成功
                        255=功能未開啟
]]--
protocolTable[170][10] = function(data)
  local result = data:ReadByte();
  UIMine.Mining(result);
end

--[[
S:170-011 <設定挖礦狀態> +res(1)
                        res 1:成功
                        res 255:功能未開啟
]]--
protocolTable[170][11] = function(data)
  local result = data:ReadByte();
  if result == 1 then
    ShowCenterMessage(string.Get(23800));
  elseif result == 255 then
    ShowCenterMessage(string.Get(71336));
  else
    logError("回收錯誤");
  end
end

--[[ 客服中心
C:199-004 <發玩家訊息> +自己玩家ID(8) +目標玩家ID(8) +訊息(?)
C:199-006 <發全頻訊息> +自己玩家ID(8) +訊息(?)
]]--
protocolTable[199] = {}

--[[ GM私頻訊息
S:199-004 <GM密頻訊息> +玩家ID(8) +訊息(?)
]]--
protocolTable[199][4] = function(data)
  local roleId = data:ReadInt64();
  local message = data:ReadString(data.length);

  Chat.AddMessage(EChannel.Whisper, message, roleId);
end

--[[ GM全頻訊息
S:199-006 <GM全頻訊息> +玩家ID(8) +訊息(?)
]]--
protocolTable[199][6] = function(data)
  local roleId = data:ReadInt64();
  local message = data:ReadString(data.length);

  Chat.AddMessage(EChannel.World, message, roleId);

  AudioManager.PlayOnce("AudioClip_WA0033", 0);
end

protocolTable[400] = {}

--[[
S:400-001 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][001] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-002 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][002] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-003 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][003] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-004 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][004] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-005 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][005] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-006 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][006] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-007 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][007] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-008 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][008] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-009 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][009] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-010 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][010] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-011 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][011] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-012 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][012] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-013 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][013] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-014 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][014] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-015 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][015] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-016 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][016] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-017 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][017] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-018 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][018] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-019 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][019] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-020 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][020] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-021 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][021] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-022 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][022] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-023 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][023] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-024 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][024] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-025 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][025] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-026 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][026] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-027 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][027] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-028 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][028] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-029 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][029] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-030 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][030] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-031 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][031] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-032 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][032] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-033 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][033] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-034 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][034] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-035 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][035] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-036 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][036] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-037 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][037] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-038 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][038] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-039 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][039] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-040 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][040] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-041 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][041] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-042 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][042] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-043 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][043] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-044 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][044] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-045 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][045] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-046 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][046] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-047 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][047] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-048 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][048] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-049 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][049] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-050 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][050] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-051 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][051] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-052 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][052] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-053 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][053] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-054 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][054] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-055 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][055] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-056 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][056] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-057 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][057] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-058 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][058] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-059 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][059] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-060 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][060] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-061 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][061] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-062 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][062] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-063 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][063] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-064 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][064] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-065 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][065] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-066 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][066] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-067 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][067] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-068 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][068] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-069 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][069] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-070 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][070] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-071 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][071] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-072 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][072] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-073 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][073] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-074 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][074] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-075 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][075] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-077 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][077] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-078 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][078] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-079 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][079] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-080 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][080] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-081 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][081] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-082 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][082] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-083 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][083] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-084 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][084] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-085 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][085] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-086 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][086] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-087 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][087] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-088 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][088] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-089 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][089] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-090 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][090] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-091 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][091] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-092 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][092] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-093 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][093] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-094 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][094] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-095 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][095] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-096 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][096] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-097 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][097] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-098 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][098] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-099 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][099] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:400-100 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[400][100] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

protocolTable[500] = {}

--[[
S:500-001 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][001] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-002 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][002] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-003 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][003] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-004 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][004] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-005 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][005] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-006 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][006] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-007 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][007] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-008 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][008] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-009 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][009] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-010 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][010] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-011 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][011] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-012 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][012] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-013 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][013] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-014 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][014] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-015 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][015] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-016 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][016] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-017 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][017] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-018 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][018] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-019 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][019] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-020 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][020] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-021 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][021] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-022 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][022] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-023 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][023] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-024 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][024] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-025 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][025] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-026 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][026] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-027 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][027] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-028 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][028] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-029 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][029] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-030 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][030] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-031 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][031] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-032 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][032] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-033 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][033] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-034 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][034] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-035 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][035] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-036 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][036] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-037 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][037] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-038 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][038] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-039 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][039] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-040 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][040] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-041 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][041] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-042 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][042] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-043 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][043] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-044 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][044] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-045 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][045] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-046 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][046] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-047 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][047] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-048 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][048] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-049 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][049] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-050 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][050] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-051 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][051] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-052 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][052] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-053 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][053] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-054 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][054] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-055 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][055] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-056 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][056] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-057 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][057] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-058 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][058] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-059 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][059] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-060 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][060] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-061 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][061] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-062 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][062] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-063 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][063] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-064 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][064] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-065 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][065] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-066 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][066] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-067 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][067] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-068 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][068] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-069 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][069] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-070 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][070] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-071 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][071] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-072 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][072] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-073 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][073] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-074 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][074] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-075 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][075] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-076 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][076] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-077 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][077] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-078 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][078] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-079 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][079] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-080 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][080] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-081 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][081] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-082 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][082] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-083 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][083] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-084 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][084] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-085 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][085] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-086 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][086] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-087 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][087] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-088 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][088] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-089 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][089] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-090 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][090] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-091 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][091] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-092 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][092] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-093 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][093] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-094 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][094] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-095 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][095] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-096 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][096] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-097 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][097] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-098 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][098] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-099 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][099] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:500-100 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[500][100] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

protocolTable[600] = {}

--[[
S:600-001 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][001] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-002 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][002] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-003 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][003] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-004 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][004] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-005 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][005] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-006 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][006] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-007 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][007] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-008 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][008] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-009 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][009] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-010 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][010] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-011 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][011] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-012 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][012] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-013 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][013] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-014 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][014] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-015 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][015] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-016 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][016] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-017 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][017] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-018 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][018] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-019 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][019] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-020 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][020] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-021 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][021] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-022 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][022] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-023 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][023] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-024 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][024] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-025 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][025] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-026 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][026] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-027 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][027] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-028 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][028] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-029 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][029] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-030 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][030] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-031 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][031] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-032 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][032] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-033 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][033] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-034 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][034] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-035 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][035] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-036 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][036] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-037 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][037] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-038 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][038] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-039 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][039] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-040 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][040] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-041 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][041] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-042 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][042] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-043 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][043] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-044 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][044] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-045 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][045] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-046 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][046] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-047 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][047] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-048 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][048] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-049 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][049] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-050 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][050] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-051 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][051] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-052 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][052] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-053 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][053] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-054 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][054] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-055 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][055] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-056 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][056] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-057 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][057] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-058 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][058] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-059 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][059] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-060 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][060] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-061 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][061] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-062 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][062] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-063 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][063] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-064 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][064] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-065 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][065] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-066 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][066] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-067 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][067] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-068 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][068] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-069 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][069] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-070 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][070] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-071 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][071] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-072 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][072] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-073 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][073] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-074 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][074] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-075 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][075] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-076 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][076] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-077 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][077] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-078 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][078] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-079 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][079] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-080 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][080] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-081 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][081] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-082 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][082] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-083 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][083] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-084 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][084] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-085 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][085] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-086 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][086] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-087 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][087] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-088 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][088] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-089 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][089] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-090 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][090] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-091 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][091] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-092 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][092] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-093 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][093] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-094 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][094] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-095 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][095] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-096 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][096] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-097 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][097] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-098 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][098] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-099 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][099] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:600-100 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[600][100] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

protocolTable[700] = {}

--[[
S:700-001 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][001] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-002 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][002] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-003 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][003] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-004 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][004] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-005 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][005] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-006 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][006] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-007 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][007] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-008 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][008] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-009 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][009] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-010 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][010] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-011 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][011] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-012 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][012] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-013 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][013] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-014 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][014] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-015 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][015] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-016 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][016] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-017 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][017] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-018 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][018] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-019 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][019] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-020 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][020] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-021 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][021] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-022 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][022] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-023 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][023] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-024 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][024] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-025 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][025] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-026 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][026] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-027 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][027] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-028 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][028] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-029 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][029] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-030 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][030] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-031 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][031] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-032 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][032] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-033 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][033] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-034 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][034] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-035 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][035] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-036 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][036] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-037 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][037] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-038 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][038] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-039 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][039] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-040 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][040] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-041 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][041] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-042 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][042] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-043 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][043] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-044 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][044] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-045 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][045] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-046 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][046] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-047 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][047] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-048 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][048] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-049 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][049] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-050 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][050] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-051 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][051] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-052 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][052] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-053 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][053] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-054 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][054] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-055 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][055] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-056 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][056] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-057 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][057] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-058 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][058] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-059 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][059] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-060 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][060] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-061 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][061] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-062 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][062] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-063 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][063] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-064 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][064] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-065 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][065] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-066 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][066] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-067 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][067] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-068 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][068] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-069 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][069] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-070 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][070] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-071 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][071] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-072 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][072] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-073 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][073] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-074 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][074] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-075 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][075] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-076 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][076] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-077 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][077] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-078 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][078] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-079 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][079] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-080 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][080] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-081 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][081] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-082 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][082] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-083 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][083] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-084 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][084] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-085 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][085] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-086 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][086] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-087 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][087] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-088 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][088] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-089 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][089] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-090 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][090] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-091 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][091] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-092 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][092] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-093 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][093] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-094 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][094] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-095 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][095] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-096 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][096] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-097 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][097] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-098 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][098] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-099 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][099] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:700-100 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[700][100] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

protocolTable[800] = {}

--[[
S:800-001 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][001] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-002 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][002] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-003 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][003] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-004 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][004] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-005 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][005] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-006 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][006] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-007 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][007] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-008 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][008] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-009 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][009] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-010 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][010] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-011 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][011] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-012 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][012] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-013 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][013] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-014 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][014] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-015 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][015] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-016 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][016] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-017 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][017] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-018 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][018] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-019 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][019] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-020 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][020] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-021 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][021] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-022 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][022] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-023 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][023] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-024 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][024] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-025 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][025] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-026 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][026] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-027 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][027] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-028 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][028] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-029 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][029] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-030 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][030] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-031 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][031] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-032 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][032] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-033 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][033] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-034 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][034] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-035 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][035] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-036 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][036] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-037 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][037] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-038 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][038] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-039 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][039] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-040 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][040] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-041 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][041] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-042 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][042] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-043 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][043] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-044 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][044] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-045 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][045] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-046 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][046] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-047 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][047] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-048 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][048] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-049 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][049] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-050 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][050] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-051 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][051] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-052 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][052] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-053 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][053] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-054 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][054] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-055 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][055] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-056 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][056] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-057 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][057] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-058 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][058] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-059 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][059] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-060 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][060] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-061 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][061] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-062 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][062] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-063 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][063] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-064 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][064] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-065 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][065] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-066 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][066] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-067 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][067] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-068 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][068] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-069 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][069] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-070 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][070] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-071 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][071] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-072 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][072] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-073 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][073] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-074 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][074] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-075 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][075] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-076 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][076] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-077 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][077] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-078 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][078] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-079 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][079] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-080 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][080] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-081 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][081] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-082 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][082] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-083 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][083] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-084 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][084] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-085 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][085] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-086 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][086] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-087 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][087] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-088 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][088] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-089 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][089] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-090 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][090] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-091 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][091] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-092 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][092] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-093 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][093] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-094 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][094] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-095 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][095] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-096 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][096] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-097 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][097] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-098 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][098] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-099 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][099] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end

--[[
S:800-100 <useless> +data(1) +data(2) +data(4) +data(8) +時間(8) +開關(1) +L(1) +字串(L)
]]--
protocolTable[800][100] = function(data)
  local data1 = data:ReadByte();
  local data2 = data:ReadUInt16();
  local data3 = data:ReadInt32();
  local data4 = data:ReadInt64();
  local time = data:ReadDouble();
  local switch = data:ReadBoolean();
  local stringData = data:ReadString(data:ReadByte());
end
