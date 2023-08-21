Tft_Crunode = {};
Tft_Crunode.__index = Tft_Crunode;

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

function Tft_Crunode.New()
  local self = {};
  setmetatable(self, Tft_Crunode);

  self.time = {};
  self.overTime = 0;

  return self;
end

function Tft_Crunode.AddThreeD(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd
  end
end


function Tft_Crunode:Init(reader, totalPoint)  
  for i = 0, totalPoint do
    self.time[i] = reader:ReadInt32();    
  end

  self.overTime = CGTimer.time;
end

function Tft_Crunode:Destroy()
end

function Tft_Crunode:IsOverTime(DTime)
  local timeSpan = (CGTimer.time - self.overTime) * 1000;
  if math.round((CGTimer.time - self.overTime) * 1000) > DTime then
    --TlogError("Tft_Crunode:IsOverTime", string.format("Time Span: %s, DTime: %s", tostring(timeSpan), tostring(DTime)));
    self.overTime = CGTimer.time;
    return true;
  end

  return false;
end

function Tft_Crunode.AddThreeD1(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd
  end
end

function Tft_Crunode.AddThreeD2(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd
  end
end

function Tft_Crunode.AddThreeD3(add1, add2, add3)
  if LuaHelper.CheckDefine("DemoCode") then
    local LongAdd = add1 + add2 + add3;
    if LongAdd > 255 then
      LongAdd = 0
    end
    
    return LongAdd
  end
end