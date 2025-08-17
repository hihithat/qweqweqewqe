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

if Infinite then
    return
end
getgenv().Infinite = true
if not game:IsLoaded() then
    game.Loaded:Wait()
end
if game.GameId ~= 985731078 then
    return
end
local queue_on_teleport = syn and syn.queue_on_teleport or fluxus and fluxus.queue_on_teleport or queue_on_teleport
if queue_on_teleport then
    queue_on_teleport(
        [[
        if isfile('Infinite/World Zero/autoexec') and readfile('Infinite/World Zero/autoexec') == 'true' then
            loadstring(game:HttpGet('https://raw.githubusercontent.com/infinitekill/WorldZero/main/Infinite'))()
        end
    ]]
    )
end
local a = game:GetService("Players")
local b = a.LocalPlayer or a:GetPropertyChangedSignal("LocalPlayer"):Wait() or a.LocalPlayer
getgenv().userId = b.UserId
getgenv().HttpService = game:GetService("HttpService")
getgenv().nameStr = b.DisplayName == b.Name and b.Name or b.DisplayName .. " (@" .. b.Name .. ")"
getgenv().plrLink =
    "User: [" .. nameStr .. " - " .. userId .. "](https://www.roblox.com/users/" .. userId .. "/profile)"
local c
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
    KickTimestamp = 0,
    Dungeon = false,
    Difficulty = false,
    DungeonTimestamp = 0,
    RejoinLastDungeon = false,
    CameFromMenu = false,
    RejoinLastDungeonThreshold = 1800,
    Gold = false,
    LastDungeonCompletion = false,
    CrossSessionTimestamp = false,
    CrossSessionGold = false,
    ForceRestartLastTower = false
}
local a8 = a7
KickFilename = "Infinite/World Zero/" .. userId .. "_Data.txt"
function save()
    local a9 = HttpService:JSONEncode(a7)
    writefile(KickFilename, a9)
end
function load()
    if isfile(KickFilename) then
        a7 = HttpService:JSONDecode(readfile(KickFilename))
    else
        save()
    end
end
if game.PlaceId == 2727067538 then
    load()
    if a7.Kicked or a7.RejoinLastDungeon and tick() - a7.DungeonTimestamp <= a7.RejoinLastDungeonThreshold then
        a7.CameFromMenu = true
        save()
        local aa =
            require(
            b:WaitForChild("PlayerScripts"):WaitForChild("LocalScript"):WaitForChild("Guis"):WaitForChild(
                "CharacterPicker"
            )
        )
        local ab = aa:GetSelectedProfile()
        while not ab do
            task.wait()
            ab = aa:GetSelectedProfile()
        end
        local ac = ab.GUID.Value
        local ad = V:WaitForChild("Teleport"):WaitForChild("JoinGame")
        ad:FireServer(ac)
    end
    return
end
getgenv().DungeonData = {
    {Id = 1, Name = "Crabby Crusade", World = 1, Type = "Dungeon", Code = "1-1", PlaceId = 2978696440},
    {Id = 49, Name = "Crabby Crusade", World = 1, Type = "Dungeon", Code = "1-1", PlaceId = 107701891477606},
    {Id = 3, Name = "Scarecrow Defense", World = 1, Type = "Dungeon", Code = "1-2", PlaceId = 4310476380},
    {Id = 2, Name = "Dire Problem", World = 1, Type = "Dungeon", Code = "1-3", PlaceId = 4310464656},
    {Id = 4, Name = "Kingslayer", World = 1, Type = "Dungeon", Code = "1-4", PlaceId = 4310478830},
    {Id = 6, Name = "Gravetower Dungeon", World = 1, Type = "Dungeon", Code = "1-5", PlaceId = 3383444582},
    {Id = 11, Name = "Temple of Ruin", World = 2, Type = "Dungeon", Code = "2-1", PlaceId = 3885726701},
    {Id = 12, Name = "Mama Trauma", World = 2, Type = "Dungeon", Code = "2-2", PlaceId = 3994953548},
    {Id = 13, Name = "Volcano's Shadow", World = 2, Type = "Dungeon", Code = "2-3", PlaceId = 4050468028},
    {Id = 7, Name = "Volcano Dungeon", World = 2, Type = "Dungeon", Code = "2-4", PlaceId = 3165900886},
    {Id = 14, Name = "Mountain Pass", World = 3, Type = "Dungeon", Code = "3-1", PlaceId = 4465988196},
    {Id = 15, Name = "Winter Cavern", World = 3, Type = "Dungeon", Code = "3-2", PlaceId = 4465989351},
    {Id = 16, Name = "Winter Dungeon", World = 3, Type = "Dungeon", Code = "3-3", PlaceId = 4465989998},
    {Id = 20, Name = "Scrap Canyon", World = 4, Type = "Dungeon", Code = "4-1", PlaceId = 4646473427},
    {Id = 19, Name = "Deserted Burrowmine", World = 4, Type = "Dungeon", Code = "4-2", PlaceId = 4646475342},
    {Id = 18, Name = "Pyramid Dungeon", World = 4, Type = "Dungeon", Code = "4-3", PlaceId = 4646475570},
    {Id = 24, Name = "Konoh Heartlands", World = 5, Type = "Dungeon", Code = "5-1", PlaceId = 6386112652},
    {Id = 35, Name = "Konoh Inferno", World = 5, Type = "Dungeon", Code = "5-2", PlaceId = 11466514043},
    {Id = 21, Name = "Prison Tower", World = 5, Type = "Tower", Code = "Tower 1", PlaceId = 5703353651},
    {Id = 25, Name = "Rough Waters", World = 6, Type = "Dungeon", Code = "6-1", PlaceId = 6510862058},
    {Id = 36, Name = "Treasure Hunt", World = 6, Type = "Dungeon", Code = "6-2", PlaceId = 11533444995},
    {Id = 23, Name = "Atlantis Tower", World = 6, Type = "Tower", Code = "Tower 2", PlaceId = 6075085184},
    {Id = 26, Name = "The Underworld", World = 7, Type = "Dungeon", Code = "7-1", PlaceId = 6847034886},
    {Id = 37, Name = "The Labyrinth", World = 7, Type = "Dungeon", Code = "7-2", PlaceId = 11644048314},
    {Id = 27, Name = "Mezuvian Tower", World = 7, Type = "Tower", Code = "Tower 3", PlaceId = 7071564842},
    {Id = 30, Name = "Rescue in the Ruins", World = 8, Type = "Dungeon", Code = "8-1", PlaceId = 9944263348},
    {Id = 31, Name = "Ruin Rush", World = 8, Type = "Dungeon", Code = "8-2", PlaceId = 10014664329},
    {Id = 29, Name = "Oasis Tower", World = 8, Type = "Tower", Code = "Tower 4", PlaceId = 10089970465},
    {Id = 32, Name = "Treetop Trouble", World = 9, Type = "Dungeon", Code = "9-1", PlaceId = 10651527284},
    {Id = 33, Name = "Aether Fortress", World = 9, Type = "Dungeon", Code = "9-2", PlaceId = 10727165164},
    {Id = 34, Name = "Aether Tower", World = 9, Type = "Tower", Code = "Tower 5", PlaceId = 10795158121},
    {Id = 41, Name = "Crystal Chaos", World = 10, Type = "Dungeon", Code = "10-1", PlaceId = 14914700740},
    {Id = 42, Name = "Astral Academy", World = 10, Type = "Dungeon", Code = "10-2", PlaceId = 14914855930},
    {Id = 43, Name = "Arcane Tower", World = 10, Type = "Tower", Code = "Tower 6", PlaceId = 15121292578},
    {Id = 38, Name = "Infinite Tower", Type = "Special", Special = true, Code = "Special", PlaceId = 13988110964},
    {Id = 39, Name = "Celestial Tower", Type = "Special", Special = true, Code = "Special", PlaceId = 14400549310},
    {
        Id = 22,
        Name = "The Fallen Throne",
        Type = "Raid",
        World = "Spooky Courtyard",
        Special = true,
        Code = "Halloween",
        PlaceId = 5862277651
    },
    {
        Id = 17,
        Name = "North Pole",
        Type = "Raid",
        World = "Holiday Village",
        Special = true,
        Code = "Christmas",
        PlaceId = 4526768588
    },
    {
        Id = 44,
        Name = "Vane's Lair",
        Type = "Raid",
        World = "Dragon Town",
        Special = true,
        Code = "Event",
        PlaceId = 18567068844
    },
    {
        Id = 45,
        Name = "The Depths",
        Type = "Raid",
        World = "Kraken Cove",
        Special = true,
        Code = "Event",
        PlaceId = 75540798045662
    },
    {Id = 46, Name = "Cradle of Hearts", Type = "Raid", Special = true, Code = "Event", PlaceId = 81373988789544},
    {Id = 47, Name = "Gravetower's Past", Type = "Raid", Special = true, Code = "Event", PlaceId = 102111805987017},
    {Id = 48, Name = "Veil's Domain", Type = "Raid", Special = true, Code = "Event", PlaceId = 138178936582742},
    {Id = 50, Name = "Alien Invasion", Type = "Raid", Special = true, Code = "Event", PlaceId = 109614960834199},
    {Id = 51, Name = "Graffiti Beach", Type = "Raid", Special = true, Code = "Event", PlaceId = 111271980458581},
    {Id = 40, Name = "Daily Dungeon", Type = "Dungeon", Special = true, Code = "I dont know", PlaceId = "N/A"}
}
local ae
local af, ag, ah, ai
getgenv().Towers = {21, 23, 27, 29, 34, 43}
getgenv().Nightmares = {1005, 1006, 1007}
getgenv().Raids = {22, 17, 44, 45, 46, 47, 48, 50, 51}
getgenv().NoDifficultyMissions = {21, 23, 27, 29, 34, 43, 38, 39}
for aj, ak in DungeonData do
    if game.PlaceId == ak.PlaceId then
        ai = true
    end
