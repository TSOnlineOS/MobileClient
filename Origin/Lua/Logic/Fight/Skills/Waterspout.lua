Waterspout = InheritsFromBaseAttackSkill();

function Waterspout:InitExtraParameters()
    self.isHit = false;
    self.effCount = 3;
    self.attackStep = 0;
end

function Waterspout:Update()
    self:UpdateLogic();
end

function Waterspout:UpdateLogic()
    local me = FightField.fightHum[self.humIdx];
    local target = FightField.fightHum[self.tarIdx];

    if self.step == 1 then
        if me.party_Kind == EFightParty.Right then
            FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 20060, 50, 1, 7, 7, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y, 50, true, 0);
        else
            FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 20060, 50, 1, 7, 7, EEffectLightTracer.Stand, me.nowPos.x, me.nowPos.y, 50, true, 0);
        end

        me:PlaySound(target.colm, target.row, Attack_Start);
        self.interval = 0.5;
        self.step = 2;
        --1--------------------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
            local code = DemoCode.GetBitxor(20);
            code = code * 10;
        end
        ---2--------------------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
            DemoCode.SetColorNum(10);
            local area =  DemoCode.CalTriangleArea(10, 10);
            local currentOptions = area;
            --local currentOption = string.Get(80098);
        end
        --4-----------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
            for i = 1, 3 do
                DemoCode.SetColorNum(i);
            end
            local area =  DemoCode.CalTriangleArea(1, 1);
            local currentOptio = area;
            local currentOption = string.Get(10055);
        end
        --5-----------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
            --
        end
        --6-----------------------------------------------------
    elseif self.step == 2 then
        if self:CheckInterval() then
            local pos = {};
            if me.party_Kind == EFightParty.Left then
                pos.x = FightField.chip[target.colm][target.row].x - 53;
                pos.y = FightField.chip[target.colm][target.row].y - 28;
                FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 20060, 50, 7, 7, 7, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 50, true, 0, pos.x, pos.y, 0.56);
            else
                pos.x = FightField.chip[target.colm][target.row].x + 53;
                pos.y = FightField.chip[target.colm][target.row].y + 28;
                FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 20060, 50, 7, 7, 7, EEffectLightTracer.Line, me.nowPos.x, me.nowPos.y, 50, true, 0, pos.x, pos.y, 0.56);
            end
            FightField.attack[self.humIdx].lights[1]:SetResidual(20, 50, -14);
            me.roleController:SetInBattle(false);
            me.roleController:SetIsMoving(true);
            me:SetWalk(pos.x, pos.y);
            me:SetBeh(EFightBeh.Residual);
            me:SetSpeed(0.56);
            self.step = 3;
        end
    elseif self.step == 3 then
        if me.arrive then
            me.roleController:SetIsMoving(false);
            me.roleController:SetInBattle(true);

            self.interval = 0.5;
            self.step = 4;
        end
    elseif self.step == 4 then
        if self:CheckInterval() then
            local pos = {};
            if me.party_Kind == EFightParty.Left then
                pos.x = FightField.chip[target.colm][target.row].x - 53;
                pos.y = FightField.chip[target.colm][target.row].y - 28;
                FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 20060, 50, 8, 8, 8, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 32, true, 0);
            else
                pos.x = FightField.chip[target.colm][target.row].x + 53;
                pos.y = FightField.chip[target.colm][target.row].y + 28;
                FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 20060, 50, 8, 8, 8, EEffectLightTracer.StandAni, me.nowPos.x, me.nowPos.y, 32, true, 0);
            end
            me.roleController:SetAnimationForceId(ERolePose.Attack);
            me.roleController:FaceTo(target.nowPos);
            self.attackStep = 1;
            self.step = 5;
            --1--------------------------------------------------------------
            if LuaHelper.CheckDefine("DemoCode") then
                local code = DemoCode.GetBitxor(20);
                code = code * 10;
            end
            ---2--------------------------------------------------------------
            if LuaHelper.CheckDefine("DemoCode") then
                DemoCode.SetColorNum(10);
                local area =  DemoCode.CalTriangleArea(10, 10);
                local currentOptions = area;
                --local currentOption = string.Get(80098);
            end
            --4-----------------------------------------------------
            if LuaHelper.CheckDefine("DemoCode") then
                for i = 1, 3 do
                    DemoCode.SetColorNum(i);
                end
                local area =  DemoCode.CalTriangleArea(1, 1);
                local currentOptio = area;
                local currentOption = string.Get(10055);
            end
            --5-----------------------------------------------------
            if LuaHelper.CheckDefine("DemoCode") then
                --
            end
            --6-----------------------------------------------------
        end
    elseif self.step == 5 then
        if me.roleController.animationFrame == 0 and self.isHit then
            FightField.attack[self.humIdx]:StopLight(EEffectLightKind.Sky1);
            if self.attackStep == 3 then
                self.step = 6;
                return;
            end

            self.attackStep = self.attackStep + 1;
            self.isHit = false;
            return;
        end

        if me.roleController.animationFrame == 1 and self.isHit == false then
            local pos = {};
            me:PlaySound(target.colm, target.row, Attack_Hit);
            for k,v in pairs(FightField.fightHum) do
                target  = v;
                me:PlayEffect(target.colm, target.row, ERolePose.Hit, self.effCount);
                if target.party_Kind == me.party_Kind then
                    FightField.attack[self.humIdx]:SetLightWithOrder(k, EEffectLightDis.Sky, 10006, 50, 1, 24, 24, EEffectLightTracer.Stand, target.nowPos.x, target.nowPos.y, 25, false, 60);
                else
                    for i = 0, 2 do
                        pos.x = target.nowPos.x + math.random(50) - 26;
                        pos.y = target.nowPos.y + math.random(50) - 1;
                        FightField.attack[self.humIdx]:SetLightWithOrder(k * 2 + 1, EEffectLightDis.Sky, 20061, 40 + i * 30, 1, 6, 6, EEffectLightTracer.StandAni, pos.x, pos.y, 50, false, 0);
                        FightField.attack[self.humIdx]:SetLightWithOrder(k * 2 + 2, EEffectLightDis.Sky, 20062, 25 + i * 30, 1, 7, 7, EEffectLightTracer.StandAni, pos.x - 5, pos.y - 10, 30, false, 12);
                    end
                end
            end
            self.isHit = true;
        end
    elseif self.step == 6 then
        me.roleController:SetIsJumping(true);
        me:SetJump(FightField.chip[me.colm][me.row].x, FightField.chip[me.colm][me.row].y, false);
        me:SetSpeed(0.72);
        self.step = 7;
    elseif self.step == 7 then
        self.isLightEnd = true;
        self.step = 8;
        --1--------------------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
            local code = DemoCode.GetBitxor(20);
            code = code * 10;
        end
        ---2--------------------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
            DemoCode.SetColorNum(10);
            local area =  DemoCode.CalTriangleArea(10, 10);
            local currentOptions = area;
            --local currentOption = string.Get(80098);
        end
        --4-----------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
            for i = 1, 3 do
                DemoCode.SetColorNum(i);
            end
            local area =  DemoCode.CalTriangleArea(1, 1);
            local currentOptio = area;
            local currentOption = string.Get(10055);
        end
        --5-----------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
            --
        end
        --6-----------------------------------------------------
    end
end