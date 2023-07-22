--[[
And God kept Noah in mind, and all the living things and the cattle which were with him in the ark: and God sent a wind over the earth, and the waters went down.
And the fountains of the deep and the windows of heaven were shut, and the rain from heaven was stopped.
And the waters went slowly back from the earth, and at the end of a hundred and fifty days the waters were lower.
And on the seventeenth day of the seventh month the ark came to rest on the mountains of Ararat.
And still the waters went on falling, till on the first day of the tenth month the tops of the mountains were seen.
Then, after forty days, through the open window of the ark which he had made,
Noah sent out a raven, which went this way and that till the waters were gone from the earth.
And he sent out a dove, to see if the waters had gone from the face of the earth;
But the dove saw no resting-place for her foot, and came back to the ark, for the waters were still over all the earth; and he put out his hand, and took her into the ark.
And after waiting another seven days, he sent the dove out again;
And the dove came back at evening, and in her mouth was an olive-leaf broken off: so Noah was certain that the waters had gone down on the earth.
And after seven days more, he sent the dove out again, but she did not come back to him.
And in the six hundred and first year, on the first day of the first month, the waters were dry on the earth: and Noah took the cover off the ark and saw that the face of the earth was dry.
And on the twenty-seventh day of the second month the earth was dry.
And God said to Noah,
Go out of the ark, you and your wife and your sons and your sons' wives.
Take out with you every living thing which is with you, birds and cattle and everything which goes on the earth, so that they may have offspring and be fertile and be increased on the earth.
And Noah went out with his sons and his wife and his sons' wives;
And every beast and bird and every living thing of every sort which goes on the earth, went out of the ark.
And Noah made an altar to the Lord, and from every clean beast and bird he made burned offerings on the altar.
--]]

EventHandler = {}

EventHandler[0] = function(eventInfo, eventManager, surfaceDatas)
  local role = Role.mapNpcs[eventInfo.parameter];
  
  eventManager.SetConduct(true);   --用來控制效果循序執行

  if eventInfo.resultClass == 1 then
    --道具
    ShowCenterMessage(string.Concat(itemDatas[eventInfo.parameter]:GetName(true), tostring(eventInfo.resultValue)));
  elseif eventInfo.resultClass == 2 then
    --任務/標記
    if eventInfo.parameterStyle == 1 then
      --增加標記
      if (MaxMissionQuant - MarkManager.missions[eventInfo.parameter].step) >= eventInfo.resultValue then
        MarkManager.missions[eventInfo.parameter].step = MarkManager.missions[eventInfo.parameter].step + eventInfo.resultValue;
        logWarn(string.Concat("標記", tostring(eventInfo.parameter), " ", markDatas[eventInfo.parameter].name, "+", tostring(eventInfo.resultValue), " = ", tostring(MarkManager.missions[eventInfo.parameter].step), "個標記"));
      end
    elseif eventInfo.parameterStyle == 2 then
      --刪除標記
      if MarkManager.missions[eventInfo.parameter].step >= eventInfo.resultValue then
        MarkManager.missions[eventInfo.parameter].step = MarkManager.missions[eventInfo.parameter].step - resultValue;
        logWarn(string.Concat("標記", tostring(eventInfo.parameter), " ", markDatas[eventInfo.parameter].name, "-", tostring(eventInfo.resultValue), " = ", tostring(MarkManager.missions[eventInfo.parameter].step), "個標記"));
      end
    end
  elseif eventInfo.resultClass == 3 then
    --NPC
    if eventInfo.parameterStyle == 1 then
      --要求加入玩家
      if table.Count(followNpcs) < Role.maxFollowNpc then
        local inTeam = false;

        local followNpcs = Role.GetFollowNpcs(Role.playerId);
        for k, v in pairs(followNpcs) do
          if v.npcId == role.npcId then
            inTeam = true;
            break;
          end
        end
        
        if not inTeam then
          --[[
          CY_FNpcTeamMenu.FocusIndex:=Focus.Index;
          CY_FNpcTeamMenu.btnJoinTeam.appear;
          CY_FNpcTeamMenu.btnDisJoinTeam.DisAppear;
          CY_FNpcTeamMenu.btnGoFight.DisAppear;        
          CY_FNpcTeamMenu.editLabel.Text:='是否讓'+MapNpc[Focus.Index].Name+'加入?';
          CY_FNpcTeamMenu.Appear;
          CY_FNpcTeamMenu.Bool:=True;
          ]]--
        end
      end
    elseif eventInfo.parameterStyle == 2 then
      --追擊玩家
      --[[ 等龍哥弄好
      PursueFlag = true;
      PursueIDx = parameter;
      MapNpc[parameter].PathMedIndex = 2;
      MapNpc[parameter].Speed = Player.Speed*(0.5)*NpcArray[parameter].TraceSpeedLevel;
      ]]--
    elseif eventInfo.parameterStyle == 3 then
      --隱形
      role:SetVisible(ERoleVisible.TimeHide, eventInfo.resultValue);
    elseif eventInfo.parameterStyle == 4 then
      --顯現
      role:SetVisible(ERoleVisible.TimeVisible, eventInfo.resultValue);
    elseif eventInfo.parameterStyle == 5 then
      --更換圖序
      ShowCenterMessage(string.Get(40324), 1);
    end
  elseif eventInfo.resultClass == 8 then
    --[[ 不知道是三小
    if eventInfo.parameterStyle == 1 then
      MessageBox(DZ_Game.Form1.Handle, PChar(String("^__^"+NPCData.Who[NPCData.FindOne(parameter)].Name+" 加入")), "黑暗的勢力又增加了...", MB_ICONASTERISK);
    elseif eventInfo.parameterStyle == 2 then
      MessageBox(DZ_Game.Form1.Handle, PChar(String("=__="+NPCData.Who[NPCData.FindOne(parameter)].Name+" 離開")), "黑暗的勢力削弱了...", MB_ICONASTERISK);
    end
    ]]--
  end  
