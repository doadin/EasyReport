local EasyReport = LibStub("AceAddon-3.0"):NewAddon("EasyReport", "AceConsole-3.0")
local er = EasyReport
local AceGUI = LibStub("AceGUI-3.0")

local WOW_PROJECT_ID = _G.WOW_PROJECT_ID
local WOW_PROJECT_CLASSIC = _G.WOW_PROJECT_CLASSIC
local WOW_PROJECT_BURNING_CRUSADE_CLASSIC = _G.WOW_PROJECT_BURNING_CRUSADE_CLASSIC
local WOW_PROJECT_MAINLINE = _G.WOW_PROJECT_MAINLINE
local CreateFrame = _G.CreateFrame
local tinsert = _G.tinsert
local UISpecialFrames = _G.UISpecialFrames

local function IsClassicWow() --luacheck: ignore 212
	return WOW_PROJECT_ID == WOW_PROJECT_CLASSIC
end

local function IsTBCWow() --luacheck: ignore 212
	return WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC
end

local function IsRetailWow() --luacheck: ignore 212
	return WOW_PROJECT_ID == WOW_PROJECT_MAINLINE
end

local C_ChatInfo
if IsClassicWow() or IsTBCWow() then
    C_ChatInfo = _G.C_ChatInfo
end
local C_ReportSystem
if IsRetailWow() then
    C_ReportSystem = _G.C_ReportSystem
end

local function ReportPlayerSpam()
    if IsClassicWow() or IsTBCWow() then
        C_ChatInfo.ReportPlayer(PLAYER_REPORT_TYPE_SPAM, PlayerLocation:CreateFromUnit("target"))
    end
    if IsRetailWow() then
        C_ReportSystem.OpenReportPlayerDialog(PLAYER_REPORT_TYPE_SPAM, UnitName("target"), PlayerLocation:CreateFromUnit("target"))
    end
end

local function ReportPlayerLanguage()
    if IsClassicWow() or IsTBCWow() then
        C_ChatInfo.ReportPlayer(PLAYER_REPORT_TYPE_LANGUAGE, PlayerLocation:CreateFromUnit("target"))
    end
    if IsRetailWow() then
        C_ReportSystem.OpenReportPlayerDialog(PLAYER_REPORT_TYPE_LANGUAGE, UnitName("target"), PlayerLocation:CreateFromUnit("target"))
    end
end

local function ReportPlayerAbuse()
    if IsClassicWow() or IsTBCWow() then
        C_ChatInfo.ReportPlayer(PLAYER_REPORT_TYPE_ABUSE, PlayerLocation:CreateFromUnit("target"))
    end
    if IsRetailWow() then
        C_ReportSystem.OpenReportPlayerDialog(PLAYER_REPORT_TYPE_ABUSE, UnitName("target"), PlayerLocation:CreateFromUnit("target"))
    end
end

local function ReportPlayerBadPlayerName()
    if IsClassicWow() or IsTBCWow() then
        C_ChatInfo.ReportPlayer(PLAYER_REPORT_TYPE_BAD_PLAYER_NAME, PlayerLocation:CreateFromUnit("target"))
    end
    if IsRetailWow() then
        C_ReportSystem.OpenReportPlayerDialog(PLAYER_REPORT_TYPE_BAD_PLAYER_NAME, UnitName("target"), PlayerLocation:CreateFromUnit("target"))
    end
end

local function ReportPlayerBadGuildName()
    if IsClassicWow() or IsTBCWow() then
        C_ChatInfo.ReportPlayer(PLAYER_REPORT_TYPE_BAD_GUILD_NAME, PlayerLocation:CreateFromUnit("target"))
    end
    if IsRetailWow() then
        C_ReportSystem.OpenReportPlayerDialog(PLAYER_REPORT_TYPE_BAD_GUILD_NAME, UnitName("target"), PlayerLocation:CreateFromUnit("target"))
    end
end

local function ReportPlayerCheating()
    if IsClassicWow() or IsTBCWow() then
        C_ChatInfo.ReportPlayer(PLAYER_REPORT_TYPE_CHEATING, PlayerLocation:CreateFromUnit("target"))
    end
    if IsRetailWow() then
        C_ReportSystem.OpenReportPlayerDialog(PLAYER_REPORT_TYPE_CHEATING, UnitName("target"), PlayerLocation:CreateFromUnit("target"))
    end
