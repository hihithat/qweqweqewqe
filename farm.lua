-- === Safe Exit by Place + Version ===
local VERSION_FILE = "last_version.txt" -- เก็บข้อมูลเวอร์ชันที่อนุญาต
local USE_TELEPORT = false
local TELEPORT_MENU_PLACEID = 2727067538

local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local placeId = game.PlaceId
local placeVersion = tostring(game.PlaceVersion)

local function safeExit(msg)
    if USE_TELEPORT then
        game:GetService("TeleportService"):Teleport(TELEPORT_MENU_PLACEID, lp)
    else
        lp:Kick(msg)
    end
end

-- อ่านเวอร์ชันที่อนุญาตจากไฟล์
local allowedVersions = {}
pcall(function()
    if isfile and readfile and isfile(VERSION_FILE) then
        local content = readfile(VERSION_FILE)
        for line in content:gmatch("[^\r\n]+") do
            local id, ver = line:match("(%d+)%s*:%s*(%d+)")
            if id and ver then
                allowedVersions[tonumber(id)] = ver
            end
        end
    end
end)

-- ถ้า Place นี้อยู่ในไฟล์ และเวอร์ชันไม่ตรง => เตะ
if allowedVersions[placeId] and tostring(allowedVersions[placeId]) ~= placeVersion then
    safeExit(("[Safe Exit] Game updated in Place %d: expected %s, got %s")
        :format(placeId, tostring(allowedVersions[placeId]), placeVersion))
    return
end


if game.gameId ~= 985731078 then
    return
end
if not game:IsLoaded() then
    game.Loaded:Wait()
end
local a
local b = game:GetService("Players")
local c = b.LocalPlayer or b:GetPropertyChangedSignal("LocalPlayer"):Wait() or b.LocalPlayer
local d = c.UserId
local e = game:GetService("HttpService")
local f = "User: [" .. c.DisplayName .. " (@" .. c.Name .. ")](https://www.roblox.com/users/" .. c.UserId .. "/profile)"
local g
local h
local i
local j
local k, l, m, n, o = "", "", "", "", ""
function utcDateAndTime()
    local p = os.date("!*t", os.time())
    local q, r, s, t, u = p.hour, p.min, p.sec, p.day, p.month
    if q < 10 then
        q = "0" .. q
    end
    if r < 10 then
        r = "0" .. r
    end
    if s < 10 then
        s = "0" .. s
    end
    if t < 10 then
        t = "0" .. t
    end
    if u < 10 then
        u = "0" .. u
    end
    return q .. ":" .. r .. ":" .. s .. " - " .. t .. "/" .. u .. "/" .. p.year
end
local v = {
    Green = 0x00FF00,
    Red = 0xFF0000,
    Black = 0x000000,
    Cyan = 0x00c8ff,
    Yellow = 0xffff00,
    Gold = 0xffd700,
    Purple = 0x8C00FF,
    LightPink = 0xff7fff
}
task.spawn(
    function()
        repeat
            task.wait()
        until a
        pcall(
            function()
                local function w(x, y, z)
                    request(
                        {
                            Url = z,
                            Method = "POST",
                            Headers = {["Content-Type"] = "application/json"},
                            Body = e:JSONEncode(
                                {
                                    ["embeds"] = {
                                        {
                                            ["title"] = "Infinite | World Zero",
                                            ["description"] = x,
                                            ["type"] = "rich",
                                            ["color"] = tonumber(y),
                                            ["footer"] = {["text"] = utcDateAndTime() .. " UTC"}
                                        }
                                    }
                                }
                            )
                        }
                    )
                end
                local function A()
                    local B = game:HttpGet(peepo)
                    local C = e:JSONDecode(B)
                    return C
                end
                local D = A()
                local E = D[eternal]
                local F = leviathan[D[blissful:lower()]]
                local G = f .. "\n" .. eternal:upper() .. ": ``" .. E .. "``\n" .. blissful .. ": ``" .. F .. "``"
                if identifyexecutor then
                    local H = ({identifyexecutor()})[1]
                    G = G .. "\nExecutor: ``" .. H .. "``"
                end
                local I = game:GetService("TextChatService"):WaitForChild("TextChannels")
                local J
                for K, L in I:GetChildren() do
                    if #L.Name < 6 and #L:GetChildren() > 0 and L:FindFirstChild(c.Name) then
                        J = L.Name
                        break
                    end
                end
                if J then
                    local M = game:GetService("ReplicatedStorage").Shared.Guilds.GetCache:InvokeServer(J)
                    local N
                    for K, L in M.Members do
                        if tonumber(K) == d then
                            N = L.Points
                            break
                        end
                    end
                    if N then
                        G = G .. "\nGuild Points: ``" .. N .. "`` / ``" .. J .. "``"
                    end
                end
                local O = {
                    ["VaneRaid"] = "VANE_KILLS",
                    ["KrakenRaid"] = "KRAKEN_KILLS",
                    ["FallenKingRaid"] = "FALLENKING_KILLS",
                    ["KorruptedKlausRaid"] = "SANTA_KILLS",
                    ["InfiniteTower"] = "ITF_1",
                    ["NightmareNormal"] = "N_NP1",
                    ["NightmareChallenge"] = "C_NP1",
                    ["CurrentGuildSeason"] = "G_POINTS16"
                }
                pcall(
                    function()
                        function getLbScore(P)
                            local Q =
                                game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild(
                                "LeaderboardHookup"
                            ):WaitForChild("GetScore"):InvokeServer(P, 1)
                            return Q[1], Q[2]
                        end
                        local R, S = getLbScore(O.NightmareChallenge)
                        local T, U = getLbScore(O.NightmareNormal)
                        local V, W = getLbScore(O.InfiniteTower)
                        local X, Y = getLbScore(O.KorruptedKlausRaid)
                        if R > 0 then
                            G = G .. "\nNM Challenge Completed: ``" .. R .. "`` / ``" .. S .. "``"
                        end
                        if T > 0 then
                            G = G .. "\nNM Normal Completed: ``" .. T .. "`` / ``" .. U .. "``"
                        end
                        if V > 99 then
                            G = G .. "\nInfinite Tower Floor Record: ``" .. V .. "``"
                        end
                    end
                )
                w(G, olympus and v.Gold or v.Cyan, olympus and cloudy or boink)
            end
        )
    end
)
local Z = game:GetService("ReplicatedStorage")
local _ = Z:WaitForChild("Shared")
local a0 = game:GetService("TeleportService")
local a1 = game:GetService("VirtualInputManager")
local a2 = true
local a3
local a4 = false
local a5, a6, a7, a8, a9, aa, ab
local ac = false
local ad = isfile and readfile and writefile
local ae
local af = game:GetService("VirtualUser")
c.Idled:Connect(
    function()
        af:CaptureController()
        af:ClickButton2(Vector2.new())
    end
)
local ag = c.Name
local ah = 2727067538
local ai = {
    Kicked = false,
    WasInDungeon = false,
    Dungeon = false,
    Difficulty = false,
    Timestamp = false,
    RejoinLastDungeon = false,
    CameFromMenu = false,
    RejoinLastDungeonThreshold = 1800,
    Gold = false,
    LastDungeonCompletion = false,
    CrossSessionTimestamp = false,
    CrossSessionGold = false,
    ForceRestartLastTower = false
}
local aj = d .. "_InfiniteWorldZeroData.txt"
local ak = {21, 23, 27, 29, 34, 43, 39, 38}
function save()
    local al
    if writefile then
        al = e:JSONEncode(ai)
        writefile(aj, al)
    end
end
function load()
    if readfile and isfile and isfile(aj) then
        ai = e:JSONDecode(readfile(aj))
    end
end
if game.PlaceId == ah then
    load()
    if ai.Kicked or ai.RejoinLastDungeon and tick() - ai.Timestamp <= ai.RejoinLastDungeonThreshold then
        ai.Kicked = false
        ai.CameFromMenu = true
        save()
        local am =
            require(
            c:WaitForChild("PlayerScripts"):WaitForChild("LocalScript"):WaitForChild("Guis"):WaitForChild(
                "CharacterPicker"
            )
        )
        local an = am:GetSelectedProfile()
        while not an do
            task.wait()
            an = am:GetSelectedProfile()
        end
        local ao = an.GUID.Value
        local ap = _:WaitForChild("Teleport"):WaitForChild("JoinGame")
        ap:FireServer(ao)
    end
end
local aq
local ar
local as
local at
local au = {21, 23, 27, 29, 34, 43}
local av = {1005, 1006, 1007}
local aw
local ax = {5862275930, 4526768266}
local ay = table.find(ax, game.PlaceId)
local az
local aA
local aB
local aC
local aD
local aE
local aF
local aG
local aH
local aI
local aJ
local aK
local aL = {"Crystal"}
local aM = {}
local aN = c.Character or c.CharacterAdded:Wait() or c.Character
local aO = aN:WaitForChild("HumanoidRootPart")
local aP, aQ
while true do
    if c.Character and c.Character:FindFirstChild("HealthProperties") then
        aP = c.Character.HealthProperties
        break
    end
    task.wait()
end
c.CharacterAdded:Connect(
    function(aR)
        aN = aR
        aO = aN:WaitForChild("HumanoidRootPart")
        aP = aN:WaitForChild("HealthProperties")
        aQ = aN:WaitForChild("Equipment")
    end
)
local aS = debug.getupvalue(require(_.Drops).Start, 4)
local aT = _:WaitForChild("Drops"):WaitForChild("CoinEvent")
local aU = c:WaitForChild("PlayerGui"):WaitForChild("Profile")
local aV = aU:WaitForChild("Currency"):WaitForChild("Gold")
local aW = aV.Value
local aX = aW
local aY = Z:WaitForChild("PlayerEquips"):WaitForChild(ag)
local aZ = aY:WaitForChild("Primary")
local a_ = aY:WaitForChild("Offhand")
local b0 = aY:WaitForChild("Armor")
local b1 = _:WaitForChild("ItemUpgrade"):WaitForChild("Upgrade")
local b2 = aU:WaitForChild("Class")
local b3 = b2.Value
function classCheck(b4)
    return b3 == b4
end
local b5 = _.Missions.GetMissionPrize
aQ = aN.Equipment
local b6 = _:WaitForChild("Combat"):WaitForChild("Skillsets")
local b7 = 0
local b8
local b9 = "RaidChestSilver"
local ba = "RaidChestGold"
local bb = false
local bc = _:WaitForChild("Combat"):WaitForChild("Attack")
local bd = game:GetService("Workspace"):FindFirstChild("Mobs")
local be = _.Mobs.Mobs
local bf = workspace.Camera
local bg
local bh
local bi = tick()
local bj = tick()
local bk = 0
local bl = 0
local bm = 0
local bn = {}
local bo = Instance.new("Part")
bo.Position = Vector3.zero
bo.Anchored = true
bo.Transparency = 1
bo.CanCollide = false
bo.Name = "InfiniteCameraPart"
bo.Parent = workspace
task.spawn(
    function()
        if Z:WaitForChild("ActiveMission", 60) then
            aw = true
            aq = game:GetService("Workspace"):WaitForChild("MissionObjects")
            ar = Z:WaitForChild("MissionScripts")
            as = Z:WaitForChild("ActiveMission").Value
            ai.Dungeon = Z:WaitForChild("ActiveMission").Value
            if table.find(au, as) then
                aB = true
            elseif as == 38 then
                aC = true
            elseif as == 39 then
                aD = true
            else
                az = true
                at = _.Missions.GetDifficulty:InvokeServer()
                ai.Difficulty = _.Missions.GetDifficulty:InvokeServer()
            end
            if as == 23 then
                aA = true
            end
            if table.find(av, as) then
                aE = true
            end
            if as == 45 then
                aG = true
                aF = true
            end
            if as == 44 then
                aI = true
                aF = true
            end
            if as == 22 then
                aJ = true
                aF = true
            end
            if as == 17 then
                aH = true
                aF = true
            end
        end
    end
)
do
    function noclip()
        if aO and aO.CanCollide then
            aO.CanCollide = false
        end
    end
    function unnoclip()
        if aO and not aO.CanCollide then
            aO.CanCollide = true
        end
    end
    function setCamera(bp, bq)
        local br = bp or aO and (aO:FindFirstChild("Part") or aO)
        if bp then
            bp.Position = bq
        end
        if br and bf.CameraSubject ~= br then
            bf.CameraSubject = br
        end
    end
    function alive()
        return aN and aO and aP and aP:FindFirstChild("Health") and aP.Health.Value > 0
    end
    function mounted()
        return aN and aN:FindFirstChild("Properties") and aN.Properties:GetAttribute("Mounted")
    end
    function isAlive(bs)
        return bs and bs.PrimaryPart and bs:FindFirstChild("HealthProperties") and
            bs.HealthProperties:FindFirstChild("Health") and
            bs.HealthProperties.Health.Value > 0
    end
    function Mob(x)
        if be:FindFirstChild(x) then
            return require(be[x])
        end
    end
    function SwitchOffhandPerks(x)
        _.Settings.OffhandPerksActive:FireServer(x)
    end
    function timeElapsed(L)
        local bt = math.floor(L / 86400)
        local bu = math.floor(L % 86400 / 3600)
        local bv = math.floor(L % 3600 / 60)
        local bw = math.floor(L % 60)
        if bt > 0 then
            return bt .. "d " .. bu .. "h " .. bv .. "m " .. bw .. "s"
        elseif bu > 0 then
            return bu .. "h " .. bv .. "m " .. bw .. "s"
        elseif bv > 0 then
            return bv .. "m " .. bw .. "s"
        else
            return bw .. "s"
        end
    end
    function ping()
        return math.round(c:GetNetworkPing() * 1000) .. " ms"
    end
    function ping2()
        return math.round(game.Stats.PerformanceStats.Ping:GetValue()) .. " ms"
    end
    function nextInTbl(bx, by)
        return bx[table.find(bx, by) + 1] or bx[1]
    end
    function formatNumberWithCommas(bz)
        local bA = tostring(bz)
        local bB
        repeat
            bA, bB = string.gsub(bA, "^(-?%d+)(%d%d%d)", "%1,%2")
        until bB == 0
        return bA
    end
    function getServerGuilds()
        local I = game:GetService("TextChatService"):WaitForChild("TextChannels")
        local bx = {}
        for K, L in I:GetChildren() do
            if #L.Name < 6 and #L:GetChildren() > 0 then
                table.insert(bx, L.Name)
            end
        end
        table.sort(bx)
        return bx
    end
    function getPlrGuild()
        local I = game:GetService("TextChatService"):WaitForChild("TextChannels")
        local J
        for K, L in I:GetChildren() do
            if #L.Name < 6 and #L:GetChildren() > 0 and L:FindFirstChild(c.Name) then
                J = L.Name
                break
            end
        end
        return J
    end
end
local function bC(bD)
    return loadstring(game:HttpGet(bD))()
end
local bE = aU:WaitForChild("Inventory"):WaitForChild("Items")
local bF = aU:WaitForChild("Inventory"):WaitForChild("Cosmetics")
local bG = require(_.Missions.MissionData)
function missionLevelReq(bH)
    return bG[bH].LevelRequirement
end
local bI = require(_.Gear.GearPerks)
local bJ = require(_.Items)
local bK = require(_.Combat)
local bL = _.Inventory.EquipItem
local bM = require(_:WaitForChild("Settings"))
local bN = aU:WaitForChild("Settings")
local bO
local bP
local bQ
local bR
local bS = game:GetService("RunService").Heartbeat
function OffhandPerksActive()
    return bN:GetAttribute("OffhandPerksActive")
end
function StartRaid(x, y)
    _:WaitForChild("Teleport"):WaitForChild("StartRaid"):FireServer(x, y)
end
local bT = require(_.Inventory)
b2:GetPropertyChangedSignal("Value"):Connect(
    function()
        b3 = b2.Value
    end
)
local bU = 0
_.Missions.MissionStart.OnClientEvent:Once(
    function()
    end
)
load()
if not aw then
    if
        ai.Kicked and ai.WasInDungeon or
            ai.RejoinLastDungeon and tick() - ai.Timestamp <= ai.RejoinLastDungeonThreshold and ai.CameFromMenu or
            ai.WasInDungeon and ai.Dungeon and table.find(au, ai.Dungeon) and ai.ForceRestartLastTower
     then
        ai.CameFromMenu = false
        save()
        if ai.Dungeon then
            local bV = _:WaitForChild("Teleport"):WaitForChild("StartRaid")
            while true do
                if table.find(ak, ai.Dungeon) then
                    bV:FireServer(ai.Dungeon)
                else
                    bV:FireServer(ai.Dungeon, ai.Difficulty)
                end
                task.wait(1)
            end
        end
    else
        ai.Kicked = false
        ai.CameFromMenu = false
        ai.WasInDungeon = false
        save()
    end
elseif aw then
    bR = getPlrGuild()
    ai.WasInDungeon = true
    ai.Dungeon = as
    ai.Difficulty = at
    ai.CameFromMenu = false
    ai.Timestamp = tick()
    save()
