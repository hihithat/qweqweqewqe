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
getgenv().libLoaded = false
local a = game:GetService("Players")
local b = a.LocalPlayer or a:GetPropertyChangedSignal("LocalPlayer"):Wait() or a.LocalPlayer
getgenv().userId = b.UserId
getgenv().HttpService = game:GetService("HttpService")
getgenv().nameStr = b.DisplayName == b.Name and b.Name or b.DisplayName .. " (@" .. b.Name .. ")"
getgenv().plrLink =
    "User: [" .. nameStr .. " - " .. userId .. "](https://www.roblox.com/users/" .. userId .. "/profile)"
local c
getgenv().missionName = false
getgenv().codeStr = false
function utcDateAndTime()
    local d = os.date("!*t", os.time())
    local e, f, g, h, i = d.hour, d.min, d.sec, d.day, d.month
    if e < 10 then
        e = "0" .. e
    end
    if f < 10 then
        f = "0" .. f
    end
    if g < 10 then
        g = "0" .. g
    end
    if h < 10 then
        h = "0" .. h
    end
    if i < 10 then
        i = "0" .. i
    end
    return e .. ":" .. f .. ":" .. g .. " - " .. h .. "/" .. i .. "/" .. d.year
end
function waitForChild(j, k, waittime)
    local l = j
    local m
    for n = 1, #k do
        local o = l:WaitForChild(k[n], waittime)
        if o then
            l = o
            if n == #k then
                return l
            end
        else
            return nil
        end
    end
end
function firstCheckWait(p)
    repeat
        task.wait()
    until firstCheckDone or not Toggles[p].Value
end
function findFirstChild(j, k)
    local l = j
    for n = 1, #k do
        local o = l:FindFirstChild(k[n])
        if o then
            l = o
            if n == #k then
                return l
            end
        else
            return nil
        end
    end
