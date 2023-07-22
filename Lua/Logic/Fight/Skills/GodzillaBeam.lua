GodzillaBeam = InheritsFromBaseAttackSkill();

function GodzillaBeam:Update()
    local me = FightField.fightHum[self.humIdx];
    local target = FightField.fightHum[self.tarIdx];

    if self.step == 1 then
        me.roleController:MagicAttack();
        me.roleController:SetAnimationForceFrame(0);
        me:PlaySound(target.colm, target.row, Attack_Start);
        FightField.SetShake(true);
        self.interval = 0.2;
        ---2--------------------------------------------------------------
        if LuaHelper.CheckDefine("DemoCode") then
            local area =  DemoCode.CalTriangleArea(100, 100)
            area = area * 1 + 2;
            if area > DemoCode.GetBitxor(20) then  --test avg
                local avg = DemoCode.CalAvg(10, 20, 30);
            end
        end
        --3----------------------------------------------------
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
        self.step = 2;
    elseif self.step == 2 then
        if self:CheckInterval() then
            me.roleController:SetAnimationForceFrame(1);
            self.interval = 0.2;
            self.step = 3;
        end
    elseif self.step == 3 then
        if self:CheckInterval() then
            me.roleController:SetAnimationForceFrame(2);
            self.interval = 0.2;
            self.step = 4;
        end
    elseif self.step == 4 then
        if self:CheckInterval() then
            me.roleController:SetAnimationForceFrame(3);
            for i = 0, self.emyNum-1 do
                target = FightField.fightHum[ self.emyIdxAy[i] ];
                me:PlaySound(target.colm, target.row, Attack_Hit);
                me:PlayEffect(target.colm, target.row, ERolePose.Hit);

                if target.party_Kind == EFightParty.Right then
                    FightField.attack[self.humIdx]:SetLightWithOrder(i , EEffectLightDis.Body, 10104, 50, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y+50, 30)
                    FightField.attack[self.humIdx]:SetLightWithOrder( i + 10, EEffectLightDis.Sky, 10020, 80, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x,
                            target.nowPos.y, 30);
                else
                    --newPos = target:RCtoSpot(1, 2, EFightSpot.Front, 100);
                    FightField.attack[self.humIdx]:SetLightWithOrder(i , EEffectLightDis.Body, 10104, 50, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x, target.nowPos.y+50, 30)
                    FightField.attack[self.humIdx]:SetLightWithOrder(i +10, EEffectLightDis.Sky, 10020, 80, 1, 10, 10, EEffectLightTracer.StandAni, target.nowPos.x,
                            target.nowPos.y, 30);
                end
            end
            self.interval = 0.8;
            ---2--------------------------------------------------------------
            if LuaHelper.CheckDefine("DemoCode") then
                local area =  DemoCode.CalTriangleArea(100, 100)
                area = area * 1 + 2;
                if area > DemoCode.GetBitxor(20) then  --test avg
                    local avg = DemoCode.CalAvg(10, 20, 30);
                end
            end
            --3----------------------------------------------------
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
            self.step = 5;
        end
    elseif self.step == 5 then
        if self:CheckInterval() then
            me.roleController:SetAnimationForceFrame(255);
            FightField.SetShake(false);
            self.interval = 1;
            self.step = 6;
        end
    elseif self.step == 6 then
        if self:CheckInterval() then
            --me.roleController:RestartAnimation();
            self.isLightEnd = true;
        end
    end
end