end

local function ReportPlayerBadBattlePatName()
    if IsClassicWow() or IsTBCWow() then
        --C_ChatInfo.ReportPlayer("badbattlepetname", PlayerLocation:CreateFromUnit("target"))
        return
    end
    if IsRetailWow() then
        C_ReportSystem.OpenReportPlayerDialog(PLAYER_REPORT_TYPE_BAD_BATTLEPET_NAME, UnitName("target"), PlayerLocation:CreateFromUnit("target"))
    end
end

local function ReportPlayerBadPetName()
    if IsClassicWow() or IsTBCWow() then
        C_ChatInfo.ReportPlayer(PLAYER_REPORT_TYPE_BAD_PET_NAME, PlayerLocation:CreateFromUnit("target"))
    end
    if IsRetailWow() then
        C_ReportSystem.OpenReportPlayerDialog(PLAYER_REPORT_TYPE_BAD_PET_NAME, UnitName("target"), PlayerLocation:CreateFromUnit("target"))
    end
end

local function ReportServerLag()
    if IsClassicWow() or IsTBCWow() then
        C_ChatInfo.ReportServerLag()
    end
    if IsRetailWow() then
        C_ReportSystem.ReportServerLag()
    end
end
local function close(widget)
    --AceGUI:Release(widget)
    print("close clicked")
end

--local options = {}
--options = LibStub("AceDBOptions-3.0"):GetOptionsTable(options)
--LibStub("AceConfig-3.0"):RegisterOptionsTable("EasyReport", options)
-- Use AceConsole-3.0 to register a Chat Command
er:RegisterChatCommand("easyreport", "ChatCommand")
er:RegisterChatCommand("er", "ChatCommand")

-- Show the GUI if no input is supplied, otherwise handle the chat input.
function er:ChatCommand(input)
  -- Assuming "MyOptions" is the appName of a valid options table
  if not input or input:trim() == "" then
    --LibStub("AceConfigDialog-3.0"):Open("MyOptions")
    -- Create a container frame
    if _G["EasyReportFrame"] then
        --print("Frame already Exists")
        return
    end
    local f = AceGUI:Create("Frame")
    -- Add the frame as a global variable under the name `MyGlobalFrameName`
    _G["EasyReportFrame"] = f.frame
    -- Register the global variable `MyGlobalFrameName` as a "special frame"
    -- so that it is closed when the escape key is pressed.
    tinsert(UISpecialFrames, "EasyReportFrame")

    f:SetCallback("OnClose",function(widget) AceGUI:Release(widget) ; _G["EasyReportFrame"] = nil end)
    f:SetTitle("Easy Report")
    f:SetWidth(200)
    f:SetHeight(290)
    f:SetLayout("List")
    if EasyReportFramePossition then
        print("Restoring possition")
        f:SetPoint(EasyReportFramePossition)
    end
    -- Create a button
    local btn1 = AceGUI:Create("Button")
    btn1:SetWidth(165)
    btn1:SetText("Spaming!")
    btn1:SetCallback("OnClick", ReportPlayerSpam)
    -- Add the button to the container
    f:AddChild(btn1)
    -- Create a button
    local btn2 = AceGUI:Create("Button")
    btn2:SetWidth(165)
    btn2:SetText("Language!")
    btn2:SetCallback("OnClick", ReportPlayerLanguage)
    -- Add the button to the container
    f:AddChild(btn2)
    -- Create a button
    local btn3 = AceGUI:Create("Button")
    btn3:SetWidth(165)
    btn3:SetText("Abuse!")
    btn3:SetCallback("OnClick", ReportPlayerAbuse)
    -- Add the button to the container
    f:AddChild(btn3)
    -- Create a button
    local btn4 = AceGUI:Create("Button")
    btn4:SetWidth(165)
    btn4:SetText("Bad Player Name!")
    btn4:SetCallback("OnClick", ReportPlayerBadPlayerName)
    -- Add the button to the container
    f:AddChild(btn4)
    -- Create a button
    local btn5 = AceGUI:Create("Button")
    btn5:SetWidth(165)
    btn5:SetText("Bad Guild Name!")
    btn5:SetCallback("OnClick", ReportPlayerBadGuildName)
    -- Add the button to the container
    f:AddChild(btn5)
    -- Create a button
    local btn6 = AceGUI:Create("Button")
    btn6:SetWidth(165)
    btn6:SetText("Cheating!")
    btn6:SetCallback("OnClick", ReportPlayerCheating)
    -- Add the button to the container
    f:AddChild(btn6)
    -- Create a button
    local btn7 = AceGUI:Create("Button")
    btn7:SetWidth(165)
    btn7:SetText("Bad Battle Pet Name!")
    btn7:SetCallback("OnClick", ReportPlayerBadBattlePatName)
    -- Add the button to the container
    f:AddChild(btn7)
    -- Create a button
    local btn8 = AceGUI:Create("Button")
    btn8:SetWidth(165)
    btn8:SetText("Bad Pet Name!")
    btn8:SetCallback("OnClick", ReportPlayerBadPetName)
    -- Add the button to the container
    f:AddChild(btn8)
    -- Create a button
    local btn9 = AceGUI:Create("Button")
    btn9:SetWidth(165)
    btn9:SetText("Report Server Lag")
    btn9:SetCallback("OnClick", ReportServerLag)
    -- Add the button to the container
    f:AddChild(btn9)

    -- Create a button
    local btn10 = AceGUI:Create("Button")
    btn10:SetWidth(165)
    btn10:SetText("Close")
    btn10:SetCallback("OnClick", close)
    -- Add the button to the container
    --f:AddChild(btn10)

    f:PauseLayout()
  end
  if input == "spam" then
      ReportPlayerSpam()
  end
  if input == "language" then
      ReportPlayerLanguage()
  end
  if input == "abuse" then
      ReportPlayerAbuse()
  end
  if input == "badplayername" then
      ReportPlayerBadPlayerName()
  end
  if input == "badguildname" then
      ReportPlayerBadGuildName()
  end
  if input == "cheating" then
      ReportPlayerCheating()
  end
  if input == "badbattlepetname" then
      ReportPlayerBadBattlePatName()
  end
  if input == "badpetname" then
      ReportPlayerBadPetName()
  end
  if input == "serverlag" then
    ReportServerLag()
  end
