--// Local Variables
local _s = game:GetService('Players')
local _p = _s.LocalPlayer
local _r = game:GetService('ReplicatedStorage')
local _run = game:GetService('RunService')
local _g = game:GetService('GuiService')
local _vm = game:GetService('VirtualInputManager')

--// Flags
local _f = {}
local _cp
local _fav = false
local _dc
local _tm
local _tl = {
['Zones'] = {
    ['Moosewood'] = CFrame.new(379.875458, 134.500519, 233.5495, -0.033920113, 8.13274355e-08, 0.999424577, 8.98441925e-08, 1, -7.83249803e-08, -0.999424577, 8.7135696e-08, -0.033920113),
    ['Roslit Bay'] = CFrame.new(-1472.9812, 132.525513, 707.644531, -0.00177415239, 1.15743369e-07, -0.99999845, -9.25943056e-09, 1, 1.15759981e-07, 0.99999845, 9.46479251e-09, -0.00177415239),
    ['Forsaken Shores'] = CFrame.new(-2491.104, 133.250015, 1561.2926, 0.355353981, -1.68352852e-08, -0.934731781, 4.69647858e-08, 1, -1.56367586e-10, 0.934731781, -4.38439116e-08, 0.355353981),
    ['Sunstone Island'] = CFrame.new(-913.809143, 138.160782, -1133.25879, -0.746701241, 4.50330218e-09, 0.665159583, 2.84934609e-09, 1, -3.5716119e-09, -0.665159583, -7.71657294e-10, -0.746701241),
    ['Statue of Sovereignty'] = CFrame.new(21.4017925, 159.014709, -1039.14233, -0.865476549, -4.38348664e-08, -0.500949502, -9.38435818e-08, 1, 7.46273798e-08, 0.500949502, 1.11599142e-07, -0.865476549),
    ['Terrapin Island'] = CFrame.new(-193.434143, 135.121979, 1951.46936, 0.512723684, -6.94711346e-08, 0.858553708, 5.44089183e-08, 1, 4.84237539e-08, -0.858553708, 2.18849721e-08, 0.512723684),
    ['Snowcap Island'] = CFrame.new(2607.93018, 135.284332, 2436.13208, 0.909039497, -7.49003748e-10, 0.4167099, 3.38659367e-09, 1, -5.59032465e-09, -0.4167099, 6.49305321e-09, 0.909039497),
    ['Mushgrove Swamp'] = CFrame.new(2434.29785, 131.983276, -691.930542, -0.123090521, -7.92820209e-09, -0.992395461, -9.05862692e-08, 1, 3.2467995e-09, 0.992395461, 9.02970569e-08, -0.123090521),
    ['Ancient Isle'] = CFrame.new(6056.02783, 195.280167, 276.270325, -0.655055285, 1.96010075e-09, 0.755580962, -1.63855578e-08, 1, -1.67997189e-08, -0.755580962, -2.33853594e-08, -0.655055285),
    ['Northern Expedition'] = CFrame.new(-1701.02979, 187.638779, 3944.81494, 0.918493569, -8.5804345e-08, 0.395435959, 8.59132356e-08, 1, 1.74328942e-08, -0.395435959, 1.7961181e-08, 0.918493569),
    ['Northern Summit'] = CFrame.new(19608.791, 131.420105, 5222.15283, 0.462794542, -2.64426987e-08, 0.886465549, -4.47066562e-08, 1, 5.31692343e-08, -0.886465549, -6.42373408e-08, 0.462794542),
    ['Vertigo'] = CFrame.new(-102.40567, -513.299377, 1052.07104, -0.999989033, 5.36423439e-09, 0.00468267547, 5.85247495e-09, 1, 1.04251647e-07, -0.00468267547, 1.04277916e-07, -0.999989033),
    ['Depths Entrance'] = CFrame.new(-15.4965982, -706.123718, 1231.43494, 0.0681341439, 1.15903154e-08, -0.997676194, 7.1017638e-08, 1, 1.64673093e-08, 0.997676194, -7.19745898e-08, 0.0681341439),
    ['Depths'] = CFrame.new(491.758118, -706.123718, 1230.6377, 0.00879980437, 1.29271776e-08, -0.999961257, 1.95575205e-13, 1, 1.29276803e-08, 0.999961257, -1.13956629e-10, 0.00879980437),
    ['Overgrowth Caves'] = CFrame.new(19746.2676, 416.00293, 5403.5752, 0.488031536, -3.30940715e-08, -0.87282598, -3.24267696e-11, 1, -3.79341323e-08, 0.87282598, 1.85413569e-08, 0.488031536),
    ['Frigid Cavern'] = CFrame.new(20253.6094, 756.525818, 5772.68555, -0.781508088, 1.85673343e-08, 0.623895109, 5.92671467e-09, 1, -2.23363816e-08, -0.623895109, -1.3758414e-08, -0.781508088),
    ['Cryogenic Canal'] = CFrame.new(19958.5176, 917.195923, 5332.59375, 0.758922458, -7.29783434e-09, 0.651180983, -4.58880756e-09, 1, 1.65551253e-08, -0.651180983, -1.55522013e-08, 0.758922458),
    ['Glacial Grotto'] = CFrame.new(20003.0273, 1136.42798, 5555.95996, 0.983130038, -3.94455064e-08, 0.182907909, 3.45229765e-08, 1, 3.0096718e-08, -0.182907909, -2.32744615e-08, 0.983130038),
    ["Keeper's Altar"] = CFrame.new(1297.92285, -805.292236, -284.155823, -0.99758029, 5.80044706e-08, -0.0695239156, 6.16549869e-08, 1, -5.03615105e-08, 0.0695239156, -5.45261436e-08, -0.99758029)
},
['Rods'] = {
    ['Heaven Rod'] = CFrame.new(20025.0508, -467.665955, 7114.40234, -0.9998191, -2.41349773e-10, 0.0190212391, -4.76249762e-10, 1, -1.23448247e-08, -0.0190212391, -1.23516495e-08, -0.9998191),
    ['Summit Rod'] = CFrame.new(20213.334, 736.668823, 5707.8208, -0.274440169, 3.53429606e-08, 0.961604178, -1.52819659e-08, 1, -4.11156122e-08, -0.961604178, -2.59789772e-08, -0.274440169),
    ['Kings Rod'] = CFrame.new(1380.83862, -807.198608, -304.22229, -0.692510426, 9.24755454e-08, 0.72140789, 4.86611427e-08, 1, -8.1475676e-08, -0.72140789, -2.13182219e-08, -0.692510426)
}
}