end
local al = {5862275930, 4526768266}
local am, an, ao, ap, aq, ar
local as
local at = {
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
local au = {}
local av = b.Character or b.CharacterAdded:Wait() or b.Character
local aw
while task.wait() do
    aw = av.PrimaryPart
    if aw then
        break
    end
end
local ax, ay
b.CharacterAdded:Connect(
    function(az)
        av = az
        while task.wait() do
            aw = av.PrimaryPart
            if aw then
                break
            end
        end
        ax = av:WaitForChild("HealthProperties")
        ay = av:WaitForChild("Equipment")
    end
)
while task.wait() do
    ax = b.Character and b.Character:FindFirstChild("HealthProperties")
    ay = b.Character and b.Character:FindFirstChild("Equipment")
    if ax and ay then
        break
    end
end
local aA = getupvalue(require(V.Drops).Start, 4)
local aB = V:WaitForChild("Drops"):WaitForChild("CoinEvent")
local aC = b:WaitForChild("PlayerGui"):WaitForChild("Profile")
local aD = aC:WaitForChild("Currency"):WaitForChild("Gold")
local aE = aD.Value
local aF = aE
local aG = U:WaitForChild("PlayerEquips"):WaitForChild(b.Name)
local aH = aG:WaitForChild("Primary")
local aI = aG:WaitForChild("Offhand")
local aJ = aG:WaitForChild("Armor")
local aK = V:WaitForChild("ItemUpgrade"):WaitForChild("Upgrade")
local aL = aC:WaitForChild("Class")
local aM = aL.Value
function classCheck(aN)
    return aM == aN
end
aL:GetPropertyChangedSignal("Value"):Connect(
    function()
        aM = aL.Value
    end
)
ay = av.Equipment
local aO = V:WaitForChild("Combat"):WaitForChild("Skillsets")
local aP = 0
local aQ
local aR = V:WaitForChild("Combat"):WaitForChild("Attack")
local aS = game:GetService("Workspace"):FindFirstChild("Mobs")
local aT = V.Mobs.Mobs
local aU = workspace.Camera
local aV
local aW
local aX = tick()
local aY = tick()
local aZ = 0
local a_ = 0
local b0 = 0
local b1 = Instance.new("Part")
b1.Position = Vector3.zero
b1.Anchored = true
b1.Transparency = 1
b1.CanCollide = false
b1.Name = "InfiniteCameraPart"
b1.Parent = workspace
do
    function noclip()
        if aw and aw.CanCollide then
            aw.CanCollide = false
        end
    end
    function unnoclip()
        if aw and not aw.CanCollide then
            aw.CanCollide = true
        end
    end
    function setCamera(b2)
        local b3 = b2 or aw and (aw:FindFirstChild("Part") or aw)
        if b3 and aU.CameraSubject ~= b3 then
            aU.CameraSubject = b3
        end
    end
    function alive()
        return av and aw and ax and ax:FindFirstChild("Health") and ax.Health.Value > 0
    end
    function mounted()
        return av and av:FindFirstChild("Properties") and av.Properties:GetAttribute("Mounted")
    end
    function isAlive(b4)
        return b4 and b4.PrimaryPart and b4:FindFirstChild("HealthProperties") and
            b4.HealthProperties:FindFirstChild("Health") and
            b4.HealthProperties.Health.Value > 0
    end
    function Mob(r)
        if aT:FindFirstChild(r) then
            return require(aT[r])
        end
    end
    function SwitchOffhandPerks(r)
        V.Settings.OffhandPerksActive:FireServer(r)
    end
    function timeElapsed(E)
        local b5 = math.floor(E / 3600)
        local b6 = math.floor(E % 3600 / 60)
        local b7 = math.floor(E % 60)
        if b5 > 0 then
            return b5 .. "h " .. b6 .. "m " .. b7 .. "s"
        end
        if b6 > 0 and b5 == 0 then
            return b6 .. "m " .. b7 .. "s"
        end
        if b5 == 0 and b6 == 0 then
            return b7 .. "s"
        end
    end
    function ping()
        return math.round(b:GetNetworkPing() * 1000) .. " ms"
    end
    function ping2()
        return math.round(game.Stats.PerformanceStats.Ping:GetValue()) .. " ms"
    end
    function nextInTbl(b8, b9)
        return b8[table.find(b8, b9) + 1] or b8[1]
    end
    function formatNumberWithCommas(ba)
        local bb = tostring(ba)
        local bc
        repeat
            bb, bc = string.gsub(bb, "^(-?%d+)(%d%d%d)", "%1,%2")
        until bc == 0
        return bb
    end
    function getServerGuilds()
        local C = game:GetService("TextChatService"):WaitForChild("TextChannels")
        local b8 = {}
        for n, E in C:GetChildren() do
            if #E.Name < 6 and #E:GetChildren() > 0 then
                table.insert(b8, E.Name)
            end
        end
        table.sort(b8)
        return b8
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
function done2(bd)
    return loadstring(game:HttpGet(bd))()
end
local be = aC:WaitForChild("Inventory"):WaitForChild("Items")
local bf = aC:WaitForChild("Inventory"):WaitForChild("Cosmetics")
local bg = require(V.Missions.MissionData)
function missionLevelReq(bh)
    return bg[bh].LevelRequirement
end
local bi = require(V.Gear.GearPerks)
local bj = require(V.Items)
local bk = require(V.Combat)
local bl = V.Inventory.EquipItem
local bm = require(V:WaitForChild("Settings"))
local bn = aC:WaitForChild("Settings")
local bo
local bp
local bq
local br
local bs = game:GetService("RunService").Heartbeat
function OffhandPerksActive()
    return bn:GetAttribute("OffhandPerksActive")
end
function StartRaid(r, s)
    V:WaitForChild("Teleport"):WaitForChild("StartRaid"):FireServer(r, s)
end
local bt = require(V.Inventory)
local bu = 0
if ai then
    ae = workspace:WaitForChild("MissionObjects")
    getgenv().MissionScripts = U:WaitForChild("MissionScripts")
    af = U:WaitForChild("ActiveMission").Value
    an = table.find(Towers, af)
    aq = table.find(Nightmares, af)
    ar = table.find(Raids, af)
    ao = af == 38
    ap = af == 39
    if aq then
        for n, E in MissionScripts:GetChildren() do
            if #E.Name < 4 then
                ag = tonumber(E.Name)
            end
        end
    else
        ag = af
    end
    am = not an and not ar and not ao and not ap
    ah = not table.find(NoDifficultyMissions, af) and V.Missions.GetDifficulty:InvokeServer()
    for aj, ak in DungeonData do
        if ak.Id == ag then
            getgenv().MissionName =
                (aq and "Nightmare " or "") .. ak.Name .. (ah == 1 and " Normal" or ah == 5 and " Challenge" or "")
            getgenv().MissionCode = ak.Code
        end
    end
end
load()
for n, E in a8 do
    if not a7[n] then
        a7[n] = E
    end
end
save()
if not ai then
    if
        a7.Dungeon and
            (a7.Kicked and tick() - a7.KickTimestamp < 120 and a7.CameFromMenu or
                a7.RejoinLastDungeon and tick() - a7.DungeonTimestamp <= a7.RejoinLastDungeonThreshold or
                table.find(Towers, a7.Dungeon) and a7.ForceRestartLastTower)
     then
        local bv = a7.Dungeon
        a7.Kicked = false
        a7.KickTimestamp = 0
        a7.CameFromMenu = false
        a7.Dungeon = false
        a7.DungeonTimestamp = 0
        save()
        local bw = V:WaitForChild("Teleport"):WaitForChild("StartRaid")
        while true do
            bw:FireServer(bv, not table.find(NoDifficultyMissions, bv) and a7.Difficulty or false)
            task.wait(2)
        end
    else
        a7.Kicked = false
        a7.KickTimestamp = 0
        a7.CameFromMenu = false
        a7.Dungeon = false
        a7.DungeonTimestamp = 0
        save()
    end
elseif ai then
    br = getPlrGuild()
    a7.Kicked = false
    a7.KickTimestamp = 0
    a7.Dungeon = af
    a7.Difficulty = ah
    a7.CameFromMenu = false
    a7.DungeonTimestamp = tick()
    save()
end
local bx = {
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
V.Missions.MissionStart.OnClientEvent:Once(
    function()
        getgenv().MissionStarted = true
    end
)
local by = {
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
local bz = {"Scarecrow1", "Scarecrow2", "Scarecrow3"}
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
    38
}
local bA = {[2] = 1, [12] = 1, [13] = 1, [20] = 1, [30] = 1}
function doDid(w)
    local bB = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    w = w:gsub("[^" .. bB .. "=]", "")
    return w:gsub(
        ".",
        function(bC)
            if bC == "=" then
                return ""
            end
            local bD, bE = "", bB:find(bC) - 1
            for n = 6, 1, -1 do
                bD = bD .. (bE % 2 ^ n - bE % 2 ^ (n - 1) > 0 and "1" or "0")
            end
            return bD
        end
    ):gsub(
        "%d%d%d?%d?%d?%d?%d?%d?",
        function(bC)
            if #bC ~= 8 then
                return ""
            end
            local bF = 0
            for n = 1, 8 do
                bF = bF + (bC:sub(n, n) == "1" and 2 ^ (8 - n) or 0)
            end
            return string.char(bF)
        end
    )
end
local bG = {
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
            {Skill = aO:WaitForChild("Assassin"):WaitForChild("EventStealthWalk"), Cooldown = 0.25, Type = "Remote"},
            {Skill = aO:WaitForChild("Assassin"):WaitForChild("Ultimate"), Cooldown = 1, Type = "Remote"},
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
            {Skill = "MageOfLight", Cooldown = 0.3},
            {Skill = "MageOfLightBlast", Cooldown = 0.33},
            {Skill = "MageOfLightCharged", Cooldown = 0.33},
            {Skill = "MageOfLightBlastCharged", Cooldown = 0.33},
            {Skill = aO:WaitForChild("MageOfLight"):WaitForChild("HealCircle"), Cooldown = 14.2, Type = "Heal"},
            {Skill = aO:WaitForChild("MageOfLight"):WaitForChild("Barrier"), Args = b, Cooldown = 15.2, Type = "Heal"},
            {Skill = aO:WaitForChild("MageOfLight"):WaitForChild("Ultimate"), Cooldown = 1, Type = "Heal"}
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
            {Skill = aO:WaitForChild("Paladin"):WaitForChild("GuildedLight"), Cooldown = 15.2, Type = "Heal"}
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
            {Skill = aO:WaitForChild("Berserker"):WaitForChild("Ultimate"), Cooldown = 1, Type = "Remote"}
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
            {Skill = aO:WaitForChild("Guardian"):WaitForChild("AggroDraw"), Cooldown = 14.5, Type = "Remote"},
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
            {Skill = aO:WaitForChild("Demon"):WaitForChild("Ultimate"), Cooldown = 1, Type = "Remote"},
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
            {Skill = aO:WaitForChild("DualWielder"):WaitForChild("AttackBuff"), Cooldown = 12.2, Type = "Remote"},
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
            {Skill = aO:WaitForChild("DualWielder"):WaitForChild("Ultimate"), Cooldown = 31, Type = "Remote"},
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
        AttackPointAdjustment = -3,
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
            {Skill = aO:WaitForChild("Dragoon"):WaitForChild("Ultimate"), Cooldown = 1, Type = "Remote"},
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
                Skill = aO:WaitForChild("Summoner"):WaitForChild("SoulHarvest"),
                Cooldown = 10.2,
                Type = "Remote",
                Args = "MobPosition",
                Range = 39
            },
            {Skill = aO:WaitForChild("Summoner"):WaitForChild("Summon"), Cooldown = 0.5, Type = "Remote"},
            {Skill = aO:WaitForChild("Summoner"):WaitForChild("Ultimate"), Cooldown = 1, Type = "Remote"}
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
            {Skill = aO:WaitForChild("Necromancer"):WaitForChild("Ultimate"), Cooldown = 31, Type = "Remote"}
        }
    },
    MageOfShadows = {
        DisplayName = "Mage Of Shadows",
        Range = 99,
        Type = "Ranged",
        Primary = "Staff",
        Skills = {
            {Skill = "MageOfShadows", Cooldown = 0.3},
            {Skill = "MageOfShadowsBlast", Cooldown = 0.3},
            {Skill = "MageOfShadowsCharged", Cooldown = 0.31},
            {Skill = "MageOfShadowsBlastCharged", Cooldown = 0.31},
            {Skill = "BighShadowOrb1", Cooldown = 0.33},
            {Skill = "BighShadowOrb2", Cooldown = 0.33},
            {Skill = "BighShadowOrb3", Cooldown = 0.33},
            {Skill = "MageOfShadowsDamageCircle", Cooldown = 0.33},
            {
                Skill = aO:WaitForChild("MageOfShadows"):WaitForChild("ShadowChains"),
                Cooldown = 6,
                Type = "Remote",
                Args = "mobTbl"
            },
            {Skill = aO:WaitForChild("MageOfShadows"):WaitForChild("Ultimate"), Cooldown = 2, Type = "Remote"}
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
local bH = Instance.new("Folder")
bH.Name = "SummonFolder"
bH.Parent = Workspace
local bI = Instance.new("Folder")
bI.Name = "infiniteboy"
bI.Parent = Workspace
local bJ
if ap then
    bJ = Instance.new("Part")
    bJ.Name = "InfiniteKillPart"
    bJ.Size = Vector3.new(50, 20, 50)
    bJ.Position = Vector3.new(10000, 10000, 10000)
    bJ.Anchored = true
    bJ.Transparency = 0
    bJ.Material = "SmoothPlastic"
    bJ.BrickColor = BrickColor.new("Cyan")
    bJ.Parent = workspace
end
local bK, bL, bM
bK, bM, bL = done2(mobTargets)
getgenv().libLoaded = true
function libWarn(msg)
    warn("[Infinite]: " .. msg)
end
function pcallWithError(bN)
    local b7, bO = pcall(bN)
    if not b7 and bO then
        libWarn(bO)
    end
end
function libNoti(msg)
    pcallWithError(
        function()
            bK:Notify(msg)
        end
    )
end
function setMissionObjective(bP, bQ)
    local I = b.PlayerGui.MissionObjective.MissionObjective.Label
    I.Text = bP
    I.Overlay.Text = bP
    if bQ then
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
    return bG[aM] and bG[aM].Type == "Ranged"
end
local bR
bR =
    game:GetService("GuiService").ErrorMessageChanged:Connect(
    function(msg)
        if
            game:GetService("GuiService"):GetErrorCode() == Enum.ConnectionError.DisconnectLuaKick or
                game:GetService("GuiService"):GetErrorCode() == Enum.ConnectionError.DisconnectConnectionLost or
                msg:lower():find("exploit")
         then
            bR:Disconnect()
            a7.Kicked = true
            a7.KickTimestamp = tick()
            save()
            if msg:lower():find("exploit") then
                pcall(
                    function()
                        local bS =
                            "Killaura Delay: ``" ..
                            Options.KillauraDelay.Value ..
                                "``\nClass: ``" .. bG[aM].DisplayName .. "``\nPing: ``" .. ping2() .. "``"
                        if ai then
                            bS = bS .. "\nCode: ``" .. MissionCode .. "``\nMission: ``" .. MissionName .. "``"
                        end
                        bS = bS .. "\n" .. plrLink
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
                                                ["description"] = bS,
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
                )
            end
            V.Teleport.TeleportToHub:FireServer(5)
        end
    end
)
getgenv().testing3 = {[600] = tonumber(tostring(2 + 4) .. tostring(3 + 3))}
local bT =
    bK:CreateWindow(
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
local bU = {
    Main = bT:AddTab("Main"),
    Sell = bT:AddTab("Sell"),
    Teleports = bT:AddTab("Teleports"),
    ["Settings"] = bT:AddTab("Settings")
}
local bV = bU.Main:AddLeftTabbox("farmmm")
local bW = bU.Sell:AddLeftTabbox("selll")
local bX = bU.Sell:AddRightTabbox("selll2")
local bY = bV:AddTab("Farm")
local bZ = bV:AddTab("Settings")
local b_ = bW:AddTab("Auto Sell")
local c0 = bX:AddTab("Sell/Recycle Cosmetics")
local c1 = bV:AddTab("Weapons")
local c2 = bV:AddTab("Event")
local c3 = bU.Main:AddRightTabbox("box")
local c4 = c3:AddTab("Visual")
local c5 = c3:AddTab("Webhook")
local c6 = c3:AddTab("Misc")
local c7 = c3:AddTab("Gui")
local c8 = bU.Main:AddRightTabbox("temp")
local c9 = c8:AddTab("Stats")
local ca = bU.Teleports:AddLeftGroupbox("Worlds")
local cb = bU.Teleports:AddRightGroupbox("Towers")
local cc = bU.Teleports:AddRightGroupbox("Nightmare Dungeons")
bY:AddToggle("Killaura", {Text = "Killaura", Default = false})
bY:AddSlider(
    "KillauraDelay",
    {Text = "Delay", Default = 0, Min = 0, Max = 1, Rounding = 2, HideMax = true, Compact = true}
)
if olympus then
    bY:AddToggle("autosetTestOffset", {Text = "Auto Set Test Offset", Default = true})
    bY:AddSlider(
        "testOffset",
        {Text = "Test Offset", Default = 0, Min = -25, Max = 25, Rounding = 0, HideMax = true, Compact = true}
    )
end
bY:AddToggle("Autofarm", {Text = "Autofarm", Default = false})
bY:AddSlider(
    "Offset",
    {
        Text = "Offset",
        Default = isRangedClass() and 30 or 7,
        Min = 0,
        Max = ai and (isRangedClass() and 75 or 25) or 75,
        Rounding = 1,
        Compact = true
    }
)
bY:AddSlider(
    "healPercent",
    {Text = "Heal At", Default = 30, Min = 0, Max = 100, Rounding = 0, HideMax = true, Compact = true, Suffix = "% HP"}
)
bY:AddSlider(
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
bY:AddToggle("CollectDrops", {Text = "Collect Drops", Default = false})
bY:AddToggle("collectEggChests", {Text = "Collect Egg Chests", Default = true})
bY:AddToggle("RestartDungeon", {Text = "Restart Dungeon", Default = false})
bY:AddToggle("nightmareLoop", {Text = "Nightmare Loop", Default = false})
bY:AddToggle("NextDungeon", {Text = "Next Dungeon", Default = false})
bY:AddToggle(
    "PerkSwitcher",
    {
        Text = "Auto Switch Perks",
        Default = false,
        Tooltip = "Enables Primary Perks on Mobs, and Offhand Perks on Bosses"
    }
)
bY:AddToggle("autoEquipBestwWep", {Text = "Auto Equip Best Weapon/Armor", Default = false})
bY:AddToggle("mobCamera", {Text = "Mob POV", Default = false})
bY:AddSlider("FastSprint", {Text = "Sprint Speed", Default = 28, Min = 28, Max = 200, Rounding = 0, Compact = true})
bY:AddButton(
    {Text = "Restart Dungeon", Func = function()
            if ai then
                StartRaid(af, ah)
            end
        end, DoubleClick = false}
)
bZ:AddSlider(
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
bZ:AddSlider(
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
bZ:AddSlider(
    "dungeonStartTimer",
    {
        Text = "Dungeon Start Delay",
        Default = 0,
        Min = 0,
        Max = 600,
        Rounding = 0,
        HideMax = true,
        Suffix = "s",
        Compact = true
    }
)
bZ:AddSlider(
    "towerStartTimer",
    {
        Text = "Tower Start Delay",
        Default = 0,
        Min = 0,
        Max = 900,
        Rounding = 0,
        HideMax = true,
        Suffix = "s",
        Compact = true
    }
)
Options.dungeonStartTimer:OnChanged(
    function(cd)
        aZ = aZ + 1
    end
)
Options.towerStartTimer:OnChanged(
    function(cd)
        a_ = a_ + 1
    end
)
bZ:AddSlider(
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
bZ:AddToggle(
    "restartAfterFloors",
    {
        Text = "Inf Tower Smart Restart",
        Tooltip = "Restarts Infinite Floor after specified amount of floors are completed",
        Default = false
    }
)
bZ:AddInput("completedInfiniteTowerFloors", {Text = "Floors", Default = 31, Numeric = true, Finished = true})
bZ:AddToggle("ignoreCannon", {Text = "Ignore Cannon (Atlantis Tower)", Default = false})
bZ:AddToggle("skipScarecrowNm", {Text = "Skip Scarecrow Defense (NM Loop)", Default = false})
bZ:AddToggle(
    "rejoinDungeon",
    {
        Text = "Rejoin Last Dungeon",
        Tooltip = "Automatically starts the last dungeon started within your desired time limit",
        Default = false
    }
)
Toggles.rejoinDungeon:OnChanged(
    function(bF)
        a7.RejoinLastDungeon = bF
        save()
    end
)
local ce = {
    ["30 minutes"] = 1800,
    ["3 hours"] = 10800,
    ["12 hours"] = 43200,
    ["24 hours"] = 86400,
    ["Infinite"] = 999999999
}
bZ:AddDropdown(
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
    function(bF)
        a7.RejoinLastDungeonThreshold = ce[bF]
        save()
    end
)
bZ:AddToggle(
    "forceRestartLastTower",
    {
        Text = "Force Restart Last Tower",
        Tooltip = "Restart the Tower when going back to town (willingly or by force)",
        Default = false
    }
)
Toggles.forceRestartLastTower:OnChanged(
    function(bF)
        a7.ForceRestartLastTower = bF
        save()
    end
)
bZ:AddSlider(
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
        while ai do
            if #a:GetPlayers() >= Options.playerCountKick.Value then
                task.wait(0.5)
                b:Kick("Someone might have joined your mission!")
                break
            end
            task.wait()
        end
    end
)
c1:AddInput("mobWepId", {Numeric = false, Finished = true, Text = "Current Mob Weapon"})
c1:AddInput("bossWepId", {Numeric = false, Finished = true, Text = "Current Boss Weapon"})
c1:AddButton(
    {
        Text = "Set Current Primary for Mobs",
        Tooltip = "Killaura will auto equip this weapon when targeting mobs",
        Func = function()
            local cf = aH and aH:GetChildren()[1]
            local cg = cf and cf.ID.Value
            if cg then
                Options.mobWepId:SetValue(cg)
                libNoti("Set " .. bj[cf.Name].DisplayKey .. " as your Mob weapon!")
            else
                libNoti("No suitable Primary Weapon Detected")
            end
        end,
        DoubleClick = false
    }
)
c1:AddButton(
    {
        Text = "Set Current Primary for Bosses",
        Tooltip = "Killaura will auto equip this weapon when targeting bosses",
        Func = function()
            local cf = aH and aH:GetChildren()[1]
            local cg = cf and cf.ID.Value
            if cg then
                Options.bossWepId:SetValue(cg)
                libNoti("Set " .. bj[cf.Name].DisplayKey .. " as your Boss weapon!")
            else
                libNoti("No suitable Primary Weapon Detected")
            end
        end,
        DoubleClick = false
    }
)
c1:AddButton(
    {Text = "Reset Selected Weapons", Func = function()
            Options.mobWepId:SetValue("")
            Options.bossWepId:SetValue("")
            libNoti("Selected weapons reset!")
        end, DoubleClick = false}
)
c5:AddInput(
    "dungeonHook",
    {
        Numeric = false,
        Finished = true,
        Text = "Mission Webhook",
        Tooltip = "Put your own webhook link to log mission completions/fails"
    }
)
c5:AddInput(
    "drophook",
    {Numeric = false, Finished = true, Text = "Drop Webhook", Tooltip = "Put your own webhook link to log T5 drops"}
)
c5:AddInput(
    "dropHookRoleId",
    {
        Numeric = false,
        Finished = true,
        Text = "Custom Role ID for DropHook",
        Tooltip = "Mention your chosen role instead of @everyone when getting a desired perk T5"
    }
)
c5:AddToggle(
    "anonHook",
    {Text = "Anonymous Webhook", Tooltip = "Won't show your User Info in the webhook", Default = false}
)
b_:AddDropdown("AutoSellTbl", {Text = "Auto Sell Tiers", Values = {1, 2, 3, 4, 5}, AllowNull = true, Multi = true})
b_:AddButton(
    {
        Text = "Sell All",
        Tooltip = "Sells all weapons and armors of selected tiers",
        Func = function()
            local ch = {}
            for n, E in be:GetChildren() do
                local ci = bj[E.Name]
                if
                    (ci.Type == "Weapon" or ci.Type == "Armor") and Options.AutoSellTbl.Value[bt:GetItemTier(E)] and
                        not E:FindFirstChild("Locked")
                 then
                    table.insert(ch, E)
                end
            end
            if #ch > 0 then
                libNoti("Sold " .. #ch .. " items")
                V.Drops.SellItems:InvokeServer(ch)
            end
        end,
        DoubleClick = true
    }
)
b_:AddToggle(
    "autoSellAll",
    {
        Text = "Sell All On Mission Start",
        Tooltip = "Failsafe incase auto sell doesn't sell in time at the end of a mission",
        Default = false
    }
)
b_:AddToggle("autoSellEggs", {Text = "Auto Sell Eggs", Default = false, Tooltip = "Works in Event Wheel Hub also"})
b_:AddDivider()
b_:AddToggle(
    "smartPerkSell",
    {
        Text = "Smart T5 Auto Sell",
        Default = false,
        Tooltip = "Do NOT enable this until you have turned all of your desired perks slider atleast 1 higher than lowest value"
    }
)
local cj = {}
for n, E in bi do
    table.insert(cj, E.DisplayName)
end
table.sort(cj)
for n = 1, #cj do
    for ck, cl in bi do
        if cj[n] == cl.DisplayName then
            b_:AddSlider(
                ck,
                {
                    Text = cl.DisplayName,
                    Default = math.round(cl.StatRange[1] * 100),
                    Min = math.round(cl.StatRange[1] * 100),
                    Max = math.round(cl.StatRange[2] * 100),
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
    b_:AddLabel("")
end
local cm = {
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
local cn = {}
for n, E in cm do
    table.insert(cn, E)
end
table.sort(cn)
c0:AddDropdown("selectedCosmetics", {Text = "Select Cosmetics", Values = cn, AllowNull = true, Multi = true})
local co = {
    FrostyScarf = "Frosty Scarf",
    WolfspiritHelmet = "Wolfspirit Helmet",
    WolfspiritArmor = "Wolfspirit Armor",
    FestiveDress = "Festive Dress",
    RamHorns = "Ram Horns",
    CandycaneAntlers = "Candycane Antlers",
    CarrotNose = "Carrot Nose",
    FluffyJacket = "Fluffy Jacket"
}
local cn = {}
for n, E in co do
    table.insert(cn, E)
end
table.sort(cn)
c0:AddDropdown("selectedWheelCosmetics", {Text = "Select Event Cosmetics", Values = cn, AllowNull = true, Multi = true})
local cp = {
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
local cn = {}
for n, E in cp do
    table.insert(cn, E.Name)
end
table.sort(cn)
c0:AddDropdown(
    "selectedDyes",
    {
        Text = "Select Desired Dyes",
        Tooltip = "Event wheel items with these dyes or close to these dyes won't be sold/recycled",
        Values = cn,
        AllowNull = true,
        Default = {"Rainbow", "Ghoul", "Ice", "Faded", "Black", "White"},
        Multi = true
    }
)
c0:AddSlider(
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
c0:AddToggle("autoSellCosmetics", {Text = "Auto Sell Cosmetics", Default = false})
Toggles.autoSellCosmetics:OnChanged(
    function(cd)
        if cd and Toggles.autoRecycleCosmetics.Value then
            Toggles.autoRecycleCosmetics:SetValue(false)
        end
    end
)
c0:AddToggle("autoRecycleCosmetics", {Text = "Auto Recycle Cosmetics", Default = false})
Toggles.autoRecycleCosmetics:OnChanged(
    function(cd)
        if cd and Toggles.autoSellCosmetics.Value then
            Toggles.autoSellCosmetics:SetValue(false)
        end
    end
)
function color3ToHex(color)
    local bD = math.floor(color.R * 255 + 0.5)
    local cq = math.floor(color.G * 255 + 0.5)
    local bB = math.floor(color.B * 255 + 0.5)
    return string.format("#%02X%02X%02X", bD, cq, bB)
end
function hexToRGB(cr)
    cr = cr:gsub("#", "")
    return tonumber("0x" .. cr:sub(1, 2)), tonumber("0x" .. cr:sub(3, 4)), tonumber("0x" .. cr:sub(5, 6))
end
function colorDistance(cs, ct)
    local cu, cv, cw = hexToRGB(cs)
    local cx, cy, cz = hexToRGB(ct)
    return math.sqrt((cx - cu) ^ 2 + (cy - cv) ^ 2 + (cz - cw) ^ 2)
end
function desiredColorCheck(cA)
    local cB
    local cC
    if cA and cA:FindFirstChild("Dye") and cA.Dye.Value then
        cC = color3ToHex(cA.Dye.Value)
        for aj, cD in cp do
            if Options.selectedDyes.Value[cD.Name] then
                if cC == cD.Hex then
                    cB = true
                    print("Did not sell " .. cA.Name .. " - " .. cD.Name)
                    break
                elseif not cD.SpecialType then
                    local a1 = colorDistance(cC, cD.Hex)
                    if a1 <= Options.colorDistanceThreshold.Value then
                        cB = true
                        print(
                            "Did not sell " ..
                                cA.Name ..
                                    " - Similar to " ..
                                        cD.Name ..
                                            " - Color Distance: " .. math.floor(a1 / 0.1) / 10 .. " - Hex: " .. cC
                        )
                        break
                    end
                end
            end
        end
    end
    if cB then
        return true
    end
end
c0:AddButton(
    {
        Text = "Sell Selected Cosmetics",
        Func = function()
            local ch = {}
            for n, E in bf:GetChildren() do
                local cE = cm[E.Name] or co[E.Name] or "none"
                if
                    (Options.selectedCosmetics.Value[cE] or Options.selectedWheelCosmetics.Value[cE]) and
                        not E:FindFirstChild("Locked") and
                        not desiredColorCheck(E)
                 then
                    table.insert(ch, E)
                end
            end
            if #ch > 0 then
                libNoti("Sold " .. #ch .. " Cosmetics")
                sell(ch)
            end
        end,
        DoubleClick = true
    }
)
c0:AddButton(
    {
        Text = "Recycle Selected Cosmetics",
        Func = function()
            local ch = {}
            for n, E in bf:GetChildren() do
                local cE = cm[E.Name] or co[E.Name] or "none"
                if
                    (Options.selectedCosmetics.Value[cE] or Options.selectedWheelCosmetics.Value[cE]) and
                        not E:FindFirstChild("Locked") and
                        not desiredColorCheck(E)
                 then
                    table.insert(ch, E)
                end
            end
            if #ch > 0 then
                libNoti("Recycled " .. #ch .. " Cosmetics")
                recycle(ch)
            end
        end,
        DoubleClick = true
    }
)
if table.find(al, game.PlaceId) then
    bf.ChildAdded:Connect(
        function(E)
            if Toggles.autoSellCosmetics.Value or Toggles.autoRecycleCosmetics.Value then
                local cE = co[E.Name]
                if cE then
                    E:WaitForChild("Dye", 5)
                    if
                        Options.selectedWheelCosmetics.Value[cE] and not E:FindFirstChild("Locked") and
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
    be.ChildAdded:Connect(
        function(E)
            if Toggles.autoSellEggs.Value then
                local cA = bj[E.Name]
                if cA.Type == "Egg" then
                    sell({E})
                end
            end
        end
    )
end
c2:AddInput("wheelCount", {Default = 100, Numeric = true, Finished = true, Text = "Wheel Spin Count"})
c2:AddSlider(
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
local cF =
    c2:AddLabel(
    Options.wheelCount.Value ..
        " spins in " .. timeElapsed(math.round((Options.wheelCount.Value - 1) * Options.wheelDelay.Value * 10) / 10)
)
Options.wheelCount:OnChanged(
    function(cd)
        cF:SetText(cd .. " spins in " .. timeElapsed(math.round((cd - 1) * Options.wheelDelay.Value * 10) / 10))
    end
)
Options.wheelDelay:OnChanged(
    function(cd)
        cF:SetText(
            Options.wheelCount.Value ..
                " spins in " .. timeElapsed(math.round((Options.wheelCount.Value - 1) * cd * 10) / 10)
        )
    end
)
c2:AddButton(
    {
        Text = "Spin wheel with the settings above!",
        Func = function()
            local cG, cH = tonumber(Options.wheelCount.Value), Options.wheelDelay.Value
            if cG > 0 then
                libNoti(
                    "Spinning the wheel " ..
                        cG .. " times in " .. timeElapsed(math.round((cG - 1) * cH * 10) / 10) .. " seconds!",
                    7
                )
                for n = 1, cG do
                    V.EventSpinner.JoinQueue:FireServer(b)
                    task.wait(cH)
                end
            end
        end,
        DoubleClick = true
    }
)
function PlayerTp(r, bC, cI, cJ)
    if alive() then
        aw.CFrame = CFrame.new(r + Vector3.new(bC, cI, cJ))
    end
end
function SmartPlayerTp(cK, cL)
    if not alive() then
        return
    end
    noclip()
    aw.Velocity = Vector3.new()
    if av:FindFirstChild("Collider") then
        av.Collider.Velocity = Vector3.new()
    end
    if cL then
        aw.CFrame = CFrame.lookAt(cK.Position, Vector3.new(cL.Position.x, cK.Position.y, cL.Position.z))
    else
        aw.CFrame = cK
    end
end
c4:AddToggle("NVD", {Text = "No Visual Damage", Default = true})
c4:AddToggle("disableEffects", {Text = "Disable Effects", Default = true})
c4:AddToggle("rendering", {Text = "Disable 3D Rendering", Default = false})
Toggles.rendering:OnChanged(
    function(bF)
        cloneref(game:GetService("RunService")):Set3dRenderingEnabled(not bF)
    end
)
c4:AddToggle("autoHide", {Text = "Hide GUI On Execution", Default = false})
c6:AddButton(
    {
        Text = "Upgrade Equipped Items",
        Func = function()
            local cM = {aH:GetChildren()[1], aI:GetChildren()[1], aJ:GetChildren()[1]}
            for aj, cN in cM do
                task.spawn(
                    function()
                        if cN and cN:FindFirstChild("UpgradeLimit") and cN.UpgradeLimit.Value ~= 0 then
                            local cO = aD.Value
                            local cP = tick()
                            while task.wait(0.1) do
                                if cN:FindFirstChild("Upgrade") and cN.Upgrade.Value == cN.UpgradeLimit.Value then
                                    break
                                else
                                    aK:FireServer(cN)
                                    if aD.Value ~= cO then
                                        cO = aD.Value
                                        cP = tick()
                                    end
                                    if tick() - cP >= 2 then
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
c6:AddButton(
    {
        Text = "Discover Dungeons (!)",
        Func = function()
            if alive() and not ai then
                local cQ = workspace.PhysicalDungeonLocations
                for n, E in cQ:GetChildren() do
                    local cR
                    V.Teleport.WaystoneTeleport:FireServer(1)
                    aw:GetPropertyChangedSignal("Position"):Once(
                        function()
                            aw:GetPropertyChangedSignal("Position"):Once(
                                function()
                                    cR = true
                                end
                            )
                            PlayerTp(E.Ring.Position, 0, 7.5, 0)
                        end
                    )
                    repeat
                        task.wait()
                    until cR
                    task.wait(1)
                end
            end
        end,
        DoubleClick = true
    }
)
if olympus then
    c6:AddButton(
        {Text = "Dex Explorer", Func = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
            end, DoubleClick = true}
    )
    c6:AddButton(
        {Text = "SimpleSpy", Func = function()
                loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpyBeta.lua"))(

                )
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
function OpenGui(cS)
    setthreadcontext(2)
    require(U.Client.Gui.GuiScripts[cS]):Open()
end
for aj, cq in ipairs(GuiData) do
    c7:AddButton(
        {Text = cq.DisplayName, Func = function()
                OpenGui(cq.CodeName)
            end, DoubleClick = false}
    )
end
c7:AddInput("marketFilter", {Numeric = false, Finished = true, Text = "Market Filter"})
c7:AddButton(
    {
        Text = "Open All Markets",
        Func = function()
            task.spawn(
                function()
                    setthreadcontext(2)
                    local cT = require(game.ReplicatedStorage.Client.Gui.GuiScripts.Shop)
                    local cU = getfenv(cT.Open).BuildShop
                    pcall(cT.Open, cT, game)
                    pcall(
                        function()
                            for n, E in getupvalue(cU, 1) do
                            end
                        end
                    )
                    for n, E in getupvalue(cU, 2) do
                    end
                    local cV = {}
                    local cW = {}
                    local cX = U:WaitForChild("PlayerShops")
                    for n, cY in a:GetPlayers() do
                        local cZ = cX:FindFirstChild(cY.Name) and cX[cY.Name]:FindFirstChild("SellShop")
                        if cZ and cZ:FindFirstChild("Active") and cZ.Active.Value then
                            setupvalue(cU, 1, {})
                            setupvalue(cU, 2, {})
                            cU(cY)
                            for n, E in getupvalue(cU, 1) do
                                E.Title.Text = E.Title.Text .. " (" .. cY.Name .. ")"
                                E.Title.Overlay.Text = E.Title.Text
                                table.insert(cV, E)
                            end
                            for n, E in getupvalue(cU, 2) do
                                table.insert(cW, E)
                            end
                        end
                    end
                    if Options.marketFilter.Value and #Options.marketFilter.Value > 0 then
                        for n, E in cV do
                            if not E.Title.Text:lower():find(Options.marketFilter.Value:lower()) then
                                E:Destroy()
                            end
                        end
                    end
                    table.sort(
                        cV,
                        function(c_, bB)
                            local d0 =
                                c_:FindFirstChild("Cost") and c_.Cost:FindFirstChild("Overlay") and
                                #c_.Cost.Overlay.Text > 0 and
                                c_.Cost.Overlay.Text:gsub(",", "") and
                                tonumber(c_.Cost.Overlay.Text:gsub(",", "")) or
                                0
                            local d1 =
                                bB:FindFirstChild("Cost") and bB.Cost:FindFirstChild("Overlay") and
                                #bB.Cost.Overlay.Text > 0 and
                                bB.Cost.Overlay.Text:gsub(",", "") and
                                tonumber(bB.Cost.Overlay.Text:gsub(",", "")) or
                                0
                            return d0 > d1
                        end
                    )
                    setupvalue(cU, 1, cV)
                    setupvalue(cU, 2, cW)
                    getupvalue(cT.Init, 1).Title.Text = "All Shops"
                    getupvalue(cT.Init, 1).Title.Overlay.Text = "All Shops"
                end
            )
        end,
        DoubleClick = false
    }
)
local d2 = c9:AddLabel("Gold Gain: " .. aD.Value - aE)
local d3 = c9:AddLabel("Gold Rate: N/A")
local d4 = 0
local d5 = true
c = tick()
local d6
local d7
local d8 = false
local d9 = c9:AddLabel("Total Gold: " .. formatNumberWithCommas(aD.Value))
local da = c9:AddLabel("Session Time: 0s")
c9:AddDivider()
local db = a7.CrossSessionTimestamp or tick()
local dc = c9:AddLabel("Cross-Session Time: " .. timeElapsed(tick() - db))
local dd =
    c9:AddLabel("CS Gold Gain: " .. formatNumberWithCommas(a7.CrossSessionGold and aF - a7.CrossSessionGold or 0))
local de = a7.CrossSessionGold or aF
c9:AddButton(
    {Text = "Reset Cross-Session Time", Func = function()
            db = tick()
            a7.CrossSessionTimestamp = db
            save()
        end, DoubleClick = true}
)
c9:AddButton(
    {Text = "Reset Cross-Session Gold", Func = function()
            de = aF
            a7.CrossSessionGold = de
            save()
            dd:SetText("CS Gold Gain: 0")
        end, DoubleClick = true}
)
local df
if not a7.CrossSessionTimestamp then
    a7.CrossSessionTimestamp = db
    df = true
end
if not a7.CrossSessionGold then
    a7.CrossSessionGold = de
    df = true
end
if df then
    save()
end
task.spawn(
    function()
        while true do
            if aD.Value ~= aF then
                aF = aD.Value
                if not d5 then
                    d3:SetText("Gold Rate: " .. math.floor((aF - d7) / (tick() - d6) * 600) / 10 .. "/min")
                end
                if d5 then
                    d5 = false
                    d8 = true
                    d6 = tick()
                    d7 = aF
                end
                d2:SetText("Gold Gained: " .. formatNumberWithCommas(aF - aE))
                d9:SetText("Total Gold: " .. formatNumberWithCommas(aF))
                dd:SetText("CS Gold Gain: " .. formatNumberWithCommas(aF - de))
            end
            task.wait()
        end
    end
)
task.spawn(
    function()
        while true do
            task.wait(1)
            da:SetText("Session Time: " .. timeElapsed(tick() - c))
            dc:SetText("Cross-Session Time: " .. timeElapsed(tick() - db))
        end
    end
)
local dg
for n, dh in ipairs(WorldData) do
    if n % 2 > 0 then
        dg = false
    end
    if not dh.Name:find("World") then
        dg = false
    end
    if not dg then
        dg =
            ca:AddButton(
            {Text = dh.Name, Func = function()
                    V.Teleport.TeleportToHub:FireServer(dh.Id)
                end, DoubleClick = true}
        )
    else
        dg:AddButton(
            {Text = dh.Name, Func = function()
                    V.Teleport.TeleportToHub:FireServer(dh.Id)
                end, DoubleClick = true}
        )
    end
end
for n, E in ipairs(Towers) do
    cb:AddButton(
        {Text = bg[E].NameTag .. " T" .. n, Func = function()
                StartRaid(E)
            end, DoubleClick = false}
    )
end
for n, E in Nightmares do
    cc:AddButton(
        {
            Text = string.gsub(bg[E].NameTag, "%(NIGHTMARE%) ", "") ..
                " " .. bg[E].DisplayWorldID .. "-" .. bg[E].WorldMissionID,
            Func = function()
                StartRaid(E, Toggles.ChallengeMode.Value and 5 or 1)
            end,
            DoubleClick = false
        }
    )
end
cc:AddToggle("ChallengeMode", {Text = "Challenge Mode", Default = true})
local di = Vector3.new(0, 500, 0)
local dj = Vector3.new()
local dk
local dl
local dm
do
    function isKrakenArm(dn)
        return dn:lower():find("kraken-arm") or dn:lower():find("krakenarm")
    end
    function MobTeleport()
        task.spawn(
            function()
                local dp
                local dq
                local dr
                while Toggles.Autofarm.Value do
                    for n, E in aS:GetChildren() do
                        if isAlive(E) then
                            if mobWaitTbl and table.find(mobWaitTbl, E.Name) and (not dr or alwaysWait) then
                                task.wait(waittime)
                                dr = true
                            end
                            local Z = E.PrimaryPart
                            if not firstMobFound then
                                firstMobFound = true
                            end
                            while isAlive(E) and Toggles.Autofarm.Value and W do
                                bq = E
                                dp = Z.Position
                                setCamera(not bp and Toggles.mobCamera.Value and Z)
                                dk =
                                    isKrakenArm(E.Name) and 0 or
                                    (Z.Size.Y / 2 + Options.Offset.Value) * (isRangedClass() and 1 or -1)
                                dl =
                                    CFrame.new(
                                    Z.Position + (table.find(au, E) and dj or Vector3.new(0, dk, 0) + (bp and di or dj))
                                ) +
                                    Z.CFrame.lookVector * 2
                                dq = dl
                                SmartPlayerTp(dl, Z)
                                bs:Wait()
                            end
                        end
                    end
                    bq = nil
                    setCamera()
                    unnoclip()
                    if ao and W and dq then
                        SmartPlayerTp(dq)
                    end
                    task.wait()
                end
                if dp and ao then
                    SmartPlayerTp(CFrame.new(dp + Vector3.new(0, 10, 0)))
                end
            end
        )
    end
    function MobTeleportIgnore(ds, mobWaitTbl, waittime, alwaysWait)
        local dr
        task.spawn(
            function()
                while Toggles.Autofarm.Value do
                    for n, E in aS:GetChildren() do
                        if isAlive(E) then
                            if E.Name ~= ds or E.Name == ds and aP == 1 then
                                if mobWaitTbl and table.find(mobWaitTbl, E.Name) and (not dr or alwaysWait) then
                                    task.wait(waittime)
                                    dr = true
                                end
                                local Z = E.PrimaryPart
                                while isAlive(E) and Toggles.Autofarm.Value and W and
                                    (E.Name ~= ds or E.Name == ds and aP == 1) do
                                    bq = E
                                    setCamera(not bp and Toggles.mobCamera.Value and Z)
                                    dk =
                                        isKrakenArm(E.Name) and 0 or
                                        (Z.Size.Y / 2 + Options.Offset.Value) * (isRangedClass() and 1 or -1)
                                    dl =
                                        CFrame.new(
                                        Z.Position +
                                            (table.find(au, E) and dj or Vector3.new(0, dk, 0) + (bp and di or dj))
                                    ) +
                                        Z.CFrame.lookVector * 2
                                    SmartPlayerTp(dl, Z)
                                    bs:Wait()
                                end
                            end
                        end
                    end
                    bq = nil
                    setCamera()
                    unnoclip()
                    task.wait()
                end
            end
        )
    end
    function MobTeleportPriority(dt, mobWaitTbl, waittime, alwaysWait)
        local du, dv
        task.spawn(
            function()
                while Toggles.Autofarm.Value do
                    local dw = false
                    local dx = {}
                    for n, E in aS:GetChildren() do
                        if isAlive(E) then
                            table.insert(dx, E)
                        end
                    end
                    for n = 1, #dt do
                        for aj, Mob in dx do
                            if Mob.Name == dt[n] then
                                dw = true
                                du, dv = Mob, Mob.Name
                                break
                            end
                        end
                        if dw then
                            break
                        end
                    end
                    if not dw and dx[1] then
                        du, dv = dx[1], dx[1].Name
                    end
                    task.wait()
                end
            end
        )
        task.spawn(
            function()
                local dr
                while Toggles.Autofarm.Value do
                    if isAlive(du) and W then
                        local dy = du.PrimaryPart
                        bq = du
                        if mobWaitTbl and table.find(mobWaitTbl, dv) and (not dr or alwaysWait) then
                            task.wait(waittime)
                            dr = true
                        end
                        setCamera(not bp and Toggles.mobCamera.Value and dy)
                        dk =
                            isKrakenArm(dv) and 0 or
                            (dy.Size.Y / 2 + Options.Offset.Value) * (isRangedClass() and 1 or -1)
                        dl =
                            CFrame.new(
                            dy.Position + (table.find(au, du) and dj or Vector3.new(0, dk, 0) + (bp and di or dj))
                        ) +
                            dy.CFrame.lookVector * 2
                        SmartPlayerTp(dl, dy)
                    else
                        bq = nil
                        setCamera()
                        unnoclip()
                    end
                    bs:Wait()
                end
                setCamera()
            end
        )
    end
    function AutoCheckpoint()
        task.spawn(
            function()
                local dz = 0.25
                local dA = bA[ag] or 0
                while Toggles.Autofarm.Value do
                    if ar or as then
                        break
                    end
                    if alive() and aP <= dA then
                        local dB
                        for aj, o in workspace:GetChildren() do
                            if not table.find(by, o.Name) then
                                for n, E in o:GetDescendants() do
                                    if
                                        E and E.Name == "TouchInterest" and E.Parent and
                                            (table.find(bx, E.Parent.Name) or
                                                E.Parent.Parent and table.find(bx, E.Parent.Parent.Name)) and
                                            alive()
                                     then
                                        if E.Parent.Name == "WaveExit" then
                                            task.wait(0.5)
                                            if alive() and Toggles.Autofarm.Value then
                                                local dC = aw.CFrame
                                                PlayerTp(E.Parent.Position, 0, 25, 0)
                                                local cP = tick()
                                                repeat
                                                    task.wait()
                                                until not o:FindFirstChild("WaveExit") or tick() - cP > 1 or
                                                    not Toggles.Autofarm.Value
                                                if alive() and o:FindFirstChild("WaveExit") and Toggles.Autofarm.Value then
                                                    aw.CFrame = dC
                                                end
                                                dB = true
                                            end
                                        else
                                            task.spawn(
                                                function()
                                                    E.Parent.CanCollide = false
                                                    E.Parent.Anchored = true
                                                    E.Parent.Transparency = 1
                                                    local dC = E.Parent.CFrame
                                                    E.Parent.CFrame = CFrame.new(aw.Position) * (dC - dC.Position)
                                                    task.wait(dz)
                                                    if E and E.Parent then
                                                        E.Parent.CFrame = dC
                                                    end
                                                end
                                            )
                                        end
                                    end
                                end
                            end
                        end
                        local dD = tick()
                        while Toggles.Autofarm.Value do
                            if tick() - dD > dz * 2 and aP <= dA then
                                local dE = true
                                if an then
                                    local cP = tick()
                                    while Toggles.Autofarm.Value do
                                        if aP > 0 then
                                            dE = false
                                            dD = tick()
                                            break
                                        end
                                        if tick() - cP > 0.75 or dB then
                                            break
                                        end
                                        task.wait()
                                    end
                                end
                                if dE then
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
                    aQ = 0
                    for n, E in aS:GetChildren() do
                        if isAlive(E) then
                            aQ = aQ + 1
                        end
                    end
                    if aP ~= aQ then
                        aP = aQ
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
                    bo = nil
                    while Toggles.Autofarm.Value do
                        if bq and bq.PrimaryPart and bq.PrimaryPart.Position then
                            bo =
                                ar and CFrame.new(Vector3.new(324, 60, -134)) or
                                CFrame.new(bq.PrimaryPart.Position + Vector3.new(0, 5, 0))
                        end
                        if bo and aP == 0 then
                            local dF = tick()
                            while tick() - dF <= 0.1 and aP == 0 do
                                SmartPlayerTp(bo)
                                bs:Wait()
                            end
                            bo = nil
                        end
                        task.wait()
                    end
                    if not Toggles.Autofarm.Value then
                        if bo then
                            local dF = tick()
                            while tick() - dF <= 0.1 do
                                SmartPlayerTp(bo)
                                bs:Wait()
                            end
                            bo = nil
                        end
                    end
                end
            )
        end
    end
    function sell(b8)
        V.Drops.SellItems:InvokeServer(b8)
    end
    function recycle(b8)
        V.Recycler.Recycle:FireServer(b8)
    end
end
if addingCosmetics then
    function ChangeCosmetic(r, s)
        if av then
            ay:SetAttribute(r, s)
        end
    end
    function color(bC, cI, cJ)
        Color3.fromRGB(bC, cI, cJ)
    end
    local dG = {
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
    local aG = {
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
    local dH = {Costume = "CogWorkArmor", Hat1 = "CogWorkTophat", Hat2 = "CogWorkGoggles"}
    function CogWorkOutfit()
        if ay:GetAttribute("Primary") then
            local dI = bj[ay:GetAttribute("Primary")].SubType
            if dI == "Greataxe" then
                ChangeCosmetic(aG.RightWepSkin, "CogWorkAxe")
            else
                ChangeCosmetic(aG.RightWepSkin, "CogWork" .. dI)
            end
        end
        if ay:GetAttribute("Offhand") then
            local dI = bj[ay:GetAttribute("Offhand")].SubType
            if dI == "Greataxe" then
                ChangeCosmetic(aG.LeftWepSkin, "CogWorkAxe")
            else
                ChangeCosmetic(aG.LeftWepSkin, "CogWork" .. dI)
            end
        end
        for n, E in dH do
            ChangeCosmetic(n, E)
        end
    end
    OutfitList:AddButton(
        {Text = "Cogwork", Func = function()
                if av then
                    CogWorkOutfit()
                end
            end, DoubleClick = false}
    )
end
function hookWithUserInfo(dJ, dK, dL, color, d, dM)
    request(
        {
            Url = dJ,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode(
                {
                    ["content"] = dM or "",
                    ["embeds"] = {
                        {
                            ["title"] = dK,
                            ["description"] = dL,
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
function anonHook(dJ, dK, dL, color, d, dM)
    request(
        {
            Url = dJ,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode(
                {
                    ["content"] = dM or "",
                    ["embeds"] = {
                        {
                            ["title"] = dK,
                            ["description"] = dL,
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
function msg(dN, color, d)
    local dO = Options.dungeonHook.Value
    local dP =
        "Code: ``" ..
        MissionCode ..
            "``\nMission: ``" .. MissionName .. "``\nTime: ``" .. d .. "``\nClass: ``" .. bG[aM].DisplayName .. "``"
    if ao then
        local b4 = aS:GetChildren()[1]
        local dQ = b4 and Mob(b4.Name)
        local a3, dv = dQ and dQ.BossTag, dQ and dQ.NameTag
        if a3 and dv then
            dP = dP .. "\nBoss: ``" .. dv .. "``"
        end
    end
    if isfile and readfile and writefile then
        if a7.LastDungeonCompletion then
            dP =
                dP ..
                "\nTime Since Last Completion: ``" .. timeElapsed(math.round(bu - a7.LastDungeonCompletion)) .. "``"
        end
        if a7.Gold and X >= a7.Gold then
            dP = dP .. "\nGold Gained: ``" .. formatNumberWithCommas(X - a7.Gold) .. "``"
        end
        a7.Gold = X
        a7.LastDungeonCompletion = bu
        save()
    end
    dP = dP .. "\nGold: ``" .. formatNumberWithCommas(aD.Value) .. "``"
    if ar then
        local dR = {
            [45] = {coinCode = "KrakenCoin", coinStr = "Kraken Coins", lb = "KRAKEN_KILLS_2025", name = "Kraken"},
            [44] = {coinCode = "DragonCoin", coinStr = "Dragon Coins", lb = "VANE_KILLS", name = "Vane"},
            [22] = {
                coinCode = "HalloweenCoin",
                coinStr = "Halloween Coins",
                lb = "FALLENKING_KILLS",
                name = "Halloween"
            },
            [17] = {coinCode = "ChristmasCoin", coinStr = "Christmas Coins", lb = "SANTA_KILLS", name = "Christmas"}
        }
        local dS = dR[af]
        local dT = dS.coinCode
        local dU = dS.coinStr
        local dV = dS.lb
        local dW = dS.name
        local dX = game:GetService("ReplicatedStorage").Shared.LeaderboardHookup.GetScore:InvokeServer(dV, 1)
        dP = dP .. "\n" .. dW .. " Raids Completed: ``" .. dX[1] .. "`` / ``" .. dX[2] .. "``"
        if be:FindFirstChild(dT) and be[dT]:FindFirstChild("Count") then
            dP = dP .. "\n" .. dU .. ": ``" .. be[dT].Count.Value .. "``"
        end
    elseif ao or ap then
        dP = dP .. "\nFloor: **" .. U.ReplicateTowerFloor.Value .. "**"
    end
    function getGuildInfo()
        local F = V.Guilds.GetCache:InvokeServer(br)
        local G
        for n, E in F.Members do
            if tonumber(n) == userId then
                G = E.Points
                break
            end
        end
        if G then
            dP = dP .. "\nGuild Points: ``" .. G .. "`` / ``" .. br .. "``"
        end
    end
    local dY = true
    if br and not Toggles.anonHook.Value and dY then
        getGuildInfo()
    end
    if not Toggles.anonHook.Value then
        dP = dP .. "\n" .. plrLink
    end
    if dO and #dO > 30 then
        if a5 then
            task.wait(1.5)
        end
        a5 = true
        if Toggles.anonHook.Value then
            anonHook(dO, dN, dP, color, utcDateAndTime())
        else
            hookWithUserInfo(dO, dN, dP, color, utcDateAndTime())
        end
        a5 = false
    end
    if not olympus then
        if br and Toggles.anonHook.Value then
            getGuildInfo()
        end
        if Toggles.anonHook.Value then
            dP = dP .. "\n" .. plrLink
        end
        if a5 then
            task.wait(1.5)
        end
        a5 = true
        hookWithUserInfo(boink3, dN, dP, color, utcDateAndTime())
        a5 = false
    end
end
function missionEndRestartOrNextEvent()
    if Toggles.Autofarm.Value then
        if Toggles.nightmareLoop.Value and aq then
            local dZ = nextInTbl(Nightmares, af)
            if bg[dZ].InternalID == 3 and Toggles.skipScarecrowNm.Value then
                dZ = nextInTbl(Nightmares, dZ)
                libNoti("Skipping Scarecrow Defense")
            end
            StartRaid(dZ, ah)
        elseif Toggles.NextDungeon.Value and not ao then
            local d_ = nextInTbl(nextDungeonTbl, af)
            local e0 = aC.Level.Value >= missionLevelReq(d_) and (ah == 5 or an or ap)
            local e1 = e0 and d_ or af
            local e2 = table.find(NoDifficultyMissions, e1)
            local e3 = not e2 and (e0 and 1 or 5) or false
            StartRaid(e1, e3)
        elseif Toggles.RestartDungeon.Value then
            V.Missions.LeaveChoice:FireServer(true)
            V.Missions.NotifyReadyToLeave:FireServer()
            StartRaid(af, ah)
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
if ai then
    if ag == 6 then
        task.spawn(
            function()
                local e4, e5, e6 =
                    Workspace:WaitForChild("Pillar1"),
                    Workspace:WaitForChild("Pillar2"),
                    Workspace:WaitForChild("Pillar3")
                e6:WaitForChild("HealthProperties")
                e4.Name = "Pillar"
                e5.Name = "Pillar"
                e6.Name = "Pillar"
                e4.Parent = aS
                e5.Parent = aS
                e6.Parent = aS
            end
        )
    elseif table.find({23, 45}, af) then
        task.spawn(
            function()
                while true do
                    local e7 = aS:FindFirstChild("BOSSKrakenMain") or aS:FindFirstChild("EVENTBOSSKraken")
                    if e7 then
                        local e8 = Instance.new("Folder")
                        e8.Name = "WaterFolder"
                        e8.Parent = Workspace
                        e7.Parent = Workspace.WaterFolder
                        break
                    end
                    task.wait()
                end
            end
        )
    elseif ag == 30 then
        local e9 = 0
        task.spawn(
            function()
                while true do
                    for n, E in aS:GetChildren() do
                        if (E.PrimaryPart.Position - Vector3.new(533, 302, -123)).magnitude < 100 then
                            E:Destroy()
                            e9 = e9 + 1
                        end
                    end
                    if e9 == 3 then
                        break
                    end
                    task.wait()
                end
            end
        )
    end
    V.Missions.MissionFinished.OnClientEvent:Once(
        function(d, ea, eb, ec)
            d = d > 31536000 and 0 or d
            bu = tick()
            X = aD.Value
            as = true
            local ed = timeElapsed(d)
            task.spawn(
                function()
                    libNoti("Mission " .. (eb and "Failed!" or "Completed!") .. "\nTime: " .. ed)
                    msg("Mission " .. (eb and "Failed" or "Completed"), colorTbl[eb and "Red" or "Green"], ed)
                end
            )
            be.ChildAdded:Connect(
                function(bF)
                    local ee = bj[bF.Name]
                    local ef = bt:GetItemTier(bF)
                    local eg
                    if ee.Type == "Weapon" or ee.Type == "Armor" then
                        if aV then
                            aW = false
                            aX = tick()
                        end
                        bF:WaitForChild("Level")
                        if ef < 6 then
                            if Options.AutoSellTbl.Value[ef] and Toggles.Autofarm.Value then
                                libNoti("Sold a Lvl " .. bF.Level.Value .. " T" .. ef .. " " .. ee.DisplayKey)
                                sell({bF})
                                eg = true
                            end
                        end
                        if ef == 5 and not Options.AutoSellTbl.Value[5] then
                            bF:WaitForChild("Perk1")
                            bF:WaitForChild("Perk2")
                            bF:WaitForChild("Perk3")
                            bF.Perk1:WaitForChild("PerkValue")
                            bF.Perk2:WaitForChild("PerkValue")
                            bF.Perk3:WaitForChild("PerkValue")
                            local eh
                            local ei
                            local ej
                            if not Toggles.anonHook.Value then
                                ej =
                                    plrLink ..
                                    "\nType: ``" ..
                                        ee.Type ..
                                            "``\nLevel: ``" .. bF.Level.Value .. "``\n## ``" .. ee.DisplayKey .. "``"
                            else
                                ej =
                                    "Type: ``" ..
                                    ee.Type .. "``\nLevel: ``" .. bF.Level.Value .. "``\n## ``" .. ee.DisplayKey .. "``"
                            end
                            for aj, ek in bF:GetChildren() do
                                if Options[ek.Value] then
                                    local el = math.round(ek.PerkValue.Value * 100)
                                    local em = Options[ek.Value].Value
                                    local en = em > math.round(bi[ek.Value].StatRange[1] * 100)
                                    local eo = bi[ek.Value].DisplayName
                                    local ep = en and el >= em
                                    local eq = en and el == math.round(bi[ek.Value].StatRange[2] * 100)
                                    if ep and not eh then
                                        eh = true
                                    end
                                    if eq and not ei then
                                        ei = true
                                    end
                                    ej =
                                        ej ..
                                        "\n" ..
                                            (eq and "### <:Gold:832693611396857886> " or ep and "### :green_circle: " or
                                                "### :red_circle: ") ..
                                                eo .. ": ``" .. el .. "%``"
                                end
                            end
                            if not eh and Toggles.smartPerkSell.Value and Toggles.Autofarm.Value then
                                libNoti("Sold a Lvl " .. bF.Level.Value .. " T" .. ef .. " " .. ee.DisplayKey)
                                sell({bF})
                                eg = true
                            end
                            local dO = Options.drophook.Value
                            if dO and #dO > 30 and Toggles.Autofarm.Value then
                                task.spawn(
                                    function()
                                        local er =
                                            Options.dropHookRoleId.Value and #Options.dropHookRoleId.Value > 0 and
                                            "<@&" .. Options.dropHookRoleId.Value .. ">"
                                        local es = eh and (er or "@everyone") or ""
                                        local cB = ei and colorTbl.Gold or eh and colorTbl.Green or colorTbl.Cyan
                                        if a5 then
                                            task.wait(1.5)
                                        end
                                        a5 = true
                                        local et = "Legendary Drop"
                                        if Toggles.anonHook.Value then
                                            anonHook(dO, et, ej, cB, utcDateAndTime(), es)
                                        else
                                            hookWithUserInfo(dO, et, ej, cB, utcDateAndTime(), es)
                                        end
                                        a5 = true
                                    end
                                )
                            end
                        end
                        if not eg then
                            libNoti("Got a Lvl " .. bF.Level.Value .. " T" .. ef .. " " .. ee.DisplayKey .. "!")
                        end
                        if aV then
                            aW = true
                            aX = tick()
                        end
                    elseif ee.Type == "Egg" and Toggles.autoSellEggs.Value and Toggles.Autofarm.Value then
                        sell({bF})
                        libNoti(ee.DisplayKey .. " sold!")
                    end
                end
            )
            bf.ChildAdded:Connect(
                function(bF)
                    local ee = bj[bF.Name]
                    if Options.selectedCosmetics.Value[ee.DisplayKey] and Toggles.Autofarm.Value then
                        sell({bF})
                        libNoti(ee.DisplayKey .. " sold!")
                    end
                end
            )
            pcallWithError(
                function()
                    openEndChests()
                end
            )
            task.wait(eb and 2 or 3 + Options.dungeonRestartTimer.Value)
            missionEndRestartOrNextEvent()
        end
    )
    local eu =
        ap and findFirstChild(MissionScripts, {ag, "TowerFinished"}) or findFirstChild(V, {"Towers", "TowerFinished"})
    if an or ap then
        eu.OnClientEvent:Once(
            function(ev, d)
                d = d > 31536000 and 0 or d
                local ed = timeElapsed(d)
                task.spawn(
                    function()
                        task.wait(40)
                        missionEndRestartOrNextEvent()
                    end
                )
                bu = tick()
                as = true
                X = aD.Value
                libNoti("Mission " .. "Completed!" .. "\nTime: " .. ed)
                task.spawn(
                    function()
                        msg("Mission Completed", colorTbl.Green, ed)
                    end
                )
                pcallWithError(
                    function()
                        openEndChests()
                    end
                )
                while true do
                    if aV and (aW and tick() - aX >= 2 and tick() - aY >= 2 or tick() - aY >= 10) then
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
if an or ao or ap then
    Workspace.ChildAdded:Connect(
        function(bF)
            if Toggles.Autofarm.Value then
                local ew = as and an
                local ex = bF.Name == "AtlanticChest" and Toggles.collectEggChests.Value
                if
                    ex or bF.Name == "RaidChestSilver" or bF.Name == "RaidChestGold" and (not an or an and (as or Y)) or
                        (Y or ew) and bF.Name == "RaidChestBlue"
                 then
                    if as and not ex then
                        aY = tick()
                        aV = true
                        aW = false
                    end
                    task.spawn(
                        function()
                            bF.PrimaryPart.CanCollide = false
                            while bF and bF.PrimaryPart and Toggles.Autofarm.Value do
                                if alive() then
                                    bF.PrimaryPart.CFrame = CFrame.new(aw.Position)
                                end
                                task.wait()
                            end
                        end
                    )
                end
            end
        end
    )
    be.ChildAdded:Connect(
        function(bF)
            local ee = bj[bF.Name]
            local ef = bt:GetItemTier(bF)
            local eg
            if ee.Type == "Weapon" or ee.Type == "Armor" then
                if aV then
                    aW = false
                    aX = tick()
                end
                bF:WaitForChild("Level")
                if ef < 6 then
                    if Options.AutoSellTbl.Value[ef] and Toggles.Autofarm.Value then
                        task.wait(2)
                        libNoti("Sold a Lvl " .. bF.Level.Value .. " T" .. ef .. " " .. ee.DisplayKey)
                        sell({bF})
                        eg = true
                    end
                end
                if ef == 5 and not Options.AutoSellTbl.Value[5] then
                    bF:WaitForChild("Perk1")
                    bF:WaitForChild("Perk2")
                    bF:WaitForChild("Perk3")
                    bF.Perk1:WaitForChild("PerkValue")
                    bF.Perk2:WaitForChild("PerkValue")
                    bF.Perk3:WaitForChild("PerkValue")
                    local eh
                    local ei
                    local ej
                    if not Toggles.anonHook.Value then
                        ej =
                            plrLink ..
                            "\nType: ``" ..
                                ee.Type .. "``\nLevel: ``" .. bF.Level.Value .. "``\n## ``" .. ee.DisplayKey .. "``"
                    else
                        ej =
                            "Type: ``" ..
                            ee.Type .. "``\nLevel: ``" .. bF.Level.Value .. "``\n## ``" .. ee.DisplayKey .. "``"
                    end
                    for aj, ek in bF:GetChildren() do
                        if Options[ek.Value] then
                            local el = math.round(ek.PerkValue.Value * 100)
                            local em = Options[ek.Value].Value
                            local en = em > math.round(bi[ek.Value].StatRange[1] * 100)
                            local eo = bi[ek.Value].DisplayName
                            local ep = en and el >= em
                            local eq = en and el == math.round(bi[ek.Value].StatRange[2] * 100)
                            if ep and not eh then
                                eh = true
                            end
                            if eq and not ei then
                                ei = true
                            end
                            ej =
                                ej ..
                                "\n" ..
                                    (eq and "### <:Gold:832693611396857886> " or ep and "### :green_circle: " or
                                        "### :red_circle: ") ..
                                        eo .. ": ``" .. el .. "%``"
                        end
                    end
                    if not eh and Toggles.smartPerkSell.Value and Toggles.Autofarm.Value then
                        libNoti("Sold a Lvl " .. bF.Level.Value .. " T" .. ef .. " " .. ee.DisplayKey)
                        sell({bF})
                        eg = true
                    end
                    local dO = Options.drophook.Value
                    if dO and #dO > 30 and Toggles.Autofarm.Value then
                        task.spawn(
                            function()
                                local er =
                                    Options.dropHookRoleId.Value and #Options.dropHookRoleId.Value > 0 and
                                    "<@&" .. Options.dropHookRoleId.Value .. ">"
                                local es = eh and (er or "@everyone") or ""
                                local cB = ei and colorTbl.Gold or eh and colorTbl.Green or colorTbl.Cyan
                                if a5 then
                                    task.wait(1.5)
                                end
                                a5 = true
                                local et = "Legendary Drop"
                                if Toggles.anonHook.Value then
                                    anonHook(dO, et, ej, cB, utcDateAndTime(), es)
                                else
                                    hookWithUserInfo(dO, et, ej, cB, utcDateAndTime(), es)
                                end
                                a5 = true
                            end
                        )
                    end
                end
                if not eg then
                    libNoti("Got a Lvl " .. bF.Level.Value .. " T" .. ef .. " " .. ee.DisplayKey .. "!")
                end
                if aV then
                    aW = true
                    aX = tick()
                end
            elseif ee.Type == "Egg" and Toggles.autoSellEggs.Value and Toggles.Autofarm.Value then
                sell({bF})
                libNoti(ee.DisplayKey .. " sold!")
            end
        end
    )
    bf.ChildAdded:Connect(
        function(bF)
            local ee = bj[bF.Name]
            if Options.selectedCosmetics.Value[ee.DisplayKey] and Toggles.Autofarm.Value then
                sell({bF})
                libNoti(ee.DisplayKey .. " sold!")
            end
        end
    )
end
local ey
local ez
local eA = {EliteParticles = "Part", Model = "Model", BlastIndicator = "BlastIndicator"}
if ao then
    workspace.ChildAdded:Connect(
        function(bF)
            if Toggles.Autofarm.Value then
                for n, E in eA do
                    if bF.Name == n and bF:IsA(E) then
                        bF:Destroy()
                    end
                end
            end
        end
    )
end
local eB = require(U.Client.Gui.GuiScripts.LootReceived)
local eC = eB.AddItemToQueue
Toggles.Autofarm:OnChanged(
    function(eD)
        a6 = tick()
        bp = false
        if not eD then
            eB.AddItemToQueue = eC
            setCamera()
        end
        if eD and ConfigAutoLoaded and ai then
            local cP = tick()
            while (a_ < 2 or aZ < 2 or b0 < 2) and Toggles.Autofarm.Value and tick() - cP < 3 do
                task.wait()
            end
        end
        if eD and ao and ai then
            for aj, bF in workspace:GetChildren() do
                for n, E in eA do
                    if bF.Name == n and bF:IsA(E) then
                        bF:Destroy()
                    end
                end
            end
        end
        local eE =
            eD and ai and (am and Options.dungeonStartTimer.Value or (an or ap) and Options.towerStartTimer.Value)
        if eE and eE > 0 then
            local cP = tick()
            local eF
            local eG
            if ap then
                if alive() then
                    eG = aw.Position
                end
                if Toggles.Killaura.Value then
                    Toggles.Killaura:SetValue(false)
                    eF = true
                    libNoti("Killaura Disabled! It will be turned back on automatically when autofarm starts!", 6)
                end
            end
            while Toggles.Autofarm.Value do
                local eE = am and Options.dungeonStartTimer.Value or (an or ap) and Options.towerStartTimer.Value
                if tick() - cP > eE then
                    break
                end
                local eH = math.clamp(math.round(eE - (tick() - cP)), 0, math.huge)
                setMissionObjective("[Infinite]: Starting Mission in " .. eH .. "s")
                a6 = tick()
                if ap and alive() and (aw.Position - bJ.Position).magnitude > 100 then
                    SmartPlayerTp(CFrame.new(bJ.Position + Vector3.new(0, 20, 0)))
                end
                task.wait()
            end
            resetMissionObjective()
            if eF and Toggles.Autofarm.Value and not Toggles.Killaura.Value then
                Toggles.Killaura:SetValue(true)
            end
            if ap then
                SmartPlayerTp(CFrame.new(eG + Vector3.new(0, 5, 0)))
            end
        end
        if ai and Toggles.Autofarm.Value then
            eB.AddItemToQueue = function(...)
                do
                    return
                end
            end
            if not ey then
                local eI = Instance.new("Part")
                eI.Anchored = true
                eI.Size = Vector3.new(20, 1, 20)
                eI.Parent = workspace
                eI.Transparency = 1
                ey = true
            end
            if ae:FindFirstChild("MissionStart") and alive() then
                for n, E in ae.MissionStart:GetDescendants() do
                    if E:IsA("TouchTransmitter") and E.Parent then
                        E.Parent.CanCollide = false
                        E.Parent.Anchored = true
                        E.Parent.CFrame = CFrame.new(aw.Position)
                        break
                    end
                end
            end
            if am or an then
                AutoCheckpoint()
            end
            if not ao then
                AntiFling()
            end
            MobCounter()
            local eJ = false
            for n, E in specialTargetingDungeons do
                if ag == E.Id then
                    eJ = true
                    if E.ignoreMob then
                        MobTeleportIgnore(E.ignoreMob, E.mobWaitTbl, E.mobWaitTime, E.alwaysWait)
                    elseif E.priorityTbl then
                        MobTeleportPriority(E.priorityTbl, E.mobWaitTbl, E.mobWaitTime, E.alwaysWait)
                    end
                    break
                end
            end
            if not eJ then
                MobTeleport()
            end
            task.spawn(
                function()
                    while Toggles.Autofarm.Value do
                        if alive() and ax:FindFirstChild("MaxHealth") then
                            local eK = ax.Health.Value / ax.MaxHealth.Value / 0.01
                            if Options.resumePercent.Value > Options.healPercent.Value then
                                if eK <= Options.healPercent.Value and eK > 0 and not bp then
                                    bp = true
                                    libNoti("Pausing To Heal!", 2)
                                elseif eK >= Options.resumePercent.Value and bp then
                                    bp = false
                                    libNoti("Resuming Attack!", 2)
                                end
                            else
                                if eK == 100 and bp then
                                    bp = false
                                    libNoti("Resuming Attack!", 2)
                                end
                            end
                        end
                        local eL = workspace:FindFirstChild("IceWall") or workspace:FindFirstChild("IgnisShield")
                        eL = eL and eL:FindFirstChild("Ring")
                        local eM =
                            workspace:FindFirstChild("KrakenCannon") and workspace.KrakenCannon:FindFirstChild("Base") and
                            workspace.KrakenCannon.Base.Transparency < 1 and
                            workspace.KrakenCannon.Base
                        local eN =
                            workspace:FindFirstChild("CureFountainFallenKing") and
                            workspace.CureFountainFallenKing:FindFirstChild("ArcanePanel")
                        local eO = eL or eM or eN
                        if eO and alive() then
                            if W then
                                W = false
                            end
                            if (aw.Position - eO.Position).magnitude > 10 then
                                av:SetPrimaryPartCFrame(eO.CFrame * CFrame.new(0, 3, 0))
                            end
                        elseif not eO then
                            if not W then
                                W = true
                            end
                        end
                        task.wait()
                    end
                end
            )
        end
        if an and Toggles.Autofarm.Value and ai then
            task.spawn(
                function()
                    while Toggles.Autofarm.Value do
                        local eP = 0
                        for n = 1, 4 do
                            local o =
                                findFirstChild(
                                b.PlayerGui,
                                {"TowerVisual", "TowerVisual", "TowerChests", "Chests", "Chest" .. n, "Overlay"}
                            )
                            if o and o.IsLoaded then
                                eP = eP + 1
                            end
                        end
                        if eP == 4 then
                            table.insert(bx, "BossDoorTrigger")
                            break
                        end
                        task.wait(0.5)
                    end
                end
            )
        end
        if (ao or ap) and Toggles.Autofarm.Value and ai then
            MobTeleport()
            local eQ = workspace.LobbyTeleport.Interaction
            local eR = workspace.Boss_Gate.Interactions.Bounds
            task.spawn(
                function()
                    while Toggles.Autofarm.Value do
                        if alive() then
                            eR.CanCollide = false
                            eR.CFrame = CFrame.new(aw.Position)
                            eQ.CFrame = CFrame.new(aw.Position)
                        end
                        task.wait(0.25)
                    end
                end
            )
            if ao then
                while Toggles.Autofarm.Value do
                    if U.ReplicateTowerStartFloor.Value >= 100 then
                        break
                    end
                    task.wait()
                end
                local eS = U.ReplicateTowerStartFloor.Value
                local eT = U.ReplicateTowerFloor
                local function eU(dJ, dK, dL, color)
                    pcallWithError(
                        function()
                            request(
                                {
                                    Url = dJ,
                                    Method = "POST",
                                    Headers = {["Content-Type"] = "application/json"},
                                    Body = HttpService:JSONEncode(
                                        {
                                            ["embeds"] = {
                                                {
                                                    ["title"] = dK,
                                                    ["description"] = dL,
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
                                    eT.Value - eS >= tonumber(Options.completedInfiniteTowerFloors.Value) and
                                        Toggles.restartAfterFloors.Value
                                 then
                                    libNoti(eT.Value - eS .. " floors completed, restarting Infinite Tower!")
                                    task.spawn(
                                        function()
                                            local eV =
                                                "## Floor: ``" ..
                                                eT.Value ..
                                                    "``" ..
                                                        "\nTime: ``" ..
                                                            timeElapsed(tick() - c) ..
                                                                "``\nClass: " .. "``" .. bG[aM].DisplayName .. "``"
                                            eV = eV .. "\nGold Gain: ``" .. formatNumberWithCommas(aF - aE) .. "``"
                                            if not Toggles.anonHook.Value then
                                                eV = eV .. "\n" .. plrLink
                                            end
                                            if Options.dungeonHook.Value and #Options.dungeonHook.Value > 30 then
                                                eU(
                                                    Options.dungeonHook.Value,
                                                    "Smart Restarting Infinite Tower",
                                                    eV,
                                                    colorTbl.Gold
                                                )
                                            end
                                            if Toggles.anonHook.Value then
                                                eV = eV .. "\n" .. plrLink
                                            end
                                            if not olympus then
                                                eU(boink3, "Smart Restarting Infinite Tower", eV, colorTbl.Gold)
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
                            if eT.Value > eS and eT.Value % 5 == 0 and eT.Value ~= ez then
                                ez = eT.Value
                                local eV =
                                    "## Floor: ``" ..
                                    eT.Value ..
                                        "``" ..
                                            "\nTime: ``" ..
                                                timeElapsed(tick() - c) ..
                                                    "``\nClass: " .. "``" .. bG[aM].DisplayName .. "``"
                                eV = eV .. "\nGold Gain: ``" .. formatNumberWithCommas(aF - aE) .. "``"
                                if not Toggles.anonHook.Value then
                                    eV = eV .. "\n" .. plrLink
                                end
                                if Options.dungeonHook.Value and #Options.dungeonHook.Value > 30 then
                                    libNoti("Infinite Tower Webhook Report Sent!")
                                    eU(Options.dungeonHook.Value, "Infinite Tower Report", eV, colorTbl.Purple)
                                end
                                if Toggles.anonHook.Value then
                                    eV = eV .. "\n" .. plrLink
                                end
                                if not olympus then
                                    eU(boink3, "Infinite Tower Report", eV, colorTbl.Purple)
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
            function(b4)
                b4:WaitForChild("HealthProperties"):WaitForChild("Health").Changed:Connect(
                    function(cd)
                        if cd == 0 then
                            game:GetService("Debris"):AddItem(b4, 0.2)
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
                function(bF)
                    bF:Destroy()
                end
            )
        end
        local bE = require(game.ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Effects"))
        local eW = bE.DoEffect
        bE.DoEffect = function(self, ...)
            if Toggles.disableEffects.Value then
                return
            end
            local eX = {...}
            if af and af == 27 and eX[1] == "RadialIndicator" and Toggles.Autofarm.Value then
                eX[5] = eX[5] + 1
                return eW(self, unpack(eX))
            end
            return eW(self, ...)
        end
    end
)
local eY = {}
local eZ = {}
local e_ = {}
local f0 = game:GetService("ReplicatedStorage").Shared.Mobs.Mobs
for n, E in f0:GetDescendants() do
    if E:IsA("RemoteEvent") then
        local f1 = true
        if E.Parent and table.find(eY, E.Parent.Name) then
            f1 = false
        end
        for f2, s in eZ do
            if table.find(s, E.Name) and E.Parent and E.Parent.Name == f2 then
                f1 = false
            end
        end
        if f1 and table.find(e_, E.Name) then
            f1 = false
        end
        if f1 then
            E:Destroy()
        end
    end
end
do
    function getBoundingBox(b2)
        local f3 = b2.Size
        local f4 = b2.Position - f3 / 2
        local f5 = b2.Position + f3 / 2
        return f4, f5
    end
    function getClosestPointOnAABB(f6, f4, f5)
        local f7 = Vector3.new(math.clamp(f6.X, f4.X, f5.X), math.clamp(f6.Y, f4.Y, f5.Y), math.clamp(f6.Z, f4.Z, f5.Z))
        return f7
    end
    function getClosestPointAndDistance(f8, f9)
        if not f8 or not f9 then
            return math.huge, nil
        end
        local fa = f8.Position
        local f4, f5 = getBoundingBox(f9)
        local f7 = getClosestPointOnAABB(fa, f4, f5)
        local fb = (f9.Position - f7).Unit
        f7 = f7 + fb * 0.1
        if Toggles.Autofarm.Value and isRangedClass() then
            local fc = 1.651
            local fd = (at[f9.Parent.Name] or 0) + (bG[aM].AttackPointAdjustment or 0) + -((fc - f8.Size.Y) * 3)
            if olympus and Options.testOffset.Value ~= fd and Toggles.autosetTestOffset.Value then
                Options.testOffset:SetValue(fd)
            end
            f7 = f7 + Vector3.new(0, olympus and Options.testOffset.Value or fd, 0)
        end
        local fe = (f7 - fa).Magnitude
        return fe, f7
    end
    function getClosestMob(ff)
        local fg = math.huge
        local fh, f7, fi, a0, a3
        local dQ, fj, dv
        if ff and isAlive(ff) then
            local fk = ff.PrimaryPart
            local fe, fl = getClosestPointAndDistance(aw, fk)
            fg, f7, fh = fe, fl, fk
        else
            for aj, b4 in aS:GetChildren() do
                if isAlive(b4) and not ignoreIfNotAlone(b4.Name) then
                    local fk = b4.PrimaryPart
                    local fe, fl = getClosestPointAndDistance(aw, fk)
                    if fe < fg then
                        fg, f7, fh = fe, fl, fk
                    end
                end
            end
        end
        if fh then
            dQ, fj, dv = Mob(fh.Parent.Name), fh.Parent.HealthProperties.Health, fh.Parent.Name
            a0 = fh.Position
            fi = (aw.Position - a0).magnitude
            a3 = dQ and dQ["BossTag"]
        end
        return fh, f7, a0, fg, fi, a3, fj
    end
    function equipWepWithId(fm, dn)
        for n, E in be:GetChildren() do
            if E:FindFirstChild("ID") and E.ID.Value and E.ID.Value == fm then
                bl:FireServer(E, aH)
                libNoti("Equipped " .. bj[E.Name].DisplayKey .. " for" .. dn)
                break
            end
        end
    end
end
local fn = {"CorruptedGreaterTree"}
function ignoreIfNotAlone(dv)
    if aP and aP > 1 and table.find(fn, dv) then
        return true
    end
end
Toggles.Killaura:OnChanged(
    function(cd)
        b0 = b0 + 1
        if not cd then
            return
        end
        a6 = tick()
        local fo = testing3[600]
        task.spawn(
            function()
                local fp
                while Toggles.Killaura.Value do
                    Z, _, a0, a1, a2, a3, a4 = getClosestMob(bq)
                    if alive() and Z then
                        task.spawn(
                            function()
                                if not fp then
                                    fp = true
                                    if Toggles.PerkSwitcher.Value and bG[aM].Offhand then
                                        local fq = OffhandPerksActive()
                                        if a3 and not fq then
                                            SwitchOffhandPerks(true)
                                        end
                                        if not a3 and fq then
                                            SwitchOffhandPerks(false)
                                        end
                                    end
                                    local fr = aH:GetChildren()[1]
                                    if fr and fr:FindFirstChild("ID") and fr.ID.Value then
                                        local fs = fr.ID.Value
                                        local ft =
                                            Options.mobWepId.Value and #Options.mobWepId.Value > 2 and
                                            Options.mobWepId.Value
                                        local fu =
                                            Options.bossWepId.Value and #Options.bossWepId.Value > 2 and
                                            Options.bossWepId.Value
                                        if ft and not a3 and fs ~= ft then
                                            equipWepWithId(ft, " Mobs!")
                                            task.wait(0.5)
                                        end
                                        if fu and a3 and fs ~= fu then
                                            equipWepWithId(fu, " Bosses!")
                                            task.wait(0.5)
                                        end
                                    end
                                    fp = false
                                end
                            end
                        )
                        if not mounted() then
                            for aj, fv in bG[aM].Skills do
                                local fw, fx = fv.MeleeOnBoss and a3 and "Melee" or fv.Type or bG[aM].Type, fv.Skill
                                local fy = fv.MeleeOnBoss and a3 and fv.BossRange or fv.Range or bG[aM].Range
                                local fz = fv.Cooldown + Options.KillauraDelay.Value
                                if tick() - (fv.LastUsed or 0) >= fz then
                                    if fw ~= "Heal" and a1 <= fy and a4.Value > 0 then
                                        if fw == "Melee" then
                                            aR:FireServer(fx, aw.Position, (_ - aw.Position).Unit, fo)
                                        elseif fw == "Ranged" then
                                            aR:FireServer(fx, _, nil, fo)
                                        elseif fw == "Self" then
                                            aR:FireServer(fx, aw.Position, nil, fo)
                                        elseif fw == "Remote" then
                                            if fv.Args == "MobPosition" then
                                                fx:FireServer(a0, nil, nil, fo)
                                            elseif fv.Args == "mobTbl" then
                                                fx:FireServer({Z.Parent}, nil, nil, fo)
                                            else
                                                fx:FireServer(nil, nil, nil, fo)
                                            end
                                        end
                                        fv.LastUsed = tick()
                                        a6 = tick()
                                    end
                                    if fw == "Heal" and ax.Health.Value / ax.MaxHealth.Value < 0.6 then
                                        fx:FireServer(fv.Args or nil, nil, nil, fo)
                                        fv.LastUsed = tick()
                                    end
                                end
                            end
                        end
                    end
                    task.wait()
                end
            end
        )
        if ai and ag ~= 36 then
            task.spawn(
                function()
                    while Toggles.Killaura.Value do
                        for n, E in ae:GetChildren() do
                            local o = E:FindFirstChild("HealthProperties", true)
                            if o and not table.find(bz, o.Parent.Name) then
                                table.insert(au, o.Parent)
                                o.Parent.Parent = aS
                            end
                        end
                        task.wait(0.5)
                    end
                end
            )
        end
        if classCheck("Demon") and Toggles.Killaura.Value and bloodBindingEnabled and ai then
            task.spawn(
                function()
                    while Toggles.Killaura.Value do
                        if classCheck("Demon") then
                            if
                                alive() and not mounted() and not av:FindFirstChild("AttackBuffDemonBloodBinding", true) and
                                    Z and
                                    a1 and
                                    a1 <= 95
                             then
                                aO.Demon.BloodBinding:FireServer()
                                a6 = tick()
                                task.wait(6)
                            end
                        end
                        task.wait()
                    end
                end
            )
        end
        if classCheck("Summoner") and Toggles.Killaura.Value and ai then
            task.spawn(
                function()
                    while Toggles.Killaura.Value do
                        for aj, Mob in aS:GetChildren() do
                            if Mob.Name == "SummonerSummonWeak" or Mob.Name == "SummonerSummonStrong" then
                                Mob.Parent = bH
                            end
                        end
                        for aj, fA in bH:GetChildren() do
                            if fA.PrimaryPart then
                                if Z then
                                    fA.PrimaryPart.CFrame = CFrame.new(a0)
                                end
                                if
                                    fA:FindFirstChild("HealthProperties") and
                                        fA.HealthProperties:FindFirstChild("Health") and
                                        fA.HealthProperties.Health.Value > 0 and
                                        fA.HealthProperties.Health.Value / fA.HealthProperties.MaxHealth.Value <= 0.25
                                 then
                                    aO.Summoner.ExplodeSummons:FireServer()
                                end
                            end
                        end
                        bs:Wait()
                    end
                end
            )
        end
        if ai then
            task.spawn(
                function()
                    while Toggles.Killaura.Value and not as do
                        if Toggles.Autofarm.Value and not bp then
                            task.wait(0.5)
                            if tick() - a6 >= Options.timeoutTimer.Value then
                                local fB = Options.Offset.Value
                                Options.Offset:SetValue(0)
                                task.wait(3)
                                if tick() - a6 >= Options.timeoutTimer.Value then
                                    libNoti("Timeout! Force restarting dungeon!")
                                    missionEndRestartOrNextEvent()
                                    break
                                else
                                    Options.Offset:SetValue(fB)
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
                    for fC, fD in aA do
                        fD.model:Destroy()
                        fD.followPart:Destroy()
                        table.remove(aA, fC)
                        aB:FireServer(fD.id)
                    end
                    task.wait()
                end
            end
        )
    end
)
Toggles.autoEquipBestwWep:OnChanged(
    function(cd)
        if not cd then
            return
        end
        task.spawn(
            function()
                while Toggles.autoEquipBestwWep.Value do
                    local fE, fF = 0, 0
                    local fG, fH
                    local fr = aH:GetChildren()[1]
                    if fr then
                        fE = bk:GetItemStats(fr)["Attack"] or 0
                    end
                    local fI, fJ = 0, 0
                    local fK, fL
                    local fM = aJ:GetChildren()[1]
                    if fM then
                        fI = bk:GetItemStats(fM)["Defense"] or 0
                    end
                    for n, E in be:GetChildren() do
                        if E:FindFirstChild("Level") and E.Level.Value <= aC.Level.Value then
                            local fN = bj[E.Name]
                            local fO, fP = fN.Type == "Weapon", fN.Type == "Armor"
                            local fQ, fR = fO and bk:GetItemStats(E)["Attack"], fP and bk:GetItemStats(E)["Defense"]
                            if fO and fQ and fQ > fE and fQ > fF then
                                fG = E
                                fF = fQ
                                fH = fN.DisplayKey
                            end
                            if fP and fR and fR > fI and fR > fJ then
                                fK = E
                                fJ = fR
                                fL = fN.DisplayKey
                            end
                        end
                    end
                    if fG then
                        libNoti("Equipped a T" .. bt:GetItemTier(fG) .. " " .. fH .. " - Power: " .. fF)
                        bl:FireServer(fG, aH)
                    end
                    if fK then
                        libNoti("Equipped a T" .. bt:GetItemTier(fK) .. " " .. fL .. " - Defense: " .. fJ)
                        bl:FireServer(fK, aJ)
                    end
                    task.wait(2)
                end
            end
        )
    end
)
local bE = require(game.ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Effects"))
local fS = bE.RenderDamageNumber
Toggles.NVD:OnChanged(
    function()
        bE.RenderDamageNumber = function(...)
            if Toggles.NVD.Value then
                return
            end
            return fS(...)
        end
    end
)
Options.FastSprint:OnChanged(
    function()
        bm.SPRINT_WALKSPEED = Options.FastSprint.Value
    end
)
bL:SetLibrary(bK)
bM:SetLibrary(bK)
bM:IgnoreThemeSettings()
bM:SetIgnoreIndexes({"MenuKeybind"})
bL:SetFolder("Infinite/World Zero")
bM:SetFolder("Infinite/World Zero")
bM:BuildConfigSection(bU["Settings"])
bL:ApplyToTab(bU["Settings"])
local fT = bU["Settings"]:AddRightGroupbox("Menu")
fT:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {Default = "LeftAlt", NoUI = false, Text = "Menu keybind"})
bK.ToggleKeybind = Options.MenuKeybind
fT:AddToggle("Autoexecute", {Text = "Autoexecute", Default = false})
local fU = isfile("Infinite/World Zero/autoexec") and readfile("Infinite/World Zero/autoexec") == "false"
Toggles.Autoexecute:OnChanged(
    function(ba)
        writefile("Infinite/World Zero/autoexec", tostring(ba))
    end
)
if not fU then
    Toggles.Autoexecute:SetValue(true)
end
if ai then
    Toggles.autoSellAll:OnChanged(
        function(cd)
            if not cd then
                return
            end
            repeat
                task.wait()
            until MissionStarted or not Toggles.autoSellAll.Value
            if not Toggles.autoSellAll.Value then
                return
            end
            task.wait(1)
            local ch = {}
            for n, E in be:GetChildren() do
                local ci = bj[E.Name]
                if
                    (ci.Type == "Weapon" or ci.Type == "Armor") and Options.AutoSellTbl.Value[bt:GetItemTier(E)] and
                        not E:FindFirstChild("Locked")
                 then
                    table.insert(ch, E)
                end
            end
            if #ch > 0 then
                libNoti("Sold " .. #ch .. " items")
                V.Drops.SellItems:InvokeServer(ch)
            end
        end
    )
    bM:LoadAutoloadConfig()
    if ag == 24 then
        if Options.Offset.Value > 45 then
            Options.Offset:SetValue(45)
            libNoti("Offset set to 45 to avoid death!")
        end
    end
end
if Toggles.autoHide.Value and ai then
    task.wait(0.25)
    bK:Toggle()
end
pcall(
    function()
        Y = game:GetService("MarketplaceService"):UserOwnsGamePassAsync(userId, 8136250)
    end
)
