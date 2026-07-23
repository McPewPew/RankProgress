local function RankProgress_OnEnter()
    local progress = GetPVPRankProgress() or 0
    local title = string.format(
        "%s - %.2f%%",
        RANK_POSITION,
        progress * 100
    )

    GameTooltip:SetOwner(HonorFrameProgressButton, "ANCHOR_RIGHT")
    GameTooltip:SetText(
        title,
        HIGHLIGHT_FONT_COLOR.r,
        HIGHLIGHT_FONT_COLOR.g,
        HIGHLIGHT_FONT_COLOR.b
    )
    GameTooltip:AddLine(
        NEWBIE_TOOLTIP_RANK_POSITION,
        NORMAL_FONT_COLOR.r,
        NORMAL_FONT_COLOR.g,
        NORMAL_FONT_COLOR.b,
        1
    )
    GameTooltip:Show()
end

local function RankProgress()
    if not HonorFrameProgressButton then
        return false
    end

    HonorFrameProgressButton:SetScript("OnEnter", RankProgress_OnEnter)
    return true
end

if not RankProgress() then
    local setup = CreateFrame("Frame")
    setup:RegisterEvent("PLAYER_ENTERING_WORLD")
    setup:SetScript("OnEvent", function()
        if RankProgress_Install() then
            this:UnregisterAllEvents()
        end
    end)
end