local _zn = {}
local _rn = {}
local _rc = {}
local _rm = {}

for i,v in pairs(_tl['Zones']) do table.insert(_zn, i) end
for i,v in pairs(_tl['Rods']) do table.insert(_rn, i) end

--// Utility Functions
local function _find_class(p, c)
    return p:FindFirstChildOfClass(c)
end

local function _find(p, c)
    return p:FindFirstChild(c)
end

local function _find_type(p, n, c)
    local child = p:FindFirstChild(n)
    if child and child.ClassName == c then
        return child
    end
end

local function _check_fn(f)
    return typeof(f) == 'function'
end

--// Core Functions
local function _get_char()
    return _p.Character or _p.CharacterAdded:Wait()
end

local function _get_root()
    return _get_char():WaitForChild('HumanoidRootPart')
end

local function _get_hum()
    return _get_char():WaitForChild('Humanoid')
end

local function _find_tool()
    if _find_class(_get_char(), 'Tool') and _find(_find_class(_get_char(), 'Tool'), 'values') then
        return _find_class(_get_char(), 'Tool')
    else
        return nil
    end
end

local function _show_msg(text, time)
    if _tm then _tm:Remove() end
    _tm = require(_p.PlayerGui:WaitForChild("GeneralUIModule")):GiveToolTip(_p, text)
    task.spawn(function()
        task.wait(time)
        if _tm then _tm:Remove(); _tm = nil end
    end)
end

--// UI
local _lib
if _check_fn(makefolder) and (_check_fn(isfolder) and not isfolder('data')) then
    makefolder('data')