end

--[[
Now Dinah, the daughter whom Leah had by Jacob, went out to see the women of that country.
And when Shechem, the son of Hamor the Hivite who was the chief of that land, saw her, he took her by force and had connection with her.
Then his heart went out in love to Dinah, the daughter of Jacob, and he said comforting words to her.
And Shechem said to Hamor, his father, Get me this girl for my wife.
Now Jacob had word of what Shechem had done to his daughter; but his sons were in the fields with the cattle, and Jacob said nothing till they came.
Then Hamor, the father of Shechem, came out to have a talk with Jacob.
Now the sons of Jacob came in from the fields when they had news of it, and they were wounded and very angry because of the shame he had done in Israel by having connection with Jacob's daughter; and they said, Such a thing is not to be done.
But Hamor said to them, Shechem, my son, is full of desire for your daughter: will you then give her to him for a wife?
And let our two peoples be joined together; give your daughters to us, and take our daughters for yourselves.
Go on living with us, and the country will be open to you; do trade and get property there.
And Shechem said to her father and her brothers, If you will give ear to my request, whatever you say I will give to you.
However great you make the bride-price and payment, I will give it; only let me have the girl for my wife.
But the sons of Jacob gave a false answer to Shechem and Hamor his father, because of what had been done to Dinah their sister.
And they said, It is not possible for us to give our sister to one who is without circumcision, for that would be a cause of shame to us:
But on this condition only will we come to an agreement with you: if every male among you becomes like us and undergoes circumcision;
Then we will give our daughters to you and take your daughters to us and go on living with you as one people.
But if you will not undergo circumcision as we say, then we will take our daughter and go.
And their words were pleasing to Hamor and his son Shechem.
And without loss of time the young man did as they said, because he had delight in Jacob's daughter, and he was the noblest of his father's house.
--]]


