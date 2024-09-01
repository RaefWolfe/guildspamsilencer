-- Hack to block achievement alerts
local AchievementAlertSystem_AddAlert = _G.AchievementAlertSystem.AddAlert
_G.AchievementAlertSystem.AddAlert = function(...)
    local id = select(2, ...)
    if id and id == 5130 or id == 7843 or id == 5129 or id == 7844 or id == 5892 or id == 5812 or id == 5126 or id == 5145 or id == 6644  or id == 6664 or id == 5131 or id == 5128 or id == 5179 or id == 5167 or id == 5031 or id == 5171 or id == 5173 or id == 5168 or id == 5170 or id == 5175 or id == 5176 or id == 5169 or id == 5172 or id == 5174 or id == 6532 or id == 5178 or id == 5177 or id == 6533 then
        return
    end
    return AchievementAlertSystem_AddAlert(...)
end

-- Mute Alert Sound
local frame = CreateFrame("Frame")
frame:SetScript(
    "OnEvent",
    function(_, event, id)
        if event == "ACHIEVEMENT_EARNED" and (id and id == 5130 or id == 7843 or id == 5129 or id == 7844 or id == 5892 or id == 5812 or id == 5126 or id == 5145 or id == 6644 or id == 6664 or id == 5131 or id == 5128 or id == 5179 or id == 5167 or id == 5031 or id == 5171 or id == 5173 or id == 5168 or id == 5170 or id == 5175 or id == 5176 or id == 5169 or id == 5172 or id == 5174 or id == 6532 or id == 5178 or id == 5177 or id == 6533) then
            MuteSoundFile(569143)
            C_Timer.After(
                2,
                function()
                    UnmuteSoundFile(569143)
                end
            )
        end
    end
)
frame:RegisterEvent("ACHIEVEMENT_EARNED")

-- Mute "has come online" noise and message
local frame = CreateFrame("Frame")
local function OnEvent(self, event, message)
    if event == "CHAT_MSG_SYSTEM" and message and message:find("has come online") then
        ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", function(_, _, msg)
            return msg:find("has come online")
        end)
        MuteSoundFile(567518)
    end
end
frame:RegisterEvent("CHAT_MSG_SYSTEM")
frame:SetScript("OnEvent", OnEvent)