end
if _check_fn(writefile) and (_check_fn(isfile) and not isfile('data/ui.lua')) then
    writefile('data/ui.lua', game:HttpGet('https://raw.githubusercontent.com/xataxell/fisch/refs/heads/main/library.lua'))
end
if _check_fn(loadfile) then
    _lib = loadfile('data/ui.lua')()
else
    _lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/xataxell/fisch/refs/heads/main/library.lua'))()
end
local Automation = _lib:CreateWindow('Automation')
local Modifications = _lib:CreateWindow('Modifications')
local Teleports = _lib:CreateWindow('Teleports')
local Visuals = _lib:CreateWindow('Visuals')
Automation:Section('Autofarm')
Automation:Toggle('Freeze Character', {location = _f, flag = 'freezechar'})
Automation:Dropdown('Freeze Character Mode', {location = _f, flag = 'freezecharmode', list = {'Rod Equipped', 'Toggled'}})
Automation:Toggle('Auto Cast', {location = _f, flag = 'autocast'})
Automation:Toggle('Auto Shake', {location = _f, flag = 'autoshake'})
Automation:Toggle('Auto Reel', {location = _f, flag = 'autoreel'})
-----
if _check_fn(hookmetamethod) then
Modifications:Section('Hooks')
Modifications:Toggle('No AFK Text', {location = _f, flag = 'noafk'})
Modifications:Toggle('Perfect Cast', {location = _f, flag = 'perfectcast'})
Modifications:Toggle('Always Catch', {location = _f, flag = 'alwayscatch'})
end
Modifications:Section('Client')
Modifications:Toggle('Infinite Oxygen', {location = _f, flag = 'infoxygen'})
Modifications:Toggle('No Temp & Oxygen', {location = _f, flag = 'nopeakssystems'})
-----
Teleports:Section('Locations')
Teleports:Dropdown('Zones', {location = _f, flag = 'zones', list = _zn})
Teleports:Button('Teleport To Zone', function() _get_root().CFrame = _tl['Zones'][_f['zones']] end)
Teleports:Dropdown('Rod Locations', {location = _f, flag = 'rodlocations', list = _rn})
Teleports:Button('Teleport To Rod', function() _get_root().CFrame = _tl['Rods'][_f['rodlocations']] end)
-----
Visuals:Section('Rod')
Visuals:Toggle('Body Rod Chams', {location = _f, flag = 'bodyrodchams'})
Visuals:Toggle('Rod Chams', {location = _f, flag = 'rodchams'})
Visuals:Dropdown('Material', {location = _f, flag = 'rodmaterial', list = {'ForceField', 'Neon'}})
Visuals:Section('Fish Abundance')
Visuals:Toggle('Free Fish Radar', {location = _f, flag = 'fishabundance'})