EventHandler[1] = function(eventInfo, eventManager, surfaceDatas)
  local role = Role.mapNpcs[eventInfo.parameter];

  if Define.IsDebugMode() then    
    if eventInfo == nil then
      Chat.AddMessage(EChannel.System, "ErrorMessage: talk eventInfo nil");
      return;
    end;
    if eventInfo.resultMeanNo == nil then
      Chat.AddMessage(EChannel.System, "ErrorMessage: talk resultNo nil");
      return;
    end;
    if talkDatas == nil then
      Chat.AddMessage(EChannel.System, "ErrorMessage: talk data nil");
      return;
    end
    if talkDatas[eventInfo.resultMeanNo] == nil then
      Chat.AddMessage(EChannel.System, string.format("ErrorMessage: talk data No: %s nil", tostring(eventInfo.resultMeanNo)));    
      return;
    end      
  end

  eventManager.SetConduct(false);   --事件處理暫停,此行專用於Click的循序處理方式

  --面對面講話
  if role ~= nil then
    Role.player:FaceTo(role.position);

    if not role.isMoving and (npcDatas[role.npcId] == nil or not Contains(npcDatas[role.npcId].kind, ENpc.Billboard)) then
      role:FaceTo(Role.player.position, true);
    end
  end

  local showRole = nil;
  if eventInfo.resultClass == 3 then
    --NPC
    showRole = role;
  elseif eventInfo.resultClass == 7 then
    --玩家
    showRole = Role.player;
  elseif resultClass == 12 then
    --二代武將
    showRole = Role.childNpc;
  end    

  ShowTalkMessage(
    function()
      if role ~= nil and not role.isMoving then
        role:SetDirection(role.data.eventNpcData.direction);
      end

      if eventManager.IsRunning then
        eventManager.SetConduct(true);
      end
      --runevent
    end,
    talkDatas[eventInfo.resultMeanNo],
    showRole
  );
end

EventHandler[2] = function(eventInfo, eventManager, surfaceDatas)
  eventManager.SetConduct(true); --用來控制效果循序執行

  --[[
  C_SendDoorMsg.DoorNo := DoorMeetNo; //觸發的door編號
  C_SendDoorMsg.EveNo := NowRunningEve;

  C_RevDoorInfoMsg.DoorNo := DoorMeetNo;  //目前暫用Client這邊的data
  C_RevDoorInfoMsg.EveNo := NowRunningEve;  //目前暫用Client這邊的data
  {$ifDef _IsSimServer}
    C_RevDoorInfoFlag := True;
    BKSimServer.ReceiveDoorInfo(C_SendDoorMsg); //Server_Rev //值送給SimServer
  {$Else}
  {$EndIf}
  ]]--
end

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

EventHandler[3] = function(eventInfo, eventManager, surfaceDatas)
  eventManager.SetSession(true);
  --[[
  FightMsg := FightArray[resultMeanNo];  //戰鬥資料應該用Server端的

  C_SSessioning := True;
  FConnect.SedMessage(11, 1);
  ]]--
end

--[[
Now Abraham was old and far on in years: and the Lord had given him everything in full measure.
And Abraham said to his chief servant, the manager of all his property, Come now, put your hand under my leg:
And take an oath by the Lord, the God of heaven and the God of the earth, that you will not get a wife for my son Isaac from the daughters of the Canaanites among whom I am living;
But that you will go into my country and to my relations and get a wife there for my son Isaac.
And the servant said, If by chance the woman will not come with me into this land, am I to take your son back again to the land from which you came?
And Abraham said, Take care that you do not let my son go back to that land.
The Lord God of heaven, who took me from my father's house and from the land of my birth, and made an oath to me, saying, To your seed I will give this land: he will send his angel before you and give you a wife for my son in that land.
And if the woman will not come with you, then you are free from this oath; only do not take my son back there.
And the servant put his hand under Abraham's leg, and gave him his oath about this thing.
And the servant took ten of his master's camels, and all sorts of good things of his master's, and went to Mesopotamia, to the town of Nahor.
And he made the camels take their rest outside the town by the water-spring in the evening, at the time when the women came to get water.
And he said, O Lord, the God of my master Abraham, let me do well in what I have undertaken this day, and give your mercy to my master Abraham.
See, I am waiting here by the water-spring; and the daughters of the town are coming out to get water:
Now, may the girl to whom I say, Let down your vessel and give me a drink, and who says in answer, Here is a drink for you and let me give water to your camels: may she be the one marked out by you for your servant Isaac: so may I be certain that you have been good to my master Abraham.
And even before his words were ended, Rebekah, the daughter of Bethuel, the son of Milcah, who was the wife of Nahor, Abraham's brother, came out with her water-vessel on her arm.
She was a very beautiful girl, a virgin, who had never been touched by a man: and she went down to the spring to get water in her vessel.
And the servant came running to her and said, Give me a little water from your vessel.
And she said, Take a drink, my lord: and quickly letting down her vessel onto her hand, she gave him a drink.
And having done so, she said, I will get water for your camels till they have had enough.
And after putting the water from her vessel into the animals' drinking-place, she went quickly back to the spring and got water for all the camels.
And the man, looking at her, said nothing, waiting to see if the Lord had given his journey a good outcome.
And when the camels had had enough, the man took a gold nose-ring, half a shekel in weight, and two ornaments for her arms of ten shekels weight of gold;
And said to her, Whose daughter are you? is there room in your father's house for us?
And she said to him, I am the daughter of Bethuel, the son of Milcah, Nahor's wife.
And she said, We have a great store of dry grass and cattle-food, and there is room for you.
And with bent head the man gave worship to the Lord;
And said, Praise be to the Lord, the God of my master Abraham, who has given a sign that he is good and true to my master, by guiding me straight to the house of my master's family.
]]--

