MagicBeanShow = {}
MagicBeanShow.__index = MagicBeanShow;

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

local this = MagicBeanShow;
  --爬樹相關參數

  this.isClimbTree = false; --爬豆中
  this.beanEffect = nil; --爬豆動畫
  this.magicBeanToEnd = false; --是否達到頂端
  this.magicBeanCircle = false;
  this.roleController = nil;
  this.isMagicBean = false;
  this.magicBeanShowTime = nil;

  this.startPos = Vector2.zero;
  this.endY = 0;

function MagicBeanShow.Start()
  if Role.player.horseNpcId ~= 0 then return end --如果騎馬則不能種魔豆  
  if this.isMagicBean  then return end --如果已經種魔豆則離開

  if this.beanEffect ~= nil then 
    this.beanEffect:Stop();
    this.beanEffect = nil;
  end
  local oriRole = Role.player;                
  this.roleController = RoleController.Copy(oriRole);  
  this.roleController:UpdateViewVisible();

  this.roleController.position = oriRole.position;
  this.roleController.canvas.sortingOrder = 1500  + this.roleController.position.y;
  this.direction =  oriRole.direction;
  this.isClimbTree = false; --爬豆中
  this.beanEffect = nil; --爬豆動畫
  this.magicBeanToEnd = true; --魔豆未到達頂端
  this.magicBeanCircle = false; --魔豆尚未循環
  this.isMagicBean = true;
  this.magicBeanShowTime = CGTimer.time;
  this.startPos = Vector2.New(oriRole.position.x, oriRole.position.y);
  this.climbY = 0;
  this.endY = Scene.cameraPosition.y + Scene.currentSceneHalfHeight;
  
  this.beanEffect = EffectLight.New('MagicBean1',1000,1,4,4, EEffectLightTracer.StandAni, this.startPos.x + 10, this.startPos.y - 20, 255, false, 25, nil, nil, nil, nil, true);
  this.beanEffect:SetSortingOrder(1500);
  Role.player.gameObject:SetActive(false);
  CGTimer.AddListener(this.Update, 0.05, false);
end

function MagicBeanShow.Trash()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MagicBeanShow.Update()
  if not this.isMagicBean  then  --如果魔豆未種則離開
    return;
  end  
  
  if not this.isClimbTree then
    this.roleController:SetAnimationForceId(ERolePose.Stand);
    this.roleController:SetDirection(ERoleDirection.Up); 

    if CGTimer.time - this.magicBeanShowTime > 5 then  --種魔豆5秒後才開始爬    
      this.isClimbTree = true;  --玩家開始爬樹
      this.magicBeanShowTime = CGTimer.time;
      this.roleController:SetAnimationForceId(ERolePose.Walk);      
    end
  end

  this.ClimbTreeTrace();

  if this.beanEffect.picId == 0 then            --重新載入新圖檔  
    this.beanEffect = EffectLight.New('MagicBean2',1000, 1,10,10, EEffectLightTracer.Stand, this.startPos.x, this.startPos.y, 255, true, 25, nil, nil, nil, nil, true);
    this.beanEffect:SetSortingOrder(1500);
    this.magicBeanToEnd = false;  --開始偵測是否魔豆到達頂端
  end

  if not this.magicBeanToEnd then             
    if this.beanEffect.orderCount == 9 then  --魔豆到達頂端      
      this.magicBeanCircle = true;  --魔豆循環開始
      this.magicBeanToEnd = true;   --停止判斷魔豆是否到達頂端
    end

    if this.magicBeanCircle then    
      this.beanEffect:SetPage(9, 10);
      this.beanEffect.interval = 100;
      this.magicBeanCircle = false; --停止判斷是否循環
    end
  end  
  local screenEdgeY = (Scene.cameraPosition.y - Scene.currentSceneHalfHeight);      
  if (this.roleController.position.y) <= screenEdgeY then     
    Network.Send(23, 45);       --//傳封包給server      
    this.beanEffect:Stop();
    this.beanEffect = nil;      
    this.isClimbTree = false; --以下是將所有相關值歸回初始
    this.isMagicBean = false;
    this.magicBeanToEnd = false;
    this.magicBeanCircle = false;
    this.startPos = Vector2.zero;      
    this.climbY = 0;
    this.roleController:Destroy();      
    this.roleController = nil;
    Role.player.gameObject:SetActive(true);
    CGTimer.RemoveListener(this.Update);
  else
    this.roleController:SetPosition(this.roleController.position);
    this.roleController.canvas.sortingOrder = 1500  + this.roleController.position.y;
    this.roleController:UpdateShow(false, 1);
  end
end

function MagicBeanShow.Trash1()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MagicBeanShow.Trash2()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MagicBeanShow.ClimbTreeTrace()
  if not this.isClimbTree then
    return; 
  end

  local moveValue = 9;  --每次偏移的量
  if CGTimer.time - this.magicBeanShowTime >= 0.2 then  
    this.climbY = this.climbY + moveValue;    
    this.magicBeanShowTime = CGTimer.time;    
    this.roleController.position.y = this.roleController.position.y - moveValue;        
  end 
end

function MagicBeanShow.Trash3()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end

function MagicBeanShow.Trash4()
  if LuaHelper.CheckDefine("DemoCode") then
    local SBBS = 78;
    local stringBS = "";
    
    if SBBS == 78 then
      stringBS = tostring(SBBS);
    end
    
    return stringBS;
  end
end