--// Loops
_run.Heartbeat:Connect(function()
-- Autofarm
if _f['freezechar'] then
    if _f['freezecharmode'] == 'Toggled' then
        if _cp == nil then
            _cp = _get_root().CFrame
        else
            _get_root().CFrame = _cp
        end
    elseif _f['freezecharmode'] == 'Rod Equipped' then
        local rod = _find_tool()
        if rod and _cp == nil then
            _cp = _get_root().CFrame
        elseif rod and _cp ~= nil then
            _get_root().CFrame = _cp
        else
            _cp = nil
        end
    end
else
    _cp = nil
end
if _f['autoshake'] then
    if _find(_p.PlayerGui, 'shakeui') and _find(_p.PlayerGui['shakeui'], 'safezone') and _find(_p.PlayerGui['shakeui']['safezone'], 'button') then
        _g.SelectedObject = _p.PlayerGui['shakeui']['safezone']['button']
        if _g.SelectedObject == _p.PlayerGui['shakeui']['safezone']['button'] then
            _vm:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
            _vm:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
        end
    end
end
if _f['autocast'] then
    local rod = _find_tool()
    if rod ~= nil and rod['values']['lure'].Value <= .001 and task.wait(.5) then
        rod.events.cast:FireServer(100, 1)
    end
end
if _f['autoreel'] then
    local rod = _find_tool()
    if rod ~= nil and rod['values']['lure'].Value == 100 and task.wait(.5) then
        _r.events.reelfinished:FireServer(100, true)
    end
end

-- Visuals
if _f['rodchams'] then
    local rod = _find_tool()
    if rod ~= nil and _find(rod, 'Details') then
        local rodName = tostring(rod)
        if not _rc[rodName] then
            _rc[rodName] = {}
            _rm[rodName] = {}
        end
        for i,v in rod['Details']:GetDescendants() do
            if v:IsA('BasePart') or v:IsA('MeshPart') then
                if v.Color ~= Color3.fromRGB(100, 100, 255) then
                    _rc[rodName][v.Name..i] = v.Color
                end
                if _rm[rodName][v.Name..i] == nil then
                    if v.Material == Enum.Material.Neon then
                        _rm[rodName][v.Name..i] = Enum.Material.Neon
                    elseif v.Material ~= Enum.Material.ForceField and v.Material ~= Enum.Material[_f['rodmaterial']] then
                        _rm[rodName][v.Name..i] = v.Material
                    end
                end
                v.Material = Enum.Material[_f['rodmaterial']]
                v.Color = Color3.fromRGB(100, 100, 255)
            end
        end
        if rod['handle'].Color ~= Color3.fromRGB(100, 100, 255) then
            _rc[rodName]['handle'] = rod['handle'].Color
        end
        if rod['handle'].Material ~= Enum.Material.ForceField and rod['handle'].Material ~= Enum.Material.Neon and rod['handle'].Material ~= Enum.Material[_f['rodmaterial']] then
            _rm[rodName]['handle'] = rod['handle'].Material
        end
        rod['handle'].Material = Enum.Material[_f['rodmaterial']]
        rod['handle'].Color = Color3.fromRGB(100, 100, 255)
    end
elseif not _f['rodchams'] then
    local rod = _find_tool()
    if rod ~= nil and _find(rod, 'Details') then
        local rodName = tostring(rod)
        if _rc[rodName] and _rm[rodName] then
            for i,v in rod['Details']:GetDescendants() do
                if v:IsA('BasePart') or v:IsA('MeshPart') then
                    if _rm[rodName][v.Name..i] and _rc[rodName][v.Name..i] then
                        v.Material = _rm[rodName][v.Name..i]
                        v.Color = _rc[rodName][v.Name..i]
                    end
                end
            end
            if _rm[rodName]['handle'] and _rc[rodName]['handle'] then
                rod['handle'].Material = _rm[rodName]['handle']
                rod['handle'].Color = _rc[rodName]['handle']
            end
        end
    end
end
if _f['bodyrodchams'] then
    local rod = _get_char():FindFirstChild('RodBodyModel')
    if rod ~= nil and _find(rod, 'Details') then
        local rodName = tostring(rod)
        if not _rc[rodName] then
            _rc[rodName] = {}
            _rm[rodName] = {}
        end
        for i,v in rod['Details']:GetDescendants() do
            if v:IsA('BasePart') or v:IsA('MeshPart') then
                if v.Color ~= Color3.fromRGB(100, 100, 255) then
                    _rc[rodName][v.Name..i] = v.Color
                end
                if _rm[rodName][v.Name..i] == nil then
                    if v.Material == Enum.Material.Neon then
                        _rm[rodName][v.Name..i] = Enum.Material.Neon
                    elseif v.Material ~= Enum.Material.ForceField and v.Material ~= Enum.Material[_f['rodmaterial']] then
                        _rm[rodName][v.Name..i] = v.Material
                    end
                end
                v.Material = Enum.Material[_f['rodmaterial']]
                v.Color = Color3.fromRGB(100, 100, 255)
            end
        end
        if rod['handle'].Color ~= Color3.fromRGB(100, 100, 255) then
            _rc[rodName]['handle'] = rod['handle'].Color
        end
        if rod['handle'].Material ~= Enum.Material.ForceField and rod['handle'].Material ~= Enum.Material.Neon and rod['handle'].Material ~= Enum.Material[_f['rodmaterial']] then
            _rm[rodName]['handle'] = rod['handle'].Material
        end
        rod['handle'].Material = Enum.Material[_f['rodmaterial']]
        rod['handle'].Color = Color3.fromRGB(100, 100, 255)
    end
elseif not _f['bodyrodchams'] then
    local rod = _get_char():FindFirstChild('RodBodyModel')
    if rod ~= nil and _find(rod, 'Details') then
        local rodName = tostring(rod)
        if _rc[rodName] and _rm[rodName] then
            for i,v in rod['Details']:GetDescendants() do
                if v:IsA('BasePart') or v:IsA('MeshPart') then
                    if _rm[rodName][v.Name..i] and _rc[rodName][v.Name..i] then
                        v.Material = _rm[rodName][v.Name..i]
                        v.Color = _rc[rodName][v.Name..i]
                    end
                end
            end
            if _rm[rodName]['handle'] and _rc[rodName]['handle'] then
                rod['handle'].Material = _rm[rodName]['handle']
                rod['handle'].Color = _rc[rodName]['handle']
            end
        end
    end
end
if _f['fishabundance'] then
    if not _fav then
        _show_msg('<b><font color = "#9eff80">Fish Abundance Zones</font></b> are now visible', 5)
    end
    for i,v in workspace.zones.fishing:GetChildren() do
        if _find_type(v, 'Abundance', 'StringValue') and _find_type(v, 'radar1', 'BillboardGui') then
            v['radar1'].Enabled = true
            v['radar2'].Enabled = true
        end
    end
    _fav = _f['fishabundance']
else
    if _fav then
        _show_msg('<b><font color = "#9eff80">Fish Abundance Zones</font></b> are no longer visible', 5)
    end
    for i,v in workspace.zones.fishing:GetChildren() do
        if _find_type(v, 'Abundance', 'StringValue') and _find_type(v, 'radar1', 'BillboardGui') then
            v['radar1'].Enabled = false
            v['radar2'].Enabled = false
        end
    end
    _fav = _f['fishabundance']
end

-- Modifications
if _f['infoxygen'] then
    if not _dc then
        _dc = _get_hum().Died:Connect(function()
            task.delay(9, function()
                if _find_type(_get_char(), 'DivingTank', 'Decal') then
                    _find_type(_get_char(), 'DivingTank', 'Decal'):Destroy()
                end
                local oxygentank = Instance.new('Decal')
                oxygentank.Name = 'DivingTank'
                oxygentank.Parent = workspace
                oxygentank:SetAttribute('Tier', 1/0)
                oxygentank.Parent = _get_char()
                _dc = nil
            end)
        end)
    end
    if _dc and _get_hum().Health > 0 then
        if not _get_char():FindFirstChild('DivingTank') then
            local oxygentank = Instance.new('Decal')
            oxygentank.Name = 'DivingTank'
            oxygentank.Parent = workspace
            oxygentank:SetAttribute('Tier', 1/0)
            oxygentank.Parent = _get_char()
        end
    end
else
    if _find_type(_get_char(), 'DivingTank', 'Decal') then
        _find_type(_get_char(), 'DivingTank', 'Decal'):Destroy()
    end
end
if _f['nopeakssystems'] then
    _get_char():SetAttribute('WinterCloakEquipped', true)
    _get_char():SetAttribute('Refill', true)
else
    _get_char():SetAttribute('WinterCloakEquipped', nil)
    _get_char():SetAttribute('Refill', false)
end
end)

--// Hooks
if _check_fn(hookmetamethod) then
local old; old = hookmetamethod(game, "__namecall", function(self, ...)
    local method, args = getnamecallmethod(), {...}
    if method == 'FireServer' and self.Name == 'afk' and _f['noafk'] then
        args[1] = false
        return old(self, unpack(args))
    elseif method == 'FireServer' and self.Name == 'cast' and _f['perfectcast'] then
        args[1] = 100
        return old(self, unpack(args))
    elseif method == 'FireServer' and self.Name == 'reelfinished' and _f['alwayscatch'] then
        args[1] = 100
        args[2] = true
        return old(self, unpack(args))
    end
    return old(self, ...)
end)
end