end
getgenv().colorTbl = {
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
        until libLoaded
        pcall(
            function()
                local function q(r, s, t)
                    request(
                        {
                            Url = t,
                            Method = "POST",
                            Headers = {["Content-Type"] = "application/json"},
                            Body = HttpService:JSONEncode(
                                {
                                    ["embeds"] = {
                                        {
                                            ["title"] = "Infinite | World Zero",
                                            ["description"] = r,
                                            ["type"] = "rich",
                                            ["color"] = tonumber(s),
                                            ["footer"] = {["text"] = utcDateAndTime() .. " UTC"}
                                        }
                                    }
                                }
                            )
                        }
                    )
                end
                local function u()
                    local v = game:HttpGet(peepo)
                    local w = HttpService:JSONDecode(v)
                    return w
                end
                local x = u()
                local y = x[eternal]
                local z = leviathan[x[blissful:lower()]]
                local A = plrLink .. "\n" .. eternal:upper() .. ": ``" .. y .. "``\n" .. blissful .. ": ``" .. z .. "``"
                if identifyexecutor then
                    local B = ({identifyexecutor()})[1]
                    A = A .. "\nExecutor: ``" .. B .. "``"
                end
                local C = game:GetService("TextChatService"):WaitForChild("TextChannels")
                local D
                for n, E in C:GetChildren() do
                    if #E.Name < 6 and #E:GetChildren() > 0 and E:FindFirstChild(b.Name) then
                        D = E.Name
                        break
                    end
                end
                if D then
                    local F = game:GetService("ReplicatedStorage").Shared.Guilds.GetCache:InvokeServer(D)
                    local G
                    for n, E in F.Members do
                        if tonumber(n) == userId then
                            G = E.Points
                            break
                        end
                    end
                    if G then
                        A = A .. "\nGuild Points: ``" .. G .. "`` / ``" .. D .. "``"
                    end
                end
                local H = {
                    ["VaneRaid"] = "VANE_KILLS",
                    ["KrakenRaid"] = "KRAKEN_KILLS_2025",
                    ["FallenKingRaid"] = "FALLENKING_KILLS",
                    ["KorruptedKlausRaid"] = "SANTA_KILLS",
                    ["InfiniteTower"] = "ITF_1",
                    ["NightmareNormal"] = "N_NP1",
                    ["NightmareChallenge"] = "C_NP1",
                    ["CurrentGuildSeason"] = "G_POINTS16"
                }
                pcall(
                    function()
                        function getLbScore(I)
                            local J =
                                game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild(
                                "LeaderboardHookup"
                            ):WaitForChild("GetScore"):InvokeServer(I, 1)
                            return J[1], J[2]
                        end
                        local K, L = getLbScore(H.NightmareChallenge)
                        local M, N = getLbScore(H.NightmareNormal)
                        local O, P = getLbScore(H.InfiniteTower)
                        local Q, R = getLbScore(H.KrakenRaid)
                        local S, T = getLbScore(H.KorruptedKlausRaid)
                        if K > 0 then
                            A = A .. "\nNM Challenge Completed: ``" .. K .. "`` / ``" .. L .. "``"
                        end
                        if M > 0 then
                            A = A .. "\nNM Normal Completed: ``" .. M .. "`` / ``" .. N .. "``"
                        end
                        if O > 99 then
                            A = A .. "\nInfinite Tower Floor Record: ``" .. O .. "``"
                        end
                        if Q > 0 then
                            A = A .. "\nKraken Raids Completed: ``" .. Q .. "`` / ``" .. R .. "``"
                        end
                    end
                )
                q(A, olympus and colorTbl.Gold or colorTbl.Cyan, olympus and cloudy or boink)
            end
        )
    end
)
local U = game:GetService("ReplicatedStorage")
local V = U:WaitForChild("Shared")
getgenv().TeleportService = game:GetService("TeleportService")
local W = true
local X
local Y = false
local Z, _, a0, a1, a2, a3, a4
local a5 = false
local a6
b.Idled:Connect(
    function()
        game:GetService("VirtualUser"):CaptureController()
        game:GetService("VirtualUser"):ClickButton2(Vector2.new())
    end
)
local a7 = {
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
KickFilename = userId .. "_InfiniteWorldZeroData.txt"
noDifficultyMissions = {21, 23, 27, 29, 34, 43, 39, 38}
function save()
    local a8
    if writefile then
        a8 = HttpService:JSONEncode(a7)
        writefile(KickFilename, a8)
    end
end
function load()
    if readfile and isfile and isfile(KickFilename) then
        a7 = HttpService:JSONDecode(readfile(KickFilename))
    end
end
if game.PlaceId == 2727067538 then
    load()
    if a7.Kicked or a7.RejoinLastDungeon and tick() - a7.Timestamp <= a7.RejoinLastDungeonThreshold then
        a7.Kicked = false
        a7.CameFromMenu = true
        save()
        local a9 =
            require(
            b:WaitForChild("PlayerScripts"):WaitForChild("LocalScript"):WaitForChild("Guis"):WaitForChild(
                "CharacterPicker"
            )
        )
        local aa = a9:GetSelectedProfile()
        while not aa do
            task.wait()
            aa = a9:GetSelectedProfile()
        end
        local ab = aa.GUID.Value
        local ac = V:WaitForChild("Teleport"):WaitForChild("JoinGame")
        ac:FireServer(ab)
    end
end
local ad
getgenv().MissionScripts = false
local ae = math.huge
local af
local ag
Towers = {21, 23, 27, 29, 34, 43}
Nightmares = {1005, 1006, 1007}
local ah
local ai = {5862275930, 4526768266}
local aj
local ak
local al
local am
local an
local ao
local ap
local aq
local ar
local as
local at
local au
local av = {
    StoneTreeEnt = -3,
    BOSSTreeEnt = -3,
    BOSSFireTreeEnt = -3,
    BOSSCrystalGolem = -9,
    CorruptedGreaterTree = -19,
    BOSSCrystalWeaverBlue = 1,
    MiniBossCrystalWeaver = 4,
    MinotaurDungeonBoss = 4,
    BOSSKandrix = 4,
    Crystal = -9,
    Taurha = -2,
    BOSSShadowOfCerberus = 7,
    Hades = -1
}
local aw = {}
local ax = b.Character or b.CharacterAdded:Wait() or b.Character
local ay
while task.wait() do
    ay = ax.PrimaryPart
    if ay then
        break
    end
end
local az, aA
b.CharacterAdded:Connect(
    function(aB)
        ax = aB
        while task.wait() do
            ay = ax.PrimaryPart
            if ay then
                break
            end
        end
        az = ax:WaitForChild("HealthProperties")
        aA = ax:WaitForChild("Equipment")
    end
)
while task.wait() do
    az = b.Character and b.Character:FindFirstChild("HealthProperties")
    aA = b.Character and b.Character:FindFirstChild("Equipment")
    if az and aA then
        break
    end
end
local aC = getupvalue(require(V.Drops).Start, 4)
local aD = V:WaitForChild("Drops"):WaitForChild("CoinEvent")
local aE = b:WaitForChild("PlayerGui"):WaitForChild("Profile")
local aF = aE:WaitForChild("Currency"):WaitForChild("Gold")
local aG = aF.Value
local aH = aG
local aI = U:WaitForChild("PlayerEquips"):WaitForChild(b.Name)
local aJ = aI:WaitForChild("Primary")
local aK = aI:WaitForChild("Offhand")
local aL = aI:WaitForChild("Armor")
local aM = V:WaitForChild("ItemUpgrade"):WaitForChild("Upgrade")
local aN = aE:WaitForChild("Class")
local aO = aN.Value
function classCheck(aP)
    return aO == aP
end
aN:GetPropertyChangedSignal("Value"):Connect(
    function()
        aO = aN.Value
    end
)
aA = ax.Equipment
local aQ = V:WaitForChild("Combat"):WaitForChild("Skillsets")
local aR = 0
local aS
local aT = V:WaitForChild("Combat"):WaitForChild("Attack")
local aU = game:GetService("Workspace"):FindFirstChild("Mobs")
local aV = V.Mobs.Mobs
local aW = workspace.Camera
local aX
local aY
local aZ = tick()
local a_ = tick()
local b0 = 0
local b1 = 0
local b2 = 0
local b3 = Instance.new("Part")
b3.Position = Vector3.zero
b3.Anchored = true
b3.Transparency = 1
b3.CanCollide = false
b3.Name = "InfiniteCameraPart"
b3.Parent = workspace
task.spawn(
    function()
        if U:WaitForChild("ActiveMission", 60) then
            ah = true
            ad = game:GetService("Workspace"):WaitForChild("MissionObjects")
            MissionScripts = U:WaitForChild("MissionScripts")
            for n, E in MissionScripts:GetChildren() do
                if #E.Name < 4 then
                    ae = tonumber(E.Name)
                end
            end
            af = U:WaitForChild("ActiveMission").Value
            a7.Dungeon = U:WaitForChild("ActiveMission").Value
            if table.find(Towers, af) then
                al = true
            elseif af == 38 then
                am = true
            elseif af == 39 then
                an = true
            else
                aj = true
                ag = V.Missions.GetDifficulty:InvokeServer()
                a7.Difficulty = V.Missions.GetDifficulty:InvokeServer()
            end
            if af == 23 then
                ak = true
            end
            if table.find(Nightmares, af) then
                ao = true
            end
            if af == 45 then
                aq = true
                ap = true
            end
            if af == 44 then
                as = true
                ap = true
            end
            if af == 22 then
                at = true
                ap = true
            end
            if af == 17 then
                ar = true
                ap = true
            end
        end
    end
)
if not ah then
    task.wait(1)
end
do
    function noclip()
        if ay and ay.CanCollide then
            ay.CanCollide = false
        end
    end
    function unnoclip()
        if ay and not ay.CanCollide then
            ay.CanCollide = true
        end
    end
    function setCamera(b4)
        local b5 = b4 or ay and (ay:FindFirstChild("Part") or ay)
        if b5 and aW.CameraSubject ~= b5 then
            aW.CameraSubject = b5
        end
    end
    function alive()
        return ax and ay and az and az:FindFirstChild("Health") and az.Health.Value > 0
    end
    function mounted()
        return ax and ax:FindFirstChild("Properties") and ax.Properties:GetAttribute("Mounted")
    end
    function isAlive(b6)
        return b6 and b6.PrimaryPart and b6:FindFirstChild("HealthProperties") and
            b6.HealthProperties:FindFirstChild("Health") and
            b6.HealthProperties.Health.Value > 0
    end
    function Mob(r)
        if aV:FindFirstChild(r) then
            return require(aV[r])
        end
    end
    function SwitchOffhandPerks(r)
        V.Settings.OffhandPerksActive:FireServer(r)
    end
    function timeElapsed(E)
        local b7 = math.floor(E / 3600)
        local b8 = math.floor(E % 3600 / 60)
        local b9 = math.floor(E % 60)
        if b7 > 0 then
            return b7 .. "h " .. b8 .. "m " .. b9 .. "s"
        end
        if b8 > 0 and b7 == 0 then
            return b8 .. "m " .. b9 .. "s"
        end
        if b7 == 0 and b8 == 0 then
            return b9 .. "s"
        end
    end
    function ping()
        return math.round(b:GetNetworkPing() * 1000) .. " ms"
    end
    function ping2()
        return math.round(game.Stats.PerformanceStats.Ping:GetValue()) .. " ms"
    end
    function nextInTbl(ba, bb)
        return ba[table.find(ba, bb) + 1] or ba[1]
    end
    function formatNumberWithCommas(bc)
        local bd = tostring(bc)
        local be
        repeat
            bd, be = string.gsub(bd, "^(-?%d+)(%d%d%d)", "%1,%2")
        until be == 0
        return bd
    end
    function getServerGuilds()
        local C = game:GetService("TextChatService"):WaitForChild("TextChannels")
        local ba = {}
        for n, E in C:GetChildren() do
            if #E.Name < 6 and #E:GetChildren() > 0 then
                table.insert(ba, E.Name)
            end
        end
        table.sort(ba)
        return ba
    end
    function getPlrGuild()
        local C = game:GetService("TextChatService"):WaitForChild("TextChannels")
        local D
        for n, E in C:GetChildren() do
            if #E.Name < 6 and #E:GetChildren() > 0 and E:FindFirstChild(b.Name) then
                D = E.Name
                break
            end
        end
        return D
    end
end
function done2(bf)
    return loadstring(game:HttpGet(bf))()
end
local bg = aE:WaitForChild("Inventory"):WaitForChild("Items")
local bh = aE:WaitForChild("Inventory"):WaitForChild("Cosmetics")
local bi = require(V.Missions.MissionData)
function missionLevelReq(bj)
    return bi[bj].LevelRequirement
end
local bk = require(V.Gear.GearPerks)
local bl = require(V.Items)
local bm = require(V.Combat)
local bn = V.Inventory.EquipItem
local bo = require(V:WaitForChild("Settings"))
local bp = aE:WaitForChild("Settings")
local bq
local br
local bs
local bt
local bu = game:GetService("RunService").Heartbeat
function OffhandPerksActive()
    return bp:GetAttribute("OffhandPerksActive")
end
function StartRaid(r, s)
    V:WaitForChild("Teleport"):WaitForChild("StartRaid"):FireServer(r, s)
end
local bv = require(V.Inventory)
local bw = 0
load()
if not ah then
    if
        a7.Kicked and a7.WasInDungeon or
            a7.RejoinLastDungeon and tick() - a7.Timestamp <= a7.RejoinLastDungeonThreshold and a7.CameFromMenu or
            a7.WasInDungeon and a7.Dungeon and table.find(Towers, a7.Dungeon) and a7.ForceRestartLastTower
     then
        a7.CameFromMenu = false
        save()
        if a7.Dungeon then
            local bx = V:WaitForChild("Teleport"):WaitForChild("StartRaid")
            while true do
                if table.find(noDifficultyMissions, a7.Dungeon) then
                    bx:FireServer(a7.Dungeon)
                else
                    bx:FireServer(a7.Dungeon, a7.Difficulty)
                end
                task.wait(1)
            end
        end
    else
        a7.Kicked = false
        a7.CameFromMenu = false
        a7.WasInDungeon = false
        save()
    end
elseif ah then
    bt = getPlrGuild()
    a7.WasInDungeon = true
    a7.Dungeon = af
    a7.Difficulty = ag
    a7.CameFromMenu = false
    a7.Timestamp = tick()
    save()
end
local by = {
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
    "Checkpoint11",
    "Checkpoint12",
    "Checkpoint13",
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
    "NextFloorTeleporter",
    "WaveExit",
    "MinibossExit",
    "ArenaEntry0",
    "ArenaEntry1",
    "ArenaEntry2"
}
getgenv().MissionStarted = false
V.Missions.MissionStart.OnClientEvent:Once(
    function()
        MissionStarted = true
    end
)
local bz = {
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
    "Terrain",
    "TeleportSystem",
    "Room_Boss_Final",
    "Room_Boss_Mini",
    "Room_Lobby",
    "Room_Spawn"
}
local bA = {"Scarecrow1", "Scarecrow2", "Scarecrow3"}
getgenv().specialTargetingDungeons = {
    DireProblem = {Id = 2, ignoreMob = "BOSSDireBoarwolf"},
    KingSlayer = {Id = 4, ignoreMob = "BOSSKingCrab"},
    GravetowerDungeon = {Id = 6, priorityTbl = {"Pillar", "BOSSTreeEnt"}, mobWaitTbl = {"BOSSTreeEnt"}, mobWaitTime = 3},
    MamaTrauma = {Id = 12, priorityTbl = {"GoblinSpear", "GoblinSlingshot", "GoblinKnight", "BOSSMamaQuillodile"}},
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
getgenv().WorldData = {
    {Name = "World 1", Id = 13},
    {Name = "World 2", Id = 19},
    {Name = "World 3", Id = 20},
    {Name = "World 4", Id = 29},
    {Name = "World 5", Id = 31},
    {Name = "World 6", Id = 36},
    {Name = "World 7", Id = 40},
    {Name = "World 8", Id = 45},
    {Name = "World 9", Id = 49},
    {Name = "World 10", Id = 56},
    {Name = "Cliffside Marketplace", Id = 44},
    {Name = "Pvp Arena", Id = 39},
    {Name = "Guild Hub", Id = 76},
    {Name = "Kraken Cove", Id = 68}
}
getgenv().nextDungeonTbl = {
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
local bB = {[2] = 1, [12] = 1, [20] = 1, [30] = 1}
getgenv().DungeonData = {
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
function doDid(w)
    local bC = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    w = w:gsub("[^" .. bC .. "=]", "")
    return w:gsub(
        ".",
        function(bD)
            if bD == "=" then
                return ""
            end
            local bE, bF = "", bC:find(bD) - 1
            for n = 6, 1, -1 do
                bE = bE .. (bF % 2 ^ n - bF % 2 ^ (n - 1) > 0 and "1" or "0")
            end
            return bE
        end
    ):gsub(
        "%d%d%d?%d?%d?%d?%d?%d?",
        function(bD)
            if #bD ~= 8 then
                return ""
            end
            local bG = 0
            for n = 1, 8 do
                bG = bG + (bD:sub(n, n) == "1" and 2 ^ (8 - n) or 0)
            end
            return string.char(bG)
        end
    )
end
local bH = {
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
            {Skill = aQ:WaitForChild("Assassin"):WaitForChild("EventStealthWalk"), Cooldown = 0.25, Type = "Remote"},
            {Skill = aQ:WaitForChild("Assassin"):WaitForChild("Ultimate"), Cooldown = 1, Type = "Remote"},
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
        Range = 99,
        Type = "Ranged",
        Primary = "Staff",
        Skills = {
            {Skill = "MageOfLight", Cooldown = 0.28},
            {Skill = "MageOfLightBlast", Cooldown = 0.33},
            {Skill = "MageOfLightCharged", Cooldown = 0.33},
            {Skill = "MageOfLightBlastCharged", Cooldown = 0.33},
            {Skill = aQ:WaitForChild("MageOfLight"):WaitForChild("HealCircle"), Cooldown = 14.2, Type = "Heal"},
            {Skill = aQ:WaitForChild("MageOfLight"):WaitForChild("Barrier"), Args = b, Cooldown = 15.2, Type = "Heal"},
            {Skill = aQ:WaitForChild("MageOfLight"):WaitForChild("Ultimate"), Cooldown = 1, Type = "Heal"}
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
            {Skill = aQ:WaitForChild("Paladin"):WaitForChild("GuildedLight"), Cooldown = 15.2, Type = "Heal"}
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
            {Skill = aQ:WaitForChild("Berserker"):WaitForChild("Ultimate"), Cooldown = 1, Type = "Remote"}
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
            {Skill = aQ:WaitForChild("Guardian"):WaitForChild("AggroDraw"), Cooldown = 14.5, Type = "Remote"},
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
            {Skill = aQ:WaitForChild("Demon"):WaitForChild("Ultimate"), Cooldown = 1, Type = "Remote"},
            {Skill = "DemonSoulDPS1", Cooldown = 31, Type = "Ranged", Range = 26},
            {Skill = "DemonSoulDPS2", Cooldown = 31, Type = "Ranged", Range = 26},
            {Skill = "DemonSoulDPS3", Cooldown = 31, Type = "Ranged", Range = 26}
        }
    },
    Swordmaster = {
        DisplayName = "Swordmaster",
        Range = 14,
        Type = "Melee",
        Primary = "Longsword",
        Skills = {
            {Skill = "Swordmaster1", Cooldown = 0.33},
            {Skill = "Swordmaster2", Cooldown = 0.33},
            {Skill = "Swordmaster3", Cooldown = 0.33},
            {Skill = "Swordmaster4", Cooldown = 0.33},
            {Skill = "Swordmaster5", Cooldown = 0.33},
            {Skill = "Swordmaster6", Cooldown = 0.33},
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
            {Skill = aQ:WaitForChild("DualWielder"):WaitForChild("AttackBuff"), Cooldown = 12.2, Type = "Remote"},
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
            {Skill = aQ:WaitForChild("DualWielder"):WaitForChild("Ultimate"), Cooldown = 31, Type = "Remote"},
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
            {Skill = aQ:WaitForChild("Dragoon"):WaitForChild("Ultimate"), Cooldown = 1, Type = "Remote"},
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
                Skill = aQ:WaitForChild("Summoner"):WaitForChild("SoulHarvest"),
                Cooldown = 10.2,
                Type = "Remote",
                Args = "MobPosition",
                Range = 39
            },
            {Skill = aQ:WaitForChild("Summoner"):WaitForChild("Summon"), Cooldown = 0.5, Type = "Remote"},
            {Skill = aQ:WaitForChild("Summoner"):WaitForChild("Ultimate"), Cooldown = 1, Type = "Remote"}
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
            {Skill = aQ:WaitForChild("Necromancer"):WaitForChild("Ultimate"), Cooldown = 31, Type = "Remote"}
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
                Skill = aQ:WaitForChild("MageOfShadows"):WaitForChild("ShadowChains"),
                Cooldown = 6,
                Type = "Remote",
                Args = "mobTbl"
            },
            {Skill = aQ:WaitForChild("MageOfShadows"):WaitForChild("Ultimate"), Cooldown = 2, Type = "Remote"}
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
getgenv().mobTargets = doDid("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL3JvbmFsZGJ1cmdlcnNvbi9ib3JnL21haW4vYnJvb20=")
local bI = Instance.new("Folder")
bI.Name = "SummonFolder"
bI.Parent = Workspace
local bJ = Instance.new("Folder")
bJ.Name = "infiniteboy"
bJ.Parent = Workspace
local bK
if an then
    bK = Instance.new("Part")
    bK.Name = "InfiniteKillPart"
    bK.Size = Vector3.new(50, 20, 50)
    bK.Position = Vector3.new(10000, 10000, 10000)
    bK.Anchored = true
    bK.Transparency = 0
    bK.Material = "SmoothPlastic"
    bK.BrickColor = BrickColor.new("Cyan")
    bK.Parent = workspace
end
local bL, bM, bN
bL, bN, bM = done2(mobTargets)
libLoaded = true
function libWarn(msg)
    warn("[Infinite]: " .. msg)
end
function pcallWithError(bO)
    local b9, bP = pcall(bO)
    if not b9 and bP then
        libWarn(bP)
    end
end
function libNoti(msg)
    pcallWithError(
        function()
            bL:Notify(msg)
        end
    )
end
function setMissionObjective(bQ, bR)
    local I = b.PlayerGui.MissionObjective.MissionObjective.Label
    I.Text = bQ
    I.Overlay.Text = bQ
    if bR then
        I.ZIndex = 30
        I.Overlay.ZIndex = 31
    end
end
function resetMissionObjective()
    local I = b.PlayerGui.MissionObjective.MissionObjective.Label
    I.Text = ""
    I.Overlay.Text = ""
end
function isRangedClass()
    return bH[aO] and bH[aO].Type == "Ranged"
end
local bS
bS =
    game:GetService("GuiService").ErrorMessageChanged:Connect(
    function(msg)
        if
            game:GetService("GuiService"):GetErrorCode() == Enum.ConnectionError.DisconnectLuaKick or
                game:GetService("GuiService"):GetErrorCode() == Enum.ConnectionError.DisconnectConnectionLost or
                msg:lower():find("exploit")
         then
            bS:Disconnect()
            a7.Kicked = true
            save()
            if msg:lower():find("exploit") then
                local bT =
                    "Killaura Delay: ``" ..
                    Options.KillauraDelay.Value ..
                        "``\nClass: ``" .. bH[aO].DisplayName .. "``\nPing: ``" .. ping2() .. "``"
                if ah then
                    bT = bT .. "\nCode: ``" .. codeStr .. "``\nMission: ``" .. missionName .. "``"
                end
                bT = bT .. "\n" .. plrLink
                request(
                    {
                        Url = boink2,
                        Method = "POST",
                        Headers = {["Content-Type"] = "application/json"},
                        Body = HttpService:JSONEncode(
                            {
                                ["embeds"] = {
                                    {
                                        ["title"] = "Exploit Kick",
                                        ["description"] = bT,
                                        ["type"] = "rich",
                                        ["color"] = tonumber(colorTbl.LightPink),
                                        ["footer"] = {["text"] = utcDateAndTime() .. " UTC"}
                                    }
                                }
                            }
                        )
                    }
                )
            end
            TeleportService:Teleport(2727067538, b)
        end
    end
)
local bL = loadstring(game:HttpGet('https://raw.githubusercontent.com/KeneiUmaru/Library/refs/heads/main/Linoria.lua'))()
local bU =
    bL:CreateWindow(
    {
        Title = " " ,
        Resizable = true,
        Center = false,
        AutoShow = true,
        TabPadding = 8,
        MenuFadeTime = 0,
        CornerRadius = 15
    }
)
local bV = {
    Main = bU:AddTab("Main"),
    Sell = bU:AddTab("Sell"),
    Teleports = bU:AddTab("Teleports"),
    ["Settings"] = bU:AddTab("Settings")
}
local bW = bV.Main:AddLeftTabbox("farmmm")
local bX = bV.Sell:AddLeftTabbox("selll")
local bY = bV.Sell:AddRightTabbox("selll2")
local bZ = bW:AddTab("Farm")
local b_ = bW:AddTab("Settings")
local c0 = bX:AddTab("Auto Sell")
local c1 = bY:AddTab("Sell/Recycle Cosmetics")
local c2 = bW:AddTab("Weapons")
local c3 = bW:AddTab("Event")
local c4 = bV.Main:AddRightTabbox("box")
local c5 = c4:AddTab("Visual")
local c6 = c4:AddTab("Webhook")
local c7 = c4:AddTab("Misc")
local c8 = c4:AddTab("Gui")
local c9 = bV.Main:AddRightTabbox("temp")
local ca = c9:AddTab("Stats")
local cb = bV.Teleports:AddLeftGroupbox("Worlds")
local cc = bV.Teleports:AddRightGroupbox("Towers")
local cd = bV.Teleports:AddRightGroupbox("Nightmare Dungeons")
bZ:AddToggle("Killaura", {Text = "Killaura", Default = false})
bZ:AddSlider(
    "KillauraDelay",
    {Text = "Delay", Default = 0, Min = 0, Max = 1, Rounding = 2, HideMax = true, Compact = true}
)
if olympus and disabled then
    bZ:AddSlider(
        "testOffset",
        {Text = "Test Offset", Default = 0, Min = -25, Max = 25, Rounding = 0, HideMax = true, Compact = true}
    )
end
bZ:AddToggle("Autofarm", {Text = "Autofarm", Default = false})
bZ:AddSlider(
    "Offset",
    {
        Text = "Offset",
        Default = isRangedClass() and 50 or 7,
        Min = 0,
        Max = ah and (isRangedClass() and 75 or 25) or 75,
        Rounding = 1,
        Compact = true
    }
)
bZ:AddSlider(
    "healPercent",
    {Text = "Heal At", Default = 30, Min = 0, Max = 100, Rounding = 0, HideMax = true, Compact = true, Suffix = "% HP"}
)
bZ:AddSlider(
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
bZ:AddToggle("CollectDrops", {Text = "Collect Drops", Default = false})
bZ:AddToggle("collectEggChests", {Text = "Collect Egg Chests", Default = true})
bZ:AddToggle("RestartDungeon", {Text = "Restart Dungeon", Default = false})
bZ:AddToggle("nightmareLoop", {Text = "Nightmare Loop", Default = false})
bZ:AddToggle("NextDungeon", {Text = "Next Dungeon", Default = false})
bZ:AddToggle(
    "PerkSwitcher",
    {
        Text = "Auto Switch Perks",
        Default = false,
        Tooltip = "Enables Primary Perks on Mobs, and Offhand Perks on Bosses"
    }
)
bZ:AddToggle("autoEquipBestwWep", {Text = "Auto Equip Best Weapon/Armor", Default = false})
bZ:AddToggle("mobCamera", {Text = "Mob POV", Default = false})
bZ:AddSlider("FastSprint", {Text = "Sprint Speed", Default = 28, Min = 28, Max = 200, Rounding = 0, Compact = true})
bZ:AddButton(
    {Text = "Restart Dungeon", Func = function()
            if ah then
                StartRaid(af, ag)
            end
        end, DoubleClick = false}
)
b_:AddSlider(
    "dungeonRestartTimer",
    {
        Text = "Restart Dungeon Delay",
        Default = 0,
        Min = 0,
        Max = 300,
        Rounding = 0,
        HideMax = true,
        Suffix = "s",
        Compact = true
    }
)
b_:AddSlider(
    "towerRestartTimer",
    {
        Text = "Restart Tower Delay",
        Default = 0,
        Min = 0,
        Max = 30,
        Rounding = 0,
        HideMax = true,
        Suffix = "s",
        Compact = true
    }
)
b_:AddSlider(
    "dungeonStartTimer",
    {
        Text = "Dungeon Start Delay",
        Default = 0,
        Min = 0,
        Max = 300,
        Rounding = 0,
        HideMax = true,
        Suffix = "s",
        Compact = true
    }
)
b_:AddSlider(
    "towerStartTimer",
    {
        Text = "Tower Start Delay",
        Default = 0,
        Min = 0,
        Max = 600,
        Rounding = 0,
        HideMax = true,
        Suffix = "s",
        Compact = true
    }
)
Options.dungeonStartTimer:OnChanged(
    function(ce)
        b0 = b0 + 1
    end
)
Options.towerStartTimer:OnChanged(
    function(ce)
        b1 = b1 + 1
    end
)
b_:AddSlider(
    "timeoutTimer",
    {
        Text = "Dungeon Timeout",
        Default = 120,
        Min = 10,
        Max = 300,
        Rounding = 0,
        HideMax = true,
        Suffix = "s",
        Tooltip = "Restart dungeon if no damage has been done within the specified time period",
        Compact = true
    }
)
b_:AddToggle(
    "restartAfterFloors",
    {
        Text = "Inf Tower Smart Restart",
        Tooltip = "Restarts Infinite Floor after specified amount of floors are completed",
        Default = false
    }
)
b_:AddInput("completedInfiniteTowerFloors", {Text = "Floors", Default = 31, Numeric = true, Finished = true})
b_:AddToggle("ignoreCannon", {Text = "Ignore Cannon (Atlantis Tower)", Default = false})
b_:AddToggle("skipScarecrowNm", {Text = "Skip Scarecrow Defense (NM Loop)", Default = false})
b_:AddToggle(
    "rejoinDungeon",
    {
        Text = "Rejoin Last Dungeon",
        Tooltip = "Automatically starts the last dungeon started within your desired time limit",
        Default = false
    }
)
Toggles.rejoinDungeon:OnChanged(
    function(bG)
        a7.RejoinLastDungeon = bG
        save()
    end
)
local cf = {
    ["30 minutes"] = 1800,
    ["3 hours"] = 10800,
    ["12 hours"] = 43200,
    ["24 hours"] = 86400,
    ["Infinite"] = 999999999
}
b_:AddDropdown(
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
    function(bG)
        a7.RejoinLastDungeonThreshold = cf[bG]
        save()
    end
)
b_:AddToggle(
    "forceRestartLastTower",
    {
        Text = "Force Restart Last Tower",
        Tooltip = "Restart the Tower when going back to town (willingly or by force)",
        Default = false
    }
)
Toggles.forceRestartLastTower:OnChanged(
    function(bG)
        a7.ForceRestartLastTower = bG
        save()
    end
)
b_:AddSlider(
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
        while ah do
            if #a:GetPlayers() >= Options.playerCountKick.Value then
                task.wait(0.5)
                b:Kick("Someone might have joined your mission!")
                break
            end
            task.wait()
        end
    end
)
c2:AddInput("mobWepId", {Numeric = false, Finished = true, Text = "Current Mob Weapon"})
c2:AddInput("bossWepId", {Numeric = false, Finished = true, Text = "Current Boss Weapon"})
c2:AddButton(
    {
        Text = "Set Current Primary for Mobs",
        Tooltip = "Killaura will auto equip this weapon when targeting mobs",
        Func = function()
            local cg = aJ and aJ:GetChildren()[1]
            local ch = cg and cg.ID.Value
            if ch then
                Options.mobWepId:SetValue(ch)
                libNoti("Set " .. bl[cg.Name].DisplayKey .. " as your Mob weapon!")
            else
                libNoti("No suitable Primary Weapon Detected")
            end
        end,
        DoubleClick = false
    }
)
c2:AddButton(
    {
        Text = "Set Current Primary for Bosses",
        Tooltip = "Killaura will auto equip this weapon when targeting bosses",
        Func = function()
            local cg = aJ and aJ:GetChildren()[1]
            local ch = cg and cg.ID.Value
            if ch then
                Options.bossWepId:SetValue(ch)
                libNoti("Set " .. bl[cg.Name].DisplayKey .. " as your Boss weapon!")
            else
                libNoti("No suitable Primary Weapon Detected")
            end
        end,
        DoubleClick = false
    }
)
c2:AddButton(
    {Text = "Reset Selected Weapons", Func = function()
            Options.mobWepId:SetValue("")
            Options.bossWepId:SetValue("")
            libNoti("Selected weapons reset!")
        end, DoubleClick = false}
)
c6:AddInput(
    "dungeonHook",
    {
        Numeric = false,
        Finished = true,
        Text = "Mission Webhook",
        Tooltip = "Put your own webhook link to log mission completions/fails"
    }
)
c6:AddInput(
    "drophook",
    {Numeric = false, Finished = true, Text = "Drop Webhook", Tooltip = "Put your own webhook link to log T5 drops"}
)
c6:AddInput(
    "dropHookRoleId",
    {
        Numeric = false,
        Finished = true,
        Text = "Custom Role ID for DropHook",
        Tooltip = "Mention your chosen role instead of @everyone when getting a desired perk T5"
    }
)
c6:AddToggle(
    "anonHook",
    {Text = "Anonymous Webhook", Tooltip = "Won't show your User Info in the webhook", Default = false}
)
c0:AddDropdown("AutoSellTbl", {Text = "Auto Sell Tiers", Values = {1, 2, 3, 4, 5}, AllowNull = true, Multi = true})
c0:AddButton(
    {
        Text = "Sell All",
        Tooltip = "Sells all weapons and armors of selected tiers",
        Func = function()
            local ci = {}
            for n, E in bg:GetChildren() do
                local cj = bl[E.Name]
                if
                    (cj.Type == "Weapon" or cj.Type == "Armor") and Options.AutoSellTbl.Value[bv:GetItemTier(E)] and
                        not E:FindFirstChild("Locked")
                 then
                    table.insert(ci, E)
                end
            end
            if #ci > 0 then
                libNoti("Sold " .. #ci .. " items")
                V.Drops.SellItems:InvokeServer(ci)
            end
        end,
        DoubleClick = true
    }
)
c0:AddToggle(
    "autoSellAll",
    {
        Text = "Sell All On Mission Start",
        Tooltip = "Failsafe incase auto sell doesn't sell in time at the end of a mission",
        Default = false
    }
)
c0:AddToggle("autoSellEggs", {Text = "Auto Sell Eggs", Default = false, Tooltip = "Works in Event Wheel Hub also"})
c0:AddDivider()
c0:AddToggle(
    "smartPerkSell",
    {
        Text = "Smart T5 Auto Sell",
        Default = false,
        Tooltip = "Do NOT enable this until you have turned all of your desired perks slider atleast 1 higher than lowest value"
    }
)
local ck = {}
for n, E in bk do
    table.insert(ck, E.DisplayName)
end
table.sort(ck)
for n = 1, #ck do
    for cl, cm in bk do
        if ck[n] == cm.DisplayName then
            c0:AddSlider(
                cl,
                {
                    Text = cm.DisplayName,
                    Default = math.round(cm.StatRange[1] * 100),
                    Min = math.round(cm.StatRange[1] * 100),
                    Max = math.round(cm.StatRange[2] * 100),
                    Rounding = 0,
                    HideMax = true,
                    Compact = true,
                    ScrollSpace = true,
                    Suffix = "%"
                }
            )
        end
    end
end
for n = 1, 11 do
    c0:AddLabel("")
end
local cn = {
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
local co = {}
for n, E in cn do
    table.insert(co, E)
end
table.sort(co)
c1:AddDropdown("selectedCosmetics", {Text = "Select Cosmetics", Values = co, AllowNull = true, Multi = true})
local cp = {
    FrostyScarf = "Frosty Scarf",
    WolfspiritHelmet = "Wolfspirit Helmet",
    WolfspiritArmor = "Wolfspirit Armor",
    FestiveDress = "Festive Dress",
    RamHorns = "Ram Horns",
    CandycaneAntlers = "Candycane Antlers",
    CarrotNose = "Carrot Nose",
    FluffyJacket = "Fluffy Jacket"
}
local co = {}
for n, E in cp do
    table.insert(co, E)
end
table.sort(co)
c1:AddDropdown("selectedWheelCosmetics", {Text = "Select Event Cosmetics", Values = co, AllowNull = true, Multi = true})
local cq = {
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
local co = {}
for n, E in cq do
    table.insert(co, E.Name)
end
table.sort(co)
c1:AddDropdown(
    "selectedDyes",
    {
        Text = "Select Desired Dyes",
        Tooltip = "Event wheel items with these dyes or close to these dyes won't be sold/recycled",
        Values = co,
        AllowNull = true,
        Default = {"Rainbow", "Ghoul", "Ice", "Faded", "Black", "White"},
        Multi = true
    }
)
c1:AddSlider(
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
c1:AddToggle("autoSellCosmetics", {Text = "Auto Sell Cosmetics", Default = false})
Toggles.autoSellCosmetics:OnChanged(
    function(ce)
        if ce and Toggles.autoRecycleCosmetics.Value then
            Toggles.autoRecycleCosmetics:SetValue(false)
        end
    end
)
c1:AddToggle("autoRecycleCosmetics", {Text = "Auto Recycle Cosmetics", Default = false})
Toggles.autoRecycleCosmetics:OnChanged(
    function(ce)
        if ce and Toggles.autoSellCosmetics.Value then
            Toggles.autoSellCosmetics:SetValue(false)
        end
    end
)
function color3ToHex(color)
    local bE = math.floor(color.R * 255 + 0.5)
    local cr = math.floor(color.G * 255 + 0.5)
    local bC = math.floor(color.B * 255 + 0.5)
    return string.format("#%02X%02X%02X", bE, cr, bC)
end
function hexToRGB(cs)
    cs = cs:gsub("#", "")
    return tonumber("0x" .. cs:sub(1, 2)), tonumber("0x" .. cs:sub(3, 4)), tonumber("0x" .. cs:sub(5, 6))
end
function colorDistance(ct, cu)
    local cv, cw, cx = hexToRGB(ct)
    local cy, cz, cA = hexToRGB(cu)
    return math.sqrt((cy - cv) ^ 2 + (cz - cw) ^ 2 + (cA - cx) ^ 2)
end
function desiredColorCheck(cB)
    local cC
    local cD
    if cB and cB:FindFirstChild("Dye") and cB.Dye.Value then
        cD = color3ToHex(cB.Dye.Value)
        for cE, cF in cq do
            if Options.selectedDyes.Value[cF.Name] then
                if cD == cF.Hex then
                    cC = true
                    print("Did not sell " .. cB.Name .. " - " .. cF.Name)
                    break
                elseif not cF.SpecialType then
                    local a1 = colorDistance(cD, cF.Hex)
                    if a1 <= Options.colorDistanceThreshold.Value then
                        cC = true
                        print(
                            "Did not sell " ..
                                cB.Name ..
                                    " - Similar to " ..
                                        cF.Name ..
                                            " - Color Distance: " .. math.floor(a1 / 0.1) / 10 .. " - Hex: " .. cD
                        )
                        break
                    end
                end
            end
        end
    end
    if cC then
        return true
    end
end
c1:AddButton(
    {
        Text = "Sell Selected Cosmetics",
        Func = function()
            local ci = {}
            for n, E in bh:GetChildren() do
                local cG = cn[E.Name] or cp[E.Name] or "none"
                if
                    (Options.selectedCosmetics.Value[cG] or Options.selectedWheelCosmetics.Value[cG]) and
                        not E:FindFirstChild("Locked") and
                        not desiredColorCheck(E)
                 then
                    table.insert(ci, E)
                end
            end
            if #ci > 0 then
                libNoti("Sold " .. #ci .. " Cosmetics")
                sell(ci)
            end
        end,
        DoubleClick = true
    }
)
c1:AddButton(
    {
        Text = "Recycle Selected Cosmetics",
        Func = function()
            local ci = {}
            for n, E in bh:GetChildren() do
                local cG = cn[E.Name] or cp[E.Name] or "none"
                if
                    (Options.selectedCosmetics.Value[cG] or Options.selectedWheelCosmetics.Value[cG]) and
                        not E:FindFirstChild("Locked") and
                        not desiredColorCheck(E)
                 then
                    table.insert(ci, E)
                end
            end
            if #ci > 0 then
                libNoti("Recycled " .. #ci .. " Cosmetics")
                recycle(ci)
            end
        end,
        DoubleClick = true
    }
)
if table.find(ai, game.PlaceId) then
    bh.ChildAdded:Connect(
        function(E)
            if Toggles.autoSellCosmetics.Value or Toggles.autoRecycleCosmetics.Value then
                local cG = cp[E.Name]
                if cG then
                    E:WaitForChild("Dye", 5)
                    if
                        Options.selectedWheelCosmetics.Value[cG] and not E:FindFirstChild("Locked") and
                            not desiredColorCheck(E)
                     then
                        if Toggles.autoSellCosmetics.Value then
                            sell({E})
                        end
                        if Toggles.autoRecycleCosmetics.Value then
                            recycle({E})
                        end
                    end
                end
            end
        end
    )
    bg.ChildAdded:Connect(
        function(E)
            if Toggles.autoSellEggs.Value then
                local cB = bl[E.Name]
                if cB.Type == "Egg" then
                    sell({E})
                end
            end
        end
    )
end
c3:AddInput("wheelCount", {Default = 100, Numeric = true, Finished = true, Text = "Wheel Spin Count"})
c3:AddSlider(
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
local cH =
    c3:AddLabel(
    Options.wheelCount.Value ..
        " spins in " .. timeElapsed(math.round((Options.wheelCount.Value - 1) * Options.wheelDelay.Value * 10) / 10)
)
Options.wheelCount:OnChanged(
    function(ce)
        cH:SetText(ce .. " spins in " .. timeElapsed(math.round((ce - 1) * Options.wheelDelay.Value * 10) / 10))
    end
)
Options.wheelDelay:OnChanged(
    function(ce)
        cH:SetText(
            Options.wheelCount.Value ..
                " spins in " .. timeElapsed(math.round((Options.wheelCount.Value - 1) * ce * 10) / 10)
        )
    end
)
c3:AddButton(
    {
        Text = "Spin wheel with the settings above!",
        Func = function()
            local cI, cJ = tonumber(Options.wheelCount.Value), Options.wheelDelay.Value
            if cI > 0 then
                libNoti(
                    "Spinning the wheel " ..
                        cI .. " times in " .. timeElapsed(math.round((cI - 1) * cJ * 10) / 10) .. " seconds!",
                    7
                )
                for n = 1, cI do
                    V.EventSpinner.JoinQueue:FireServer(b)
                    task.wait(cJ)
                end
            end
        end,
        DoubleClick = true
    }
)
function PlayerTp(r, bD, cK, cL)
    if alive() then
        ay.CFrame = CFrame.new(r + Vector3.new(bD, cK, cL))
    end
end
function SmartPlayerTp(cM, cN)
    if not alive() then
        return
    end
    noclip()
    ay.Velocity = Vector3.new()
    if ax:FindFirstChild("Collider") then
        ax.Collider.Velocity = Vector3.new()
    end
    if cN then
        ay.CFrame = CFrame.lookAt(cM.Position, Vector3.new(cN.Position.x, cM.Position.y, cN.Position.z))
    else
        ay.CFrame = cM
    end
end
c5:AddToggle("NVD", {Text = "No Visual Damage", Default = true})
c5:AddToggle("disableEffects", {Text = "Disable Effects", Default = true})
c5:AddToggle("rendering", {Text = "Disable 3D Rendering", Default = false})
Toggles.rendering:OnChanged(
    function(bG)
        cloneref(game:GetService("RunService")):Set3dRenderingEnabled(not bG)
    end
)
c5:AddToggle("autoHide", {Text = "Hide GUI On Execution", Default = false})
c7:AddButton(
    {
        Text = "Upgrade Equipped Items",
        Func = function()
            local cO = {aJ:GetChildren()[1], aK:GetChildren()[1], aL:GetChildren()[1]}
            for cE, cP in cO do
                task.spawn(
                    function()
                        if cP and cP:FindFirstChild("UpgradeLimit") and cP.UpgradeLimit.Value ~= 0 then
                            local cQ = aF.Value
                            local cR = tick()
                            while task.wait(0.1) do
                                if cP:FindFirstChild("Upgrade") and cP.Upgrade.Value == cP.UpgradeLimit.Value then
                                    break
                                else
                                    aM:FireServer(cP)
                                    if aF.Value ~= cQ then
                                        cQ = aF.Value
                                        cR = tick()
                                    end
                                    if tick() - cR >= 2 then
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
c7:AddButton(
    {
        Text = "Discover Dungeons (!)",
        Func = function()
            if alive() and not ah then
                local cS = workspace.PhysicalDungeonLocations
                for n, E in cS:GetChildren() do
                    local cT
                    V.Teleport.WaystoneTeleport:FireServer(1)
                    ay:GetPropertyChangedSignal("Position"):Once(
                        function()
                            ay:GetPropertyChangedSignal("Position"):Once(
                                function()
                                    cT = true
                                end
                            )
                            PlayerTp(E.Ring.Position, 0, 7.5, 0)
                        end
                    )
                    repeat
                        task.wait()
                    until cT
                    task.wait(1)
                end
            end
        end,
        DoubleClick = true
    }
)
local cU, cV
if olympus then
    c7:AddButton(
        {Text = "Dex Explorer", Func = function()
                if not cU then
                    cU = true
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
                end
            end, DoubleClick = true}
    )
    c7:AddButton(
        {Text = "SimpleSpy", Func = function()
                if not cV then
                    cV = true
                    loadstring(
                        game:HttpGetAsync("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpyBeta.lua")
                    )()
                end
            end, DoubleClick = true}
    )
end
getgenv().GuiData = {
    {DisplayName = "Bank", CodeName = "Bank"},
    {DisplayName = "Zero Altar", CodeName = "Fusion"},
    {DisplayName = "Upgrade", CodeName = "ItemUpgrade"},
    {DisplayName = "Dungeon Menu", CodeName = "MissionSelect"},
    {DisplayName = "Inventory", CodeName = "Inventory"},
    {DisplayName = "Recycler", CodeName = "Recycler"},
    {DisplayName = "Admin Item Panel (!)", CodeName = "AdminItemPanel"}
}
function OpenGui(cW)
    setthreadcontext(2)
    require(U.Client.Gui.GuiScripts[cW]):Open()
end
for cE, cr in ipairs(GuiData) do
    c8:AddButton(
        {Text = cr.DisplayName, Func = function()
                OpenGui(cr.CodeName)
            end, DoubleClick = false}
    )
end
c8:AddInput("marketFilter", {Numeric = false, Finished = true, Text = "Market Filter"})
c8:AddButton(
    {
        Text = "Open All Markets",
        Func = function()
            task.spawn(
                function()
                    setthreadcontext(2)
                    local cX = require(game.ReplicatedStorage.Client.Gui.GuiScripts.Shop)
                    local cY = getfenv(cX.Open).BuildShop
                    pcall(cX.Open, cX, game)
                    pcall(
                        function()
                            for n, E in getupvalue(cY, 1) do
                                print(n, E)
                            end
                        end
                    )
                    for n, E in getupvalue(cY, 2) do
                    end
                    local cZ = {}
                    local c_ = {}
                    local d0 = U:WaitForChild("PlayerShops")
                    for n, d1 in a:GetPlayers() do
                        local d2 = d0:FindFirstChild(d1.Name) and d0[d1.Name]:FindFirstChild("SellShop")
                        if d2 and d2:FindFirstChild("Active") and d2.Active.Value then
                            setupvalue(cY, 1, {})
                            setupvalue(cY, 2, {})
                            cY(d1)
                            for n, E in getupvalue(cY, 1) do
                                E.Title.Text = E.Title.Text .. " (" .. d1.Name .. ")"
                                E.Title.Overlay.Text = E.Title.Text
                                table.insert(cZ, E)
                            end
                            for n, E in getupvalue(cY, 2) do
                                table.insert(c_, E)
                            end
                        end
                    end
                    if Options.marketFilter.Value and #Options.marketFilter.Value > 0 then
                        for n, E in cZ do
                            if not E.Title.Text:lower():find(Options.marketFilter.Value:lower()) then
                                E:Destroy()
                            end
                        end
                    end
                    table.sort(
                        cZ,
                        function(d3, bC)
                            local d4 =
                                d3:FindFirstChild("Cost") and d3.Cost:FindFirstChild("Overlay") and
                                #d3.Cost.Overlay.Text > 0 and
                                d3.Cost.Overlay.Text:gsub(",", "") and
                                tonumber(d3.Cost.Overlay.Text:gsub(",", "")) or
                                0
                            local d5 =
                                bC:FindFirstChild("Cost") and bC.Cost:FindFirstChild("Overlay") and
                                #bC.Cost.Overlay.Text > 0 and
                                bC.Cost.Overlay.Text:gsub(",", "") and
                                tonumber(bC.Cost.Overlay.Text:gsub(",", "")) or
                                0
                            return d4 > d5
                        end
                    )
                    setupvalue(cY, 1, cZ)
                    setupvalue(cY, 2, c_)
                    getupvalue(cX.Init, 1).Title.Text = "All Shops"
                    getupvalue(cX.Init, 1).Title.Overlay.Text = "All Shops"
                end
            )
        end,
        DoubleClick = false
    }
)
local d6 = ca:AddLabel("Gold Gain: " .. aF.Value - aG)
local d7 = ca:AddLabel("Gold Rate: N/A")
local d8 = 0
local d9 = true
c = tick()
local da
local db
local dc = false
local dd = ca:AddLabel("Total Gold: " .. formatNumberWithCommas(aF.Value))
local de = ca:AddLabel("Session Time: 0s")
ca:AddDivider()
local df = a7.CrossSessionTimestamp or tick()
local dg = ca:AddLabel("Cross-Session Time: " .. timeElapsed(tick() - df))
local dh =
    ca:AddLabel("CS Gold Gain: " .. formatNumberWithCommas(a7.CrossSessionGold and aH - a7.CrossSessionGold or 0))
local di = a7.CrossSessionGold or aH
ca:AddButton(
    {Text = "Reset Cross-Session Time", Func = function()
            df = tick()
            a7.CrossSessionTimestamp = df
            save()
        end, DoubleClick = true}
)
ca:AddButton(
    {Text = "Reset Cross-Session Gold", Func = function()
            di = aH
            a7.CrossSessionGold = di
            save()
            dh:SetText("CS Gold Gain: 0")
        end, DoubleClick = true}
)
local dj
if not a7.CrossSessionTimestamp then
    a7.CrossSessionTimestamp = df
    dj = true
end
if not a7.CrossSessionGold then
    a7.CrossSessionGold = di
    dj = true
end
if dj then
    save()
end
task.spawn(
    function()
        while true do
            if aF.Value ~= aH then
                aH = aF.Value
                if not d9 then
                    d7:SetText("Gold Rate: " .. math.floor((aH - db) / (tick() - da) * 600) / 10 .. "/min")
                end
                if d9 then
                    d9 = false
                    dc = true
                    da = tick()
                    db = aH
                end
                d6:SetText("Gold Gained: " .. formatNumberWithCommas(aH - aG))
                dd:SetText("Total Gold: " .. formatNumberWithCommas(aH))
                dh:SetText("CS Gold Gain: " .. formatNumberWithCommas(aH - di))
            end
            task.wait()
        end
    end
)
task.spawn(
    function()
        while true do
            task.wait(1)
            de:SetText("Session Time: " .. timeElapsed(tick() - c))
            dg:SetText("Cross-Session Time: " .. timeElapsed(tick() - df))
        end
    end
)
local dk
for n, dl in ipairs(WorldData) do
    if n % 2 > 0 then
        dk = false
    end
    if not dl.Name:find("World") then
        dk = false
    end
    if not dk then
        dk =
            cb:AddButton(
            {Text = dl.Name, Func = function()
                    V.Teleport.TeleportToHub:FireServer(dl.Id)
                end, DoubleClick = true}
        )
    else
        dk:AddButton(
            {Text = dl.Name, Func = function()
                    V.Teleport.TeleportToHub:FireServer(dl.Id)
                end, DoubleClick = true}
        )
    end
end
for n, E in Towers do
    cc:AddButton(
        {Text = bi[E].NameTag .. " T" .. n, Func = function()
                StartRaid(E)
            end, DoubleClick = false}
    )
end
for n, E in Nightmares do
    cd:AddButton(
        {
            Text = string.gsub(bi[E].NameTag, "%(NIGHTMARE%) ", "") ..
                " " .. bi[E].DisplayWorldID .. "-" .. bi[E].WorldMissionID,
            Func = function()
                StartRaid(E, Toggles.ChallengeMode.Value and 5 or 1)
            end,
            DoubleClick = false
        }
    )
end
cd:AddToggle("ChallengeMode", {Text = "Challenge Mode", Default = true})
local dm = Vector3.new(0, 500, 0)
local dn = Vector3.new()
local dp
local dq
local dr
do
    function isKrakenArm(ds)
        return ds:lower():find("kraken-arm") or ds:lower():find("krakenarm")
    end
    function MobTeleport()
        task.spawn(
            function()
                local dt
                local du
                local dv
                while Toggles.Autofarm.Value do
                    for n, E in aU:GetChildren() do
                        if isAlive(E) then
                            if mobWaitTbl and table.find(mobWaitTbl, E.Name) and (not dv or alwaysWait) then
                                task.wait(waittime)
                                dv = true
                            end
                            local Z = E.PrimaryPart
                            if not firstMobFound then
                                firstMobFound = true
                            end
                            while isAlive(E) and Toggles.Autofarm.Value and W do
                                bs = E
                                dt = Z.Position
                                setCamera(not br and Toggles.mobCamera.Value and Z)
                                dp =
                                    isKrakenArm(E.Name) and 0 or
                                    (Z.Size.Y / 2 + Options.Offset.Value) * (isRangedClass() and 1 or -1)
                                dq =
                                    CFrame.new(
                                    Z.Position + (table.find(aw, E) and dn or Vector3.new(0, dp, 0) + (br and dm or dn))
                                ) +
                                    Z.CFrame.lookVector * 2
                                du = dq
                                SmartPlayerTp(dq, Z)
                                bu:Wait()
                            end
                        end
                    end
                    bs = nil
                    setCamera()
                    unnoclip()
                    if am and W and du then
                        SmartPlayerTp(du)
                    end
                    task.wait()
                end
                if dt and am then
                    SmartPlayerTp(CFrame.new(dt + Vector3.new(0, 10, 0)))
                end
            end
        )
    end
    function MobTeleportIgnore(dw, mobWaitTbl, waittime, alwaysWait)
        local dv
        task.spawn(
            function()
                while Toggles.Autofarm.Value do
                    for n, E in aU:GetChildren() do
                        if isAlive(E) then
                            if E.Name ~= dw or E.Name == dw and aR == 1 then
                                if mobWaitTbl and table.find(mobWaitTbl, E.Name) and (not dv or alwaysWait) then
                                    task.wait(waittime)
                                    dv = true
                                end
                                local Z = E.PrimaryPart
                                while isAlive(E) and Toggles.Autofarm.Value and W and
                                    (E.Name ~= dw or E.Name == dw and aR == 1) do
                                    bs = E
                                    setCamera(not br and Toggles.mobCamera.Value and Z)
                                    dp =
                                        isKrakenArm(E.Name) and 0 or
                                        (Z.Size.Y / 2 + Options.Offset.Value) * (isRangedClass() and 1 or -1)
                                    dq =
                                        CFrame.new(
                                        Z.Position +
                                            (table.find(aw, E) and dn or Vector3.new(0, dp, 0) + (br and dm or dn))
                                    ) +
                                        Z.CFrame.lookVector * 2
                                    SmartPlayerTp(dq, Z)
                                    bu:Wait()
                                end
                            end
                        end
                    end
                    bs = nil
                    setCamera()
                    unnoclip()
                    task.wait()
                end
            end
        )
    end
    function MobTeleportPriority(dx, mobWaitTbl, waittime, alwaysWait)
        local dy, dz
        task.spawn(
            function()
                while Toggles.Autofarm.Value do
                    local dA = false
                    local dB = {}
                    for n, E in aU:GetChildren() do
                        if isAlive(E) then
                            table.insert(dB, E)
                        end
                    end
                    for n = 1, #dx do
                        for cE, Mob in dB do
                            if Mob.Name == dx[n] then
                                dA = true
                                dy, dz = Mob, Mob.Name
                                break
                            end
                        end
                        if dA then
                            break
                        end
                    end
                    if not dA and dB[1] then
                        dy, dz = dB[1], dB[1].Name
                    end
                    task.wait()
                end
            end
        )
        task.spawn(
            function()
                local dv
                while Toggles.Autofarm.Value do
                    if isAlive(dy) and W then
                        local dC = dy.PrimaryPart
                        bs = dy
                        if mobWaitTbl and table.find(mobWaitTbl, dz) and (not dv or alwaysWait) then
                            task.wait(waittime)
                            dv = true
                        end
                        setCamera(not br and Toggles.mobCamera.Value and dC)
                        dp =
                            isKrakenArm(dz) and 0 or
                            (dC.Size.Y / 2 + Options.Offset.Value) * (isRangedClass() and 1 or -1)
                        dq =
                            CFrame.new(
                            dC.Position + (table.find(aw, dy) and dn or Vector3.new(0, dp, 0) + (br and dm or dn))
                        ) +
                            dC.CFrame.lookVector * 2
                        SmartPlayerTp(dq, dC)
                    else
                        bs = nil
                        setCamera()
                        unnoclip()
                    end
                    bu:Wait()
                end
                setCamera()
            end
        )
    end
    function AutoCheckpoint()
        task.spawn(
            function()
                local dD = 0.33
                local dE = bB[ae] or 0
                local dF, dG
                for n, E in DungeonData do
                    if E.Id == ae then
                        dF = true
                    end
                end
                if not dF then
                    dG = true
                end
                while Toggles.Autofarm.Value do
                    if aq or au then
                        break
                    end
                    if alive() and (aR <= dE or dG) then
                        for cE, o in workspace:GetChildren() do
                            if not table.find(bz, o.Name) then
                                for n, E in o:GetDescendants() do
                                    if
                                        E and E.Name == "TouchInterest" and E.Parent and
                                            (table.find(by, E.Parent.Name) or
                                                E.Parent.Parent and table.find(by, E.Parent.Parent.Name))
                                     then
                                        if E.Parent.Name == "WaveExit" then
                                            local dH = ay.CFrame
                                            PlayerTp(E.Parent.Position, 0, 25, 0)
                                            local cR = tick()
                                            repeat
                                                task.wait()
                                            until not o:FindFirstChild("WaveExit") or tick() - cR > 2 or
                                                not Toggles.Autofarm.Value
                                            if ay and o:FindFirstChild("WaveExit") and Toggles.Autofarm.Value then
                                                ay.CFrame = dH
                                            end
                                        else
                                            task.spawn(
                                                function()
                                                    E.Parent.CanCollide = false
                                                    E.Parent.Anchored = true
                                                    E.Parent.Transparency = 1
                                                    local dH = E.Parent.CFrame
                                                    E.Parent.CFrame = CFrame.new(ay.Position) * (dH - dH.Position)
                                                    task.wait(dD)
                                                    if E and E.Parent then
                                                        E.Parent.CFrame = dH
                                                    end
                                                end
                                            )
                                        end
                                    end
                                end
                            end
                        end
                        local dI = tick()
                        while Toggles.Autofarm.Value do
                            if tick() - dI > 10 then
                                break
                            end
                            if tick() - dI > dD * 2 and (aR <= dE or dG) then
                                local dJ = true
                                if al then
                                    local cR = tick()
                                    while Toggles.Autofarm.Value do
                                        if aR > 0 then
                                            dJ = false
                                            break
                                        end
                                        if tick() - cR > 1 then
                                            break
                                        end
                                        task.wait()
                                    end
                                end
                                if dJ then
                                    break
                                end
                            end
                            task.wait()
                        end
                    end
                    task.wait()
                end
            end
        )
    end
    function MobCounter()
        task.spawn(
            function()
                while Toggles.Autofarm.Value do
                    aS = 0
                    for n, E in aU:GetChildren() do
                        if isAlive(E) then
                            aS = aS + 1
                        end
                    end
                    if aR ~= aS then
                        aR = aS
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
                    bq = nil
                    while Toggles.Autofarm.Value do
                        if bs and bs.PrimaryPart and bs.PrimaryPart.Position then
                            bq =
                                aq and CFrame.new(Vector3.new(324, 60, -134)) or
                                CFrame.new(bs.PrimaryPart.Position + Vector3.new(0, 5, 0))
                        end
                        if bq and aR == 0 then
                            local dK = tick()
                            while tick() - dK <= 0.1 and aR == 0 do
                                SmartPlayerTp(bq)
                                bu:Wait()
                            end
                            bq = nil
                        end
                        task.wait()
                    end
                    if not Toggles.Autofarm.Value then
                        if bq then
                            local dK = tick()
                            while tick() - dK <= 0.1 do
                                SmartPlayerTp(bq)
                                bu:Wait()
                            end
                            bq = nil
                        end
                    end
                end
            )
        end
    end
    function sell(ba)
        V.Drops.SellItems:InvokeServer(ba)
    end
    function recycle(ba)
        V.Recycler.Recycle:FireServer(ba)
    end
end
if addingCosmetics then
    function ChangeCosmetic(r, s)
        if ax then
            aA:SetAttribute(r, s)
        end
    end
    function color(bD, cK, cL)
        Color3.fromRGB(bD, cK, cL)
    end
    local dL = {
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
    local aI = {
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
    local dM = {Costume = "CogWorkArmor", Hat1 = "CogWorkTophat", Hat2 = "CogWorkGoggles"}
    function CogWorkOutfit()
        if aA:GetAttribute("Primary") then
            local dN = bl[aA:GetAttribute("Primary")].SubType
            if dN == "Greataxe" then
                ChangeCosmetic(aI.RightWepSkin, "CogWorkAxe")
            else
                ChangeCosmetic(aI.RightWepSkin, "CogWork" .. dN)
            end
        end
        if aA:GetAttribute("Offhand") then
            local dN = bl[aA:GetAttribute("Offhand")].SubType
            if dN == "Greataxe" then
                ChangeCosmetic(aI.LeftWepSkin, "CogWorkAxe")
            else
                ChangeCosmetic(aI.LeftWepSkin, "CogWork" .. dN)
            end
        end
        for n, E in dM do
            ChangeCosmetic(n, E)
        end
    end
    OutfitList:AddButton(
        {Text = "Cogwork", Func = function()
                if ax then
                    CogWorkOutfit()
                end
            end, DoubleClick = false}
    )
end
function hookWithUserInfo(dO, dP, dQ, color, d, dR)
    request(
        {
            Url = dO,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode(
                {
                    ["content"] = dR or "",
                    ["embeds"] = {
                        {
                            ["title"] = dP,
                            ["description"] = dQ,
                            ["type"] = "rich",
                            ["color"] = tonumber(color),
                            ["footer"] = {["text"] = d .. " UTC"}
                        }
                    }
                }
            )
        }
    )
end
function anonHook(dO, dP, dQ, color, d, dR)
    request(
        {
            Url = dO,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode(
                {
                    ["content"] = dR or "",
                    ["embeds"] = {
                        {
                            ["title"] = dP,
                            ["description"] = dQ,
                            ["type"] = "rich",
                            ["color"] = tonumber(color),
                            ["footer"] = {["text"] = d .. " UTC"}
                        }
                    }
                }
            )
        }
    )
end
function msg(dS, color, d)
    local dT = Options.dungeonHook.Value
    local dU =
        "Code: ``" ..
        codeStr ..
            "``\nMission: ``" ..
                missionName .. "``\nTime: ``" .. d .. "``\nClass: " .. "``" .. bH[aO].DisplayName .. "``"
    if am then
        local b6 = aU:GetChildren()[1]
        local dV = b6 and Mob(b6.Name)
        local a3, dz = dV and dV.BossTag, dV and dV.NameTag
        if a3 and dz then
            dU = dU .. "\nBoss: ``" .. dz .. "``"
        end
    end
    if isfile and readfile and writefile then
        if a7.LastDungeonCompletion then
            dU =
                dU ..
                "\nTime Since Last Completion: ``" .. timeElapsed(math.round(bw - a7.LastDungeonCompletion)) .. "``"
        end
        if a7.Gold and X >= a7.Gold then
            dU = dU .. "\nGold Gained: ``" .. formatNumberWithCommas(X - a7.Gold) .. "``"
        end
        a7.Gold = X
        a7.LastDungeonCompletion = bw
        save()
    end
    dU = dU .. "\nGold: ``" .. formatNumberWithCommas(aF.Value) .. "``"
    if ap then
        local dW = {
            KrakenRaid = {coinCode = "KrakenCoin", coinStr = "Kraken Coins", lb = "KRAKEN_KILLS_2025", name = "Kraken"},
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
        local dX = aq and "KrakenRaid" or as and "VaneRaid" or at and "HalloweenRaid" or ar and "ChristmasRaid"
        local dY = dW[dX].coinCode
        local dZ = dW[dX].coinStr
        local d_ = dW[dX].lb
        local e0 = dW[dX].name
        local e1 = game:GetService("ReplicatedStorage").Shared.LeaderboardHookup.GetScore:InvokeServer(d_, 1)
        dU = dU .. "\n" .. e0 .. " Raids Completed: ``" .. e1[1] .. "`` / ``" .. e1[2] .. "``"
        if bg:FindFirstChild(dY) and bg[dY]:FindFirstChild("Count") then
            dU = dU .. "\n" .. dZ .. ": ``" .. bg[dY].Count.Value .. "``"
        end
    elseif am or an then
        dU = dU .. "\nFloor: **" .. U.ReplicateTowerFloor.Value .. "**"
    end
    function getGuildInfo()
        local F = V.Guilds.GetCache:InvokeServer(bt)
        local G
        for n, E in F.Members do
            if tonumber(n) == userId then
                G = E.Points
                break
            end
        end
        if G then
            dU = dU .. "\nGuild Points: ``" .. G .. "`` / ``" .. bt .. "``"
        end
    end
    local e2 = true
    if bt and not Toggles.anonHook.Value and e2 then
        getGuildInfo()
    end
    if not Toggles.anonHook.Value then
        dU = dU .. "\n" .. plrLink
    end
    if dT and #dT > 30 then
        if a5 then
            task.wait(1.5)
        end
        a5 = true
        if Toggles.anonHook.Value then
            anonHook(dT, dS, dU, color, utcDateAndTime())
        else
            hookWithUserInfo(dT, dS, dU, color, utcDateAndTime())
        end
        a5 = false
    end
    if not olympus then
        if bt and Toggles.anonHook.Value then
            getGuildInfo()
        end
        if Toggles.anonHook.Value then
            dU = dU .. "\n" .. plrLink
        end
        if a5 then
            task.wait(1.5)
        end
        a5 = true
        hookWithUserInfo(boink3, dS, dU, color, utcDateAndTime())
        a5 = false
    end
end
function missionEndRestartOrNextEvent()
    if Toggles.Autofarm.Value then
        if Toggles.nightmareLoop.Value and ao then
            local e3 = nextInTbl(Nightmares, af)
            if bi[e3].InternalID == 3 and Toggles.skipScarecrowNm.Value then
                e3 = nextInTbl(Nightmares, e3)
                libNoti("Skipping Scarecrow Defense")
            end
            StartRaid(e3, ag)
        elseif Toggles.NextDungeon.Value and not am then
            local e4 = nextInTbl(nextDungeonTbl, af)
            local e5 = table.find(noDifficultyMissions, e4)
            local e6 = aE.Level.Value >= missionLevelReq(e4) and (ag == 5 or al or an)
            local e7 = e6 and e4 or af
            local e8 = not e6 and (ag == 1 and 5 or ag) or not e5 and 1 or nil
            StartRaid(e7, e8)
        elseif Toggles.RestartDungeon.Value then
            game:GetService("ReplicatedStorage").Shared.Missions.LeaveChoice:FireServer(true)
            game:GetService("ReplicatedStorage").Shared.Missions.NotifyReadyToLeave:FireServer()
            StartRaid(af, ag)
        end
    end
end
function openEndChests()
    if Toggles.Autofarm.Value then
        for n = 1, 4 do
            V.Missions.GetMissionPrize:InvokeServer()
        end
    end
end
if ah then
    if MissionScripts:FindFirstChild(6) then
        task.spawn(
            function()
                local e9, ea, eb =
                    Workspace:WaitForChild("Pillar1"),
                    Workspace:WaitForChild("Pillar2"),
                    Workspace:WaitForChild("Pillar3")
                eb:WaitForChild("HealthProperties")
                e9.Name = "Pillar"
                ea.Name = "Pillar"
                eb.Name = "Pillar"
                e9.Parent = aU
                ea.Parent = aU
                eb.Parent = aU
            end
        )
    elseif ak or aq then
        task.spawn(
            function()
                while true do
                    local ec = aU:FindFirstChild("BOSSKrakenMain") or aU:FindFirstChild("EVENTBOSSKraken")
                    if ec then
                        local ed = Instance.new("Folder")
                        ed.Name = "WaterFolder"
                        ed.Parent = Workspace
                        ec.Parent = Workspace.WaterFolder
                        break
                    end
                    task.wait()
                end
            end
        )
    elseif MissionScripts:FindFirstChild(30) then
        local ee = 0
        task.spawn(
            function()
                while true do
                    for n, E in aU:GetChildren() do
                        if (E.PrimaryPart.Position - Vector3.new(533, 302, -123)).magnitude < 100 then
                            E:Destroy()
                            ee = ee + 1
                        end
                    end
                    if ee == 3 then
                        break
                    end
                    task.wait()
                end
            end
        )
    end
    local ef = bi[af]
    missionName = ef.NameTag .. (ag == 1 and " Normal" or ag == 5 and " Challenge" or "")
    missionName = string.gsub(missionName, "%(NIGHTMARE%) ", "Nightmare ")
    codeStr =
        ef.EventDungeon and "Event" or (am or an) and "Special" or ef.TowerID and "Tower " .. ef.TowerID or
        ef.DisplayWorldID .. "-" .. ef.WorldMissionID
    V.Missions.MissionFinished.OnClientEvent:Once(
        function(d, eg, eh, ei)
            d = d > 31536000 and 0 or d
            bw = tick()
            X = aF.Value
            au = true
            local ej = timeElapsed(d)
            task.spawn(
                function()
                    libNoti("Mission " .. (eh and "Failed!" or "Completed!") .. "\nTime: " .. ej)
                    msg("Mission " .. (eh and "Failed" or "Completed"), colorTbl[eh and "Red" or "Green"], ej)
                end
            )
            bg.ChildAdded:Connect(
                function(bG)
                    local ek = bl[bG.Name]
                    local el = bv:GetItemTier(bG)
                    local em
                    if ek.Type == "Weapon" or ek.Type == "Armor" then
                        if aX then
                            aY = false
                            aZ = tick()
                        end
                        bG:WaitForChild("Level")
                        if el < 6 then
                            if Options.AutoSellTbl.Value[el] and Toggles.Autofarm.Value then
                                libNoti("Sold a Lvl " .. bG.Level.Value .. " T" .. el .. " " .. ek.DisplayKey)
                                sell({bG})
                                em = true
                            end
                        end
                        if el == 5 and not Options.AutoSellTbl.Value[5] then
                            bG:WaitForChild("Perk1")
                            bG:WaitForChild("Perk2")
                            bG:WaitForChild("Perk3")
                            bG.Perk1:WaitForChild("PerkValue")
                            bG.Perk2:WaitForChild("PerkValue")
                            bG.Perk3:WaitForChild("PerkValue")
                            local en
                            local eo
                            local ep
                            if not Toggles.anonHook.Value then
                                ep =
                                    plrLink ..
                                    "\nType: ``" ..
                                        ek.Type ..
                                            "``\nLevel: ``" .. bG.Level.Value .. "``\n## ``" .. ek.DisplayKey .. "``"
                            else
                                ep =
                                    "Type: ``" ..
                                    ek.Type .. "``\nLevel: ``" .. bG.Level.Value .. "``\n## ``" .. ek.DisplayKey .. "``"
                            end
                            for cE, eq in bG:GetChildren() do
                                if Options[eq.Value] then
                                    local er = math.round(eq.PerkValue.Value * 100)
                                    local es = Options[eq.Value].Value
                                    local et = es > math.round(bk[eq.Value].StatRange[1] * 100)
                                    local eu = bk[eq.Value].DisplayName
                                    local ev = et and er >= es
                                    local ew = et and er == math.round(bk[eq.Value].StatRange[2] * 100)
                                    if ev and not en then
                                        en = true
                                    end
                                    if ew and not eo then
                                        eo = true
                                    end
                                    ep =
                                        ep ..
                                        "\n" ..
                                            (ew and "### <:Gold:832693611396857886> " or ev and "### :green_circle: " or
                                                "### :red_circle: ") ..
                                                eu .. ": ``" .. er .. "%``"
                                end
                            end
                            if not en and Toggles.smartPerkSell.Value and Toggles.Autofarm.Value then
                                libNoti("Sold a Lvl " .. bG.Level.Value .. " T" .. el .. " " .. ek.DisplayKey)
                                sell({bG})
                                em = true
                            end
                            local dT = Options.drophook.Value
                            if dT and #dT > 30 and Toggles.Autofarm.Value then
                                task.spawn(
                                    function()
                                        local ex =
                                            Options.dropHookRoleId.Value and #Options.dropHookRoleId.Value > 0 and
                                            "<@&" .. Options.dropHookRoleId.Value .. ">"
                                        local ey = en and (ex or "@everyone") or ""
                                        local cC = eo and colorTbl.Gold or en and colorTbl.Green or colorTbl.Cyan
                                        if a5 then
                                            task.wait(1.5)
                                        end
                                        a5 = true
                                        local ez = "Legendary Drop"
                                        if Toggles.anonHook.Value then
                                            anonHook(dT, ez, ep, cC, utcDateAndTime(), ey)
                                        else
                                            hookWithUserInfo(dT, ez, ep, cC, utcDateAndTime(), ey)
                                        end
                                        a5 = true
                                    end
                                )
                            end
                        end
                        if not em then
                            libNoti("Got a Lvl " .. bG.Level.Value .. " T" .. el .. " " .. ek.DisplayKey .. "!")
                        end
                        if aX then
                            aY = true
                            aZ = tick()
                        end
                    elseif ek.Type == "Egg" and Toggles.autoSellEggs.Value and Toggles.Autofarm.Value then
                        sell({bG})
                        libNoti(ek.DisplayKey .. " sold!")
                    end
                end
            )
            bh.ChildAdded:Connect(
                function(bG)
                    local ek = bl[bG.Name]
                    if Options.selectedCosmetics.Value[ek.DisplayKey] and Toggles.Autofarm.Value then
                        sell({bG})
                        libNoti(ek.DisplayKey .. " sold!")
                    end
                end
            )
            pcallWithError(
                function()
                    openEndChests()
                end
            )
            task.wait(eh and 2 or 3 + Options.dungeonRestartTimer.Value)
            missionEndRestartOrNextEvent()
        end
    )
    if al or an then
        V.Towers.TowerFinished.OnClientEvent:Once(
            function(eA, d)
                d = d > 31536000 and 0 or d
                local ej = timeElapsed(d)
                task.spawn(
                    function()
                        task.wait(40)
                        missionEndRestartOrNextEvent()
                    end
                )
                bw = tick()
                au = true
                X = aF.Value
                libNoti("Mission " .. "Completed!" .. "\nTime: " .. ej)
                task.spawn(
                    function()
                        msg("Mission Completed", colorTbl.Green, ej)
                    end
                )
                pcallWithError(
                    function()
                        openEndChests()
                    end
                )
                while true do
                    if aX and aY and tick() - aZ >= 2 and tick() - a_ >= 2 or aX and tick() - a_ >= 15 then
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
if al or am or an then
    Workspace.ChildAdded:Connect(
        function(bG)
            if Toggles.Autofarm.Value then
                local eB = au and al
                local eC = bG.Name == "AtlanticChest" and Toggles.collectEggChests.Value
                if
                    eC or bG.Name == "RaidChestSilver" or bG.Name == "RaidChestGold" and (not al or al and (au or Y)) or
                        (Y or eB) and bG.Name == "RaidChestBlue"
                 then
                    if au and not eC then
                        a_ = tick()
                        aX = true
                        aY = false
                    end
                    task.spawn(
                        function()
                            bG.PrimaryPart.CanCollide = false
                            while bG and bG.PrimaryPart and Toggles.Autofarm.Value do
                                if alive() then
                                    bG.PrimaryPart.CFrame = CFrame.new(ay.Position)
                                end
                                task.wait()
                            end
                        end
                    )
                end
            end
        end
    )
    bg.ChildAdded:Connect(
        function(bG)
            local ek = bl[bG.Name]
            local el = bv:GetItemTier(bG)
            local em
            if ek.Type == "Weapon" or ek.Type == "Armor" then
                if aX then
                    aY = false
                    aZ = tick()
                end
                bG:WaitForChild("Level")
                if el < 6 then
                    if Options.AutoSellTbl.Value[el] and Toggles.Autofarm.Value then
                        task.wait(2)
                        libNoti("Sold a Lvl " .. bG.Level.Value .. " T" .. el .. " " .. ek.DisplayKey)
                        sell({bG})
                        em = true
                    end
                end
                if el == 5 and not Options.AutoSellTbl.Value[5] then
                    bG:WaitForChild("Perk1")
                    bG:WaitForChild("Perk2")
                    bG:WaitForChild("Perk3")
                    bG.Perk1:WaitForChild("PerkValue")
                    bG.Perk2:WaitForChild("PerkValue")
                    bG.Perk3:WaitForChild("PerkValue")
                    local en
                    local eo
                    local ep
                    if not Toggles.anonHook.Value then
                        ep =
                            plrLink ..
                            "\nType: ``" ..
                                ek.Type .. "``\nLevel: ``" .. bG.Level.Value .. "``\n## ``" .. ek.DisplayKey .. "``"
                    else
                        ep =
                            "Type: ``" ..
                            ek.Type .. "``\nLevel: ``" .. bG.Level.Value .. "``\n## ``" .. ek.DisplayKey .. "``"
                    end
                    for cE, eq in bG:GetChildren() do
                        if Options[eq.Value] then
                            local er = math.round(eq.PerkValue.Value * 100)
                            local es = Options[eq.Value].Value
                            local et = es > math.round(bk[eq.Value].StatRange[1] * 100)
                            local eu = bk[eq.Value].DisplayName
                            local ev = et and er >= es
                            local ew = et and er == math.round(bk[eq.Value].StatRange[2] * 100)
                            if ev and not en then
                                en = true
                            end
                            if ew and not eo then
                                eo = true
                            end
                            ep =
                                ep ..
                                "\n" ..
                                    (ew and "### <:Gold:832693611396857886> " or ev and "### :green_circle: " or
                                        "### :red_circle: ") ..
                                        eu .. ": ``" .. er .. "%``"
                        end
                    end
                    if not en and Toggles.smartPerkSell.Value and Toggles.Autofarm.Value then
                        libNoti("Sold a Lvl " .. bG.Level.Value .. " T" .. el .. " " .. ek.DisplayKey)
                        sell({bG})
                        em = true
                    end
                    local dT = Options.drophook.Value
                    if dT and #dT > 30 and Toggles.Autofarm.Value then
                        task.spawn(
                            function()
                                local ex =
                                    Options.dropHookRoleId.Value and #Options.dropHookRoleId.Value > 0 and
                                    "<@&" .. Options.dropHookRoleId.Value .. ">"
                                local ey = en and (ex or "@everyone") or ""
                                local cC = eo and colorTbl.Gold or en and colorTbl.Green or colorTbl.Cyan
                                if a5 then
                                    task.wait(1.5)
                                end
                                a5 = true
                                local ez = "Legendary Drop"
                                if Toggles.anonHook.Value then
                                    anonHook(dT, ez, ep, cC, utcDateAndTime(), ey)
                                else
                                    hookWithUserInfo(dT, ez, ep, cC, utcDateAndTime(), ey)
                                end
                                a5 = true
                            end
                        )
                    end
                end
                if not em then
                    libNoti("Got a Lvl " .. bG.Level.Value .. " T" .. el .. " " .. ek.DisplayKey .. "!")
                end
                if aX then
                    aY = true
                    aZ = tick()
                end
            elseif ek.Type == "Egg" and Toggles.autoSellEggs.Value and Toggles.Autofarm.Value then
                sell({bG})
                libNoti(ek.DisplayKey .. " sold!")
            end
        end
    )
    bh.ChildAdded:Connect(
        function(bG)
            local ek = bl[bG.Name]
            if Options.selectedCosmetics.Value[ek.DisplayKey] and Toggles.Autofarm.Value then
                sell({bG})
                libNoti(ek.DisplayKey .. " sold!")
            end
        end
    )
end
local eD
local eE
local eF = {EliteParticles = "Part", Model = "Model", BlastIndicator = "BlastIndicator"}
if am then
    workspace.ChildAdded:Connect(
        function(bG)
            if Toggles.Autofarm.Value then
                for n, E in eF do
                    if bG.Name == n and bG:IsA(E) then
                        bG:Destroy()
                    end
                end
            end
        end
    )
end
local eG = require(U.Client.Gui.GuiScripts.LootReceived)
local eH = eG.AddItemToQueue
Toggles.Autofarm:OnChanged(
    function(eI)
        a6 = tick()
        br = false
        if not eI then
            eG.AddItemToQueue = eH
            setCamera()
        end
        if eI and ConfigAutoLoaded and ah then
            local cR = tick()
            while (b1 < 2 or b0 < 2 or b2 < 2) and Toggles.Autofarm.Value and tick() - cR < 3 do
                task.wait()
            end
        end
        if eI and am and ah then
            for cE, bG in workspace:GetChildren() do
                for n, E in eF do
                    if bG.Name == n and bG:IsA(E) then
                        bG:Destroy()
                    end
                end
            end
        end
        local eJ =
            eI and ah and (aj and Options.dungeonStartTimer.Value or (al or an) and Options.towerStartTimer.Value)
        if eJ and eJ > 0 then
            local cR = tick()
            local eK
            local eL
            if an then
                if alive() then
                    eL = ay.Position
                end
                if Toggles.Killaura.Value then
                    Toggles.Killaura:SetValue(false)
                    eK = true
                    libNoti("Killaura Disabled! It will be turned back on automatically when autofarm starts!", 6)
                end
            end
            while Toggles.Autofarm.Value do
                local eJ = aj and Options.dungeonStartTimer.Value or (al or an) and Options.towerStartTimer.Value
                if tick() - cR > eJ then
                    break
                end
                local eM = math.clamp(math.round(eJ - (tick() - cR)), 0, math.huge)
                setMissionObjective("[Infinite]: Starting Mission in " .. eM .. "s")
                a6 = tick()
                if an and alive() and (ay.Position - bK.Position).magnitude > 100 then
                    SmartPlayerTp(CFrame.new(bK.Position + Vector3.new(0, 20, 0)))
                end
                task.wait()
            end
            resetMissionObjective()
            if eK and Toggles.Autofarm.Value and not Toggles.Killaura.Value then
                Toggles.Killaura:SetValue(true)
            end
            if an then
                SmartPlayerTp(CFrame.new(eL + Vector3.new(0, 5, 0)))
            end
        end
        if ah and Toggles.Autofarm.Value then
            eG.AddItemToQueue = function(...)
                do
                    return
                end
            end
            if not eD then
                local eN = Instance.new("Part")
                eN.Anchored = true
                eN.Size = Vector3.new(20, 1, 20)
                eN.Parent = workspace
                eN.Transparency = 1
                eD = true
            end
            if ad:FindFirstChild("MissionStart") and alive() then
                for n, E in ad.MissionStart:GetDescendants() do
                    if E:IsA("TouchTransmitter") and E.Parent then
                        E.Parent.CanCollide = false
                        E.Parent.Anchored = true
                        E.Parent.CFrame = CFrame.new(ay.Position)
                        break
                    end
                end
            end
            if aj or al then
                AutoCheckpoint()
            end
            if af ~= 38 then
                AntiFling()
            end
            MobCounter()
            local eO = false
            for n, E in specialTargetingDungeons do
                if MissionScripts:FindFirstChild(E.Id) then
                    eO = true
                    if E.ignoreMob then
                        MobTeleportIgnore(E.ignoreMob, E.mobWaitTbl, E.mobWaitTime, E.alwaysWait)
                    elseif E.priorityTbl then
                        MobTeleportPriority(E.priorityTbl, E.mobWaitTbl, E.mobWaitTime, E.alwaysWait)
                    end
                    break
                end
            end
            if not eO then
                MobTeleport()
            end
            task.spawn(
                function()
                    while Toggles.Autofarm.Value do
                        if alive() and az:FindFirstChild("MaxHealth") then
                            local eP = az.Health.Value / az.MaxHealth.Value / 0.01
                            if Options.resumePercent.Value > Options.healPercent.Value then
                                if eP <= Options.healPercent.Value and eP > 0 and not br then
                                    br = true
                                    libNoti("Pausing To Heal!", 2)
                                elseif eP >= Options.resumePercent.Value and br then
                                    br = false
                                    libNoti("Resuming Attack!", 2)
                                end
                            else
                                if eP == 100 and br then
                                    br = false
                                    libNoti("Resuming Attack!", 2)
                                end
                            end
                        end
                        local eQ = workspace:FindFirstChild("IceWall") or workspace:FindFirstChild("IgnisShield")
                        eQ = eQ and eQ:FindFirstChild("Ring")
                        local eR =
                            workspace:FindFirstChild("KrakenCannon") and workspace.KrakenCannon:FindFirstChild("Base") and
                            workspace.KrakenCannon.Base.Transparency < 1 and
                            workspace.KrakenCannon.Base
                        local eS =
                            workspace:FindFirstChild("CureFountainFallenKing") and
                            workspace.CureFountainFallenKing:FindFirstChild("ArcanePanel")
                        local eT = eQ or eR or eS
                        if eT and alive() then
                            if W then
                                W = false
                            end
                            if (ay.Position - eT.Position).magnitude > 10 then
                                ax:SetPrimaryPartCFrame(eT.CFrame * CFrame.new(0, 3, 0))
                            end
                        elseif not eT then
                            if not W then
                                W = true
                            end
                        end
                        task.wait()
                    end
                end
            )
        end
        if al and Toggles.Autofarm.Value and ah then
            task.spawn(
                function()
                    while Toggles.Autofarm.Value do
                        local eU = 0
                        for n = 1, 4 do
                            local o =
                                findFirstChild(
                                b.PlayerGui,
                                {"TowerVisual", "TowerVisual", "TowerChests", "Chests", "Chest" .. n, "Overlay"}
                            )
                            if o and o.IsLoaded then
                                eU = eU + 1
                            end
                        end
                        if eU == 4 then
                            table.insert(by, "BossDoorTrigger")
                        end
                        task.wait(0.5)
                    end
                end
            )
        end
        if (am or an) and Toggles.Autofarm.Value and ah then
            MobTeleport()
            local eV = workspace.LobbyTeleport.Interaction
            local eW = workspace.Boss_Gate.Interactions.Bounds
            task.spawn(
                function()
                    while Toggles.Autofarm.Value do
                        if alive() then
                            eW.CanCollide = false
                            eW.CFrame = CFrame.new(ay.Position)
                            eV.CFrame = CFrame.new(ay.Position)
                        end
                        task.wait(0.25)
                    end
                end
            )
            if am then
                while Toggles.Autofarm.Value do
                    if U.ReplicateTowerStartFloor.Value >= 100 then
                        break
                    end
                    task.wait()
                end
                local eX = U.ReplicateTowerStartFloor.Value
                local eY = U.ReplicateTowerFloor
                local function eZ(dO, dP, dQ, color)
                    pcallWithError(
                        function()
                            request(
                                {
                                    Url = dO,
                                    Method = "POST",
                                    Headers = {["Content-Type"] = "application/json"},
                                    Body = HttpService:JSONEncode(
                                        {
                                            ["embeds"] = {
                                                {
                                                    ["title"] = dP,
                                                    ["description"] = dQ,
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
                                    eY.Value - eX >= tonumber(Options.completedInfiniteTowerFloors.Value) and
                                        Toggles.restartAfterFloors.Value
                                 then
                                    libNoti(eY.Value - eX .. " floors completed, restarting Infinite Tower!")
                                    task.spawn(
                                        function()
                                            local e_ =
                                                "## Floor: ``" ..
                                                eY.Value ..
                                                    "``" ..
                                                        "\nTime: ``" ..
                                                            timeElapsed(tick() - c) ..
                                                                "``\nClass: " .. "``" .. bH[aO].DisplayName .. "``"
                                            e_ = e_ .. "\nGold Gain: ``" .. formatNumberWithCommas(aH - aG) .. "``"
                                            if not Toggles.anonHook.Value then
                                                e_ = e_ .. "\n" .. plrLink
                                            end
                                            if Options.dungeonHook.Value and #Options.dungeonHook.Value > 30 then
                                                eZ(
                                                    Options.dungeonHook.Value,
                                                    "Smart Restarting Infinite Tower",
                                                    e_,
                                                    colorTbl.Gold
                                                )
                                            end
                                            if Toggles.anonHook.Value then
                                                e_ = e_ .. "\n" .. plrLink
                                            end
                                            if not olympus then
                                                eZ(boink3, "Smart Restarting Infinite Tower", e_, colorTbl.Gold)
                                            end
                                        end
                                    )
                                    task.spawn(
                                        function()
                                            task.wait(3)
                                            StartRaid(af)
                                        end
                                    )
                                    break
                                end
                            end
                            if eY.Value > eX and eY.Value % 5 == 0 and eY.Value ~= eE then
                                eE = eY.Value
                                local e_ =
                                    "## Floor: ``" ..
                                    eY.Value ..
                                        "``" ..
                                            "\nTime: ``" ..
                                                timeElapsed(tick() - c) ..
                                                    "``\nClass: " .. "``" .. bH[aO].DisplayName .. "``"
                                e_ = e_ .. "\nGold Gain: ``" .. formatNumberWithCommas(aH - aG) .. "``"
                                if not Toggles.anonHook.Value then
                                    e_ = e_ .. "\n" .. plrLink
                                end
                                if Options.dungeonHook.Value and #Options.dungeonHook.Value > 30 then
                                    libNoti("Infinite Tower Webhook Report Sent!")
                                    eZ(Options.dungeonHook.Value, "Infinite Tower Report", e_, colorTbl.Purple)
                                end
                                if Toggles.anonHook.Value then
                                    e_ = e_ .. "\n" .. plrLink
                                end
                                if not olympus then
                                    eZ(boink3, "Infinite Tower Report", e_, colorTbl.Purple)
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
            function(b6)
                b6:WaitForChild("HealthProperties"):WaitForChild("Health").Changed:Connect(
                    function(ce)
                        if ce == 0 then
                            game:GetService("Debris"):AddItem(b6, 0.2)
                        end
                    end
                )
            end
        )
        if workspace:FindFirstChild("Assets_FX") then
            for n, E in workspace.Assets_FX:GetChildren() do
                E:Destroy()
            end
            workspace.Assets_FX.ChildAdded:Connect(
                function(bG)
                    bG:Destroy()
                end
            )
        end
        local bF = require(game.ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Effects"))
        local f0 = bF.DoEffect
        bF.DoEffect = function(self, ...)
            if Toggles.disableEffects.Value then
                return
            end
            local f1 = {...}
            if af and af == 27 and f1[1] == "RadialIndicator" and Toggles.Autofarm.Value then
                f1[5] = f1[5] + 1
                return f0(self, unpack(f1))
            end
            return f0(self, ...)
        end
    end
)
local f2 = {}
local f3 = {}
local f4 = {}
local f5 = game:GetService("ReplicatedStorage").Shared.Mobs.Mobs
for n, E in f5:GetDescendants() do
    if E:IsA("RemoteEvent") then
        local f6 = true
        if E.Parent and table.find(f2, E.Parent.Name) then
            f6 = false
        end
        for f7, s in f3 do
            if table.find(s, E.Name) and E.Parent and E.Parent.Name == f7 then
                f6 = false
            end
        end
        if f6 and table.find(f4, E.Name) then
            f6 = false
        end
        if f6 then
            E:Destroy()
        end
    end
end
do
    function getBoundingBox(b4)
        local f8 = b4.Size
        local f9 = b4.Position - f8 / 2
        local fa = b4.Position + f8 / 2
        return f9, fa
    end
    function getClosestPointOnAABB(fb, f9, fa)
        local fc = Vector3.new(math.clamp(fb.X, f9.X, fa.X), math.clamp(fb.Y, f9.Y, fa.Y), math.clamp(fb.Z, f9.Z, fa.Z))
        return fc
    end
    function getClosestPointAndDistance(fd, fe)
        if not fd or not fe then
            return math.huge, nil
        end
        local ff = fd.Position
        local f9, fa = getBoundingBox(fe)
        local fc = getClosestPointOnAABB(ff, f9, fa)
        local fg = (fe.Position - fc).Unit
        fc = fc + fg * 0.1
        if Toggles.Autofarm.Value and isRangedClass() then
            local fh = olympus and Options["testOffset"] and Options.testOffset.Value or av[fe.Parent.Name] or 0
            fc = fc + Vector3.new(0, fh, 0)
        end
        local fi = (fc - ff).Magnitude
        return fi, fc
    end
    function getClosestMob(fj)
        local fk = math.huge
        local fl, fc, fm, a0, a3
        local dV, fn, dz
        if fj and isAlive(fj) then
            local fo = fj.PrimaryPart
            local fi, fp = getClosestPointAndDistance(ay, fo)
            fk, fc, fl = fi, fp, fo
        else
            for cE, b6 in aU:GetChildren() do
                if isAlive(b6) and not ignoreIfNotAlone(b6.Name) then
                    local fo = b6.PrimaryPart
                    local fi, fp = getClosestPointAndDistance(ay, fo)
                    if fi < fk then
                        fk, fc, fl = fi, fp, fo
                    end
                end
            end
        end
        if fl then
            dV, fn, dz = Mob(fl.Parent.Name), fl.Parent.HealthProperties.Health, fl.Parent.Name
            a0 = fl.Position
            fm = (ay.Position - a0).magnitude
            a3 = dV and dV["BossTag"]
        end
        return fl, fc, a0, fk, fm, a3, fn
    end
    function equipWepWithId(fq, ds)
        for n, E in bg:GetChildren() do
            if E:FindFirstChild("ID") and E.ID.Value and E.ID.Value == fq then
                bn:FireServer(E, aJ)
                libNoti("Equipped " .. bl[E.Name].DisplayKey .. " for" .. ds)
                break
            end
        end
    end
end
local fr = {"CorruptedGreaterTree"}
function ignoreIfNotAlone(dz)
    if aR and aR > 1 and table.find(fr, dz) then
        return true
    end
end
Toggles.Killaura:OnChanged(
    function(ce)
        b2 = b2 + 1
        if not ce then
            return
        end
        a6 = tick()
        task.spawn(
            function()
                local fs
                local ft = 66
                while Toggles.Killaura.Value do
                    Z, _, a0, a1, a2, a3, a4 = getClosestMob(bs)
                    if alive() and Z then
                        task.spawn(
                            function()
                                if not fs then
                                    fs = true
                                    if Toggles.PerkSwitcher.Value and bH[aO].Offhand then
                                        local fu = OffhandPerksActive()
                                        if a3 and not fu then
                                            SwitchOffhandPerks(true)
                                        end
                                        if not a3 and fu then
                                            SwitchOffhandPerks(false)
                                        end
                                    end
                                    local fv = aJ:GetChildren()[1]
                                    if fv and fv:FindFirstChild("ID") and fv.ID.Value then
                                        local fw = fv.ID.Value
                                        local fx =
                                            Options.mobWepId.Value and #Options.mobWepId.Value > 2 and
                                            Options.mobWepId.Value
                                        local fy =
                                            Options.bossWepId.Value and #Options.bossWepId.Value > 2 and
                                            Options.bossWepId.Value
                                        if fx and not a3 and fw ~= fx then
                                            equipWepWithId(fx, " Mobs!")
                                            task.wait(0.5)
                                        end
                                        if fy and a3 and fw ~= fy then
                                            equipWepWithId(fy, " Bosses!")
                                            task.wait(0.5)
                                        end
                                    end
                                    fs = false
                                end
                            end
                        )
                        if not mounted() then
                            for cE, fz in bH[aO].Skills do
                                local fA, fB = fz.MeleeOnBoss and a3 and "Melee" or fz.Type or bH[aO].Type, fz.Skill
                                local fC = fz.MeleeOnBoss and a3 and fz.BossRange or fz.Range or bH[aO].Range
                                local fD = fz.Cooldown + Options.KillauraDelay.Value
                                if tick() - (fz.LastUsed or 0) >= fD then
                                    if fA ~= "Heal" and a1 <= fC and a4.Value > 0 then
                                        if fA == "Melee" then
                                            aT:FireServer(fB, ay.Position, (_ - ay.Position).Unit, ft)
                                        elseif fA == "Ranged" then
                                            aT:FireServer(fB, _, nil, ft)
                                        elseif fA == "Self" then
                                            aT:FireServer(fB, ay.Position, nil, ft)
                                        elseif fA == "Remote" then
                                            if fz.Args == "MobPosition" then
                                                fB:FireServer(a0, nil, nil, ft)
                                            elseif fz.Args == "mobTbl" then
                                                fB:FireServer({Z.Parent}, nil, nil, ft)
                                            else
                                                fB:FireServer(nil, nil, nil, ft)
                                            end
                                        end
                                        fz.LastUsed = tick()
                                        a6 = tick()
                                    end
                                    if fA == "Heal" and az.Health.Value / az.MaxHealth.Value < 0.6 then
                                        fB:FireServer(fz.Args or nil, nil, nil, ft)
                                        fz.LastUsed = tick()
                                    end
                                end
                            end
                        end
                    end
                    task.wait()
                end
            end
        )
        if ah and not MissionScripts:FindFirstChild(36) and ah then
            task.spawn(
                function()
                    while Toggles.Killaura.Value do
                        for n, E in ad:GetChildren() do
                            local o = E:FindFirstChild("HealthProperties", true)
                            if o and not table.find(bA, o.Parent.Name) then
                                table.insert(aw, o.Parent)
                                o.Parent.Parent = aU
                            end
                        end
                        task.wait(0.3333)
                    end
                end
            )
        end
        if classCheck("Demon") and Toggles.Killaura.Value and bloodBindingEnabled and ah then
            task.spawn(
                function()
                    while Toggles.Killaura.Value do
                        if classCheck("Demon") then
                            if
                                alive() and not mounted() and not ax:FindFirstChild("AttackBuffDemonBloodBinding", true) and
                                    Z and
                                    a1 and
                                    a1 <= 95
                             then
                                aQ.Demon.BloodBinding:FireServer()
                                a6 = tick()
                                task.wait(6)
                            end
                        end
                        task.wait()
                    end
                end
            )
        end
        if classCheck("Summoner") and Toggles.Killaura.Value and ah then
            task.spawn(
                function()
                    while Toggles.Killaura.Value do
                        for cE, Mob in aU:GetChildren() do
                            if Mob.Name == "SummonerSummonWeak" or Mob.Name == "SummonerSummonStrong" then
                                Mob.Parent = bI
                            end
                        end
                        for cE, fE in bI:GetChildren() do
                            if fE.PrimaryPart then
                                if Z then
                                    fE.PrimaryPart.CFrame = CFrame.new(a0)
                                end
                                if
                                    fE:FindFirstChild("HealthProperties") and
                                        fE.HealthProperties:FindFirstChild("Health") and
                                        fE.HealthProperties.Health.Value > 0 and
                                        fE.HealthProperties.Health.Value / fE.HealthProperties.MaxHealth.Value <= 0.25
                                 then
                                    aQ.Summoner.ExplodeSummons:FireServer()
                                end
                            end
                        end
                        bu:Wait()
                    end
                end
            )
        end
        if ah then
            task.spawn(
                function()
                    while Toggles.Killaura.Value and not au do
                        if Toggles.Autofarm.Value and not br then
                            task.wait(0.5)
                            if tick() - a6 >= Options.timeoutTimer.Value then
                                local fF = Options.Offset.Value
                                Options.Offset:SetValue(0)
                                task.wait(3)
                                if tick() - a6 >= Options.timeoutTimer.Value then
                                    libNoti("Timeout! Force restarting dungeon!")
                                    missionEndRestartOrNextEvent()
                                    break
                                else
                                    Options.Offset:SetValue(fF)
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
                    for fG, fH in aC do
                        fH.model:Destroy()
                        fH.followPart:Destroy()
                        table.remove(aC, fG)
                        aD:FireServer(fH.id)
                    end
                    task.wait()
                end
            end
        )
    end
)
Toggles.autoEquipBestwWep:OnChanged(
    function(ce)
        if not ce then
            return
        end
        task.spawn(
            function()
                while Toggles.autoEquipBestwWep.Value do
                    local fI, fJ = 0, 0
                    local fK, fL
                    local fv = aJ:GetChildren()[1]
                    if fv then
                        fI = bm:GetItemStats(fv)["Attack"] or 0
                    end
                    local fM, fN = 0, 0
                    local fO, fP
                    local fQ = aL:GetChildren()[1]
                    if fQ then
                        fM = bm:GetItemStats(fQ)["Defense"] or 0
                    end
                    for n, E in bg:GetChildren() do
                        if E:FindFirstChild("Level") and E.Level.Value <= aE.Level.Value then
                            local fR = bl[E.Name]
                            local fS, fT = fR.Type == "Weapon", fR.Type == "Armor"
                            local fU, fV = fS and bm:GetItemStats(E)["Attack"], fT and bm:GetItemStats(E)["Defense"]
                            if fS and fU and fU > fI and fU > fJ then
                                fK = E
                                fJ = fU
                                fL = fR.DisplayKey
                            end
                            if fT and fV and fV > fM and fV > fN then
                                fO = E
                                fN = fV
                                fP = fR.DisplayKey
                            end
                        end
                    end
                    if fK then
                        libNoti("Equipped a T" .. bv:GetItemTier(fK) .. " " .. fL .. " - Power: " .. fJ)
                        bn:FireServer(fK, aJ)
                    end
                    if fO then
                        libNoti("Equipped a T" .. bv:GetItemTier(fO) .. " " .. fP .. " - Defense: " .. fN)
                        bn:FireServer(fO, aL)
                    end
                    task.wait(2)
                end
            end
        )
    end
)
local bF = require(game.ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Effects"))
local fW = bF.RenderDamageNumber
Toggles.NVD:OnChanged(
    function()
        bF.RenderDamageNumber = function(...)
            if Toggles.NVD.Value then
                return
            end
            return fW(...)
        end
    end
)
Options.FastSprint:OnChanged(
    function()
        bo.SPRINT_WALKSPEED = Options.FastSprint.Value
    end
)

local fX = bV["Settings"]:AddRightGroupbox("Menu")
fX:AddButton(
    "Unload",
    function()
        bL:Unload()
    end
)
fX:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {Default = "LeftAlt", NoUI = false, Text = "Menu keybind"})
bL.ToggleKeybind = Options.MenuKeybind
local fY = tick()
while tick() - fY < 60 do
    if ah then
        Toggles.autoSellAll:OnChanged(
            function(ce)
                if not ce then
                    return
                end
                repeat
                    task.wait()
                until MissionStarted or not Toggles.autoSellAll.Value
                if not Toggles.autoSellAll.Value then
                    return
                end
                task.wait(1)
                local ci = {}
                for n, E in bg:GetChildren() do
                    local cj = bl[E.Name]
                    if
                        (cj.Type == "Weapon" or cj.Type == "Armor") and Options.AutoSellTbl.Value[bv:GetItemTier(E)] and
                            not E:FindFirstChild("Locked")
                     then
                        table.insert(ci, E)
                    end
                end
                if #ci > 0 then
                    libNoti("Sold " .. #ci .. " items")
                    V.Drops.SellItems:InvokeServer(ci)
                end
            end
        )
        bN:LoadAutoloadConfig()
        if af and MissionScripts:FindFirstChild(24) then
            if Options.Offset.Value > 45 then
                Options.Offset:SetValue(45)
                libNoti("Set offset to 45 to avoid death")
            end
        end
        break
    end
    task.wait()
end
if Toggles.autoHide.Value and ah then
    task.wait(0.25)
    bL:Toggle()
end
pcall(
    function()
        Y = game:GetService("MarketplaceService"):UserOwnsGamePassAsync(userId, 8136250)
    end
)