EventHandler[4] = function(eventInfo, eventManager, surfaceDatas)
  local role = Role.mapNpcs[eventInfo.parameter];

  eventManager.SetConduct(true); --用來控制效果循序執行

  if eventInfo.resultClass == 3 then
    --NPC
    role:Move(Vector2.New((eventInfo.resultValue / 10000) * 20 - 10, (eventInfo.resultValue % 10000) * 20));
  end
end

EventHandler[5] = function(eventInfo, eventManager, surfaceDatas)
  if eventInfo.parameterStyle == 1 then
    eventManager.SetConduct(false); --直到撥放結束
  elseif eventInfo.parameterStyle == 2 then
    eventManager.SetConduct(false); --同步效果執行(只可與放映或換場效果合用)
  end
  --eventManager.SetConduct(true);  
  MoviePlayer.PlayMovie(eventInfo.resultValue);  
end

--[[
In the beginning God created the heaven and the earth.At the first God made the heaven and the earth.
And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of God moved upon the face of the waters.
At the first God made the heaven and the earth.And the earth was waste and without form; and it was dark on the face of the deep: and the Spirit of God was moving on the face of the waters.And God said, Let there be light: and there was light.
And God, looking on the light, saw that it was good: and God made a division between the light and the dark,
Naming the light, Day, and the dark, Night. And there was evening and there was morning, the first day.
And God said, Let there be a solid arch stretching over the waters, parting the waters from the waters.
And God made the arch for a division between the waters which were under the arch and those which were over it: and it was so.
And God gave the arch the name of Heaven. And there was evening and there was morning, the second day.
And God said, Let the waters under the heaven come together in one place, and let the dry land be seen: and it was so.
And God gave the dry land the name of Earth; and the waters together in their place were named Seas: and God saw that it was good.
And God said, Let grass come up on the earth, and plants producing seed, and fruit-trees giving fruit, in which is their seed, after their sort: and it was so.
And grass came up on the earth, and every plant producing seed of its sort, and every tree producing fruit, in which is its seed, of its sort: and God saw that it was good.
And there was evening and there was morning, the third day.
And God said, Let there be lights in the arch of heaven, for a division between the day and the night, and let them be for signs, and for marking the changes of the year, and for days and for years:
And let them be for lights in the arch of heaven to give light on the earth: and it was so.
And God made the two great lights: the greater light to be the ruler of the day, and the smaller light to be the ruler of the night: and he made the stars.
And God put them in the arch of heaven, to give light on the earth;
To have rule over the day and the night, and for a division between the light and the dark: and God saw that it was good.
And there was evening and there was morning, the fourth day.
And God said, Let the waters be full of living things, and let birds be in flight over the earth under the arch of heaven.
And God made great sea-beasts, and every sort of living and moving thing with which the waters were full, and every sort of winged bird: and God saw that it was good.
And God gave them his blessing, saying, Be fertile and have increase, making all the waters of the seas full, and let the birds be increased in the earth.
--]]