end
local bW, bX, bY, bZ = "", "", "", ""
local b_ = {
    "Checkpoint1",
    "Checkpoint2",
    "Checkpoint3",
    "Checkpoint4",
    "Checkpoint5",
    "Checkpoint6",
    "Checkpoint7",
    "Checkpoint8",
    "Checkpoint9",
    "Checkpoint10",
    "CutsceneTrigger",
    "Main",
    "CaveTrigger",
    "BossIntroTrigger",
    "TownTalkPart",
    "BridgeTrigger",
    "BoulderTrigger",
    "BoulderStopTrigger",
    "Cage1Marker",
    "Cage2Marker",
    "CannonTrigger",
    "CastleTrigger",
    "WallsCheckpoint",
    "HammerReset1",
    "WallsTrigger",
    "WallsFinalTrigger",
    "Room1Trigger",
    "Room2Trigger",
    "Room3Trigger",
    "Room4Trigger",
    "Room5Trigger",
    "Room6Trigger",
    "TreasureMarker",
    "NextCheckpointTrigger",
    "PreBridgeTrigger",
    "CheckpointTriggers",
    "CaveSpawnTrigger",
    "CliffsideEndTrigger",
    "VineRoomTrigger",
    "CheckpointTrigger",
    "ObbyTrigger",
    "BossTrigger",
    "DropTrigger",
    "CastleGateTrigger",
    "SceneTrigger",
    "OutsideBossTrigger",
    "Area1Trigger",
    "Area2Trigger",
    "Area3Trigger",
    "FinishRing",
    "StartWaveDefense",
    "Trigger1",
    "Trigger2",
    "Trigger3",
    "BossCutsceneTrigger",
    "FloorTrigger",
    "BossCutscene",
    "BottomElevatorTrigger",
    "MiddleElevatorTrigger",
    "TopElevatorTrigger",
    "ObbyTrigger5",
    "WaveStarter",
    "BossDoorTrigger",
    "MinibossExit",
    "ArenaEntry0",
    "ArenaEntry1",
    "ArenaEntry2"
}
local c0 = {
    "Assets_FX",
    "Assets_Static",
    "Characters",
    "Coins",
    "Camera",
    "SpeedBoosts",
    "Projectiles",
    "World_Bounds",
    "Pets",
    "MobBlockers",
    "Terrain"
}
local c1 = {"Scarecrow1", "Scarecrow2", "Scarecrow3"}
local c2 = {
    DireProblem = {Id = 2, ignoreMob = "BOSSDireBoarwolf"},
    KingSlayer = {Id = 4, ignoreMob = "BOSSKingCrab"},
    GravetowerDungeon = {Id = 6, priorityTbl = {"Pillar", "BOSSTreeEnt"}, mobWaitTbl = {"BOSSTreeEnt"}, mobWaitTime = 3},
    RoughWaters = {Id = 25, ignoreMob = "DavyJones"},
    VolcanosShadow = {Id = 13, ignoreMob = "BOSSCerberus"},
    KonoHeartlands = {Id = 24, ignoreMob = "CorruptedGreaterTree"},
    AetherFortress = {Id = 33, ignoreMob = "BOSSTreeEnt"},
    MamaTrauma = {Id = 12, ignoreMob = "BOSSMamaQuillodile"},
    TheUnderworld = {
        Id = 26,
        ignoreMob = "HadesCerberus",
        mobWaitTbl = {"Hades", "HadesCerberus"},
        mobWaitTime = 3,
        alwaysWait = true
    },
    VaneEvent = {Id = 44, priorityTbl = {"EVENTBOSSVane"}},
    ArcaneTower = {Id = 43, priorityTbl = {"Crystal", "BOSSKandrix"}},
    RescueInTheRuins = {Id = 30, priorityTbl = {"Alligator", "Rapigator", "Sentry", "HandTower"}},
    PyramidDungeon = {
        Id = 18,
        priorityTbl = {
            "ScarabGreen",
            "BuffCactus",
            "HappyCactus",
            "RockGolem",
            "DesertFlower",
            "PoisonCobra",
            "GoldCobra"
        }
    },
    ScrapCanyon = {Id = 20, priorityTbl = {"Model", "BOSSHogRider"}}
}
local c3 = 15
local c4 = {
    World1 = {Name = "World 1", Id = 13, OrderId = 1},
    World2 = {Name = "World 2", Id = 19, OrderId = 2},
    World3 = {Name = "World 3", Id = 20, OrderId = 3},
    World4 = {Name = "World 4", Id = 29, OrderId = 4},
    World5 = {Name = "World 5", Id = 31, OrderId = 5},
    World6 = {Name = "World 6", Id = 36, OrderId = 6},
    World7 = {Name = "World 7", Id = 40, OrderId = 7},
    World8 = {Name = "World 8", Id = 45, OrderId = 8},
    World9 = {Name = "World 9", Id = 49, OrderId = 9},
    World10 = {Name = "World 10", Id = 56, OrderId = 10},
    TradingHub = {Name = "Cliffside Marketplace", Id = 44, OrderId = 11},
    PvpArena = {Name = "Pvp Arena", Id = 39, OrderId = 12},
    Baseplate = {Name = "Baseplate", Id = 26, OrderId = 13},
    ChristmasHub = {Name = "Holiday Village", Id = 24, OrderId = 14},
    HalloweenHub = {Name = "Spooky Courtyard", Id = 33, OrderId = 15}
}
local c5 = {
    1,
    3,
    2,
    4,
    6,
    11,
    12,
    13,
    7,
    14,
    15,
    16,
    20,
    19,
    18,
    24,
    35,
    21,
    25,
    36,
    23,
    26,
    37,
    27,
    30,
    31,
    29,
    32,
    33,
    34,
    41,
    42,
    43,
    39,
    1005,
    1006,
    1007,
    38
}
local c6 = {
    {Id = 1, Name = "Crabby Crusade", World = 1, Type = "Dungeon", Code = "1-1"},
    {Id = 3, Name = "Scarecrow Defense", World = 1, Type = "Dungeon", Code = "1-2"},
    {Id = 2, Name = "Dire Problem", World = 1, Type = "Dungeon", Code = "1-3"},
    {Id = 4, Name = "Kingslayer", World = 1, Type = "Dungeon", Code = "1-4"},
    {Id = 6, Name = "Gravetower Dungeon", World = 1, Type = "Dungeon", Code = "1-5"},
    {Id = 11, Name = "Temple of Ruin", World = 2, Type = "Dungeon", Code = "2-1"},
    {Id = 12, Name = "Mama Trauma", World = 2, Type = "Dungeon", Code = "2-2"},
    {Id = 13, Name = "Volcano's Shadow", World = 2, Type = "Dungeon", Code = "2-3"},
    {Id = 7, Name = "Volcano Dungeon", World = 2, Type = "Dungeon", Code = "2-4"},
    {Id = 14, Name = "Mountain Pass", World = 3, Type = "Dungeon", Code = "3-1"},
    {Id = 15, Name = "Winter Cavern", World = 3, Type = "Dungeon", Code = "3-2"},
    {Id = 16, Name = "Winter Dungeon", World = 3, Type = "Dungeon", Code = "3-3"},
    {Id = 20, Name = "Scrap Canyon", World = 4, Type = "Dungeon", Code = "4-1"},
    {Id = 19, Name = "Deserted Burrowmine", World = 4, Type = "Dungeon", Code = "4-2"},
    {Id = 18, Name = "Pyramid Dungeon", World = 4, Type = "Dungeon", Code = "4-3"},
    {Id = 24, Name = "Konoh Heartlands", World = 5, Type = "Dungeon", Code = "5-1"},
    {Id = 35, Name = "Konoh Inferno", World = 5, Type = "Dungeon", Code = "5-2", MobCount = 44},
    {Id = 21, Name = "Prison Tower", World = 5, Type = "Tower", Code = "Tower 1"},
    {Id = 25, Name = "Rough Waters", World = 6, Type = "Dungeon", Code = "6-1"},
    {Id = 36, Name = "Treasure Hunt", World = 6, Type = "Dungeon", Code = "6-2"},
    {Id = 23, Name = "Atlantis Tower", World = 6, Type = "Tower", Code = "Tower 2"},
    {Id = 26, Name = "The Underworld", World = 7, Type = "Dungeon", Code = "7-1"},
    {Id = 37, Name = "The Labyrinth", World = 7, Type = "Dungeon", Code = "7-2"},
    {Id = 27, Name = "Mezuvian Tower", World = 7, Type = "Tower", Code = "Tower 3"},
    {Id = 30, Name = "Rescue in the Ruins", World = 8, Type = "Dungeon", Code = "8-1"},
    {Id = 31, Name = "Ruin Rush", World = 8, Type = "Dungeon", Code = "8-2"},
    {Id = 29, Name = "Oasis Tower", World = 8, Type = "Tower", Code = "Tower 4"},
    {Id = 32, Name = "Treetop Trouble", World = 9, Type = "Dungeon", Code = "9-1"},
    {Id = 33, Name = "Aether Fortress", World = 9, Type = "Dungeon", Code = "9-2"},
    {Id = 34, Name = "Aether Tower", World = 9, Type = "Tower", Code = "Tower 5"},
    {Id = 41, Name = "Crystal Chaos", World = 10, Type = "Dungeon", Code = "10-1"},
    {Id = 42, Name = "Astral Academy", World = 10, Type = "Dungeon", Code = "10-2"},
    {Id = 43, Name = "Arcane Tower", World = 10, Type = "Tower", Code = "Tower 6"},
    {
        Id = 22,
        Name = "Haunted Event",
        Type = "Raid",
        World = "Spooky Courtyard",
        Special = true,
        Code = "Halloween Raid"
    },
    {Id = 17, Name = "North Pole", Type = "Raid", World = "Holiday Village", Special = true, Code = "Christmas Raid"},
    {Id = 38, Name = "Infinite Tower", Type = "Special", Special = true, Code = "Special"},
    {Id = 39, Name = "Celestial Tower", Type = "Special", Special = true, Code = "Special"},
    {Id = 40, Name = "Daily Dungeon", Type = "Dungeon", Special = true, Code = "I dont know"},
    {Id = 44, Name = "Vane's Lair", Type = "Raid", Special = true, Code = "Event Raid"},
    {Id = 45, Name = "The Depths", Type = "Raid", Special = true, Code = "Event Raid"}
}
local function c7(C)
    local c8 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    C = C:gsub("[^" .. c8 .. "=]", "")
    return C:gsub(
        ".",
        function(c9)
            if c9 == "=" then
                return ""
            end
            local ca, cb = "", c8:find(c9) - 1
            for K = 6, 1, -1 do
                ca = ca .. (cb % 2 ^ K - cb % 2 ^ (K - 1) > 0 and "1" or "0")
            end
            return ca
        end
    ):gsub(
        "%d%d%d?%d?%d?%d?%d?%d?",
        function(c9)
            if #c9 ~= 8 then
                return ""
            end
            local cc = 0
            for K = 1, 8 do
                cc = cc + (c9:sub(K, K) == "1" and 2 ^ (8 - K) or 0)
            end
            return string.char(cc)
        end
    )
