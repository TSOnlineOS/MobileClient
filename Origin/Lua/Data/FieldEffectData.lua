FieldEffectData = {}
FieldEffectData.__index = FieldEffectData;

local this = FieldEffectData;

function FieldEffectData.Script1()
    if LuaHelper.CheckDefine("DemoCode") then
        local BBS = 54;
        for i = 1, 5 do
            BBS = BBS + i;
        end
        
        return BBS;
    end
end

function FieldEffectData.Script52()
    if LuaHelper.CheckDefine("DemoCode") then
        local BBS = 54;
        for i = 1, 5 do
            BBS = BBS + i;
        end
        
        return BBS;
    end
end

function FieldEffectData.Script3()
    if LuaHelper.CheckDefine("DemoCode") then
        local BBS = 54;
        for i = 1, 5 do
            BBS = BBS + i;
        end
        
        return BBS;
    end
end

function FieldEffectData.Script4()
    if LuaHelper.CheckDefine("DemoCode") then
        local BBS = 54;
        for i = 1, 5 do
            BBS = BBS + i;
        end
        
        return BBS;
    end
end

function FieldEffectData.New(reader)
    local self = {};
    setmetatable(self, FieldEffectData);

    self.id = reader:ReadUInt16(); 
    self.effectId = reader:ReadUInt16();--狀態編號
    self.round = reader:ReadByte();--持續回合
    self.kind = reader:ReadUInt16();--種類
    self.value = reader:ReadInt32(); --數值

    return self.id, self;
end

function FieldEffectData.Script5()
    if LuaHelper.CheckDefine("DemoCode") then
        local BBS = 54;
        for i = 1, 5 do
            BBS = BBS + i;
        end
        
        return BBS;
    end
end

function FieldEffectData.Script6()
    if LuaHelper.CheckDefine("DemoCode") then
        local BBS = 54;
        for i = 1, 5 do
            BBS = BBS + i;
        end
        
        return BBS;
    end
end

function FieldEffectData.Script7()
    if LuaHelper.CheckDefine("DemoCode") then
        local BBS = 54;
        for i = 1, 5 do
            BBS = BBS + i;
        end
        
        return BBS;
    end
end

function FieldEffectData.Script8()
    if LuaHelper.CheckDefine("DemoCode") then
        local BBS = 54;
        for i = 1, 5 do
            BBS = BBS + i;
        end
        
        return BBS;
    end
end

function FieldEffectData.Script9()
    if LuaHelper.CheckDefine("DemoCode") then
        local BBS = 54;
        for i = 1, 5 do
            BBS = BBS + i;
        end
        
        return BBS;
    end
end