EventHandler[6] = function(eventInfo, eventManager, surfaceDatas)
  local role = Role.mapNpcs[eventInfo.parameter];

  if eventInfo.parameterStyle == 0 then
    --無屬性(玩家自己)
    eventManager.SetConduct(true);          --用來控制效果循序執行
    eventManager.SetInteracting(true);      --設定目前處於互動效果中
  elseif eventInfo.parameterStyle == 1 then
    --隊長
    eventManager.SetConduct(false);         --用來控制效果循序執行
    eventManager.SetInteracting(true);      --設定目前處於互動效果中
  elseif eventInfo.parameterStyle == 2 then
    --隊員(First)
  end

  --面對面講話
  if role ~= nil then
    Role.player:FaceTo(role.position);

    if not role.isMoving and (npcDatas[role.npcId] == nil or not Contains(npcDatas[role.npcId].kind, ENpc.Billboard)) then
      role:FaceTo(Role.player.position, true);
    end
  end
  
  --互動資料用Server端的resultMeanNo取得
  local surfaceData = surfaceDatas[eventInfo.resultMeanNo];

  --事件觸發選擇
  if surfaceData.optionMode == 0 then

  elseif surfaceData.optionMode == 1 then
    --NPC交易用
    --[[
    BK_InterFace.ResetInterForm;

    -- 只有在按別的交易介面或是換場景,時才消除ListBox的記憶
    if BK_InterFace.OldMap ~= Player.SceneNum or BK_InterFace.OldSurface ~= surfaceData.SurfaceNO then
      BK_InterFace.LB1ScrollBar1.currentRec = 0;
      BK_InterFace.ListBox1.TopLineOnList = 0;
      BK_InterFace.OldSurface = surfaceData.SurfaceNO;
      BK_InterFace.OldMap = Player.SceneNum;
    end

    BK_InterFace.ListBox1.OnLeftSelect = BK_InterFace.SelThingItem;
    --要放小圖片所以加大了
    BK_InterFace.ListBox1.ItemHeight = BuyFormItemHigh;
    BK_InterFace.ListBox1.ItemLeft = 32;
    BK_InterFace.ListBox1.ImgHide = False;
    ]]--

  elseif surfaceData.optionMode == 2 then

  elseif surfaceData.optionMode == 3 then
  
  end

  local buttonCount = 0;
  local message = "";
  local options = {};
  local tempString = "";
  local seOrder = { 0, 0, 0 }

  logWarn(string.Concat("Option Mode : ", surfaceData.optionMode));

  --計算高度與設定文字內容
  for i = 1, surfaceData.sentenceCount do
    if surfaceData.sentences[i] ~= nil then
      --找出Surface中se/bk物件排列順位
      if surfaceData.sentences[i].style ~= 4 then
        for j = 1, 3 do
          if seOrder[j] == 0 then
            seOrder[j] = surfaceData.sentences[i].style;
            break;
          elseif seOrder[j] == surfaceData.sentences[i].style then
            break;
          end
        end
      end

      if surfaceData.sentences[i].style == 1 then
        --秀文字
        if surfaceData.sentences[i].dataKind == 1 then
          tempString = string.Concat(tempString, talkDatas[surfaceData.sentences[i].dataId]);
        elseif surfaceData.sentences[i].dataKind == 2 then
          tempString = string.Concat(tempString, itemDatas[surfaceData.sentences[i].dataId]:GetName(true), " $", tostring(itemDatas[surfaceData.sentences[i].dataId].price));
        end

        --累積 tempString
        if surfaceData.sentences[i].canCut then

          --[[
          if surfaceData.optionMode == 1 then
            BK_InterFace.TextMemoAndOther = 15;
            BK_InterFace.TextMemoHeight = BK_InterFace.TextMemoHeight + (20 * math.ceil((string.len(tempString) * (16 / 2)) / BK_InterFace.InterTextMemoWidthLimit));
          end
          ]]--

          message = string.Concat(message, tempString); --sega
        end

      elseif surfaceData.sentences[i].style == 2 then
        --按鈕
        if surfaceData.sentences[i].dataKind == 1 then
          tempString = talkDatas[surfaceData.sentences[i].dataId];
        elseif surfaceData.sentences[i].dataKind == 2 then
          tempString = string.Concat(itemDatas[surfaceData.sentences[i].dataId]:GetName(true), " $", tostring(itemDatas[surfaceData.sentences[i].dataId].price));
        end

        --[[
        if surfaceData.optionMode == 1 then
          BK_InterFace.BtnAndOther = 15;
          -- 如果有換行 或者為 Btn[0]
          if surfaceData.sentences[i].canCut or buttonCount == 0 then
            BK_InterFace.BtnTeamHeight = BK_InterFace.BtnTeamHeight + (BK_InterFace.BtnArray[buttonCount].Height+BK_InterFace.BtnInterval);
          end

          --減去最後一排按鈕的間隔,且只要做一次就好了
          if buttonCount == 0 then
            BK_InterFace.BtnTeamHeight = BK_InterFace.BtnTeamHeight - BK_InterFace.BtnInterval;
          end
          
          --每個字的距離
          BK_InterFace.BtnArray[buttonCount].Width = Length(tempString)*17;
          BK_InterFace.BtnArray[buttonCount].Caption = tempString;

          -- 紀錄每個按鈕要不要換行
          BK_InterFace.BtnInfoArray[buttonCount] = surfaceData.sentences[i].canCut;
        end

        buttonCount = buttonCount + 1;
        ]]--

        --table.insert(options, tempString);
        
      elseif surfaceData.sentences[i].style == 3 then
        --選單
        --[[
        --戰役選單特別處理
        if SceneManager.sceneId == 12711 and MapNpc[eventInfo.parameter].ID == 16037 then
          if EventManage.WeekNum == 1 then
            --第一個星期不開放鉅鹿、虎牢關之戰選項
            if Contains(surfaceData.sentences[i].dataId, 28336, 29734) then
              Continue;
            end

          elseif EventManage.WeekNum == 2 then
            --第二個星期不開放大興山、虎牢關之戰選項
            if Contains(surfaceData.sentences[i].dataId, 28267, 29734) then
              Continue;
            end

          elseif EventManage.WeekNum == 3 then
            --第三個星期不開放大興山、鉅鹿之戰選項
            if Contains(surfaceData.sentences[i].dataId, 28267, 28336) then
              Continue;
            end
          end
        end
        ]]--

        if surfaceData.sentences[i].dataKind == 1 then
          tempString = string.Concat(tempString, talkDatas[surfaceData.sentences[i].dataId]);
        elseif surfaceData.sentences[i].dataKind == 2 then
          if surfaceData.optionMode == 0 then
            tempString = string.Concat(itemDatas[surfaceData.sentences[i].dataId]:GetName(true), " $", tostring(itemDatas[surfaceData.sentences[i].dataId].price), "      $", tostring(itemDatas[surfaceData.sentences[i].dataId].level));
            GoodsPic = "";
          
            --[[
            if Define.Thai then
              if surfaceData.optionMode == 1 then
                BK_InterFace.ListBoxAndOther = 15;
                BK_InterFace.ListBox1.Add(surfaceData.sentences[i].dataId);
              end
            end
            ]]--
          elseif surfaceData.optionMode == 1 then
            if Define.Thai then
              --[[
              if surfaceData.optionMode == 1 then
                BK_InterFace.ListBoxAndOther = 15;
                BK_InterFace.ListBox1.Add(surfaceData.sentences[i].dataId);
              end
              ]]--
            else
              --物品效果  Max = 17個AsSCII code
              tempString = Item.GetItemEffectString(surfaceData.sentences[i].dataId);
            end
          end
        end

        --[[
        if not Define.Thai then
          if surfaceData.optionMode == 1 then
            BK_InterFace.ListBoxAndOther = 15;
            BK_InterFace.ListBox1.Line1.Add(Line1);
            BK_InterFace.ListBox1.Add(tempString, GoodsPic);
          end
        end
        ]]--

        table.insert(options, tempString);

      elseif surfaceData.sentences[i].style == 4 then
        --特殊關閉按鈕
        if surfaceData.sentences[i].dataKind == 1 then
          tempString = talkDatas[surfaceData.sentences[i].dataId];
        elseif surfaceData.sentences[i].dataKind == 2 then
          tempString = string.Concat(itemDatas[surfaceData.sentences[i].dataId]:GetName(true), " $", tostring(itemDatas[surfaceData.sentences[i].dataId].price));
        end

        --[[
        if surfaceData.optionMode == 1 then
          BK_InterFace.Cl_Btn.Appear;
        end
        ]]--
      end
          
      logWarn(string.Concat("Sentence[", i, "] Style : ", surfaceData.sentences[i].style, " Text : ", tempString));
      tempString = ""; --清空
    end
  end

  if surfaceData.optionMode == 0 then
    local showRole = nil;

    if eventInfo.parameter == 0 then  
      showRole = Role.player;
    else
      showRole = role;
    end

    if table.maxn(options) > 0 then
      ShowOptionMessage(
        function(result)
          if role ~= nil and not role.isMoving then
            role:SetDirection(role.data.eventNpcData.direction);
          end
          
          if result == 0 then
            eventManager.SelectEvent(40);
          elseif result <= 10 then
            result = result - 1;
            eventManager.SelectEvent(tonumber(string.Concat("3", tostring(result))));
          else
            result = result - 1;
            eventManager.SelectEvent(tonumber(string.Concat("6", tostring(result - 9))));
          end
        end,
        message,
        options,
        showRole
      );
    else
      ShowCheckMessage(
        function(result)
          if role ~= nil and not role.isMoving then
            role:SetDirection(role.data.eventNpcData.direction);
          end

          if result then
            eventManager.SelectEvent(20);
          else
            eventManager.SelectEvent(21);
          end     
        end,
        message,
        showRole
      );
    end

  elseif surfaceData.optionMode == 1 then
    UI.Open(UIShop, EUIShop.Shop, options);
    --[[
    --配置物件位置
    for i = 1, 3 do
      if seOrder[i] == 1 then
        --Memo
      elseif seOrder[i] == 2 then
        --Button
      elseif seOrder[i] == 3 then
        --ListBox
        BK_InterFace.ListBox1.Appear;

        --如果配置的第一位是ListBox
        if i = 1 then
          BK_InterFace.ListBox1.SetBound(19, 60, 405, BuyFormItemHigh*BuyFormItemNum);
        else
          BK_InterFace.ListBox1.SetBound(19, 60, 405, BuyFormItemHigh*BuyFormItemNum);
        end

        InterFormMaxHeight = InterFormMaxHeight + BK_InterFace.ListBox1Height + BK_InterFace.ListBoxAndOther;

        --設定ScrollBar
        with BK_InterFace.LB1ScrollBar1 do
        begin
          Left = BK_InterFace.ListBox1.Left+BK_InterFace.ListBox1.Width;
          Top = BK_InterFace.ListBox1.Top-1;
          Height = BK_InterFace.ListBox1.Height;
        end

        BK_InterFace.ListBox1.setControler(BK_InterFace.LB1ScrollBar1);
        BK_InterFace.LB1ScrollBar1.appear;
      end
    end

    BK_InterFace.appear;
    ]]--

  elseif surfaceData.optionMode == 2 then
    --[[ 舊版軍團製造
    local npcs = {};

    for i = 1, surfaceData.sentenceCount do
      if surfaceData.sentences[i].style == 1 then
        message = talkDatas[surfaceData.sentences[i].dataId];
      elseif surfaceData.sentences[i].style == 3 then
        if surfaceData.sentences[i].dataKind == 3 then
          table.insert(npcs, surfaceData.sentences[i].dataId);
        end
      end
    end

    UI.Open(UIArmyMake,
      message,
      npcs,
      function(result)
        UI.Close(UIArmyMake);

        if role ~= nil and not role.isMoving then
          role:SetDirection(role.data.eventNpcData.direction);
        end

        if result == 0 then
          eventManager.SelectEvent(40);
        elseif result <= 9 then
          result = result - 1;
          eventManager.SelectEvent(tonumber(string.Concat("3", tostring(result))));
        else
          result = result - 1;
          eventManager.SelectEvent(tonumber(string.Concat("6", tostring(result - 9))));
        end
      end
    );
    --]]
  elseif surfaceData.optionMode == 3 then
  end
end