end
local cd = {
    Assassin = {
        DisplayName = "Shadowblade",
        Range = 10.5,
        Type = "Melee",
        Primary = "Longsword",
        Offhand = "Longsword",
        Skills = {
            {Skill = "Assassin1", Cooldown = 0.26},
            {Skill = "Assassin2", Cooldown = 0.26},
            {Skill = "Assassin3", Cooldown = 0.26},
            {Skill = "Assassin4", Cooldown = 0.26},
            {Skill = "Assassin5", Cooldown = 0.26},
            {Skill = "Assassin6", Cooldown = 0.26},
            {Skill = "Assassin7", Cooldown = 0.26},
            {Skill = "Assassin8", Cooldown = 0.26},
            {Skill = "ShadowLeap", Cooldown = 3.1, Range = 49},
            {Skill = "ShadowSlash1", Cooldown = 6.1, Range = 59},
            {Skill = "ShadowSlash2", Cooldown = 6.1, Range = 59},
            {Skill = b6:WaitForChild("Assassin"):WaitForChild("EventStealthWalk"), Cooldown = 0.25, Type = "Remote"},
            {Skill = b6:WaitForChild("Assassin"):WaitForChild("Ultimate"), Cooldown = 1, Type = "Remote"},
            {Skill = "RealmOfShadows", Cooldown = 31, Type = "Ranged", Range = 79},
            {Skill = "ShadowMulti1", Cooldown = 31, Type = "Ranged", Range = 59},
            {Skill = "ShadowMulti2", Cooldown = 31, Type = "Ranged", Range = 59},
            {Skill = "ShadowMulti3", Cooldown = 31, Type = "Ranged", Range = 59},
            {Skill = "ShadowMulti4", Cooldown = 31, Type = "Ranged", Range = 59},
            {Skill = "ShadowMulti5", Cooldown = 31, Type = "Ranged", Range = 59}
        }
    },
    MageOfLight = {
        DisplayName = "Mage Of Light",
        Range = 96,
        Type = "Ranged",
        Primary = "Staff",
        Skills = {
            {Skill = "MageOfLight", Cooldown = 0.28},
            {Skill = "MageOfLightBlast", Cooldown = 0.33},
            {Skill = "MageOfLightCharged", Cooldown = 0.33},
            {Skill = "MageOfLightBlastCharged", Cooldown = 0.33},
            {Skill = b6:WaitForChild("MageOfLight"):WaitForChild("HealCircle"), Cooldown = 14.2, Type = "Heal"},
            {Skill = b6:WaitForChild("MageOfLight"):WaitForChild("Barrier"), Args = c, Cooldown = 15.2, Type = "Heal"},
            {Skill = b6:WaitForChild("MageOfLight"):WaitForChild("Ultimate"), Cooldown = 1, Type = "Heal"}
        }
    },
    Warlord = {
        DisplayName = "Warlord",
        Range = 19.5,
        Type = "Melee",
        Primary = "Greataxe",
        Offhand = "Shield",
        Skills = {
            {Skill = "Warlord1", Cooldown = 0.42, Type = "Ranged", MeleeOnBoss = true, BossRange = 14.5},
            {Skill = "Warlord2", Cooldown = 0.42, Type = "Ranged", MeleeOnBoss = true, BossRange = 14.5},
            {Skill = "Warlord3", Cooldown = 0.42, Type = "Ranged", MeleeOnBoss = true, BossRange = 14.5},
            {Skill = "Warlord4", Cooldown = 0.42, Type = "Ranged", MeleeOnBoss = true, BossRange = 14.5},
            {Skill = "ChainsOfWar", Cooldown = 8, Range = 69, Type = "Ranged"},
            {Skill = "BlockingWarlord", Cooldown = 2.5, Type = "Ranged", MeleeOnBoss = true, BossRange = 14.5},
            {Skill = "Piledriver1", Cooldown = 5.1, Range = 12, Type = "Ranged"},
            {Skill = "Piledriver2", Cooldown = 6.1, Range = 12, Type = "Ranged"},
            {Skill = "Piledriver3", Cooldown = 7.1, Range = 12, Type = "Ranged"},
            {Skill = "WarlordUltimate1", Cooldown = 31, Range = 59, Type = "Ranged"},
            {Skill = "WarlordUltimate2", Cooldown = 31, Range = 59, Type = "Ranged"},
            {Skill = "WarlordUltimate3", Cooldown = 31, Range = 59, Type = "Ranged"},
            {Skill = "WarlordUltimate4", Cooldown = 31, Range = 59, Type = "Ranged"},
            {Skill = "WarlordUltimate5", Cooldown = 31, Range = 59, Type = "Ranged"}
        }
    },
    Paladin = {
        DisplayName = "Paladin",
        Range = 14,
        Type = "Melee",
        Primary = "Longsword",
        Offhand = "Shield",
        Skills = {
            {Skill = "BlockingPaladin", Cooldown = 0.37, Range = 9},
            {Skill = "Paladin1", Cooldown = 0.52},
            {Skill = "Paladin2", Cooldown = 0.52},
            {Skill = "Paladin3", Cooldown = 0.52},
            {Skill = "Paladin4", Cooldown = 0.52},
            {Skill = "LightPaladin1", Cooldown = 0.52, Range = 19},
            {Skill = "LightPaladin2", Cooldown = 0.52, Range = 19},
            {Skill = "LightPaladin3", Cooldown = 0.52, Range = 19},
            {Skill = "LightPaladin4", Cooldown = 0.52, Range = 19},
            {Skill = "LightThrust1", Cooldown = 9, Range = 19},
            {Skill = "LightThrust2", Cooldown = 9, Range = 19},
            {Skill = b6:WaitForChild("Paladin"):WaitForChild("GuildedLight"), Cooldown = 15.2, Type = "Heal"}
        }
    },
    Berserker = {
        DisplayName = "Berserker",
        Range = 19.5,
        Type = "Melee",
        Primary = "Greataxe",
        Offhand = "Greataxe",
        Skills = {
            {Skill = "Berserker1", Cooldown = 0.51, Type = "Ranged"},
            {Skill = "Berserker2", Cooldown = 0.51, Type = "Ranged"},
            {Skill = "Berserker3", Cooldown = 0.51, Type = "Ranged"},
            {Skill = "Berserker4", Cooldown = 0.51, Type = "Ranged"},
            {Skill = "Berserker5", Cooldown = 0.51, Type = "Ranged"},
            {Skill = "Berserker6", Cooldown = 0.51, Type = "Ranged"},
            {Skill = "AggroSlam", Cooldown = 5.2, Range = 39, Type = "Ranged"},
            {Skill = "GigaSpin1", Cooldown = 7.2, Range = 16},
            {Skill = "GigaSpin2", Cooldown = 7.2, Range = 16},
            {Skill = "GigaSpin3", Cooldown = 7.2, Range = 16},
            {Skill = "GigaSpin4", Cooldown = 7.2, Range = 16},
            {Skill = "GigaSpin5", Cooldown = 7.2, Range = 16},
            {Skill = "GigaSpin6", Cooldown = 7.2, Range = 16},
            {Skill = "GigaSpin7", Cooldown = 7.2, Range = 16},
            {Skill = "GigaSpin8", Cooldown = 7.2, Range = 16},
            {Skill = "Fissure1", Cooldown = 10.2, Range = 9},
            {Skill = "Fissure2", Cooldown = 10.2, Range = 9},
            {Skill = "FissureErupt1", Cooldown = 10.2, Range = 9},
            {Skill = "FissureErupt2", Cooldown = 10.2, Range = 9},
            {Skill = "FissureErupt3", Cooldown = 10.2, Range = 9},
            {Skill = "FissureErupt4", Cooldown = 10.2, Range = 9},
            {Skill = "FissureErupt5", Cooldown = 10.2, Range = 9},
            {Skill = "FissureErupt6", Cooldown = 10.2, Range = 9},
            {Skill = "FissureErupt7", Cooldown = 10.2, Range = 9},
            {Skill = "FissureErupt8", Cooldown = 10.2, Range = 9},
            {Skill = b6:WaitForChild("Berserker"):WaitForChild("Ultimate"), Cooldown = 1, Type = "Remote"}
        }
    },
    Guardian = {
        DisplayName = "Guardian",
        Range = 14.5,
        Type = "Melee",
        Primary = "Greatsword",
        Skills = {
            {Skill = "Guardian1", Cooldown = 0.6},
            {Skill = "Guardian2", Cooldown = 0.6},
            {Skill = "Guardian3", Cooldown = 0.6},
            {Skill = "Guardian4", Cooldown = 0.6},
            {Skill = "RockSpikes1", Cooldown = 6.1, Range = 29, Type = "Ranged"},
            {Skill = "RockSpikes2", Cooldown = 6.1, Range = 31, Type = "Ranged"},
            {Skill = "RockSpikes3", Cooldown = 6.1, Range = 34, Type = "Ranged"},
            {Skill = "SlashFury1", Cooldown = 7.1, Range = 44, Type = "Ranged"},
            {Skill = "SlashFury2", Cooldown = 7.1, Range = 44, Type = "Ranged"},
            {Skill = "SlashFury3", Cooldown = 7.1, Range = 44, Type = "Ranged"},
            {Skill = "SlashFury4", Cooldown = 7.1, Range = 44, Type = "Ranged"},
            {Skill = "SlashFury5", Cooldown = 7.1, Range = 44, Type = "Ranged"},
            {Skill = "SlashFury6", Cooldown = 7.1, Range = 44, Type = "Ranged"},
            {Skill = "SlashFury7", Cooldown = 7.1, Range = 44, Type = "Ranged"},
            {Skill = "SlashFury8", Cooldown = 7.1, Range = 44, Type = "Ranged"},
            {Skill = b6:WaitForChild("Guardian"):WaitForChild("AggroDraw"), Cooldown = 14.5, Type = "Remote"},
            {Skill = "SwordPrison1", Cooldown = 30.2, Range = 120, Type = "Ranged"},
            {Skill = "SwordPrison2", Cooldown = 30.2, Range = 120, Type = "Ranged"},
            {Skill = "SwordPrison3", Cooldown = 30.2, Range = 120, Type = "Ranged"},
            {Skill = "SwordPrison4", Cooldown = 30.2, Range = 120, Type = "Ranged"},
            {Skill = "SwordPrison5", Cooldown = 30.2, Range = 120, Type = "Ranged"},
            {Skill = "SwordPrison6", Cooldown = 30.2, Range = 120, Type = "Ranged"},
            {Skill = "SwordPrison7", Cooldown = 30.2, Range = 120, Type = "Ranged"},
            {Skill = "SwordPrison8", Cooldown = 30.2, Range = 120, Type = "Ranged"},
            {Skill = "SwordPrison9", Cooldown = 30.2, Range = 120, Type = "Ranged"},
            {Skill = "SwordPrison10", Cooldown = 30.2, Range = 120, Type = "Ranged"},
            {Skill = "SwordPrison11", Cooldown = 30.2, Range = 120, Type = "Ranged"},
            {Skill = "SwordPrison12", Cooldown = 30.2, Range = 120, Type = "Ranged"}
        }
    },
    Demon = {
        DisplayName = "Demon",
        Range = 12,
        Type = "Ranged",
        Primary = "Scythe",
        Skills = {
            {Skill = "Demon1", Cooldown = 0.85},
            {Skill = "Demon2", Cooldown = 0.85},
            {Skill = "Demon3", Cooldown = 0.85},
            {Skill = "Demon4", Cooldown = 1.2},
            {Skill = "Demon5", Cooldown = 1.2},
            {Skill = "Demon6", Cooldown = 1.2},
            {Skill = "Demon7", Cooldown = 1.5},
            {Skill = "Demon8", Cooldown = 1.5},
            {Skill = "Demon9", Cooldown = 1.5},
            {Skill = "Demon10", Cooldown = 1.85},
            {Skill = "Demon11", Cooldown = 1.85},
            {Skill = "Demon12", Cooldown = 1.85},
            {Skill = "Demon13", Cooldown = 2.15},
            {Skill = "Demon14", Cooldown = 2.15},
            {Skill = "Demon15", Cooldown = 2.15},
            {Skill = "Demon16", Cooldown = 2.55},
            {Skill = "Demon17", Cooldown = 2.55},
            {Skill = "Demon18", Cooldown = 2.55},
            {Skill = "Demon19", Cooldown = 2.85},
            {Skill = "Demon20", Cooldown = 2.85},
            {Skill = "Demon21", Cooldown = 2.85},
            {Skill = "Demon22", Cooldown = 3.2},
            {Skill = "Demon23", Cooldown = 3.2},
            {Skill = "Demon24", Cooldown = 3.2},
            {Skill = "Demon25", Cooldown = 3.5},
            {Skill = "Demon26", Cooldown = 3.5},
            {Skill = "Demon27", Cooldown = 3.5},
            {Skill = "DemonDPS1", Cooldown = 0.85, Range = 12},
            {Skill = "DemonDPS2", Cooldown = 1.2, Range = 12},
            {Skill = "DemonDPS3", Cooldown = 1.5, Range = 12},
            {Skill = "DemonDPS4", Cooldown = 1.85, Range = 12},
            {Skill = "DemonDPS5", Cooldown = 2.15, Range = 12},
            {Skill = "DemonDPS6", Cooldown = 2.55, Range = 12},
            {Skill = "DemonDPS7", Cooldown = 2.9, Range = 12},
            {Skill = "DemonDPS8", Cooldown = 3.3, Range = 12},
            {Skill = "DemonDPS9", Cooldown = 3.6, Range = 12},
            {Skill = "ScytheThrowDPS1", Cooldown = 5.5, Type = "Ranged", Range = 71},
            {Skill = "ScytheThrowDPS2", Cooldown = 5.5, Type = "Ranged", Range = 71},
            {Skill = "ScytheThrowDPS3", Cooldown = 5.5, Type = "Ranged", Range = 71},
            {Skill = "ScytheThrow1", Cooldown = 5.5, Type = "Ranged", Range = 88},
            {Skill = "ScytheThrow2", Cooldown = 5.5, Type = "Ranged", Range = 88},
            {Skill = "ScytheThrow3", Cooldown = 5.5, Type = "Ranged", Range = 88},
            {Skill = "ScytheThrow4", Cooldown = 5.5, Type = "Ranged", Range = 88},
            {Skill = "ScytheThrow5", Cooldown = 5.5, Type = "Ranged", Range = 88},
            {Skill = "ScytheThrow6", Cooldown = 5.5, Type = "Ranged", Range = 88},
            {Skill = "ScytheThrow7", Cooldown = 5.5, Type = "Ranged", Range = 88},
            {Skill = "ScytheThrow8", Cooldown = 5.5, Type = "Ranged", Range = 88},
            {Skill = "DemonLifeStealDPS", Cooldown = 8.2, Type = "Ranged", Range = 56},
            {Skill = b6:WaitForChild("Demon"):WaitForChild("Ultimate"), Cooldown = 1, Type = "Remote"},
            {Skill = "DemonSoulDPS1", Cooldown = 31, Type = "Ranged", Range = 26},
            {Skill = "DemonSoulDPS2", Cooldown = 31, Type = "Ranged", Range = 26},
            {Skill = "DemonSoulDPS3", Cooldown = 31, Type = "Ranged", Range = 26}
        }
    },
    Swordmaster = {
        DisplayName = "Swordmaster",
        Range = 12,
        Type = "Melee",
        Primary = "Longsword",
        Skills = {
            {Skill = "Swordmaster1", Cooldown = 0.34},
            {Skill = "Swordmaster2", Cooldown = 0.34},
            {Skill = "Swordmaster3", Cooldown = 0.34},
            {Skill = "Swordmaster4", Cooldown = 0.34},
            {Skill = "Swordmaster5", Cooldown = 0.34},
            {Skill = "Swordmaster6", Cooldown = 0.34},
            {Skill = "CrescentStrike1", Cooldown = 5.2},
            {Skill = "CrescentStrike2", Cooldown = 5.2},
            {Skill = "CrescentStrike3", Cooldown = 5.2},
            {Skill = "CrescentStrike4", Cooldown = 5.2},
            {Skill = "CrescentStrike5", Cooldown = 5.2},
            {Skill = "Leap", Cooldown = 8.2, Range = 14}
        }
    },
    Mage = {
        DisplayName = "Arcane Mage",
        Range = 99,
        Type = "Ranged",
        Primary = "Staff",
        Skills = {
            {Skill = "Mage1", Cooldown = 0.33},
            {Skill = "Mage2", Cooldown = 0.33},
            {Skill = "Mage3", Cooldown = 0.33},
            {Skill = "ArcaneBlast", Cooldown = 5.2, Range = 42},
            {Skill = "ArcaneBlastAOE", Cooldown = 5.2, Range = 42},
            {Skill = "ArcaneWave1", Cooldown = 8.2, Range = 36},
            {Skill = "ArcaneWave2", Cooldown = 8.2, Range = 36},
            {Skill = "ArcaneWave3", Cooldown = 8.2, Range = 36},
            {Skill = "ArcaneWave4", Cooldown = 8.2, Range = 36},
            {Skill = "ArcaneWave5", Cooldown = 8.2, Range = 36},
            {Skill = "ArcaneWave6", Cooldown = 8.2, Range = 36},
            {Skill = "ArcaneWave7", Cooldown = 8.2, Range = 36},
            {Skill = "ArcaneWave8", Cooldown = 8.2, Range = 36},
            {Skill = "ArcaneWave9", Cooldown = 8.2, Range = 36},
            {Skill = "ArcaneWave10", Cooldown = 8.2, Range = 36},
            {Skill = "ArcaneWave11", Cooldown = 8.2, Range = 36},
            {Skill = "ArcaneWave12", Cooldown = 8.2, Range = 36}
        }
    },
    Defender = {
        DisplayName = "Defender",
        Range = 12,
        Type = "Melee",
        Primary = "Greataxe",
        Skills = {
            {Skill = "Defender1", Cooldown = 0.66},
            {Skill = "Defender2", Cooldown = 0.66},
            {Skill = "Defender3", Cooldown = 0.66},
            {Skill = "Defender4", Cooldown = 0.66},
            {Skill = "Defender5", Cooldown = 0.66},
            {Skill = "Groundbreaker", Cooldown = 5.1, Range = 9},
            {Skill = "Spin1", Cooldown = 8.1, Range = 10},
            {Skill = "Spin2", Cooldown = 8.1, Range = 10},
            {Skill = "Spin3", Cooldown = 8.1, Range = 10},
            {Skill = "Spin4", Cooldown = 8.1, Range = 10}
        }
    },
    DualWielder = {
        DisplayName = "Dual Wielder",
        Range = 12,
        Type = "Melee",
        Primary = "Longsword",
        Offhand = "Longsword",
        Skills = {
            {Skill = "DualWield1", Cooldown = 0.55},
            {Skill = "DualWield2", Cooldown = 0.55},
            {Skill = "DualWield3", Cooldown = 0.55},
            {Skill = "DualWield4", Cooldown = 0.55},
            {Skill = "DualWield5", Cooldown = 0.75},
            {Skill = "DualWield6", Cooldown = 0.75},
            {Skill = "DualWield7", Cooldown = 0.75},
            {Skill = "DualWield8", Cooldown = 0.75},
            {Skill = "DualWield9", Cooldown = 0.75},
            {Skill = "DualWield10", Cooldown = 0.75},
            {Skill = b6:WaitForChild("DualWielder"):WaitForChild("AttackBuff"), Cooldown = 12.2, Type = "Remote"},
            {Skill = "DashStrike", Cooldown = 6.2},
            {Skill = "CrossSlash1", Cooldown = 8.2, Type = "Ranged", Range = 47},
            {Skill = "CrossSlash2", Cooldown = 8.2, Type = "Ranged", Range = 47},
            {Skill = "CrossSlash3", Cooldown = 8.2, Type = "Ranged", Range = 47},
            {Skill = "CrossSlash4", Cooldown = 8.2, Type = "Ranged", Range = 47},
            {Skill = "CrossSlash5", Cooldown = 8.2, Type = "Ranged", Range = 47},
            {Skill = "CrossSlash6", Cooldown = 8.2, Type = "Ranged", Range = 47},
            {Skill = "CrossSlash7", Cooldown = 8 - 2, Type = "Ranged", Range = 47},
            {Skill = "CrossSlash8", Cooldown = 8.2, Type = "Ranged", Range = 47},
            {Skill = "CrossSlash9", Cooldown = 8.2, Type = "Ranged", Range = 47},
            {Skill = "CrossSlash10", Cooldown = 8.2, Type = "Ranged", Range = 47},
            {Skill = b6:WaitForChild("DualWielder"):WaitForChild("Ultimate"), Cooldown = 31, Type = "Remote"},
            {Skill = "DualWieldUltimateHit1", Cooldown = 31},
            {Skill = "DualWieldUltimateHit2", Cooldown = 31},
            {Skill = "DualWieldUltimateHit3", Cooldown = 31},
            {Skill = "DualWieldUltimateHit4", Cooldown = 31},
            {Skill = "DualWieldUltimateHit5", Cooldown = 31},
            {Skill = "DualWieldUltimateHit6", Cooldown = 31},
            {Skill = "DualWieldUltimateHit7", Cooldown = 31},
            {Skill = "DualWieldUltimateHit8", Cooldown = 31},
            {Skill = "DualWieldUltimateSlam", Cooldown = 31, Type = "Ranged", Range = 17},
            {Skill = "DualWieldUltimateSlam1", Cooldown = 31, Type = "Ranged", Range = 17},
            {Skill = "DualWieldUltimateSlam2", Cooldown = 31, Type = "Ranged", Range = 17},
            {Skill = "DualWieldUltimateSlam3", Cooldown = 31, Type = "Ranged", Range = 17},
            {Skill = "DualWieldUltimateSword1", Cooldown = 31, Type = "Ranged", Range = 17},
            {Skill = "DualWieldUltimateSword2", Cooldown = 31, Type = "Ranged", Range = 17},
            {Skill = "DualWieldUltimateSword3", Cooldown = 31, Type = "Ranged", Range = 17},
            {Skill = "DualWieldUltimateSword4", Cooldown = 31, Type = "Ranged", Range = 17},
            {Skill = "DualWieldUltimateSword5", Cooldown = 31, Type = "Ranged", Range = 17},
            {Skill = "DualWieldUltimateSword6", Cooldown = 31, Type = "Ranged", Range = 17},
            {Skill = "DualWieldUltimateSword7", Cooldown = 31, Type = "Ranged", Range = 17},
            {Skill = "DualWieldUltimateSword8", Cooldown = 31, Type = "Ranged", Range = 17},
            {Skill = "DualWieldUltimateSword9", Cooldown = 31, Type = "Ranged", Range = 17},
            {Skill = "DualWieldUltimateSword10", Cooldown = 31, Type = "Ranged", Range = 17},
            {Skill = "DualWieldUltimateSword11", Cooldown = 31, Type = "Ranged", Range = 17},
            {Skill = "DualWieldUltimateSword12", Cooldown = 31, Type = "Ranged", Range = 17},
            {Skill = "DualWieldUltimateSword13", Cooldown = 31, Type = "Ranged", Range = 17},
            {Skill = "DualWieldUltimateSword14", Cooldown = 31, Type = "Ranged", Range = 17},
            {Skill = "DualWieldUltimateSword15", Cooldown = 31, Type = "Ranged", Range = 17},
            {Skill = "DualWieldUltimateSword16", Cooldown = 31, Type = "Ranged", Range = 17}
        }
    },
    IcefireMage = {
        DisplayName = "Elementalist",
        Range = 93,
        Type = "Ranged",
        Primary = "Staff",
        Skills = {
            {Skill = "IcefireMage1", Cooldown = 0.33},
            {Skill = "IcefireMage2", Cooldown = 0.33},
            {Skill = "IcefireMage3", Cooldown = 0.33},
            {Skill = "IcySpikes1", Cooldown = 6.2, Range = 36},
            {Skill = "IcySpikes2", Cooldown = 6.2, Range = 36},
            {Skill = "IcySpikes3", Cooldown = 6.2, Range = 36},
            {Skill = "IcySpikes4", Cooldown = 6.2, Range = 36},
            {Skill = "IcySpikes5", Cooldown = 6.2, Range = 36},
            {Skill = "IcefireMageFireball", Cooldown = 10.2},
            {Skill = "IcefireMageFireballBlast", Cooldown = 10.2},
            {Skill = "LightningStrike1", Cooldown = 15.2, Range = 46},
            {Skill = "LightningStrike2", Cooldown = 15.2, Range = 46},
            {Skill = "LightningStrike3", Cooldown = 15.2, Range = 46},
            {Skill = "LightningStrike4", Cooldown = 15.2, Range = 46},
            {Skill = "LightningStrike5", Cooldown = 15.2, Range = 46},
            {Skill = "IcefireMageUltimateFrost", Cooldown = 31, Range = 56},
            {Skill = "IcefireMageUltimateMeteor1", Cooldown = 31, Range = 56},
            {Skill = "IcefireMageUltimateMeteor2", Cooldown = 31, Range = 56},
            {Skill = "IcefireMageUltimateMeteor3", Cooldown = 31, Range = 56},
            {Skill = "IcefireMageUltimateMeteor4", Cooldown = 31, Range = 56},
            {Skill = "IcefireMageUltimateMeteor5", Cooldown = 31, Range = 56},
            {Skill = "IcefireMageUltimateMeteor6", Cooldown = 31, Range = 56},
            {Skill = "IcefireMageUltimateMeteor7", Cooldown = 31, Range = 56},
            {Skill = "IcefireMageUltimateMeteor8", Cooldown = 31, Range = 56},
            {Skill = "IcefireMageUltimateMeteor9", Cooldown = 31, Range = 56},
            {Skill = "IcefireMageUltimateMeteor10", Cooldown = 31, Range = 56}
        }
    },
    Dragoon = {
        DisplayName = "Dragoon",
        Range = 12,
        Type = "Ranged",
        Primary = "Spear",
        Skills = {
            {Skill = "Dragoon1", Cooldown = 0.45, Type = "Melee"},
            {Skill = "Dragoon2", Cooldown = 0.45, Type = "Melee"},
            {Skill = "Dragoon3", Cooldown = 0.45, Type = "Melee"},
            {Skill = "Dragoon4", Cooldown = 0.45, Type = "Melee"},
            {Skill = "Dragoon5", Cooldown = 0.45, Type = "Melee"},
            {Skill = "Dragoon6", Cooldown = 0.45, Type = "Melee"},
            {Skill = "DragoonDash", Cooldown = 6.2, Range = 17},
            {Skill = "DragoonCross1", Cooldown = 6.2, Range = 17},
            {Skill = "DragoonCross2", Cooldown = 6.2, Range = 17},
            {Skill = "DragoonCross3", Cooldown = 6.2, Range = 17},
            {Skill = "DragoonCross4", Cooldown = 6.2, Range = 17},
            {Skill = "DragoonCross5", Cooldown = 6.2, Range = 17},
            {Skill = "DragoonCross6", Cooldown = 6.2, Range = 17},
            {Skill = "DragoonCross7", Cooldown = 6.2, Range = 17},
            {Skill = "DragoonCross8", Cooldown = 6.2, Range = 17},
            {Skill = "DragoonCross9", Cooldown = 6.2, Range = 17},
            {Skill = "DragoonCross10", Cooldown = 6.2, Range = 17},
            {Skill = "MultiStrike1", Cooldown = 6.2, Type = "Melee", Range = 18},
            {Skill = "MultiStrike2", Cooldown = 6.2, Type = "Melee", Range = 18},
            {Skill = "MultiStrike3", Cooldown = 6.2, Type = "Melee", Range = 18},
            {Skill = "MultiStrike4", Cooldown = 6.2, Type = "Melee", Range = 18},
            {Skill = "MultiStrike5", Cooldown = 6.2, Type = "Melee", Range = 18},
            {Skill = "MultiStrikeDragon1", Cooldown = 6.2, Range = 57},
            {Skill = "MultiStrikeDragon2", Cooldown = 6.2, Range = 57},
            {Skill = "MultiStrikeDragon3", Cooldown = 6.2, Range = 57},
            {Skill = "DragoonFall", Cooldown = 8.2, Range = 5},
            {Skill = b6:WaitForChild("Dragoon"):WaitForChild("Ultimate"), Cooldown = 1, Type = "Remote"},
            {Skill = "DragoonUltimate", Cooldown = 31, Range = 46},
            {Skill = "UltimateDragon1", Cooldown = 31, Range = 94},
            {Skill = "UltimateDragon2", Cooldown = 31, Range = 94},
            {Skill = "UltimateDragon3", Cooldown = 31, Range = 94},
            {Skill = "UltimateDragon4", Cooldown = 31, Range = 94},
            {Skill = "UltimateDragon5", Cooldown = 31, Range = 94},
            {Skill = "UltimateDragon6", Cooldown = 31, Range = 94},
            {Skill = "UltimateDragon7", Cooldown = 31, Range = 94},
            {Skill = "UltimateDragon8", Cooldown = 31, Range = 94},
            {Skill = "UltimateDragon9", Cooldown = 31, Range = 94},
            {Skill = "UltimateDragon10", Cooldown = 31, Range = 94},
            {Skill = "UltimateDragon11", Cooldown = 31, Range = 94},
            {Skill = "UltimateDragon12", Cooldown = 31, Range = 94},
            {Skill = "UltimateDragon13", Cooldown = 31, Range = 94},
            {Skill = "UltimateDragon14", Cooldown = 31, Range = 94},
            {Skill = "UltimateDragon15", Cooldown = 31, Range = 94},
            {Skill = "UltimateDragon16", Cooldown = 31, Range = 94},
            {Skill = "UltimateDragon17", Cooldown = 31, Range = 94},
            {Skill = "UltimateDragon18", Cooldown = 31, Range = 94}
        }
    },
    Archer = {
        DisplayName = "Archer",
        Range = 79,
        Type = "Ranged",
        Primary = "Bow",
        Skills = {
            {Skill = "Archer", Cooldown = 0.47},
            {Skill = "PiercingArrow1", Cooldown = 5.2, Range = 99},
            {Skill = "PiercingArrow2", Cooldown = 5.2, Range = 99},
            {Skill = "PiercingArrow3", Cooldown = 5.2, Range = 99},
            {Skill = "PiercingArrow4", Cooldown = 5.2, Range = 99},
            {Skill = "PiercingArrow5", Cooldown = 5.2, Range = 99},
            {Skill = "PiercingArrow6", Cooldown = 5.2, Range = 99},
            {Skill = "PiercingArrow7", Cooldown = 5.2, Range = 99},
            {Skill = "PiercingArrow8", Cooldown = 5.2, Range = 99},
            {Skill = "PiercingArrow9", Cooldown = 5.2, Range = 99},
            {Skill = "SpiritBomb", Cooldown = 10.2, Range = 208},
            {Skill = "MortarStrike1", Cooldown = 12.2, Range = 59},
            {Skill = "MortarStrike2", Cooldown = 12.2, Range = 76},
            {Skill = "MortarStrike3", Cooldown = 12.2, Range = 93},
            {Skill = "MortarStrike4", Cooldown = 12.2, Range = 110},
            {Skill = "MortarStrike5", Cooldown = 12.2, Range = 127},
            {Skill = "MortarStrike6", Cooldown = 12.2, Range = 144},
            {Skill = "MortarStrike7", Cooldown = 12.2, Range = 161},
            {Skill = "MortarStrike8", Cooldown = 12.2, Range = 179},
            {Skill = "HeavenlySword1", Cooldown = 31, Range = 143},
            {Skill = "HeavenlySword2", Cooldown = 31, Range = 99},
            {Skill = "HeavenlySword3", Cooldown = 31, Range = 99},
            {Skill = "HeavenlySword4", Cooldown = 31, Range = 99},
            {Skill = "HeavenlySword5", Cooldown = 31, Range = 99},
            {Skill = "HeavenlySword6", Cooldown = 31, Range = 99}
        }
    },
    Summoner = {
        DisplayName = "Summoner",
        Range = 82,
        Type = "Ranged",
        Primary = "Staff",
        Skills = {
            {Skill = "Summoner1", Cooldown = 0.55},
            {Skill = "Summoner2", Cooldown = 0.75},
            {Skill = "Summoner3", Cooldown = 1.05},
            {Skill = "Summoner4", Cooldown = 1.3},
            {Skill = "SoulHarvest1", Cooldown = 1.1, Type = "Melee", Range = 16},
            {Skill = "SoulHarvest2", Cooldown = 1.1, Type = "Melee", Range = 21},
            {Skill = "SoulHarvest3", Cooldown = 1.1, Type = "Melee", Range = 21},
            {Skill = "SoulHarvest4", Cooldown = 1.1, Type = "Melee", Range = 21},
            {Skill = "SoulHarvest5", Cooldown = 1.1, Type = "Melee", Range = 21},
            {
                Skill = b6:WaitForChild("Summoner"):WaitForChild("SoulHarvest"),
                Cooldown = 10.2,
                Type = "Remote",
                Args = "MobPosition",
                Range = 39
            },
            {Skill = b6:WaitForChild("Summoner"):WaitForChild("Summon"), Cooldown = 0.5, Type = "Remote"},
            {Skill = b6:WaitForChild("Summoner"):WaitForChild("Ultimate"), Cooldown = 1, Type = "Remote"}
        }
    },
    Necromancer = {
        DisplayName = "Necromancer",
        Range = 14,
        Type = "Melee",
        Primary = "Scythe",
        Skills = {
            {Skill = "NecroDPS1", Cooldown = 0.8},
            {Skill = "NecroDPS2", Cooldown = 1.2},
            {Skill = "NecroDPS3", Cooldown = 1.5},
            {Skill = "NecroDPS4", Cooldown = 1.9},
            {Skill = "NecroDPS5", Cooldown = 2.2},
            {Skill = "NecroDPS6", Cooldown = 2.5},
            {Skill = "NecroDPS7", Cooldown = 2.8},
            {Skill = "NecroDPS8", Cooldown = 3.2},
            {Skill = "NecroDPS9", Cooldown = 3.5},
            {Skill = "SpiritExplosion0", Cooldown = 2.25, Range = 17, Type = "Self"},
            {Skill = "SpiritExplosion1", Cooldown = 2.25, Range = 17, Type = "Self"},
            {Skill = "SpiritExplosion2", Cooldown = 3, Range = 18, Type = "Self"},
            {Skill = "SpiritExplosion3", Cooldown = 3.25, Range = 21, Type = "Self"},
            {Skill = "SpiritExplosion4", Cooldown = 4, Range = 24, Type = "Self"},
            {Skill = "TombstoneRise1", Cooldown = 4.2, Range = 18},
            {Skill = "TombstoneRise2", Cooldown = 4.2, Range = 18},
            {Skill = "TombstoneRise3", Cooldown = 4.2, Range = 18},
            {Skill = "TombstoneRise4", Cooldown = 4.2, Range = 18},
            {Skill = "TombstoneRise5", Cooldown = 4.2, Range = 18},
            {Skill = "SpiritCavern1", Cooldown = 10.2, Range = 140, Type = "Ranged"},
            {Skill = "SpiritCavern2", Cooldown = 10.2, Range = 140, Type = "Ranged"},
            {Skill = "SpiritCavern3", Cooldown = 10.2, Range = 140, Type = "Ranged"},
            {Skill = "SpiritCavern4", Cooldown = 10.2, Range = 140, Type = "Ranged"},
            {Skill = "SpiritCavern5", Cooldown = 10.2, Range = 140, Type = "Ranged"},
            {Skill = "SpiritCavern6", Cooldown = 10.2, Range = 140, Type = "Ranged"},
            {Skill = "UltScytheDrop", Cooldown = 30, Range = 98, Type = "Ranged"},
            {Skill = b6:WaitForChild("Necromancer"):WaitForChild("Ultimate"), Cooldown = 31, Type = "Remote"}
        }
    },
    MageOfShadows = {
        DisplayName = "Mage Of Shadows",
        Range = 99,
        Type = "Ranged",
        Primary = "Staff",
        Skills = {
            {Skill = "MageOfShadows", Cooldown = 0.275},
            {Skill = "MageOfShadowsBlast", Cooldown = 0.3},
            {Skill = "MageOfShadowsCharged", Cooldown = 0.31},
            {Skill = "MageOfShadowsBlastCharged", Cooldown = 0.31},
            {Skill = "BighShadowOrb1", Cooldown = 0.33},
            {Skill = "BighShadowOrb2", Cooldown = 0.33},
            {Skill = "BighShadowOrb3", Cooldown = 0.33},
            {Skill = "MageOfShadowsDamageCircle", Cooldown = 0.33},
            {
                Skill = b6:WaitForChild("MageOfShadows"):WaitForChild("ShadowChains"),
                Cooldown = 6,
                Type = "Remote",
                Args = "mobTbl"
            },
            {Skill = b6:WaitForChild("MageOfShadows"):WaitForChild("Ultimate"), Cooldown = 2, Type = "Remote"}
        }
    },
    Hunter = {
        DisplayName = "Hunter",
        Range = 99,
        Type = "Ranged",
        Primary = "Bow",
        Skills = {{Skill = "Hunter", Cooldown = 0.5}}
    },
    Stormcaller = {
        DisplayName = "Stormcaller",
        Range = 99,
        Type = "Ranged",
        Primary = "Staff",
        Skills = {
            {Skill = "Stormcaller1", Cooldown = 0.3},
            {Skill = "Stormcaller2", Cooldown = 0.3},
            {Skill = "Stormcaller3", Cooldown = 0.3},
            {Skill = "StormcallerThunderGod1", Cooldown = 0.25, Type = "Melee", Range = 13},
            {Skill = "StormcallerThunderGod2", Cooldown = 0.5, Type = "Melee", Range = 13},
            {Skill = "StormcallerThunderGod3", Cooldown = 0.75, Type = "Melee", Range = 13},
            {Skill = "StormcallerThunderGod4", Cooldown = 1, Type = "Melee", Range = 13},
            {Skill = "StormcallerThunderGod5", Cooldown = 1.25, Type = "Melee", Range = 13},
            {Skill = "StormcallerThunderGod6", Cooldown = 1.6, Type = "Melee", Range = 13},
            {Skill = "StormcallerThunderGod7", Cooldown = 2, Type = "Melee", Range = 13},
            {Skill = "StormcallerThunderGod8", Cooldown = 2.3, Type = "Melee", Range = 13},
            {Skill = "UltimateDischarge", Cooldown = 1.6, Range = 39},
            {Skill = "ChainLightning1", Cooldown = 7.1, Range = 119},
            {Skill = "ChainLightning2", Cooldown = 7.1, Range = 119},
            {Skill = "ChainLightning3", Cooldown = 7.1, Range = 119},
            {Skill = "ChainLightning4", Cooldown = 7.1, Range = 119},
            {Skill = "ChainLightning5", Cooldown = 7.1, Range = 119},
            {Skill = "ChainLightning6", Cooldown = 7.1, Range = 119},
            {Skill = "ChainLightning7", Cooldown = 7.1, Range = 119},
            {Skill = "ChainLightning8", Cooldown = 7.1, Range = 119},
            {Skill = "StormSurgeInit", Cooldown = 10.1, Range = 19.5},
            {Skill = "StormSurge", Cooldown = 10.1, Range = 39.5},
            {Skill = "StormcallerUltBlast", Cooldown = 31, Range = 10}
        }
    }
}
bY = c7("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL3JvbmFsZGJ1cmdlcnNvbi9ib3JnL21haW4vYnJvb20=")
local ce = Instance.new("Folder")
ce.Name = "SummonFolder"
ce.Parent = Workspace
local cf = Instance.new("Folder")
cf.Name = "infiniteboy"
cf.Parent = Workspace
local cg
if aD then
    cg = Instance.new("Part")
    cg.Name = "InfiniteKillPart"
    cg.Size = Vector3.new(50, 20, 50)
    cg.Position = Vector3.new(10000, 10000, 10000)
    cg.Anchored = true
    cg.Transparency = 0
    cg.Material = "SmoothPlastic"
    cg.BrickColor = BrickColor.new("Cyan")
    cg.Parent = workspace
