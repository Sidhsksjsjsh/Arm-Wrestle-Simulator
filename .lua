local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4 - EGG HUNT 🔥👀")
local workspace = game:GetService("Workspace")

local T1 = wndw:Tab("Main")
local T2 = wndw:Tab("Punch")
local T3 = wndw:Tab("Fight")
local T4 = wndw:Tab("Egg")
local T5 = wndw:Tab("Tool")

local handle = {
  egg = {},
  tool = {},
  zones = {},
  npc = {},
  pvp = {},
  arms = {},
  tier1 = {"Tier1","Tier2","Tier3","Tier4","Tier5","Tier6"},
  self = game.Players.LocalPlayer,
  toolname = {}
}

local tbl = {
  a1 = false,
  a2 = false,
  a3 = false,
  a4 = false,
  zone1 = handle.zones[1],
  tier1 = handle.tier1[1],
  a5 = false,
  npcf = handle.npc[1],
  zonef = handle.zones[1],
  a6 = false,
  eggsy = handle.egg[1],
  delete = {},
  a7 = false,
  tool = handle.toolname[1],
  zone2 = handle.zones[1]
}

for i,v in pairs(game:GetService("ReplicatedStorage").Tools:GetChildren()) do
lib:AddTable(v,handle.tool)
end

for i,v in pairs(workspace.GameObjects.ArmWrestling:GetChildren()) do
lib:AddTable(v.NPC,handle.npc)
end

--[[for i,v in pairs(workspace.GameObjects.ArmWrestling:GetChildren()) do
lib:AddTable(v.PVP,handle.pvp)
end]]

lib:AddTable(game:GetService("ReplicatedStorage").Tools,handle.toolname)
lib:AddTable(workspace.Zones,handle.zones)
lib:AddTable(game:GetService("ReplicatedStorage").Arms,handle.arms)
lib:AddTable(game:GetService("ReplicatedStorage").Eggs,handle.egg)

T1:Toggle("Auto click",false,function(value)
    tbl.a1 = value
    while wait() do
      if tbl.a1 == false then break end
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ArmWrestleService"]["RE"]["onClickRequest"]:FireServer()
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ToolService"]["RE"]["onClick"]:FireServer()
    end
end)

T1:Toggle("Auto claim all rewards",false,function(value)
    tbl.a2 = value
    while wait() do
      if tbl.a2 == false then break end
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["TimedRewardService"]["RE"]["onClaim"]:FireServer("1")
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["TimedRewardService"]["RE"]["onClaim"]:FireServer("2")
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["TimedRewardService"]["RE"]["onClaim"]:FireServer("3")
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["TimedRewardService"]["RE"]["onClaim"]:FireServer("4")
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["TimedRewardService"]["RE"]["onClaim"]:FireServer("5")
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["TimedRewardService"]["RE"]["onClaim"]:FireServer("6")
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["TimedRewardService"]["RE"]["onClaim"]:FireServer("7")
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["TimedRewardService"]["RE"]["onClaim"]:FireServer("8")
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["TimedRewardService"]["RE"]["onClaim"]:FireServer("9")
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["TimedRewardService"]["RE"]["onClaim"]:FireServer("10")
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["TimedRewardService"]["RE"]["onClaim"]:FireServer("11")
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["TimedRewardService"]["RE"]["onClaim"]:FireServer("12")
    end
end)

T1:Toggle("Auto spin",false,function(value)
    tbl.a3 = value
    while wait() do
      if tbl.a3 == false then break end
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["SpinService"]["RE"]["onSpinRequest"]:FireServer(false)
    end
end)

T2:Dropdown("Select zone",handle.zones,function(value)
    tbl.zone1 = value
end)

T2:Dropdown("Select punch bag tier",handle.tier1,function(value)
    tbl.tier1 = value
end)

T2:Toggle("Auto punch",false,function(value)
    tbl.a4 = value
    while wait() do
      if tbl.a4 == false then break end
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["PunchBagService"]["RE"]["onGiveStats"]:FireServer(tbl.zone1,tbl.tier1)
    end
end)

T3:Dropdown("Select zone",handle.zones,function(value)
    tbl.zonef = value
end)

T3:Dropdown("Select enemy",handle.npc,function(value)
    tbl.npcf = value
end)

T3:Toggle("Auto fight",false,function(value)
    tbl.a5 = value
    while wait() do
      if tbl.a5 == false then break end
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ArmWrestleService"]["RE"]["onEnterNPCTable"]:FireServer(tbl.npcf,workspace["GameObjects"]["ArmWrestling"][tbl.zonef]["NPC"][tbl.npcf]["Table"],tbl.zonef)
    end
end)

T4:Dropdown("Select egg",handle.egg,function(value)
    tbl.eggsy = value
end)

T4:Toggle("Auto hatch",false,function(value)
    tbl.a6 = value
    while wait() do
      if tbl.a6 == false then break end
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["EggService"]["RF"]["purchaseEgg"]:InvokeServer(tbl.eggsy,tbl.delete,false)
    end
end)

T4:Toggle("Auto equip best",false,function(value)
    tbl.a7 = value
    while wait() do
      if tbl.a7 == false then break end
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["PetService"]["RF"]["equipBest"]:InvokeServer(handle.self)
    end
end)

T5:Dropdown("Select tool",handle.toolname,function(value)
    tbl.tool = value
end)

T5:Dropdown("Select zone",handle.zone,function(value)
    tbl.zone2 = value
end)

T5:Button("Equip tool",function()
    for array = 1,#handle.tool do
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ToolService"]["RE"]["onGuiEquipRequest"]:FireServer(tbl.zone2,tbl.tool,handle.tool[array])
    end
end)

lib:HookFunction(function(method,self,args)
    if method == "InvokeServer" and self == "purchaseEgg" then
      tbl.delete = args[2]
    end
end)