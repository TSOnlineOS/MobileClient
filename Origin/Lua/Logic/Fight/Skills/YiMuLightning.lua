YiMuLightning = InheritsFromBaseAttackSkill();

function YiMuLightning:Update()
    local me = FightField.fightHum[self.humIdx];
    local target = FightField.fightHum[self.tarIdx];

    if self.step == 1 then
        local magicPos = me:GetMagicPos();
        me:SetMoment(magicPos.x, magicPos.y, false);
        me.roleController:SetAnimationForceId(ERolePose.Magic);

        self.interval = 0.8;
        self.step = 2;
    elseif self.step == 2 then
        if self:CheckInterval() then
            if target.party_Kind == EFightParty.Right then
                FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 11082, 90, 1, 4, 4, EEffectLightTracer.Stand, me.nowPos.x+60,me.nowPos.y+90, 20, false, 0);
            else
                FightField.attack[self.humIdx]:SetLightWithOrder(1, EEffectLightDis.Sky, 11083, 90, 1, 4, 4, EEffectLightTracer.Stand, me.nowPos.x-60,me.nowPos.y, 20, false, 0);
            end

            self.interval = 0.8;
            self.step = 3;
        end
    elseif self.step == 3 then
        if FightField.attack[self.humIdx].lights[1].orderCount == 4 then
            local colmPos;
            if target.party_Kind == EFightParty.Left then  --人在左
                colmPos = 1
            else
                colmPos = 2;
            end

            local startPos = target:RCtoSpot(colmPos,0, EFightSpot.Back ,10);
            local endPos = target:RCtoSpot(colmPos,4, EFightSpot.Back, 10);
            me:PlaySound(target.colm, target.row);
            FightField.attack[self.humIdx]:SetLightWithOrder(6, EEffectLightDis.Sky, 10503, 50, 1, 3, 7, EEffectLightTracer.Line, startPos.x, startPos.y, 255, false, 50, endPos.x, endPos.y, 0.3);
            FightField.attack[self.humIdx]:SetLightWithOrder(7, EEffectLightDis.Sky, 10504, 50, 1, 3, 7, EEffectLightTracer.Line, startPos.x, startPos.y, 255, false, 50, endPos.x, endPos.y, 0.3);
            FightField.attack[self.humIdx]:SetLightWithOrder(8, EEffectLightDis.Sky, 10016, 50, 1, 15, 15, EEffectLightTracer.Line, startPos.x, startPos.y, 30, true, 30, endPos.x, endPos.y, 0.3);

            FightField.attack[self.humIdx]:SetLightWithOrder(9, EEffectLightDis.Body, 10069, 100, 1, 4, 4, EEffectLightTracer.Line, startPos.x - 18, startPos.y, 30, true, 10, endPos.x, endPos.y, 0.3);
            FightField.attack[self.humIdx]:SetLightWithOrder(10, EEffectLightDis.Body, 10454, 80, 1, 4, 4, EEffectLightTracer.Line, startPos.x - 10, startPos.y, 30, true, 10, endPos.x, endPos.y, 0.3);
            FightField.attack[self.humIdx]:SetLightWithOrder(11, EEffectLightDis.Body, 10455, 70, 1, 4, 4, EEffectLightTracer.Line, startPos.x - 18, startPos.y, 30, true, 10, endPos.x, endPos.y, 0.3);

            for k, v in pairs(self.emyIdxAy) do
                target = FightField.fightHum[v];
                me:PlayEffect(target.colm, target.row, ERolePose.Hit,1);    --跳血挨打姿勢
                target.roleController:Hit();
            end

            self.interval = 0.8;
            self.step = 4;
        end
    elseif self.step == 4 then
        if self:CheckInterval() then
            self.isLightEnd = true;
            self.step = 5;
        end
    end
end