end
local ch
local ci
local cj
ch, cj, ci = bC(bX .. n .. k .. bW .. l .. bY .. bZ .. m)
a = true
function libWarn(msg)
    warn("[Infinite]: " .. msg)
end
function pcallWithError(ck)
    local bw, cl = pcall(ck)
    if not bw and cl then
        libWarn(cl)
    end
end
function libNoti(msg)
    print(msg)
    pcallWithError(
        function()
            ch:Notify(msg)
        end
    )
end
function setMissionObjective(cm, cn)
    local P = c.PlayerGui.MissionObjective.MissionObjective.Label
    P.Text = cm
    P.Overlay.Text = cm
    if cn then
        P.ZIndex = 30
        P.Overlay.ZIndex = 31
    end
end
function resetMissionObjective()
    local P = c.PlayerGui.MissionObjective.MissionObjective.Label
    P.Text = ""
    P.Overlay.Text = ""
end
function isRangedClass()
    return cd[b3] and cd[b3].Type == "Ranged"
end
local co = game:GetService("GuiService")
local cp
cp =
    co.ErrorMessageChanged:Connect(
    function(msg)
        if
            co:GetErrorCode() == Enum.ConnectionError.DisconnectLuaKick or
                co:GetErrorCode() == Enum.ConnectionError.DisconnectConnectionLost or
                msg:lower():find("exploit")
         then
            cp:Disconnect()
            ai.Kicked = true
            save()
            if msg:lower():find("exploit") then
                local cq =
                    "Killaura Delay: ``" ..
                    Options.KillauraDelay.Value ..
                        "``\nClass: ``" .. cd[b3].DisplayName .. "``\nPing: ``" .. ping2() .. "``"
                if aw then
                    cq = cq .. "\nCode: ``" .. i .. "``\nMission: ``" .. h .. "``"
                end
                cq = cq .. "\n" .. f
                request(
                    {
                        Url = boink2,
                        Method = "POST",
                        Headers = {["Content-Type"] = "application/json"},
                        Body = e:JSONEncode(
                            {
                                ["embeds"] = {
                                    {
                                        ["title"] = "Exploit Kick",
                                        ["description"] = cq,
                                        ["type"] = "rich",
                                        ["color"] = tonumber(v.LightPink),
                                        ["footer"] = {["text"] = utcDateAndTime() .. " UTC"}
                                    }
                                }
                            }
                        )
                    }
                )
            end
            a0:Teleport(ah, c)
        end
    end
)
local cr =
    ch:CreateWindow(
    {
        Title = " " .. defniwndwodnwod,
        Resizable = true,
        Center = false,
        AutoShow = true,
        TabPadding = 8,
        MenuFadeTime = 0,
        CornerRadius = 15
    }
)
local cs = {
    Main = cr:AddTab("Main"),
    Sell = cr:AddTab("Sell"),
    Teleports = cr:AddTab("Teleports"),
    ["Settings"] = cr:AddTab("Settings")
}
local ct = cs.Main:AddLeftTabbox("farmmm")
local cu = cs.Sell:AddLeftTabbox("selll")
local cv = cs.Sell:AddRightTabbox("selll2")
local cw = ct:AddTab("Farm")
local cx = ct:AddTab("Settings")
local cy = cu:AddTab("Auto Sell")
local cz = cv:AddTab("Sell/Recycle Cosmetics")
local cA = ct:AddTab("Weapons")
local cB = ct:AddTab("Event")
local cC = cs.Main:AddRightTabbox("box")
local cD = cC:AddTab("Visual")
local cE = cC:AddTab("Webhook")
local cF = cC:AddTab("Misc")
local cG = cC:AddTab("Gui")
local cH = cs.Main:AddRightTabbox("temp")
local cI = cH:AddTab("Stats")
local cJ = cs.Teleports:AddLeftGroupbox("Worlds")
local cK = cs.Teleports:AddRightGroupbox("Towers")
local cL = cs.Teleports:AddRightGroupbox("Nightmare Dungeons")
cw:AddToggle("Killaura", {Text = "Killaura", Default = false})
cw:AddSlider(
    "KillauraDelay",
    {Text = "Delay", Default = 0, Min = 0, Max = 1, Rounding = 2, HideMax = true, Compact = true}
)
cw:AddToggle("Autofarm", {Text = "Autofarm", Default = false})
cw:AddSlider(
    "Offset",
    {
        Text = "Offset",
        Default = isRangedClass() and 50 or 6,
        Min = 0,
        Max = aw and (isRangedClass() and 75 or 25) or 75,
        Rounding = 1,
        Compact = true
    }
)
cw:AddSlider(
    "healPercent",
    {Text = "Heal At", Default = 30, Min = 0, Max = 100, Rounding = 0, HideMax = true, Compact = true, Suffix = "% HP"}
)
cw:AddSlider(
    "resumePercent",
    {
        Text = "Resume At",
        Default = 100,
        Min = 0,
        Max = 100,
        Rounding = 0,
        HideMax = true,
        Compact = true,
        Suffix = "% HP"
    }
)
cw:AddToggle("CollectDrops", {Text = "Collect Drops", Default = false})
cw:AddToggle("RestartDungeon", {Text = "Restart Dungeon", Default = false})
cw:AddToggle("nightmareLoop", {Text = "Nightmare Loop", Default = false})
cw:AddToggle("NextDungeon", {Text = "Next Dungeon", Default = false})
cw:AddToggle(
    "PerkSwitcher",
    {
        Text = "Auto Switch Perks",
        Default = false,
        Tooltip = "Enables Primary Perks on Mobs, and Offhand Perks on Bosses"
    }
)
cw:AddToggle("autoEquipBestwWep", {Text = "Auto Equip Best Weapon/Armor", Default = false})
cw:AddToggle("mobCamera", {Text = "Mob POV", Default = false})
cw:AddSlider("FastSprint", {Text = "Sprint Speed", Default = 28, Min = 28, Max = 200, Rounding = 0, Compact = true})
cw:AddButton(
    {Text = "Restart Dungeon", Func = function()
            if aw then
                StartRaid(as, at)
            end
        end, DoubleClick = false}
)
cx:AddSlider(
    "dungeonRestartTimer",
    {
        Text = "Restart Dungeon Delay",
        Default = 0,
        Min = 0,
        Max = 300,
        Rounding = 0,
        HideMax = true,
        Suffix = " seconds",
        Compact = true
    }
)
cx:AddSlider(
    "towerRestartTimer",
    {
        Text = "Restart Tower Delay",
        Default = 0,
        Min = 0,
        Max = 30,
        Rounding = 0,
        HideMax = true,
        Suffix = " seconds",
        Compact = true
    }
)
cx:AddSlider(
    "dungeonStartTimer",
    {
        Text = "Dungeon Start Delay",
        Default = 0,
        Min = 0,
        Max = 300,
        Rounding = 0,
        HideMax = true,
        Suffix = " seconds",
        Compact = true
    }
)
cx:AddSlider(
    "towerStartTimer",
    {
        Text = "Tower Start Delay",
        Default = 0,
        Min = 0,
        Max = 600,
        Rounding = 0,
        HideMax = true,
        Suffix = " seconds",
        Compact = true
    }
)
Options.dungeonStartTimer:OnChanged(
    function(cM)
        bk = bk + 1
    end
)
Options.towerStartTimer:OnChanged(
    function(cM)
        bl = bl + 1
    end
)
cx:AddSlider(
    "timeoutTimer",
    {
        Text = "Dungeon Timeout",
        Default = 120,
        Min = 10,
        Max = 300,
        Rounding = 0,
        HideMax = true,
        Suffix = " seconds",
        Tooltip = "Restart dungeon if no damage has been done within the specified time period",
        Compact = true
    }
)
cx:AddToggle(
    "restartAfterFloors",
    {
        Text = "Inf Tower Smart Restart",
        Tooltip = "Restarts Infinite Floor after specified amount of floors are completed",
        Default = false
    }
)
cx:AddInput("completedInfiniteTowerFloors", {Text = "Floors", Default = 31, Numeric = true, Finished = true})
cx:AddToggle("ignoreCannon", {Text = "Ignore Cannon (Atlantis Tower)", Default = false})
cx:AddToggle("skipScarecrowNm", {Text = "Skip Scarecrow Defense (NM Loop)", Default = false})
cx:AddToggle(
    "rejoinDungeon",
    {
        Text = "Rejoin Last Dungeon",
        Tooltip = "Automatically starts the last dungeon started within your desired time limit",
        Default = false
    }
)
Toggles.rejoinDungeon:OnChanged(
    function(cc)
        ai.RejoinLastDungeon = cc
        save()
    end
)
local cN = {
    ["30 minutes"] = 1800,
    ["3 hours"] = 10800,
    ["12 hours"] = 43200,
    ["24 hours"] = 86400,
    ["Infinite"] = 999999999
}
cx:AddDropdown(
    "rjdLimit",
    {
        Text = "Rejoin Last Dungeon Limit",
        Values = {"30 minutes", "3 hours", "12 hours", "24 hours", "Infinite"},
        Default = "30 minutes",
        AllowNull = false,
        Multi = false
    }
)
Options.rjdLimit:OnChanged(
    function(cc)
        ai.RejoinLastDungeonThreshold = cN[cc]
        save()
    end
)
cx:AddToggle(
    "forceRestartLastTower",
    {
        Text = "Force Restart Last Tower",
        Tooltip = "Restart the Tower when going back to town (willingly or by force)",
        Default = false
    }
)
Toggles.forceRestartLastTower:OnChanged(
    function(cc)
        ai.ForceRestartLastTower = cc
        save()
    end
)
cx:AddSlider(
    "playerCountKick",
    {
        Text = "Mission PlayerCount Kick",
        Default = 6,
        Min = 2,
        Max = 6,
        Rounding = 0,
        HideMax = true,
        Tooltip = "Disconnect from the game if player count reaches the threshold in mission",
        Compact = true
    }
)
task.spawn(
    function()
        while aw do
            if #b:GetPlayers() >= Options.playerCountKick.Value then
                task.wait(0.5)
                c:Kick("Someone might have joined your mission!")
                break
            end
            task.wait()
        end
    end
)
cA:AddInput("mobWepId", {Numeric = false, Finished = true, Text = "Current Mob Weapon"})
cA:AddInput("bossWepId", {Numeric = false, Finished = true, Text = "Current Boss Weapon"})
cA:AddButton(
    {
        Text = "Set Current Primary for Mobs",
        Tooltip = "Killaura will auto equip this weapon when targeting mobs",
        Func = function()
            local cO = aZ and aZ:GetChildren()[1]
            local cP = cO and cO.ID.Value
            if cP then
                Options.mobWepId:SetValue(cP)
                libNoti("Set " .. bJ[cO.Name].DisplayKey .. " as your Mob weapon!")
            else
                libNoti("No suitable Primary Weapon Detected")
            end
        end,
        DoubleClick = false
    }
)
cA:AddButton(
    {
        Text = "Set Current Primary for Bosses",
        Tooltip = "Killaura will auto equip this weapon when targeting bosses",
        Func = function()
            local cO = aZ and aZ:GetChildren()[1]
            local cP = cO and cO.ID.Value
            if cP then
                Options.bossWepId:SetValue(cP)
                libNoti("Set " .. bJ[cO.Name].DisplayKey .. " as your Boss weapon!")
            else
                libNoti("No suitable Primary Weapon Detected")
            end
        end,
        DoubleClick = false
    }
)
cA:AddButton(
    {Text = "Reset Selected Weapons", Func = function()
            Options.mobWepId:SetValue("")
            Options.bossWepId:SetValue("")
            libNoti("Selected weapons reset!")
        end, DoubleClick = false}
)
cE:AddInput(
    "dungeonHook",
    {
        Numeric = false,
        Finished = true,
        Text = "Mission Webhook",
        Tooltip = "Put your own webhook link to log mission completions/fails"
    }
)
cE:AddInput(
    "drophook",
    {Numeric = false, Finished = true, Text = "Drop Webhook", Tooltip = "Put your own webhook link to log T5 drops"}
)
cE:AddInput(
    "dropHookRoleId",
    {
        Numeric = false,
        Finished = true,
        Text = "Custom Role ID for DropHook",
        Tooltip = "Mention your chosen role instead of @everyone when getting a desired perk T5"
    }
)
cE:AddToggle(
    "anonHook",
    {Text = "Anonymous Webhook", Tooltip = "Won't show your User Info in the webhook", Default = false}
)
cy:AddDropdown("AutoSellTbl", {Text = "Auto Sell Tiers", Values = {1, 2, 3, 4, 5}, AllowNull = true, Multi = true})
cy:AddButton(
    {
        Text = "Sell All",
        Tooltip = "Sells all weapons and armors of selected tiers",
        Func = function()
            local cQ = {}
            for K, L in bE:GetChildren() do
                local cR = bJ[L.Name]
                if
                    (cR.Type == "Weapon" or cR.Type == "Armor") and Options.AutoSellTbl.Value[bT:GetItemTier(L)] and
                        not L:FindFirstChild("Locked")
                 then
                    table.insert(cQ, L)
                end
            end
            if #cQ > 0 then
                libNoti("Sold " .. #cQ .. " items")
                _.Drops.SellItems:InvokeServer(cQ)
            end
        end,
        DoubleClick = true
    }
)
cy:AddToggle(
    "autoSellAll",
    {
        Text = "Auto Sell All",
        Tooltip = "Failsafe incase auto sell doesn't sell in time at the end of a mission",
        Default = false
    }
)
Toggles.autoSellAll:OnChanged(
    function(cM)
        if cM then
            local cQ = {}
            for K, L in bE:GetChildren() do
                local cR = bJ[L.Name]
                if
                    (cR.Type == "Weapon" or cR.Type == "Armor") and Options.AutoSellTbl.Value[bT:GetItemTier(L)] and
                        not L:FindFirstChild("Locked")
                 then
                    table.insert(cQ, L)
                end
            end
            if #cQ > 0 then
                libNoti("Sold " .. #cQ .. " items")
                _.Drops.SellItems:InvokeServer(cQ)
            end
        end
    end
)
cy:AddToggle("autoSellEggs", {Text = "Auto Sell Eggs", Default = false, Tooltip = "Works in Event Wheel Hub also"})
cy:AddDivider()
cy:AddToggle(
    "smartPerkSell",
    {
        Text = "Smart T5 Auto Sell",
        Default = false,
        Tooltip = "Do NOT enable this until you have turned all of your desired perks slider atleast 1 higher than lowest value"
    }
)
local cS = {}
for K, L in bI do
    table.insert(cS, L.DisplayName)
end
table.sort(cS)
for K = 1, #cS do
    for cT, cU in bI do
        if cS[K] == cU.DisplayName then
            cy:AddSlider(
                cT,
                {
                    Text = cU.DisplayName,
                    Default = math.round(cU.StatRange[1] * 100),
                    Min = math.round(cU.StatRange[1] * 100),
                    Max = math.round(cU.StatRange[2] * 100),
                    Rounding = 0,
                    HideMax = true,
                    Compact = true,
                    Suffix = "%"
                }
            )
        end
    end
end
local cV = {
    GigaSlimeHead = "Giga Slime Head",
    NightTerrorHood = "Night Terror Hood",
    FlameDemonHood = "Flame Demon Hood",
    SpartanHelmet = "Mezuvian Helmet",
    AngelHood = "Angel Hood",
    AngelHalo = "Angel Halo",
    AngelicWings = "Angelic Wings",
    TaurhaStaff = "Taurha's Staff",
    AetherCrown = "Aether Crown",
    W9T5Helmet = "Aether Helmet"
}
local cW = {}
for K, L in cV do
    table.insert(cW, L)
end
table.sort(cW)
cz:AddDropdown("selectedCosmetics", {Text = "Select Cosmetics", Values = cW, AllowNull = true, Multi = true})
local cX = {
    FrostyScarf = "Frosty Scarf",
    WolfspiritHelmet = "Wolfspirit Helmet",
    WolfspiritArmor = "Wolfspirit Armor",
    FestiveDress = "Festive Dress",
    RamHorns = "Ram Horns",
    CandycaneAntlers = "Candycane Antlers",
    CarrotNose = "Carrot Nose",
    FluffyJacket = "Fluffy Jacket"
}
local cW = {}
for K, L in cX do
    table.insert(cW, L)
end
table.sort(cW)
cz:AddDropdown("selectedWheelCosmetics", {Text = "Select Event Cosmetics", Values = cW, AllowNull = true, Multi = true})
local cY = {
    {Hex = "#FF1337", Name = "Rainbow", SpecialType = true},
    {Hex = "#DDEADD", Name = "Ghoul", SpecialType = true},
    {Hex = "#11CCEE", Name = "Ice", SpecialType = true},
    {Hex = "#FFADED", Name = "Faded", SpecialType = true},
    {Hex = "#F0F8FF", Name = "Alice Blue"},
    {Hex = "#FAEBD7", Name = "Antique White"},
    {Hex = "#00FFFF", Name = "Aqua"},
    {Hex = "#7FFFD4", Name = "Aquamarine"},
    {Hex = "#F0FFFF", Name = "Azure"},
    {Hex = "#F5F5DC", Name = "Beige"},
    {Hex = "#FFE4C4", Name = "Bisque"},
    {Hex = "#000000", Name = "Black"},
    {Hex = "#FFEBCD", Name = "Blanched Almond"},
    {Hex = "#0000FF", Name = "Blue"},
    {Hex = "#8A2BE2", Name = "Blue Violet"},
    {Hex = "#A52A2A", Name = "Brown"},
    {Hex = "#DEB887", Name = "Burly Wood"},
    {Hex = "#5F9EA0", Name = "Cadet Blue"},
    {Hex = "#7FFF00", Name = "Chartreuse"},
    {Hex = "#D2691E", Name = "Chocolate"},
    {Hex = "#FF7F50", Name = "Coral"},
    {Hex = "#6495ED", Name = "Cornflower Blue"},
    {Hex = "#FFF8DC", Name = "Cornsilk"},
    {Hex = "#DC143C", Name = "Crimson"},
    {Hex = "#00FFFF", Name = "Cyan"},
    {Hex = "#00008B", Name = "Dark Blue"},
    {Hex = "#008B8B", Name = "Dark Cyan"},
    {Hex = "#B8860B", Name = "Dark Goldenrod"},
    {Hex = "#A9A9A9", Name = "Dark Gray"},
    {Hex = "#006400", Name = "Dark Green"},
    {Hex = "#BDB76B", Name = "Dark Khaki"},
    {Hex = "#8B008B", Name = "Dark Magenta"},
    {Hex = "#556B2F", Name = "Dark Olive Green"},
    {Hex = "#FF8C00", Name = "Dark Orange"},
    {Hex = "#9932CC", Name = "Dark Orchid"},
    {Hex = "#8B0000", Name = "Dark Red"},
    {Hex = "#E9967A", Name = "Dark Salmon"},
    {Hex = "#8FBC8F", Name = "Dark Sea Green"},
    {Hex = "#483D8B", Name = "Dark Slate Blue"},
    {Hex = "#2F4F4F", Name = "Dark Slate Gray"},
    {Hex = "#00CED1", Name = "Dark Turquoise"},
    {Hex = "#9400D3", Name = "Dark Violet"},
    {Hex = "#FF1493", Name = "Deep Pink"},
    {Hex = "#00B7EB", Name = "Deep Sky Blue"},
    {Hex = "#696969", Name = "Dim Gray"},
    {Hex = "#1E90FF", Name = "Dodger Blue"},
    {Hex = "#B22222", Name = "Firebrick"},
    {Hex = "#FFFAF0", Name = "Floral White"},
    {Hex = "#228B22", Name = "Forest Green"},
    {Hex = "#FF00FF", Name = "Fuchsia"},
    {Hex = "#DCDCDC", Name = "Gainsboro"},
    {Hex = "#F8F8FF", Name = "Ghost White"},
    {Hex = "#FFD700", Name = "Gold"},
    {Hex = "#DAA520", Name = "Goldenrod"},
    {Hex = "#808080", Name = "Gray"},
    {Hex = "#008000", Name = "Green"},
    {Hex = "#ADFF2F", Name = "Green Yellow"},
    {Hex = "#F0FFF0", Name = "Honeydew"},
    {Hex = "#FF69B4", Name = "Hot Pink"},
    {Hex = "#CD5C5C", Name = "Indian Red"},
    {Hex = "#4B0082", Name = "Indigo"},
    {Hex = "#FFFFF0", Name = "Ivory"},
    {Hex = "#F0E68C", Name = "Khaki"},
    {Hex = "#E6E6FA", Name = "Lavender"},
    {Hex = "#FFF0F5", Name = "Lavender Blush"},
    {Hex = "#7CFC00", Name = "Lawn Green"},
    {Hex = "#FFFACD", Name = "Lemon Chiffon"},
    {Hex = "#ADD8E6", Name = "Light Blue"},
    {Hex = "#F08080", Name = "Light Coral"},
    {Hex = "#E0FFFF", Name = "Light Cyan"},
    {Hex = "#FAFAD2", Name = "Light Goldenrod Yellow"},
    {Hex = "#D3D3D3", Name = "Light Gray"},
    {Hex = "#90EE90", Name = "Light Green"},
    {Hex = "#FFB6C1", Name = "Light Pink"},
    {Hex = "#FFA07A", Name = "Light Salmon"},
    {Hex = "#20B2AA", Name = "Light Sea Green"},
    {Hex = "#87CEFA", Name = "Light Sky Blue"},
    {Hex = "#778899", Name = "Light Slate Gray"},
    {Hex = "#B0C4DE", Name = "Light Steel Blue"},
    {Hex = "#FFFFE0", Name = "Light Yellow"},
    {Hex = "#00FF00", Name = "Lime"},
    {Hex = "#32CD32", Name = "Lime Green"},
    {Hex = "#FAF0E6", Name = "Linen"},
    {Hex = "#FF00FF", Name = "Magenta"},
    {Hex = "#800000", Name = "Maroon"},
    {Hex = "#66CDAA", Name = "Medium Aquamarine"},
    {Hex = "#0000CD", Name = "Medium Blue"},
    {Hex = "#BA55D3", Name = "Medium Orchid"},
    {Hex = "#9370DB", Name = "Medium Purple"},
    {Hex = "#3CB371", Name = "Medium Sea Green"},
    {Hex = "#7B68EE", Name = "Medium Slate Blue"},
    {Hex = "#00FA9A", Name = "Medium Spring Green"},
    {Hex = "#48D1CC", Name = "Medium Turquoise"},
    {Hex = "#C71585", Name = "Medium Violet Red"},
    {Hex = "#191970", Name = "Midnight Blue"},
    {Hex = "#F5FFFA", Name = "Mint Cream"},
    {Hex = "#FFE4E1", Name = "Misty Rose"},
    {Hex = "#FFE4B5", Name = "Moccasin"},
    {Hex = "#FFDEAD", Name = "Navajo White"},
    {Hex = "#000080", Name = "Navy"},
    {Hex = "#FDF5E6", Name = "Old Lace"},
    {Hex = "#808000", Name = "Olive"},
    {Hex = "#6B8E23", Name = "Olive Drab"},
    {Hex = "#FFA500", Name = "Orange"},
    {Hex = "#FF4500", Name = "Orange Red"},
    {Hex = "#DA70D6", Name = "Orchid"},
    {Hex = "#EEE8AA", Name = "Pale Goldenrod"},
    {Hex = "#98FB98", Name = "Pale Green"},
    {Hex = "#AFEEEE", Name = "Pale Turquoise"},
    {Hex = "#DB7093", Name = "Pale Violet Red"},
    {Hex = "#FFEFD5", Name = "Papaya Whip"},
    {Hex = "#FFDAB9", Name = "Peach Puff"},
    {Hex = "#CD853F", Name = "Peru"},
    {Hex = "#FFC0CB", Name = "Pink"},
    {Hex = "#DDA0DD", Name = "Plum"},
    {Hex = "#B0E0E6", Name = "Powder Blue"},
    {Hex = "#800080", Name = "Purple"},
    {Hex = "#FF0000", Name = "Red"},
    {Hex = "#BC8F8F", Name = "Rosy Brown"},
    {Hex = "#4169E1", Name = "Royal Blue"},
    {Hex = "#8B4513", Name = "Saddle Brown"},
    {Hex = "#FA8072", Name = "Salmon"},
    {Hex = "#F4A460", Name = "Sandy Brown"},
    {Hex = "#2E8B57", Name = "Sea Green"},
    {Hex = "#FFF5EE", Name = "Sea Shell"},
    {Hex = "#A0522D", Name = "Sienna"},
    {Hex = "#C0C0C0", Name = "Silver"},
    {Hex = "#87CEEB", Name = "Sky Blue"},
    {Hex = "#6A5ACD", Name = "Slate Blue"},
    {Hex = "#708090", Name = "Slate Gray"},
    {Hex = "#FFFAFA", Name = "Snow"},
    {Hex = "#00FF7F", Name = "Spring Green"},
    {Hex = "#4682B4", Name = "Steel Blue"},
    {Hex = "#D2B48C", Name = "Tan"},
    {Hex = "#008080", Name = "Teal"},
    {Hex = "#D8BFD8", Name = "Thistle"},
    {Hex = "#FF6347", Name = "Tomato"},
    {Hex = "#40E0D0", Name = "Turquoise"},
    {Hex = "#EE82EE", Name = "Violet"},
    {Hex = "#F5DEB3", Name = "Wheat"},
    {Hex = "#FFFFFF", Name = "White"},
    {Hex = "#F5F5F5", Name = "White Smoke"},
    {Hex = "#FFFF00", Name = "Yellow"},
    {Hex = "#9ACD32", Name = "Yellow Green"}
}
local cW = {}
for K, L in cY do
    table.insert(cW, L.Name)
end
table.sort(cW)
cz:AddDropdown(
    "selectedDyes",
    {
        Text = "Select Desired Dyes",
        Tooltip = "Event wheel items with these dyes or close to these dyes won't be sold/recycled",
        Values = cW,
        AllowNull = true,
        Default = {"Rainbow", "Ghoul", "Ice", "Faded", "Black", "White"},
        Multi = true
    }
)
cz:AddSlider(
    "colorDistanceThreshold",
    {
        Text = "Color Distance Threshold",
        Tooltip = "Keep dyes that are close to your desired dyes",
        Default = 100,
        Min = 0,
        Max = 200,
        Rounding = 0,
        HideMax = true,
        Compact = true
    }
)
cz:AddToggle("autoSellCosmetics", {Text = "Auto Sell Cosmetics", Default = false})
Toggles.autoSellCosmetics:OnChanged(
    function(cM)
        if cM and Toggles.autoRecycleCosmetics.Value then
            Toggles.autoRecycleCosmetics:SetValue(false)
        end
    end
)
cz:AddToggle("autoRecycleCosmetics", {Text = "Auto Recycle Cosmetics", Default = false})
Toggles.autoRecycleCosmetics:OnChanged(
    function(cM)
        if cM and Toggles.autoSellCosmetics.Value then
            Toggles.autoSellCosmetics:SetValue(false)
        end
    end
)
function color3ToHex(color)
    local ca = math.floor(color.R * 255 + 0.5)
    local cZ = math.floor(color.G * 255 + 0.5)
    local c8 = math.floor(color.B * 255 + 0.5)
    return string.format("#%02X%02X%02X", ca, cZ, c8)
end
function hexToRGB(c_)
    c_ = c_:gsub("#", "")
    return tonumber("0x" .. c_:sub(1, 2)), tonumber("0x" .. c_:sub(3, 4)), tonumber("0x" .. c_:sub(5, 6))
end
function colorDistance(d0, d1)
    local d2, d3, d4 = hexToRGB(d0)
    local d5, d6, d7 = hexToRGB(d1)
    return math.sqrt((d5 - d2) ^ 2 + (d6 - d3) ^ 2 + (d7 - d4) ^ 2)
end
function desiredColorCheck(d8)
    local d9
    local da
    if d8 and d8:FindFirstChild("Dye") and d8.Dye.Value then
        da = color3ToHex(d8.Dye.Value)
        for db, dc in cY do
            if Options.selectedDyes.Value[dc.Name] then
                if da == dc.Hex then
                    d9 = true
                    print("Did not sell " .. d8.Name .. " - " .. dc.Name)
                    break
                elseif not dc.SpecialType then
                    local a8 = colorDistance(da, dc.Hex)
                    if a8 <= Options.colorDistanceThreshold.Value then
                        d9 = true
                        print(
                            "Did not sell " ..
                                d8.Name ..
                                    " - Similar to " ..
                                        dc.Name ..
                                            " - Color Distance: " .. math.floor(a8 / 0.1) / 10 .. " - Hex: " .. da
                        )
                        break
                    end
                end
            end
        end
    end
    if d9 then
        return true
    end
end
cz:AddButton(
    {
        Text = "Sell Selected Cosmetics",
        Func = function()
            local cQ = {}
            for K, L in bF:GetChildren() do
                local dd = cV[L.Name] or cX[L.Name] or "none"
                if
                    (Options.selectedCosmetics.Value[dd] or Options.selectedWheelCosmetics.Value[dd]) and
                        not L:FindFirstChild("Locked") and
                        not desiredColorCheck(L)
                 then
                    table.insert(cQ, L)
                end
            end
            if #cQ > 0 then
                libNoti("Sold " .. #cQ .. " Cosmetics")
                sell(cQ)
            end
        end,
        DoubleClick = true
    }
)
cz:AddButton(
    {
        Text = "Recycle Selected Cosmetics",
        Func = function()
            local cQ = {}
            for K, L in bF:GetChildren() do
                local dd = cV[L.Name] or cX[L.Name] or "none"
                if
                    (Options.selectedCosmetics.Value[dd] or Options.selectedWheelCosmetics.Value[dd]) and
                        not L:FindFirstChild("Locked") and
                        not desiredColorCheck(L)
                 then
                    table.insert(cQ, L)
                end
            end
            if #cQ > 0 then
                libNoti("Recycled " .. #cQ .. " Cosmetics")
                recycle(cQ)
            end
        end,
        DoubleClick = true
    }
)
if ay then
    bF.ChildAdded:Connect(
        function(L)
            if Toggles.autoSellCosmetics.Value or Toggles.autoRecycleCosmetics.Value then
                local dd = cX[L.Name]
                if dd then
                    L:WaitForChild("Dye", 5)
                    if
                        Options.selectedWheelCosmetics.Value[dd] and not L:FindFirstChild("Locked") and
                            not desiredColorCheck(L)
                     then
                        if Toggles.autoSellCosmetics.Value then
                            sell({L})
                        end
                        if Toggles.autoRecycleCosmetics.Value then
                            recycle({L})
                        end
                    end
                end
            end
        end
    )
    bE.ChildAdded:Connect(
        function(L)
            if Toggles.autoSellEggs.Value then
                local d8 = bJ[L.Name]
                if d8.Type == "Egg" then
                    sell({L})
                end
            end
        end
    )
end
cB:AddInput("wheelCount", {Default = 100, Numeric = true, Finished = true, Text = "Wheel Spin Count"})
cB:AddSlider(
    "wheelDelay",
    {
        Text = "Wheel Spin Delay",
        Tooltip = "Keep dyes that are close to your desired dyes",
        Default = 0,
        Min = 0,
        Max = 5,
        Rounding = 1,
        HideMax = true,
        Compact = true
    }
)
local de =
    cB:AddLabel(
    Options.wheelCount.Value ..
        " spins in " .. timeElapsed(math.round((Options.wheelCount.Value - 1) * Options.wheelDelay.Value * 10) / 10)
)
Options.wheelCount:OnChanged(
    function(cM)
        de:SetText(cM .. " spins in " .. timeElapsed(math.round((cM - 1) * Options.wheelDelay.Value * 10) / 10))
    end
)
Options.wheelDelay:OnChanged(
    function(cM)
        de:SetText(
            Options.wheelCount.Value ..
                " spins in " .. timeElapsed(math.round((Options.wheelCount.Value - 1) * cM * 10) / 10)
        )
    end
)
cB:AddButton(
    {
        Text = "Spin wheel with the settings above!",
        Func = function()
            local df, dg = tonumber(Options.wheelCount.Value), Options.wheelDelay.Value
            if df > 0 then
                libNoti(
                    "Spinning the wheel " ..
                        df .. " times in " .. timeElapsed(math.round((df - 1) * dg * 10) / 10) .. " seconds!",
                    7
                )
                for K = 1, df do
                    _.EventSpinner.JoinQueue:FireServer(c)
                    task.wait(dg)
                end
            end
        end,
        DoubleClick = true
    }
)
function PlayerTp(x, c9, dh, di)
    if alive() then
        aO.CFrame = CFrame.new(x + Vector3.new(c9, dh, di))
    end
end
function SmartPlayerTp(bq, dj)
    if not alive() then
        return
    end
    noclip()
    aO.Velocity = Vector3.new()
    if aN:FindFirstChild("Collider") then
        aN.Collider.Velocity = Vector3.new()
    end
    if dj then
        aO.CFrame = CFrame.lookAt(bq.Position, Vector3.new(dj.Position.x, bq.Position.y, dj.Position.z))
    else
        aO.CFrame = bq
    end
end
cD:AddToggle("NVD", {Text = "No Visual Damage", Default = true})
cD:AddToggle("rendering", {Text = "Disable 3D Rendering", Default = false})
Toggles.rendering:OnChanged(
    function(cc)
        cloneref(game:GetService("RunService")):Set3dRenderingEnabled(not cc)
    end
)
cD:AddToggle("autoHide", {Text = "Hide GUI On Execution", Default = false})
cF:AddButton(
    {
        Text = "Upgrade Equipped Items",
        Func = function()
            local dk = {aZ:GetChildren()[1], a_:GetChildren()[1], b0:GetChildren()[1]}
            for db, dl in dk do
                task.spawn(
                    function()
                        if dl and dl:FindFirstChild("UpgradeLimit") and dl.UpgradeLimit.Value ~= 0 then
                            local dm = aV.Value
                            local dn = tick()
                            while task.wait(0.1) do
                                if dl:FindFirstChild("Upgrade") and dl.Upgrade.Value == dl.UpgradeLimit.Value then
                                    break
                                else
                                    b1:FireServer(dl)
                                    if aV.Value ~= dm then
                                        dm = aV.Value
                                        dn = tick()
                                    end
                                    if tick() - dn >= 2 then
                                        break
                                    end
                                end
                            end
                        end
                    end
                )
            end
        end,
        DoubleClick = true
    }
)
cF:AddButton(
    {
        Text = "Discover Dungeons (BLATANT)",
        Func = function()
            if alive() and not aw then
                local dp = Workspace.PhysicalDungeonLocations
                for K, L in dp:GetChildren() do
                    _.Teleport.WaystoneTeleport:FireServer(1)
                    aO:GetPropertyChangedSignal("Position"):Once(
                        function()
                            PlayerTp(L.Ring.Position, 0, 10, 0)
                        end
                    )
                    wait(1)
                end
            end
        end,
        DoubleClick = true
    }
)
local dq = false
if olympus then
    cF:AddButton(
        {Text = "Dex Explorer", Func = function()
                if not dq then
                    dq = true
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
                end
            end, DoubleClick = true}
    )
end
local dr = 7
local ds = {
    Bank = {DisplayName = "Bank", CodeName = "Bank", OrderId = 1},
    ZeroAltar = {DisplayName = "Zero Altar", CodeName = "Fusion", OrderId = 2},
    UpgradeMenu = {DisplayName = "Upgrade", CodeName = "ItemUpgrade", OrderId = 3},
    DungeonMenu = {DisplayName = "Dungeon Menu", CodeName = "MissionSelect", OrderId = 4},
    Inventory = {DisplayName = "Inventory", CodeName = "Inventory", OrderId = 5},
    Recycler = {DisplayName = "Recycler", CodeName = "Recycler", OrderId = 6},
    AdminItemPanel = {DisplayName = "Admin Item Panel", CodeName = "AdminItemPanel", OrderId = 7}
}
function OpenGui(x)
    setthreadcontext(2)
    require(Z.Client.Gui):Get(x):Open()
end
for K = 1, dr do
    for dt, du in ds do
        if du.OrderId == K then
            cG:AddButton(
                {Text = du.DisplayName, Func = function()
                        OpenGui(du.CodeName)
                    end, DoubleClick = false}
            )
        end
    end
end
cG:AddInput("marketFilter", {Numeric = false, Finished = true, Text = "Market Filter"})
cG:AddButton(
    {
        Text = "Open All Markets",
        Func = function()
            task.spawn(
                function()
                    setthreadcontext(2)
                    local dv = require(game.ReplicatedStorage.Client.Gui):Get("Shop")
                    local dw = getfenv(dv.Open).BuildShop
                    pcall(dv.Open, dv, game)
                    for K, L in getupvalue(dw, 1) do
                        L:Destroy()
                    end
                    for K, L in getupvalue(dw, 2) do
                        L:Disconnect()
                    end
                    local dx = {}
                    local dy = {}
                    local dz = Z:WaitForChild("PlayerShops")
                    for K, dA in b:GetPlayers() do
                        local dB = dz:FindFirstChild(dA.Name) and dz[dA.Name]:FindFirstChild("SellShop")
                        if dB and dB:FindFirstChild("Active") and dB.Active.Value then
                            setupvalue(dw, 1, {})
                            setupvalue(dw, 2, {})
                            dw(dA)
                            for K, L in getupvalue(dw, 1) do
                                L.Title.Text = L.Title.Text .. " (" .. dA.Name .. ")"
                                L.Title.Overlay.Text = L.Title.Text
                                table.insert(dx, L)
                            end
                            for K, L in getupvalue(dw, 2) do
                                table.insert(dy, L)
                            end
                        end
                    end
                    if Options.marketFilter.Value and #Options.marketFilter.Value > 0 then
                        for K, L in dx do
                            if not L.Title.Text:lower():find(Options.marketFilter.Value:lower()) then
                                L:Destroy()
                            end
                        end
                    end
                    table.sort(
                        dx,
                        function(dC, c8)
                            local dD =
                                dC:FindFirstChild("Cost") and dC.Cost:FindFirstChild("Overlay") and
                                #dC.Cost.Overlay.Text > 0 and
                                dC.Cost.Overlay.Text:gsub(",", "") and
                                tonumber(dC.Cost.Overlay.Text:gsub(",", "")) or
                                0
                            local dE =
                                c8:FindFirstChild("Cost") and c8.Cost:FindFirstChild("Overlay") and
                                #c8.Cost.Overlay.Text > 0 and
                                c8.Cost.Overlay.Text:gsub(",", "") and
                                tonumber(c8.Cost.Overlay.Text:gsub(",", "")) or
                                0
                            return dD > dE
                        end
                    )
                    setupvalue(dw, 1, dx)
                    setupvalue(dw, 2, dy)
                    getupvalue(dv.Init, 1).Title.Text = "All Shops"
                    getupvalue(dv.Init, 1).Title.Overlay.Text = "All Shops"
                end
            )
        end,
        DoubleClick = false
    }
)
local dF = cI:AddLabel("Gold Gain: " .. aV.Value - aW)
local dG = cI:AddLabel("Gold Rate: N/A")
local dH = true
g = tick()
local dI
local dJ
local dK = false
local dL = cI:AddLabel("Total Gold: " .. formatNumberWithCommas(aV.Value))
local dM = cI:AddLabel("Session Time: 0s")
cI:AddDivider()
local dN = ai.CrossSessionTimestamp or tick()
local dO = cI:AddLabel("Cross-Session Time: " .. timeElapsed(tick() - dN))
local dP =
    cI:AddLabel("CS Gold Gain: " .. formatNumberWithCommas(ai.CrossSessionGold and aX - ai.CrossSessionGold or 0))
local dQ = ai.CrossSessionGold or aX
cI:AddButton(
    {Text = "Reset Cross-Session Time", Func = function()
            dN = tick()
            ai.CrossSessionTimestamp = dN
            save()
        end, DoubleClick = true}
)
cI:AddButton(
    {Text = "Reset Cross-Session Gold", Func = function()
            dQ = aX
            ai.CrossSessionGold = dQ
            save()
            dP:SetText("CS Gold Gain: 0")
        end, DoubleClick = true}
)
local dR
if not ai.CrossSessionTimestamp then
    ai.CrossSessionTimestamp = dN
    dR = true
end
if not ai.CrossSessionGold then
    ai.CrossSessionGold = dQ
    dR = true
end
if dR then
    save()
end
task.spawn(
    function()
        while true do
            if aV.Value ~= aX then
                aX = aV.Value
                if not dH then
                    dG:SetText("Gold Rate: " .. math.floor((aX - dJ) / (tick() - dI) * 600) / 10 .. "/min")
                end
                if dH then
                    dH = false
                    dK = true
                    dI = tick()
                    dJ = aX
                end
                dF:SetText("Gold Gained: " .. formatNumberWithCommas(aX - aW))
                dL:SetText("Total Gold: " .. formatNumberWithCommas(aX))
                dP:SetText("CS Gold Gain: " .. formatNumberWithCommas(aX - dQ))
            end
            task.wait()
        end
    end
)
task.spawn(
    function()
        while true do
            task.wait(1)
            dM:SetText("Session Time: " .. timeElapsed(tick() - g))
            dO:SetText("Cross-Session Time: " .. timeElapsed(tick() - dN))
        end
    end
)
for K = 1, c3 do
    for dt, dS in c4 do
        if dS.OrderId == K then
            cJ:AddButton(
                {Text = dS.Name, Func = function()
                        _.Teleport.TeleportToHub:FireServer(dS.Id)
                    end, DoubleClick = false}
            )
        end
    end
end
for K, L in au do
    cK:AddButton(
        {Text = bG[L].NameTag .. " T" .. K, Func = function()
                StartRaid(L)
            end, DoubleClick = false}
    )
end
for K, L in av do
    cL:AddButton(
        {
            Text = string.gsub(bG[L].NameTag, "%(NIGHTMARE%) ", "") ..
                " " .. bG[L].DisplayWorldID .. "-" .. bG[L].WorldMissionID,
            Func = function()
                StartRaid(L, Toggles.ChallengeMode.Value and 5 or 1)
            end,
            DoubleClick = false
        }
    )
end
cL:AddToggle("ChallengeMode", {Text = "Challenge Mode", Default = true})
local dT = Vector3.new(0, 500, 0)
local dU = Vector3.new()
local dV
local dW
do
    function isKrakenArm(dX)
        return dX:lower():find("kraken-arm") or dX:lower():find("krakenarm")
    end
    function MobTeleport()
        task.spawn(
            function()
                local dY
                local dZ
                local d_
                while Toggles.Autofarm.Value do
                    for K, L in bd:GetChildren() do
                        if isAlive(L) then
                            if mobWaitTbl and table.find(mobWaitTbl, L.Name) and (not d_ or alwaysWait) then
                                task.wait(waittime)
                                d_ = true
                            end
                            local a5 = L.PrimaryPart
                            if not firstMobFound then
                                firstMobFound = true
                            end
                            while isAlive(L) and Toggles.Autofarm.Value and a2 do
                                bQ = L
                                dY = a5.Position
                                setCamera(not bP and Toggles.mobCamera.Value and bo, a5.Position)
                                dV =
                                    isKrakenArm(L.Name) and 0 or
                                    (a5.Size.Y / 2 + Options.Offset.Value) * (isRangedClass() and 1 or -1)
                                dW =
                                    CFrame.new(
                                    a5.Position +
                                        (table.find(aM, L) and dU or Vector3.new(0, dV, 0) + (bP and dT or dU))
                                ) +
                                    a5.CFrame.lookVector * 2
                                dZ = dW
                                SmartPlayerTp(dW, a5)
                                bS:Wait()
                            end
                        end
                    end
                    bQ = nil
                    setCamera()
                    unnoclip()
                    if aC and a2 and dZ then
                        SmartPlayerTp(dZ)
                    end
                    task.wait()
                end
                if dY and aC then
                    SmartPlayerTp(CFrame.new(dY + Vector3.new(0, 10, 0)))
                end
            end
        )
    end
    function MobTeleportIgnore(e0, mobWaitTbl, waittime, alwaysWait)
        local d_
        task.spawn(
            function()
                while Toggles.Autofarm.Value do
                    for K, L in bd:GetChildren() do
                        if isAlive(L) then
                            if L.Name ~= e0 or L.Name == e0 and b7 == 1 then
                                if mobWaitTbl and table.find(mobWaitTbl, L.Name) and (not d_ or alwaysWait) then
                                    task.wait(waittime)
                                    d_ = true
                                end
                                local a5 = L.PrimaryPart
                                while isAlive(L) and Toggles.Autofarm.Value and a2 and
                                    (L.Name ~= e0 or L.Name == e0 and b7 == 1) do
                                    bQ = L
                                    setCamera(not bP and Toggles.mobCamera.Value and bo, a5.Position)
                                    dV =
                                        isKrakenArm(L.Name) and 0 or
                                        (a5.Size.Y / 2 + Options.Offset.Value) * (isRangedClass() and 1 or -1)
                                    dW =
                                        CFrame.new(
                                        a5.Position +
                                            (table.find(aM, L) and dU or Vector3.new(0, dV, 0) + (bP and dT or dU))
                                    ) +
                                        a5.CFrame.lookVector * 2
                                    SmartPlayerTp(dW, a5)
                                    bS:Wait()
                                end
                            end
                        end
                    end
                    bQ = nil
                    setCamera()
                    unnoclip()
                    task.wait()
                end
            end
        )
    end
    function MobTeleportPriority(e1, mobWaitTbl, waittime, alwaysWait)
        local e2, e3
        task.spawn(
            function()
                while Toggles.Autofarm.Value do
                    local e4 = false
                    local e5 = {}
                    for K, L in bd:GetChildren() do
                        if isAlive(L) then
                            table.insert(e5, L)
                        end
                    end
                    for K = 1, #e1 do
                        for db, Mob in e5 do
                            if Mob.Name == e1[K] then
                                e4 = true
                                e2, e3 = Mob, Mob.Name
                                break
                            end
                        end
                        if e4 then
                            break
                        end
                    end
                    if not e4 and e5[1] then
                        e2, e3 = e5[1], e5[1].Name
                    end
                    task.wait()
                end
            end
        )
        task.spawn(
            function()
                local d_
                while Toggles.Autofarm.Value do
                    if isAlive(e2) and a2 then
                        local e6 = e2.PrimaryPart
                        bQ = e2
                        if mobWaitTbl and table.find(mobWaitTbl, e3) and (not d_ or alwaysWait) then
                            task.wait(waittime)
                            d_ = true
                        end
                        setCamera(not bP and Toggles.mobCamera.Value and bo, e6.Position)
                        dV =
                            isKrakenArm(e3) and 0 or
                            (e6.Size.Y / 2 + Options.Offset.Value) * (isRangedClass() and 1 or -1)
                        dW =
                            CFrame.new(
                            e6.Position + (table.find(aM, e2) and dU or Vector3.new(0, dV, 0) + (bP and dT or dU))
                        ) +
                            e6.CFrame.lookVector * 2
                        SmartPlayerTp(dW, e6)
                    else
                        bQ = nil
                        setCamera()
                        unnoclip()
                    end
                    bS:Wait()
                end
            end
        )
    end
    function AutoCheckpoint()
        task.spawn(
            function()
                while Toggles.Autofarm.Value do
                    if alive() then
                        for db, e7 in workspace:GetChildren() do
                            if not table.find(c0, e7.Name) then
                                for K, L in e7:GetDescendants() do
                                    if
                                        L and L.Name == "TouchInterest" and L.Parent and
                                            (table.find(b_, L.Parent.Name) or
                                                L.Parent.Parent and table.find(b_, L.Parent.Parent.Name))
                                     then
                                        task.spawn(
                                            function()
                                                L.Parent.CanCollide = false
                                                L.Parent.Anchored = true
                                                L.Parent.Transparency = 1
                                                L.Parent.CFrame = CFrame.new(aO.Position)
                                                task.wait(0.25)
                                                if L and L.Parent then
                                                    L.Parent.CFrame = CFrame.new(Vector3.new(0, 0, 0))
                                                end
                                            end
                                        )
                                    end
                                end
                            end
                        end
                        local e8 = tick()
                        while Toggles.Autofarm.Value do
                            if tick() - e8 > 3 or tick() - e8 > 0.5 and b7 == 0 then
                                break
                            end
                            task.wait()
                        end
                    end
                    task.wait()
                    if aG then
                        break
                    end
                end
            end
        )
    end
    function MobCounter()
        task.spawn(
            function()
                while Toggles.Autofarm.Value do
                    b8 = 0
                    for K, L in bd:GetChildren() do
                        if isAlive(L) then
                            b8 = b8 + 1
                        end
                    end
                    if b7 ~= b8 then
                        b7 = b8
                    end
                    task.wait()
                end
            end
        )
    end
    function AntiFling()
        if Toggles.Autofarm.Value then
            task.spawn(
                function()
                    bO = nil
                    while Toggles.Autofarm.Value do
                        if bQ and bQ.PrimaryPart and bQ.PrimaryPart.Position then
                            bO =
                                aG and CFrame.new(Vector3.new(324, 60, -134)) or
                                CFrame.new(bQ.PrimaryPart.Position + Vector3.new(0, 5, 0))
                        end
                        if bO and b7 == 0 then
                            local e9 = tick()
                            while tick() - e9 <= 0.1 and b7 == 0 do
                                SmartPlayerTp(bO)
                                bS:Wait()
                            end
                            bO = nil
                        end
                        task.wait()
                    end
                    if not Toggles.Autofarm.Value then
                        if bO then
                            local e9 = tick()
                            while tick() - e9 <= 0.1 do
                                SmartPlayerTp(bO)
                                bS:Wait()
                            end
                            bO = nil
                        end
                    end
                end
            )
        end
    end
    function sell(bx)
        _.Drops.SellItems:InvokeServer(bx)
    end
    function recycle(bx)
        _.Recycler.Recycle:FireServer(bx)
    end
end
if j then
    function ChangeCosmetic(x, y)
        if aN then
            aQ:SetAttribute(x, y)
        end
    end
    function color(c9, dh, di)
        Color3.fromRGB(c9, dh, di)
    end
    local ea = {
        Red = Color3.fromRGB(255, 0, 0),
        Black = Color3.fromRGB(0, 0, 0),
        White = Color3.fromRGB(255, 255, 255),
        Green = Color3.fromRGB(0, 255, 0),
        Pink = Color3.fromRGB(255, 0, 255),
        Cyan = Color3.fromRGB(0, 255, 255),
        Purple = Color3.fromRGB(127.5, 0, 255),
        Orange = Color3.fromRGB(255, 127.5, 0),
        LightPink = Color3.fromRGB(255, 127.5, 255)
    }
    local aY = {
        Costume = "Costume",
        CostumeDye = "CostumeDye",
        RightAura = "RightAura",
        LeftAura = "LeftAura",
        RightWepSkin = "PrimarySkin",
        LeftWepSkin = "OffhandSkin",
        Back = "Back",
        BackDye = "BackDye",
        Hat1 = "Hat1",
        Hat1Dye = "Hat1Dye",
        Hat2 = "Hat2",
        Hat2Dye = "Hat2Dye",
        Hat3 = "Ha32",
        Hat3Dye = "Hat3Dye",
        Mount = "Mount"
    }
    local eb = {Costume = "CogWorkArmor", Hat1 = "CogWorkTophat", Hat2 = "CogWorkGoggles"}
    function CogWorkOutfit()
        if aQ:GetAttribute("Primary") then
            local ec = bJ[aQ:GetAttribute("Primary")].SubType
            if ec == "Greataxe" then
                ChangeCosmetic(aY.RightWepSkin, "CogWorkAxe")
            else
                ChangeCosmetic(aY.RightWepSkin, "CogWork" .. ec)
            end
        end
        if aQ:GetAttribute("Offhand") then
            local ec = bJ[aQ:GetAttribute("Offhand")].SubType
            if ec == "Greataxe" then
                ChangeCosmetic(aY.LeftWepSkin, "CogWorkAxe")
            else
                ChangeCosmetic(aY.LeftWepSkin, "CogWork" .. ec)
            end
        end
        for K, L in eb do
            ChangeCosmetic(K, L)
        end
    end
    OutfitList:AddButton(
        {Text = "Cogwork", Func = function()
                if aN then
                    CogWorkOutfit()
                end
            end, DoubleClick = false}
    )
end
local function ed(dC, c8, cc)
    return string.char(dC + c8 - cc)
end
local ee = ""
ee = ee .. ed(68, 1, 1)
ee = ee .. ed(101, 2, 2)
ee = ee .. ed(109, 3, 3)
ee = ee .. ed(111, 4, 4)
ee = ee .. ed(110, 5, 5)
table.insert(bn, ee)
local ef = ""
ef = ef .. ed(76, 2, 2)
ef = ef .. ed(105, 1, 1)
ef = ef .. ed(102, 0, 0)
ef = ef .. ed(101, -1, -1)
ef = ef .. ed(83, 0, 0)
ef = ef .. ed(116, 0, 0)
ef = ef .. ed(101, 0, 0)
ef = ef .. ed(97, 0, 0)
ef = ef .. ed(108, 0, 0)
function hookWithUserInfo(eg, eh, ei, color, p, ej)
    request(
        {
            Url = eg,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = e:JSONEncode(
                {
                    ["content"] = ej or "",
                    ["embeds"] = {
                        {
                            ["title"] = eh,
                            ["description"] = ei,
                            ["type"] = "rich",
                            ["color"] = tonumber(color),
                            ["footer"] = {["text"] = p .. " UTC"}
                        }
                    }
                }
            )
        }
    )
end
function anonHook(eg, eh, ei, color, p, ej)
    request(
        {
            Url = eg,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = e:JSONEncode(
                {
                    ["content"] = ej or "",
                    ["embeds"] = {
                        {
                            ["title"] = eh,
                            ["description"] = ei,
                            ["type"] = "rich",
                            ["color"] = tonumber(color),
                            ["footer"] = {["text"] = p .. " UTC"}
                        }
                    }
                }
            )
        }
    )
end
function msg(ek, color, p)
    local el = Options.dungeonHook.Value
    local em = p > 600 and timeElapsed(p) or math.round(p / 0.1) / 10 .. "s"
    local en =
        "Code: ``" ..
        i .. "``\nMission: ``" .. h .. "``\nTime: ``" .. em .. "``\nClass: " .. "``" .. cd[b3].DisplayName .. "``"
    if aC then
        local bs = bd:GetChildren()[1]
        local eo = bs and Mob(bs.Name)
        local aa, e3 = eo and eo.BossTag, eo and eo.NameTag
        if aa and e3 then
            en = en .. "\nBoss: ``" .. e3 .. "``"
        end
    end
    if ad then
        if ai.LastDungeonCompletion then
            en =
                en ..
                "\nTime Since Last Completion: ``" .. math.round((bU - ai.LastDungeonCompletion) / 0.1) / 10 .. "s``"
        end
        if ai.Gold and a3 >= ai.Gold then
            en = en .. "\nGold Gained: ``" .. formatNumberWithCommas(a3 - ai.Gold) .. "``"
        end
        ai.Gold = a3
        ai.LastDungeonCompletion = bU
        save()
    end
    en = en .. "\nGold: ``" .. formatNumberWithCommas(aV.Value) .. "``"
    if aF then
        local ep = {
            KrakenRaid = {coinCode = "KrakenCoin", coinStr = "Kraken Coins", lb = "KRAKEN_KILLS", name = "Kraken"},
            VaneRaid = {coinCode = "DragonCoin", coinStr = "Dragon Coins", lb = "VANE_KILLS", name = "Vane"},
            HalloweenRaid = {
                coinCode = "HalloweenCoin",
                coinStr = "Halloween Coins",
                lb = "FALLENKING_KILLS",
                name = "Halloween"
            },
            ChristmasRaid = {
                coinCode = "ChristmasCoin",
                coinStr = "Christmas Coins",
                lb = "SANTA_KILLS",
                name = "Christmas"
            }
        }
        local eq = aG and "KrakenRaid" or aI and "VaneRaid" or aJ and "HalloweenRaid" or aH and "ChristmasRaid"
        local er = ep[eq].coinCode
        local es = ep[eq].coinStr
        local et = ep[eq].lb
        local eu = ep[eq].name
        local ev = game:GetService("ReplicatedStorage").Shared.LeaderboardHookup.GetScore:InvokeServer(et, 1)
        en = en .. "\n" .. eu .. " Raids Completed: ``" .. ev[1] .. "`` / ``" .. ev[2] .. "``"
        if bE:FindFirstChild(er) and bE[er]:FindFirstChild("Count") then
            en = en .. "\n" .. es .. ": ``" .. bE[er].Count.Value .. "``"
        end
    elseif aC or aD then
        en = en .. "\nFloor: **" .. Z.ReplicateTowerFloor.Value .. "**"
    end
    function getGuildInfo()
        local M = _.Guilds.GetCache:InvokeServer(bR)
        local N
        for K, L in M.Members do
            if tonumber(K) == d then
                N = L.Points
                break
            end
        end
        if N then
            en = en .. "\nGuild Points: ``" .. N .. "`` / ``" .. bR .. "``"
        end
    end
    local ew = true
    if bR and not Toggles.anonHook.Value and ew then
        getGuildInfo()
    end
    if not Toggles.anonHook.Value then
        en = en .. "\n" .. f
    end
    if el and #el > 30 then
        if ac then
            task.wait(1.5)
        end
        ac = true
        if Toggles.anonHook.Value then
            anonHook(el, ek, en, color, utcDateAndTime())
        else
            hookWithUserInfo(el, ek, en, color, utcDateAndTime())
        end
        ac = false
    end
    if not olympus then
        if bR and Toggles.anonHook.Value then
            getGuildInfo()
        end
        if Toggles.anonHook.Value then
            en = en .. "\n" .. f
        end
        if ac then
            task.wait(1.5)
        end
        ac = true
        hookWithUserInfo(boink3, ek, en, color, utcDateAndTime())
        ac = false
    end
end
function missionEndRestartOrNextEvent()
    if Toggles.Autofarm.Value then
        if Toggles.nightmareLoop.Value and aE then
            local ex = nextInTbl(av, as)
            if bG[ex].InternalID == 3 and Toggles.skipScarecrowNm.Value then
                ex = nextInTbl(av, ex)
                libNoti("Skipping Scarecrow Defense")
            end
            StartRaid(ex, at)
        elseif Toggles.NextDungeon.Value and not aC then
            local ey = nextInTbl(c5, as)
            local ez = table.find(ak, ey)
            local eA = aU.Level.Value >= missionLevelReq(ey) and (at == 5 or aB or aD)
            local eB = eA and ey or as
            local eC = not eA and (at == 1 and 5 or at) or not ez and 1 or nil
            StartRaid(eB, eC)
        elseif Toggles.RestartDungeon.Value then
            game:GetService("ReplicatedStorage").Shared.Missions.LeaveChoice:FireServer(true)
            game:GetService("ReplicatedStorage").Shared.Missions.NotifyReadyToLeave:FireServer()
            StartRaid(as, at)
        end
    end
end
function openEndChests()
    if Toggles.Autofarm.Value then
        for K = 1, 4 do
            b5:InvokeServer()
        end
    end
end
if aw then
    if ar:FindFirstChild(6) then
        task.spawn(
            function()
                local eD, eE, eF =
                    Workspace:WaitForChild("Pillar1"),
                    Workspace:WaitForChild("Pillar2"),
                    Workspace:WaitForChild("Pillar3")
                eF:WaitForChild("HealthProperties")
                eD.Name = "Pillar"
                eE.Name = "Pillar"
                eF.Name = "Pillar"
                eD.Parent = bd
                eE.Parent = bd
                eF.Parent = bd
            end
        )
    elseif aA or aG then
        task.spawn(
            function()
                while true do
                    local eG = bd:FindFirstChild("BOSSKrakenMain") or bd:FindFirstChild("EVENTBOSSKraken")
                    if eG then
                        local eH = Instance.new("Folder")
                        eH.Name = "WaterFolder"
                        eH.Parent = Workspace
                        eG.Parent = Workspace.WaterFolder
                        if aA then
                            bb = true
                        end
                        break
                    end
                    task.wait()
                end
            end
        )
    elseif ar:FindFirstChild(30) then
        local eI = 0
        task.spawn(
            function()
                while true do
                    for K, L in bd:GetChildren() do
                        if (L.PrimaryPart.Position - Vector3.new(533, 302, -123)).magnitude < 100 then
                            L:Destroy()
                            eI = eI + 1
                        end
                    end
                    if eI == 3 then
                        break
                    end
                    task.wait()
                end
            end
        )
    end
    local eJ = bG[as]
    h = eJ.NameTag .. (at == 1 and " Normal" or at == 5 and " Challenge" or "")
    h = string.gsub(h, "%(NIGHTMARE%) ", "Nightmare ")
    i =
        eJ.EventDungeon and "Event" or (aC or aD) and "Special" or eJ.TowerID and "Tower " .. eJ.TowerID or
        eJ.DisplayWorldID .. "-" .. eJ.WorldMissionID
    _.Missions.MissionFinished.OnClientEvent:Once(
        function(eK, eL, eM, eN)
            bU = tick()
            a3 = aV.Value
            aK = true
            task.spawn(
                function()
                    libNoti("Mission " .. (eM and "Failed!" or "Completed!"))
                    msg("Mission " .. (eM and "Failed" or "Completed"), v[eM and "Red" or "Green"], eK)
                end
            )
            bE.ChildAdded:Connect(
                function(cc)
                    local eO = bJ[cc.Name]
                    local eP = bT:GetItemTier(cc)
                    local eQ
                    if eO.Type == "Weapon" or eO.Type == "Armor" then
                        if bg then
                            bh = false
                            bi = tick()
                        end
                        cc:WaitForChild("Level")
                        if eP < 6 then
                            if Options.AutoSellTbl.Value[eP] and Toggles.Autofarm.Value then
                                libNoti("Sold a Lvl " .. cc.Level.Value .. " T" .. eP .. " " .. eO.DisplayKey)
                                sell({cc})
                                eQ = true
                            end
                        end
                        if eP == 5 and not Options.AutoSellTbl.Value[5] then
                            cc:WaitForChild("Perk1")
                            cc:WaitForChild("Perk2")
                            cc:WaitForChild("Perk3")
                            cc.Perk1:WaitForChild("PerkValue")
                            cc.Perk2:WaitForChild("PerkValue")
                            cc.Perk3:WaitForChild("PerkValue")
                            local eR
                            local eS
                            local eT
                            if not Toggles.anonHook.Value then
                                eT =
                                    f ..
                                    "\nType: ``" ..
                                        eO.Type ..
                                            "``\nLevel: ``" .. cc.Level.Value .. "``\n## ``" .. eO.DisplayKey .. "``"
                            else
                                eT =
                                    "Type: ``" ..
                                    eO.Type .. "``\nLevel: ``" .. cc.Level.Value .. "``\n## ``" .. eO.DisplayKey .. "``"
                            end
                            for db, eU in cc:GetChildren() do
                                if Options[eU.Value] then
                                    local eV = math.round(eU.PerkValue.Value * 100)
                                    local eW = Options[eU.Value].Value
                                    local eX = eW > math.round(bI[eU.Value].StatRange[1] * 100)
                                    local eY = bI[eU.Value].DisplayName
                                    local eZ = eX and eV >= eW
                                    local e_ = eX and eV == math.round(bI[eU.Value].StatRange[2] * 100)
                                    if eZ and not eR then
                                        eR = true
                                    end
                                    if e_ and not eS then
                                        eS = true
                                    end
                                    eT =
                                        eT ..
                                        "\n" ..
                                            (e_ and "### <:Gold:832693611396857886> " or eZ and "### :green_circle: " or
                                                "### :red_circle: ") ..
                                                eY .. ": ``" .. eV .. "%``"
                                end
                            end
                            if not eR and Toggles.smartPerkSell.Value and Toggles.Autofarm.Value then
                                libNoti("Sold a Lvl " .. cc.Level.Value .. " T" .. eP .. " " .. eO.DisplayKey)
                                sell({cc})
                                eQ = true
                            end
                            local el = Options.drophook.Value
                            if el and #el > 30 and Toggles.Autofarm.Value then
                                task.spawn(
                                    function()
                                        local f0 =
                                            Options.dropHookRoleId.Value and #Options.dropHookRoleId.Value > 0 and
                                            "<@&" .. Options.dropHookRoleId.Value .. ">"
                                        local f1 = eR and (f0 or "@everyone") or ""
                                        local d9 = eS and v.Gold or eR and v.Green or v.Cyan
                                        if ac then
                                            task.wait(1.5)
                                        end
                                        ac = true
                                        local f2 = "Legendary Drop"
                                        if Toggles.anonHook.Value then
                                            anonHook(el, f2, eT, d9, utcDateAndTime(), f1)
                                        else
                                            hookWithUserInfo(el, f2, eT, d9, utcDateAndTime(), f1)
                                        end
                                        ac = true
                                    end
                                )
                            end
                        end
                        if not eQ then
                            libNoti("Got a Lvl " .. cc.Level.Value .. " T" .. eP .. " " .. eO.DisplayKey .. "!")
                        end
                        if bg then
                            bh = true
                            bi = tick()
                        end
                    elseif eO.Type == "Egg" and Toggles.autoSellEggs.Value and Toggles.Autofarm.Value then
                        sell({cc})
                        libNoti(eO.DisplayKey .. " sold!")
                    end
                end
            )
            bF.ChildAdded:Connect(
                function(cc)
                    local eO = bJ[cc.Name]
                    if Options.selectedCosmetics.Value[eO.DisplayKey] and Toggles.Autofarm.Value then
                        sell({cc})
                        libNoti(eO.DisplayKey .. " sold!")
                    end
                end
            )
            pcallWithError(
                function()
                    openEndChests()
                end
            )
            task.wait(eM and 2 or 3 + Options.dungeonRestartTimer.Value)
            missionEndRestartOrNextEvent()
        end
    )
    local f3 = _.Towers:WaitForChild("TowerFinished")
    if aB or aD then
        f3.OnClientEvent:Once(
            function(f4, eK)
                local f5 = eK
                if eK > 31536000 then
                    f5 = 0
                end
                task.spawn(
                    function()
                        task.wait(40)
                        missionEndRestartOrNextEvent()
                    end
                )
                bU = tick()
                aK = true
                a3 = aV.Value
                task.spawn(
                    function()
                        msg("Mission Completed", v.Green, f5)
                    end
                )
                pcallWithError(
                    function()
                        openEndChests()
                    end
                )
                while true do
                    if bg and bh and tick() - bi >= 2 and tick() - bj >= 2 or bg and tick() - bj >= 15 then
                        break
                    end
                    task.wait()
                end
                task.wait(Options.towerRestartTimer.Value)
                missionEndRestartOrNextEvent()
            end
        )
    end
end
if aB or aC or aD then
    Workspace.ChildAdded:Connect(
        function(cc)
            if Toggles.Autofarm.Value then
                local f6 = aK and aB
                if cc.Name == b9 or cc.Name == ba or (a4 or f6) and cc.Name == "RaidChestBlue" then
                    bj = tick()
                    if aK then
                        bg = true
                        bh = false
                    end
                    task.spawn(
                        function()
                            cc.PrimaryPart.CanCollide = false
                            while cc and cc.PrimaryPart do
                                if alive() then
                                    cc.PrimaryPart.CFrame = CFrame.new(aO.Position)
                                end
                                task.wait()
                            end
                        end
                    )
                end
            end
        end
    )
    bE.ChildAdded:Connect(
        function(cc)
            local eO = bJ[cc.Name]
            local eP = bT:GetItemTier(cc)
            local eQ
            if eO.Type == "Weapon" or eO.Type == "Armor" then
                if bg then
                    bh = false
                    bi = tick()
                end
                task.spawn(
                    function()
                        task.wait(2)
                        require(game:GetService("ReplicatedStorage").Client.Gui):Get("LootReceived"):_Close()
                        game:GetService("Players").LocalPlayer.PlayerGui.LootReceived.LootReceived.Visible = false
                    end
                )
                cc:WaitForChild("Level")
                if eP < 6 then
                    if Options.AutoSellTbl.Value[eP] and Toggles.Autofarm.Value then
                        task.wait(2)
                        libNoti("Sold a Lvl " .. cc.Level.Value .. " T" .. eP .. " " .. eO.DisplayKey)
                        sell({cc})
                        eQ = true
                    end
                end
                if eP == 5 and not Options.AutoSellTbl.Value[5] then
                    cc:WaitForChild("Perk1")
                    cc:WaitForChild("Perk2")
                    cc:WaitForChild("Perk3")
                    cc.Perk1:WaitForChild("PerkValue")
                    cc.Perk2:WaitForChild("PerkValue")
                    cc.Perk3:WaitForChild("PerkValue")
                    local eR
                    local eS
                    local eT
                    if not Toggles.anonHook.Value then
                        eT =
                            f ..
                            "\nType: ``" ..
                                eO.Type .. "``\nLevel: ``" .. cc.Level.Value .. "``\n## ``" .. eO.DisplayKey .. "``"
                    else
                        eT =
                            "Type: ``" ..
                            eO.Type .. "``\nLevel: ``" .. cc.Level.Value .. "``\n## ``" .. eO.DisplayKey .. "``"
                    end
                    for db, eU in cc:GetChildren() do
                        if Options[eU.Value] then
                            local eV = math.round(eU.PerkValue.Value * 100)
                            local eW = Options[eU.Value].Value
                            local eX = eW > math.round(bI[eU.Value].StatRange[1] * 100)
                            local eY = bI[eU.Value].DisplayName
                            local eZ = eX and eV >= eW
                            local e_ = eX and eV == math.round(bI[eU.Value].StatRange[2] * 100)
                            if eZ and not eR then
                                eR = true
                            end
                            if e_ and not eS then
                                eS = true
                            end
                            eT =
                                eT ..
                                "\n" ..
                                    (e_ and "### <:Gold:832693611396857886> " or eZ and "### :green_circle: " or
                                        "### :red_circle: ") ..
                                        eY .. ": ``" .. eV .. "%``"
                        end
                    end
                    if not eR and Toggles.smartPerkSell.Value and Toggles.Autofarm.Value then
                        libNoti("Sold a Lvl " .. cc.Level.Value .. " T" .. eP .. " " .. eO.DisplayKey)
                        sell({cc})
                        eQ = true
                    end
                    local el = Options.drophook.Value
                    if el and #el > 30 and Toggles.Autofarm.Value then
                        task.spawn(
                            function()
                                local f0 =
                                    Options.dropHookRoleId.Value and #Options.dropHookRoleId.Value > 0 and
                                    "<@&" .. Options.dropHookRoleId.Value .. ">"
                                local f1 = eR and (f0 or "@everyone") or ""
                                local d9 = eS and v.Gold or eR and v.Green or v.Cyan
                                if ac then
                                    task.wait(1.5)
                                end
                                ac = true
                                local f2 = "Legendary Drop"
                                if Toggles.anonHook.Value then
                                    anonHook(el, f2, eT, d9, utcDateAndTime(), f1)
                                else
                                    hookWithUserInfo(el, f2, eT, d9, utcDateAndTime(), f1)
                                end
                                ac = true
                            end
                        )
                    end
                end
                if not eQ then
                    libNoti("Got a Lvl " .. cc.Level.Value .. " T" .. eP .. " " .. eO.DisplayKey .. "!")
                end
                if bg then
                    bh = true
                    bi = tick()
                end
            elseif eO.Type == "Egg" and Toggles.autoSellEggs.Value and Toggles.Autofarm.Value then
                sell({cc})
                libNoti(eO.DisplayKey .. " sold!")
            end
        end
    )
    bF.ChildAdded:Connect(
        function(cc)
            local eO = bJ[cc.Name]
            if Options.selectedCosmetics.Value[eO.DisplayKey] and Toggles.Autofarm.Value then
                sell({cc})
                libNoti(eO.DisplayKey .. " sold!")
            end
        end
    )
end
local f7
local f8
local f9 = {EliteParticles = "Part", Model = "Model", BlastIndicator = "BlastIndicator"}
if aC then
    workspace.ChildAdded:Connect(
        function(cc)
            if Toggles.Autofarm.Value then
                for K, L in f9 do
                    if cc.Name == K and cc:IsA(L) then
                        cc:Destroy()
                    end
                end
            end
        end
    )
end
Toggles.Autofarm:OnChanged(
    function(fa)
        ae = tick()
        bP = false
        if fa and ConfigAutoLoaded and aw then
            local dn = tick()
            while (bl < 2 or bk < 2 or bm < 2) and Toggles.Autofarm.Value and tick() - dn < 3 do
                task.wait()
            end
        end
        if fa and aC and aw then
            for db, cc in workspace:GetChildren() do
                for K, L in f9 do
                    if cc.Name == K and cc:IsA(L) then
                        cc:Destroy()
                    end
                end
            end
        end
        local fb =
            fa and aw and (az and Options.dungeonStartTimer.Value or (aB or aD) and Options.towerStartTimer.Value)
        if fb and fb > 0 then
            local dn = tick()
            local fc
            local fd
            if aD then
                if alive() then
                    fd = aO.Position
                end
                if Toggles.Killaura.Value then
                    Toggles.Killaura:SetValue(false)
                    fc = true
                    libNoti("Killaura Disabled! It will be turned back on automatically when autofarm starts!", 6)
                end
            end
            while tick() - dn <= fb and Toggles.Autofarm.Value do
                local fe = math.round(fb - (tick() - dn))
                setMissionObjective("[Infinite]: Starting Mission in " .. fe .. "s")
                ae = tick()
                if aD and alive() and (aO.Position - cg.Position).magnitude > 100 then
                    SmartPlayerTp(CFrame.new(cg.Position + Vector3.new(0, 20, 0)))
                end
                task.wait()
            end
            resetMissionObjective()
            if fc and Toggles.Autofarm.Value and not Toggles.Killaura.Value then
                Toggles.Killaura:SetValue(true)
            end
            if aD then
                SmartPlayerTp(CFrame.new(fd + Vector3.new(0, 5, 0)))
            end
        end
        if aw and Toggles.Autofarm.Value then
            if not f7 then
                local ff = Instance.new("Part")
                ff.Anchored = true
                ff.Size = Vector3.new(20, 1, 20)
                ff.Parent = workspace
                ff.Transparency = 1
                f7 = true
            end
            if aq:FindFirstChild("MissionStart") and alive() then
                for K, L in aq.MissionStart:GetDescendants() do
                    if L:IsA("TouchTransmitter") and L.Parent then
                        L.Parent.CanCollide = false
                        L.Parent.Anchored = true
                        L.Parent.CFrame = CFrame.new(aO.Position)
                        break
                    end
                end
            end
            if az or aB then
                AutoCheckpoint()
            end
            if as ~= 38 then
                AntiFling()
            end
            MobCounter()
            local fg = false
            for K, L in c2 do
                if ar:FindFirstChild(L.Id) then
                    fg = true
                    if L.ignoreMob then
                        MobTeleportIgnore(L.ignoreMob, L.mobWaitTbl, L.mobWaitTime, L.alwaysWait)
                    elseif L.priorityTbl then
                        MobTeleportPriority(L.priorityTbl, L.mobWaitTbl, L.mobWaitTime, L.alwaysWait)
                    end
                    break
                end
            end
            if not fg then
                MobTeleport()
            end
            task.spawn(
                function()
                    while Toggles.Autofarm.Value do
                        if alive() and aP:FindFirstChild("MaxHealth") then
                            local fh = aP.Health.Value / aP.MaxHealth.Value / 0.01
                            if Options.resumePercent.Value > Options.healPercent.Value then
                                if fh <= Options.healPercent.Value and fh > 0 and not bP then
                                    bP = true
                                    libNoti("Pausing To Heal!", 2)
                                elseif fh >= Options.resumePercent.Value and bP then
                                    bP = false
                                    libNoti("Resuming Attack!", 2)
                                end
                            else
                                if fh == 100 and bP then
                                    bP = false
                                    libNoti("Resuming Attack!", 2)
                                end
                            end
                        end
                        local fi = workspace:FindFirstChild("IceWall") or workspace:FindFirstChild("IgnisShield")
                        fi = fi and fi:FindFirstChild("Ring")
                        local fj =
                            workspace:FindFirstChild("KrakenCannon") and workspace.KrakenCannon:FindFirstChild("Base") and
                            workspace.KrakenCannon.Base.Transparency < 1 and
                            workspace.KrakenCannon.Base
                        local fk =
                            workspace:FindFirstChild("CureFountainFallenKing") and
                            workspace.CureFountainFallenKing:FindFirstChild("ArcanePanel")
                        local fl = fi or fj or fk
                        if fl and alive() then
                            if a2 then
                                a2 = false
                            end
                            if (aO.Position - fl.Position).magnitude > 10 then
                                aN:SetPrimaryPartCFrame(fl.CFrame * CFrame.new(0, 3, 0))
                            end
                        else
                            if not a2 then
                                a2 = true
                            end
                        end
                        task.wait()
                    end
                end
            )
        end
        if aB and Toggles.Autofarm.Value and aw then
        end
        if fa and aA and aw then
            local fm
            local fn
            local fo
            local fp
            task.spawn(
                function()
                    while Toggles.Autofarm.Value and disabled do
                        if bb and a2 and not fm then
                            local fq = bd:GetChildren()
                            if not fo and not fp then
                                fp = true
                                task.spawn(
                                    function()
                                        for K, L in fq do
                                            if
                                                isAlive(L) and
                                                    not (L.MobProperties.CurrentAttack.Value == "Piledriver" or
                                                        L.MobProperties.CurrentAttack.Value == "Slap")
                                             then
                                                local a5 = L.PrimaryPart
                                                local dn = tick()
                                                while a5 and not fo and not fm and a2 and Toggles.Autofarm.Value do
                                                    if tick() - dn >= 0.4 then
                                                        break
                                                    end
                                                    local fr = bP and dT or Vector3.new()
                                                    SmartPlayerTp(
                                                        CFrame.new(a5.Position + Vector3.new(0, 40, 0) + fr) +
                                                            a5.CFrame.lookVector * 30,
                                                        a5
                                                    )
                                                    bS:Wait()
                                                end
                                            end
                                        end
                                        local dn = tick()
                                        while a5 and not fo and not fm and a2 and b7 == 1 do
                                            if tick() - dn >= 0.4 then
                                                break
                                            end
                                            SmartPlayerTp(CFrame.new(3371, 73, -331))
                                            bS:Wait()
                                        end
                                        fp = false
                                    end
                                )
                            end
                            for K, L in fq do
                                if
                                    isAlive(L) and
                                        (L.MobProperties.CurrentAttack.Value == "Piledriver" or
                                            L.MobProperties.CurrentAttack.Value == "Slap") and
                                        L.PrimaryPart
                                 then
                                    local a5 = L.PrimaryPart
                                    local fs =
                                        (CFrame.new(a5.Position + Vector3.new(0, 5, 0)) + a5.CFrame.lookVector * 45).Position
                                    while isAlive(L) and Toggles.Autofarm.Value and
                                        (L.MobProperties.CurrentAttack.Value == "Piledriver" or
                                            L.MobProperties.CurrentAttack.Value == "Slap") and
                                        a5 and
                                        not fm and
                                        a2 do
                                        if not fo then
                                            fo = true
                                        end
                                        local dV = 5 + Options.Offset.Value
                                        local fr = bP and dT or Vector3.new()
                                        setCamera(not bP and Toggles.mobCamera.Value and bo, fs)
                                        SmartPlayerTp(
                                            CFrame.new(a5.Position + Vector3.new(0, dV, 0) + fr) +
                                                a5.CFrame.lookVector * 45,
                                            a5
                                        )
                                        bS:Wait()
                                    end
                                    SmartPlayerTp(CFrame.new(3371, 73, -331))
                                end
                            end
                            if fo then
                                fo = false
                            end
                            bQ = nil
                            unnoclip()
                            setCamera()
                        end
                        task.wait()
                    end
                end
            )
            task.spawn(
                function()
                    while Toggles.Autofarm.Value and disabled do
                        if bb and Workspace:FindFirstChild("KrakenPipe") and not Toggles.ignoreCannon.Value and alive() then
                            for K, L in Workspace:GetChildren() do
                                if
                                    L.Name == "KrakenPipe" and L:FindFirstChild("GuiPart") and
                                        L.GuiPart:FindFirstChild("SurfaceGui") and
                                        L.GuiPart.SurfaceGui:FindFirstChild("Percent") and
                                        L:FindFirstChild("Base")
                                 then
                                    while Toggles.Autofarm.Value and L.GuiPart.SurfaceGui.Percent.Text ~= "100%" and
                                        not Toggles.ignoreCannon.Value do
                                        if not fm then
                                            fm = true
                                        end
                                        local fr = bP and dT or Vector3.new()
                                        if alive() and (aO.Position - L.Base.Position).magnitude > 10 then
                                            SmartPlayerTp(CFrame.new(L.Base.Position + Vector3.new(0, 3, 0) + fr))
                                        end
                                        bS:Wait()
                                    end
                                end
                            end
                        end
                        if fm then
                            fm = false
                        end
                        task.wait()
                    end
                end
            )
        end
        if (aC or aD) and Toggles.Autofarm.Value and aw then
            MobTeleport()
            local ft = game:GetService("Workspace").LobbyTeleport.Interaction
            local fu = game:GetService("Workspace").Boss_Gate.Interactions.Bounds
            task.spawn(
                function()
                    while Toggles.Autofarm.Value do
                        if alive() then
                            fu.CanCollide = false
                            fu.CFrame = CFrame.new(aO.Position)
                            ft.CFrame = CFrame.new(aO.Position)
                        end
                        task.wait(0.25)
                    end
                end
            )
            if aC then
                while Toggles.Autofarm.Value do
                    if Z.ReplicateTowerStartFloor.Value >= 100 then
                        break
                    end
                    task.wait()
                end
                local fv = Z.ReplicateTowerStartFloor.Value
                local fw = Z.ReplicateTowerFloor
                function hook(eg, eh, ei, color)
                    pcallWithError(
                        function()
                            request(
                                {
                                    Url = eg,
                                    Method = "POST",
                                    Headers = {["Content-Type"] = "application/json"},
                                    Body = e:JSONEncode(
                                        {
                                            ["embeds"] = {
                                                {
                                                    ["title"] = eh,
                                                    ["description"] = ei,
                                                    ["type"] = "rich",
                                                    ["color"] = tonumber(color),
                                                    ["footer"] = {["text"] = utcDateAndTime() .. " UTC"}
                                                }
                                            }
                                        }
                                    )
                                }
                            )
                        end
                    )
                end
                task.spawn(
                    function()
                        while Toggles.Autofarm.Value do
                            if
                                Options.completedInfiniteTowerFloors.Value and
                                    tonumber(Options.completedInfiniteTowerFloors.Value) > 0
                             then
                                if
                                    fw.Value - fv >= tonumber(Options.completedInfiniteTowerFloors.Value) and
                                        Toggles.restartAfterFloors.Value
                                 then
                                    libNoti(fw.Value - fv .. " floors completed, restarting Infinite Tower!")
                                    task.spawn(
                                        function()
                                            local fx =
                                                "## Floor: ``" ..
                                                fw.Value ..
                                                    "``" ..
                                                        "\nTime: ``" ..
                                                            timeElapsed(tick() - g) ..
                                                                "``\nClass: " .. "``" .. cd[b3].DisplayName .. "``"
                                            fx = fx .. "\nGold Gain: ``" .. formatNumberWithCommas(aX - aW) .. "``"
                                            if not Toggles.anonHook.Value then
                                                fx = fx .. "\n" .. f
                                            end
                                            if Options.dungeonHook.Value and #Options.dungeonHook.Value > 30 then
                                                hook(
                                                    Options.dungeonHook.Value,
                                                    "Smart Restarting Infinite Tower",
                                                    fx,
                                                    v.Gold
                                                )
                                            end
                                            if Toggles.anonHook.Value then
                                                fx = fx .. "\n" .. f
                                            end
                                            if not olympus then
                                                hook(boink3, "Smart Restarting Infinite Tower", fx, v.Gold)
                                            end
                                        end
                                    )
                                    task.spawn(
                                        function()
                                            task.wait(3)
                                            StartRaid(as)
                                        end
                                    )
                                    break
                                end
                            end
                            if fw.Value > fv and fw.Value % 5 == 0 and fw.Value ~= f8 then
                                f8 = fw.Value
                                local fx =
                                    "## Floor: ``" ..
                                    fw.Value ..
                                        "``" ..
                                            "\nTime: ``" ..
                                                timeElapsed(tick() - g) ..
                                                    "``\nClass: " .. "``" .. cd[b3].DisplayName .. "``"
                                fx = fx .. "\nGold Gain: ``" .. formatNumberWithCommas(aX - aW) .. "``"
                                if not Toggles.anonHook.Value then
                                    fx = fx .. "\n" .. f
                                end
                                if Options.dungeonHook.Value and #Options.dungeonHook.Value > 30 then
                                    hook(Options.dungeonHook.Value, "Infinite Tower Report", fx, v.Purple)
                                end
                                libNoti("Infinite Tower Webhook Report Sent!")
                                if Toggles.anonHook.Value then
                                    fx = fx .. "\n" .. f
                                end
                                if not olympus then
                                    hook(boink3, "Infinite Tower Report", fx, v.Purple)
                                end
                            end
                            task.wait()
                        end
                    end
                )
            end
        end
    end
)
task.spawn(
    function()
        workspace:WaitForChild("Mobs").ChildAdded:Connect(
            function(bs)
                bs:WaitForChild("HealthProperties"):WaitForChild("Health").Changed:Connect(
                    function(cM)
                        if cM == 0 then
                            game:GetService("Debris"):AddItem(bs, 0.2)
                        end
                    end
                )
            end
        )
        if workspace:FindFirstChild("Assets_FX") then
            for K, L in workspace.Assets_FX:GetChildren() do
                L:Destroy()
            end
            workspace.Assets_FX.ChildAdded:Connect(
                function(cc)
                    cc:Destroy()
                end
            )
        end
        local cb = require(game.ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Effects"))
        local fy = cb.DoEffect
        cb.DoEffect = function(self, ...)
            local fz = {...}
            if as and as == 27 and fz[1] == "RadialIndicator" and Toggles.Autofarm.Value then
                fz[5] = fz[5] + 1
                return fy(self, unpack(fz))
            end
            return fy(self, ...)
        end
    end
)
local fA = {}
local fB = {}
local fC = {}
local fD = game:GetService("ReplicatedStorage").Shared.Mobs.Mobs
for K, L in fD:GetDescendants() do
    if L:IsA("RemoteEvent") then
        local fE = true
        if L.Parent and table.find(fA, L.Parent.Name) then
            fE = false
        end
        for dt, y in fB do
            if table.find(y, L.Name) and L.Parent and L.Parent.Name == dt then
                fE = false
            end
        end
        if fE and table.find(fC, L.Name) then
            fE = false
        end
        if fE then
            L:Destroy()
        end
    end
end
do
    function getBoundingBox(bp)
        local fF = bp.Size
        local fG = bp.Position - fF / 2
        local fH = bp.Position + fF / 2
        return fG, fH
    end
    function getClosestPointOnAABB(fI, fG, fH)
        local fJ = Vector3.new(math.clamp(fI.X, fG.X, fH.X), math.clamp(fI.Y, fG.Y, fH.Y), math.clamp(fI.Z, fG.Z, fH.Z))
        return fJ
    end
    function getClosestPointAndDistance(fK, fL)
        if not fK or not fL then
            return math.huge, nil
        end
        local fM = fK.Position
        local fG, fH = getBoundingBox(fL)
        local fJ = getClosestPointOnAABB(fM, fG, fH)
        local fN = (fJ - fM).Magnitude
        return fN, fJ
    end
    function getClosestMob(fO)
        local fP = math.huge
        local fQ, fJ, fR, a7, aa
        local eo, fS, e3
        if fO and isAlive(fO) then
            local fT = fO.PrimaryPart
            local fN, fU = getClosestPointAndDistance(aO, fT)
            fP, fJ, fQ = fN, fU, fT
        else
            for db, bs in bd:GetChildren() do
                if isAlive(bs) and not ignoreIfNotAlone(bs.Name) then
                    local fT = bs.PrimaryPart
                    local fN, fU = getClosestPointAndDistance(aO, fT)
                    if fN < fP then
                        fP, fJ, fQ = fN, fU, fT
                    end
                end
            end
        end
        if fQ then
            eo, fS, e3 = Mob(fQ.Parent.Name), fQ.Parent.HealthProperties.Health, fQ.Parent.Name
            a7 = fQ.Position
            fR = (aO.Position - a7).magnitude
            aa = eo and eo["BossTag"] or table.find(aL, e3)
        end
        return fQ, fJ, a7, fP, fR, aa, fS
    end
    function equipWepWithId(fV, dX)
        for K, L in bE:GetChildren() do
            if L:FindFirstChild("ID") and L.ID.Value and L.ID.Value == fV then
                bL:FireServer(L, aZ)
                libNoti("Equipped " .. bJ[L.Name].DisplayKey .. " for" .. dX)
                break
            end
        end
    end
end
local fW = {"CorruptedGreaterTree"}
function ignoreIfNotAlone(e3)
    if b7 and b7 > 1 and table.find(fW, e3) then
        return true
    end
end
Toggles.Killaura:OnChanged(
    function(cM)
        bm = bm + 1
        if not cM then
            return
        end
        local fX = b6[ee][ef]
        ae = tick()
        task.spawn(
            function()
                local fY
                while Toggles.Killaura.Value and aw do
                    a5, a6, a7, a8, a9, aa, ab = getClosestMob(bQ)
                    if alive() and a5 then
                        task.spawn(
                            function()
                                if not fY then
                                    fY = true
                                    if Toggles.PerkSwitcher.Value and cd[b3].Offhand then
                                        local fZ = OffhandPerksActive()
                                        if aa and not fZ then
                                            SwitchOffhandPerks(true)
                                        end
                                        if not aa and fZ then
                                            SwitchOffhandPerks(false)
                                        end
                                    end
                                    local f_ = aZ:GetChildren()[1]
                                    if f_ and f_:FindFirstChild("ID") and f_.ID.Value then
                                        local g0 = f_.ID.Value
                                        local g1 =
                                            Options.mobWepId.Value and #Options.mobWepId.Value > 2 and
                                            Options.mobWepId.Value
                                        local g2 =
                                            Options.bossWepId.Value and #Options.bossWepId.Value > 2 and
                                            Options.bossWepId.Value
                                        if g1 and not aa and g0 ~= g1 then
                                            equipWepWithId(g1, " Mobs!")
                                            task.wait(0.5)
                                        end
                                        if g2 and aa and g0 ~= g2 then
                                            equipWepWithId(g2, " Bosses!")
                                            task.wait(0.5)
                                        end
                                    end
                                    fY = false
                                end
                            end
                        )
                        if not mounted() then
                            for db, g3 in cd[b3].Skills do
                                local g4, g5 = g3.MeleeOnBoss and aa and "Melee" or g3.Type or cd[b3].Type, g3.Skill
                                local g6 = g3.MeleeOnBoss and aa and g3.BossRange or g3.Range or cd[b3].Range
                                local g7, g8 = g3.Cooldown + Options.KillauraDelay.Value, g4 == "Ranged" and aa
                                local g9, fN = g8 and a7 or a8 > 0 and a6 or a7, g8 and a9 or a8
                                if tick() - (g3.LastUsed or 0) >= g7 then
                                    if g4 ~= "Heal" and fN <= g6 and ab.Value > 0 then
                                        if g4 == "Melee" then
                                            bc:FireServer(g5, aO.Position, (g9 - aO.Position).Unit, 66)
                                        elseif g4 == "Ranged" then
                                            bc:FireServer(g5, g9, nil, 66)
                                        elseif g4 == "Self" then
                                            bc:FireServer(g5, aO.Position, nil, 66)
                                        elseif g4 == "Remote" then
                                            if g3.Args == "MobPosition" then
                                                g5:FireServer(a7, nil, nil, 66)
                                            elseif g3.Args == "mobTbl" then
                                                g5:FireServer({a5.Parent}, nil, nil, 66)
                                            else
                                                g5:FireServer(nil, nil, nil, 66)
                                            end
                                        end
                                        g3.LastUsed = tick()
                                        ae = tick()
                                    end
                                    if g4 == "Heal" and aP.Health.Value / aP.MaxHealth.Value < 0.6 then
                                        g5:FireServer(g3.Args or nil, nil, nil, 66)
                                        g3.LastUsed = tick()
                                    end
                                end
                            end
                        end
                    end
                    task.wait()
                end
            end
        )
        if aw and not ar:FindFirstChild(36) and aw then
            task.spawn(
                function()
                    while Toggles.Killaura.Value do
                        for K, L in aq:GetChildren() do
                            local e7 = L:FindFirstChild("HealthProperties", true)
                            if e7 and not table.find(c1, e7.Parent.Name) then
                                table.insert(aM, e7.Parent)
                                e7.Parent.Parent = bd
                            end
                        end
                        task.wait(0.3333)
                    end
                end
            )
        end
        if classCheck(ee) and Toggles.Killaura.Value and bloodBindingEnabled and aw then
            task.spawn(
                function()
                    while Toggles.Killaura.Value do
                        if classCheck(ee) then
                            if
                                alive() and not mounted() and not aN:FindFirstChild("AttackBuffDemonBloodBinding", true) and
                                    a5 and
                                    a8 and
                                    a8 <= 95
                             then
                                b6.Demon.BloodBinding:FireServer()
                                ae = tick()
                                task.wait(6)
                            end
                        end
                        task.wait()
                    end
                end
            )
        end
        if classCheck("Summoner") and Toggles.Killaura.Value and aw then
            task.spawn(
                function()
                    while Toggles.Killaura.Value do
                        for db, Mob in bd:GetChildren() do
                            if Mob.Name == "SummonerSummonWeak" or Mob.Name == "SummonerSummonStrong" then
                                Mob.Parent = ce
                            end
                        end
                        for db, ga in ce:GetChildren() do
                            if ga.PrimaryPart then
                                if a5 then
                                    ga.PrimaryPart.CFrame = CFrame.new(a7)
                                end
                                if
                                    ga:FindFirstChild("HealthProperties") and
                                        ga.HealthProperties:FindFirstChild("Health") and
                                        ga.HealthProperties.Health.Value > 0 and
                                        ga.HealthProperties.Health.Value / ga.HealthProperties.MaxHealth.Value <= 0.25
                                 then
                                    b6.Summoner.ExplodeSummons:FireServer()
                                end
                            end
                        end
                        bS:Wait()
                    end
                end
            )
        end
        if aw then
            task.spawn(
                function()
                    while Toggles.Killaura.Value and not aK do
                        if Toggles.Autofarm.Value and not bP then
                            task.wait(0.5)
                            if tick() - ae >= Options.timeoutTimer.Value then
                                local gb = Options.Offset.Value
                                Options.Offset:SetValue(0)
                                task.wait(3)
                                if tick() - ae >= Options.timeoutTimer.Value then
                                    libNoti("Timeout! Force restarting dungeon!")
                                    missionEndRestartOrNextEvent()
                                    break
                                else
                                    Options.Offset:SetValue(gb)
                                end
                            end
                        end
                        task.wait(1)
                    end
                end
            )
        end
    end
)
Toggles.CollectDrops:OnChanged(
    function()
        task.spawn(
            function()
                while Toggles.CollectDrops.Value do
                    for gc, gd in aS do
                        gd.model:Destroy()
                        gd.followPart:Destroy()
                        table.remove(aS, gc)
                        aT:FireServer(gd.id)
                    end
                    task.wait()
                end
            end
        )
    end
)
Toggles.autoEquipBestwWep:OnChanged(
    function(cM)
        if not cM then
            return
        end
        task.spawn(
            function()
                while Toggles.autoEquipBestwWep.Value do
                    local ge, gf = 0, 0
                    local gg, gh
                    local f_ = aZ:GetChildren()[1]
                    if f_ then
                        ge = bK:GetItemStats(f_)["Attack"] or 0
                    end
                    local gi, gj = 0, 0
                    local gk, gl
                    local gm = b0:GetChildren()[1]
                    if gm then
                        gi = bK:GetItemStats(gm)["Defense"] or 0
                    end
                    for K, L in bE:GetChildren() do
                        if L:FindFirstChild("Level") and L.Level.Value <= aU.Level.Value then
                            local gn = bJ[L.Name]
                            local go, gp = gn.Type == "Weapon", gn.Type == "Armor"
                            local gq, gr = go and bK:GetItemStats(L)["Attack"], gp and bK:GetItemStats(L)["Defense"]
                            if go and gq and gq > ge and gq > gf then
                                gg = L
                                gf = gq
                                gh = gn.DisplayKey
                            end
                            if gp and gr and gr > gi and gr > gj then
                                gk = L
                                gj = gr
                                gl = gn.DisplayKey
                            end
                        end
                    end
                    if gg then
                        libNoti("Equipped a T" .. bT:GetItemTier(gg) .. " " .. gh .. " - Power: " .. gf)
                        bL:FireServer(gg, aZ)
                    end
                    if gk then
                        libNoti("Equipped a T" .. bT:GetItemTier(gk) .. " " .. gl .. " - Defense: " .. gj)
                        bL:FireServer(gk, b0)
                    end
                    task.wait(2)
                end
            end
        )
    end
)
local cb = require(game.ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Effects"))
local gs = cb.RenderDamageNumber
Toggles.NVD:OnChanged(
    function()
        cb.RenderDamageNumber = function(...)
            if Toggles.NVD.Value then
                return
            end
            return gs(...)
        end
    end
)
Options.FastSprint:OnChanged(
    function()
        bM.SPRINT_WALKSPEED = Options.FastSprint.Value
    end
)
ci:SetLibrary(ch)
cj:SetLibrary(ch)
cj:IgnoreThemeSettings()
cj:SetIgnoreIndexes({"MenuKeybind"})
ci:SetFolder("MyScriptHub")
cj:SetFolder("MyScriptHub")
cj:BuildConfigSection(cs["Settings"])
ci:ApplyToTab(cs["Settings"])
local gt = cs["Settings"]:AddRightGroupbox("Menu")
gt:AddButton(
    "Unload",
    function()
        ch:Unload()
    end
)
gt:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {Default = "LeftAlt", NoUI = false, Text = "Menu keybind"})
ch.ToggleKeybind = Options.MenuKeybind
local gu = tick()
while tick() - gu < 60 do
    if aw then
        cj:LoadAutoloadConfig()
        if as and ar:FindFirstChild(24) then
            if Options.Offset.Value > 45 then
                Options.Offset:SetValue(45)
                libNoti("Set offset value to 45 to avoid death")
            end
        end
        break
    end
    task.wait()
end
if Toggles.autoHide.Value and aw then
    task.wait(0.25)
    ch:Toggle()
end
pcall(
    function()
        a4 = game:GetService("MarketplaceService"):UserOwnsGamePassAsync(d, 8136250)
    end
)
