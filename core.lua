EasyReport = LibStub("AceAddon-3.0"):NewAddon("EasyReport", "AceConsole-3.0")
local er = EasyReport
local AceGUI = LibStub("AceGUI-3.0")

local function ReportPlayerSpam()
    C_ReportSystem.OpenReportPlayerDialog(PLAYER_REPORT_TYPE_SPAM, UnitName("target"), PlayerLocation:CreateFromUnit("target"))
end

local function ReportPlayerLanguage()
    C_ReportSystem.OpenReportPlayerDialog(PLAYER_REPORT_TYPE_LANGUAGE, UnitName("target"), PlayerLocation:CreateFromUnit("target"))
end

local function ReportPlayerAbuse()
    C_ReportSystem.OpenReportPlayerDialog(PLAYER_REPORT_TYPE_ABUSE, UnitName("target"), PlayerLocation:CreateFromUnit("target"))
end

local function ReportPlayerBadPlayerName()
    C_ReportSystem.OpenReportPlayerDialog(PLAYER_REPORT_TYPE_BAD_PLAYER_NAME, UnitName("target"), PlayerLocation:CreateFromUnit("target"))
end

local function ReportPlayerBadGuildName()
    C_ReportSystem.OpenReportPlayerDialog(PLAYER_REPORT_TYPE_BAD_GUILD_NAME, UnitName("target"), PlayerLocation:CreateFromUnit("target"))
end

local function ReportPlayerCheating()
    C_ReportSystem.OpenReportPlayerDialog(PLAYER_REPORT_TYPE_CHEATING, UnitName("target"), PlayerLocation:CreateFromUnit("target"))
end

local function ReportPlayerBadBattlePatName()
    C_ReportSystem.OpenReportPlayerDialog(PLAYER_REPORT_TYPE_BAD_BATTLEPET_NAME, UnitName("target"), PlayerLocation:CreateFromUnit("target"))
end

local function ReportPlayerBadPetName()
    C_ReportSystem.OpenReportPlayerDialog(PLAYER_REPORT_TYPE_BAD_PET_NAME, UnitName("target"), PlayerLocation:CreateFromUnit("target"))
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
    local f = AceGUI:Create("Frame")
    f:SetCallback("OnClose",function(widget) AceGUI:Release(widget) end)
    f:SetTitle("Easy Report")
    f:SetWidth(200)
    f:SetHeight(260)
    f:SetLayout("List")
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

--function er:REPORT_PLAYER_RESULT()
--    local success = success 
--    print("Report Made", success)
--end
--
----Events
--er:RegisterEvent("REPORT_PLAYER_RESULT")