end

function er:OnInitialize()
    er:Print("Easy Report Enabled!")

end

function er:OnEnable()
    -- Called when the addon is enabled
end

function er:OnDisable()
    -- Called when the addon is disabled
end

local function OnEvent(self, event, ...)
    if IsClassicWow() or IsTBCWow() then
        print("Report Made")
    end
    if ... == true then
        print("Report Made")
    end
    if ... == false then
        print("Report Failed")
    end
    if event == "GLOBAL_MOUSE_DOWN" then
        --print(_G["EasyReportFrame"]:GetPoint())
    end
    if event == "GLOBAL_MOUSE_UP" then
        --print(_G["EasyReportFrame"]:GetPoint())
        if _G["EasyReportFrame"] then
            --print("saveing possition")
            --point, relativeTo, relativePoint, xOfs, yOfs = _G["EasyReportFrame"]:GetPoint()
            --EasyReportFramePossition = point .. ", " .. "nil" .. ", " .. relativePoint .. ", " .. xOfs .. ", " .. yOfs
            --EasyReportFramePossition = point .. ", " .. " " .. ", " .. relativePoint
            EasyReportFramePossition = _G["EasyReportFrame"]:GetPoint()
            --print(EasyReportFramePossition)
        end
    end
end

if IsClassicWow() or IsTBCWow() then
    local EventFrame = CreateFrame("Frame")
    EventFrame:RegisterEvent("PLAYER_REPORT_SUBMITTED")
    EventFrame:SetScript("OnEvent", OnEvent)
end

if IsRetailWow() then
    local EventFrame = CreateFrame("Frame")
    EventFrame:RegisterEvent("REPORT_PLAYER_RESULT")
    EventFrame:RegisterEvent("GLOBAL_MOUSE_DOWN")
    EventFrame:RegisterEvent("GLOBAL_MOUSE_UP")
    EventFrame:SetScript("OnEvent", OnEvent)
end