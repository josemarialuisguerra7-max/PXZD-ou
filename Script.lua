-- Deobfuscated by ccjvwsod on Discord
-- Detected obfuscation: Luraph v15
-- Local names are inferred from use (the original names are not in the bytecode)

local fn, v, v2, defaultTab, Players, RunService, ReplicatedStorage, CoreGui, UserInputService, localPlayer
local networking, fn2, tbl, v3, fn3, fn4, tbl2, fn5, fn6, tbl3
local tbl4, fn7, n, n2, v4, v5, espSection, tbl5, color, sequence
local palettes, red

do
	local CollectionService, ProximityPromptService, v6, v7, tbl6, tbl7, tbl8

	do
		fn = function(arg)
			local genv = typeof(getgenv) == "function" and getgenv() or _G

			if type(genv.ChilliDebugPrint) == "function" then
				pcall(genv.ChilliDebugPrint, arg)
			end
		end

		task.spawn(pcall, function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/refs/heads/main/DiscordLink"))()
		end)

		local function fn8()
			local response = nil

			local function fn9()
				if type(response) == "string" and #response > 0 then
					return response
				end
				response = game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli%20Library")
				return response
			end

			local function fn10()
				local chilliHubSaeCleanup = (typeof(getgenv) == "function" and getgenv() or _G).ChilliHubSaeCleanup

				if type(chilliHubSaeCleanup) == "function" then
					pcall(chilliHubSaeCleanup)
				end

				local tbl9 = { game:GetService("CoreGui") }

				if typeof(gethui) == "function" then
					local ok, result = pcall(gethui)

					if ok and typeof(result) == "Instance" then
						table.insert(tbl9, result)
					end
				end

				local tbl10 = {
					Settings = true,
					ChilliLeftCenter = true,
					ChilliLibrarySettings = true,
					ChilliLibraryLauncher = true,
				}

				local n3 = 0

				for _, v8 in ipairs(tbl9) do
					for _, child in ipairs(v8:GetChildren()) do
						if child:IsA("ScreenGui") and (child:GetAttribute("ChilliLibraryOwned") == true or tbl10[child.Name]) then
							pcall(function()
								child:Destroy()
							end)

							n3 += 1
						end
					end
				end

				if n3 > 0 then
					fn("cleared " .. n3 .. " leftover Chilli UI screens")
				end
			end

			local function fn11()
				local v8 = fn9()
				local chunk, v9 = loadstring(v8)
				assert(chunk, v9)
				local v10 = chunk()
				assert(type(v10) == "function", "Chilli Library bootstrap is invalid.")
				local v11 = table.create(45)
				local n3 = 1

				for i = 1, 90, 2 do
					v11[n3] = string.char(bit32.bxor(tonumber(string.sub("306908100841206d474f00185f26635b2101387507010810127d7d477a473b6f435a0916573165562900226c00", i, i + 1), 16), string.byte("s9K!2vQ#", (n3 - 1) % 8 + 1)))
					n3 += 1
				end

				return v10(table.concat(v11))
			end

			local chilliLibraryFailedToLoad = "unknown"

			for i = 1, 6 do
				task.wait()
				pcall(fn10)
				local ok, result = pcall(fn11)
				if ok and type(result) == "table" then
					return result
				end
				chilliLibraryFailedToLoad = tostring(result)

				if type(chilliLibraryFailedToLoad) == "string" and string.find(chilliLibraryFailedToLoad, "HttpGet", 1, true) then
					response = nil
				end

				fn("library load attempt " .. i .. " failed: " .. chilliLibraryFailedToLoad)
				task.wait(1 + i * 0.5)
			end

			error("Chilli Library failed to load: " .. chilliLibraryFailedToLoad, 0)
		end

		v = fn8()
		assert(type(v) == "table" and type(v.CreateWindow) == "function" and type(v.Finalize) == "function", "Chilli Library returned an invalid API.")

		v.ManualQuickDefaults = {
			PinnedFeatures = { "Player > Movement > Speed Boost", "Player > Movement > Boost Speed" },
			Keybinds = { ["Player > Movement > Speed Boost"] = "Q" },
			PinGroups = {},
			LeftCenterHidden = true,
		}

		v2 = v:CreateWindow({ Name = "Chilli Hub - Steal An Egg", DefaultTab = "Farm" })
		defaultTab = v2:GetDefaultTab()
		Players = game:GetService("Players")
		RunService = game:GetService("RunService")
		ReplicatedStorage = game:GetService("ReplicatedStorage")
		CoreGui = game:GetService("CoreGui")
		UserInputService = game:GetService("UserInputService")
		CollectionService = game:GetService("CollectionService")
		game:GetService("LocalizationService")
		ProximityPromptService = game:GetService("ProximityPromptService")
		localPlayer = Players.LocalPlayer
		networking = ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Networking")

		fn2 = function(arg)
			local ok, result = pcall(function()
				return require(arg())
			end)

			return ok and result or nil
		end

		tbl = {
			EggState = fn2(function()
				return ReplicatedStorage.Client.EggState
			end),
			AreaEggs = fn2(function()
				return ReplicatedStorage.Shared.Types.AreaEggs
			end),
			ToolGameplayGuard = fn2(function()
				return ReplicatedStorage.Client.ToolGameplayGuard
			end),
			Assets = fn2(function()
				return ReplicatedStorage.Data.Assets
			end),
			Guards = fn2(function()
				return ReplicatedStorage.Data.Guards
			end),
			EggRecords = fn2(function()
				return ReplicatedStorage.Shared.Util.EggRecords
			end),
			Mutations = fn2(function()
				return ReplicatedStorage.Shared.Modules.Mutations
			end),
			Save = fn2(function()
				return ReplicatedStorage.Shared.Save
			end),
			FuseKernel = fn2(function()
				return ReplicatedStorage.Shared.Util.FuseKernel
			end),
			AreaEggCycle = fn2(function()
				return ReplicatedStorage.Shared.Util.AreaEggCycle
			end),
			AreaEggResetWall = fn2(function()
				return ReplicatedStorage.Client.AreaEggResetWall
			end),
			AreaEggResetCycle = fn2(function()
				return ReplicatedStorage.Data.AreaEggResetCycle
			end),
			Gears = fn2(function()
				return ReplicatedStorage.Data.Gears
			end),
			Areas = fn2(function()
				return ReplicatedStorage.Data.Areas
			end),
			LimitedEgg = fn2(function()
				return ReplicatedStorage.Data.LimitedEgg
			end),
			BrainrotEgg = fn2(function()
				return ReplicatedStorage.Data.BrainrotEgg
			end),
			MonsterEgg = fn2(function()
				return ReplicatedStorage.Data.MonsterEgg
			end),
		}

		local save = tbl.Save

		if type(save) == "table" and (type(save.Get) ~= "function" or type(save.FieldSignal) ~= "function") then
			tbl.Save = setmetatable({
				Get = type(save.Get) == "function" and save.Get or save.Peek,
				FieldSignal = type(save.FieldSignal) == "function" and save.FieldSignal or save.Watch,
			}, { __index = save })
		end

		local function fn9()
			if typeof(gethui) == "function" then
				local ok, result = pcall(gethui)
				if ok and typeof(result) == "Instance" then
					return result
				end
			end

			return CoreGui
		end

		v3 = fn9()

		do
			local v8 = Random.new()
			local str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

			fn3 = function()
				local v9 = v8:NextInteger(12, 20)
				local v10 = table.create(v9)

				for i = 1, v9 do
					local v11 = v8:NextInteger(1, #str)
					v10[i] = string.sub("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789", v11, v11)
				end

				return table.concat(v10)
			end
		end

		do
			local tbl9 = {}

			fn4 = function(arg)
				table.insert(tbl9, arg)
			end

			tbl2 = {}

			fn5 = function(arg, arg2)
				local n3 = 1000
				local n4 = 3
				local n5 = 12

				local function fn10(arg3)
					if arg3 <= 0 then
						return 0
					end
					local n6 = 10 ^ (math.floor(math.log10(arg3)) - 2)
					return math.floor(arg3 / n6 + 0.5) * n6
				end

				local function fn11(arg3)
					local n6 = math.clamp(tonumber(arg3) or 0, 0, 1000)
					if n6 <= 0 then
						return 0
					end
					return fn10(10 ^ (n4 + (n5 - n4) * n6 / n3))
				end

				local function fn12(arg3)
					local n6 = tonumber(arg3) or 0
					if n6 <= 0 then
						return 0
					end
					local n7 = n5 - n4
					return math.clamp(math.floor((math.log10(n6) - n4) / n7 * n3 * 100 + 0.5) / 100, 0, 1000)
				end

				local function fn13(arg3)
					local str = string.format(arg3 >= 100 and "%.0f" or arg3 >= 10 and "%.1f" or "%.2f", arg3)

					if string.find(str, ".", 1, true) then
						str = string.gsub(string.gsub(str, "0+$", ""), "%.$", "")
					end

					return str
				end

				local function fn14(arg3)
					local v8 = fn11(arg3)
					if v8 <= 0 then
						return "Off"
					end

					if v8 < 1000000 then
						return fn13(v8 / 1000) .. " K/s"
					end

					if v8 < 1e9 then
						return fn13(v8 / 1000000) .. " M/s"
					end
					return fn13(v8 / 1e9) .. " B/s"
				end

				local function fn15(arg3)
					local v8 = fn11(arg3)
					if v8 <= 0 then
						return "0"
					end

					if v8 < 1000000 then
						return fn13(v8 / 1000) .. "k"
					end
					return (string.gsub(string.gsub(string.format("%.3f", v8 / 1000000), "0+$", ""), "%.$", ""))
				end

				local tbl10 = { k = 1000, m = 1000000, b = 1e9, t = 1e12 }

				local function fn16(arg3)
					local v8 = string.gsub(string.lower(string.gsub(tostring(arg3 or ""), "[%s,/]", "")), "s$", "")
					if v8 == "" or v8 == "off" then
						return 0
					end
					local v9, v10 = string.match(v8, "^([%d%.]+)([kmbt]?)$")
					local num = tonumber(v9)
					if not num then
						return nil
					end
					return fn12(num * (tbl10[v10] or 1000000))
				end

				local v8 = arg:CreateSlider({
					Name = arg2.Name,
					Note = arg2.Note,
					SubOf = arg2.SubOf,
					Min = 0,
					Max = n3,
					Default = fn12(arg2.Default or 0),
					AllowDecimals = true,
					Increment = 0.01,
					ValueFormat = fn14,
					ValueParse = fn16,
					Callback = function(arg3)
						if type(arg2.OnRaw) == "function" then
							arg2.OnRaw(fn11(arg3))
						end
					end,
				})

				local value = type(v8) == "table" and rawget(v8, "Instance") or nil

				if typeof(value) == "Instance" then
					for _, descendant in ipairs(value:GetDescendants()) do
						if descendant:IsA("TextBox") then
							local connection = descendant.Focused:Connect(function()
								task.defer(function()
									if descendant:IsFocused() then
										local ok, result = pcall(v8.Get, v8)
										descendant.Text = fn15(ok and result or 0)
										descendant.CursorPosition = #descendant.Text + 1
										descendant.SelectionStart = 1
									end
								end)
							end)

							fn4(function()
								pcall(function()
									connection:Disconnect()
								end)
							end)
						end
					end
				end

				if type(arg2.Legacy) == "string" and type(arg2.SectionName) == "string" then
					table.insert(tbl2, { Handle = v8, Name = arg2.Name, Legacy = arg2.Legacy, Section = arg2.SectionName, StepOf = fn12 })
				end

				return v8
			end

			local text = "All"

			fn6 = function(arg)
				if type(arg) ~= "table" then
					return arg
				end
				local value = rawget(arg, "Instance")
				if typeof(value) ~= "Instance" then
					return arg
				end
				local flag = false

				local function fn10(arg2)
					if flag then
						return
					end

					if arg2.Text == "None" then
						flag = true
						arg2.Text = text
						flag = false
					end
				end

				local function fn11(descendant)
					if not descendant:IsA("TextLabel") or descendant.Name ~= "Value" then
						return
					end
					fn10(descendant)

					local connection = descendant:GetPropertyChangedSignal("Text"):Connect(function()
						fn10(descendant)
					end)

					fn4(function()
						pcall(function()
							connection:Disconnect()
						end)
					end)
				end

				for _, descendant in ipairs(value:GetDescendants()) do
					fn11(descendant)
				end

				local connection = value.DescendantAdded:Connect(fn11)

				fn4(function()
					pcall(function()
						connection:Disconnect()
					end)
				end)

				return arg
			end

			local genv = typeof(getgenv) == "function" and getgenv() or _G
			local chilliHubSaeCleanup = genv.ChilliHubSaeCleanup

			if type(chilliHubSaeCleanup) == "function" then
				pcall(chilliHubSaeCleanup)
			end

			genv.ChilliHubSaeCleanup = function()
				for i = #tbl9, 1, -1 do
					pcall(tbl9[i])
				end

				table.clear(tbl9)
			end
		end

		do
			local n3 = 0
			local fn10 = nil

			fn10 = function(arg, arg2)
				local n4 = arg2 or 0

				if type(arg) == "table" then
					if n4 > 3 then
						return
					end
					local n5 = 0

					for k, v8 in pairs(arg) do
						n5 += 1

						if not (n5 > 20) then
							fn10(k, n4 + 1)
							fn10(v8, n4 + 1)
							continue
						end

						break
					end
				elseif typeof(arg) == "Instance" then
					pcall(arg.GetFullName, arg)
				else
					n3 += #tostring(arg)
				end
			end

			local tbl9 = {}

			local function fn11(arg)
				tbl9[#tbl9 + 1] = arg
			end

			local function fn12()
				for _, v8 in ipairs(tbl9) do
					pcall(function()
						v8:Disconnect()
					end)
				end

				table.clear(tbl9)
			end

			local function chilliToolKeeper()
				fn12()

				for _, v8 in ipairs({
					"RE/GearSatchel/Lost",
					"RE/GearSatchel/Gained",
					"RE/RigSync/ProbeSatchel",
					"RE/RigSync/SeedSatchel",
					"RE/RigSync/CorrectionBegan",
					"RE/RigSync/Refresh",
					"RE/ToolTrigger/Trigger",
					"RE/BatSwing/Trigger",
				}) do
					local v9 = networking:FindFirstChild(v8)

					if v9 and v9:IsA("RemoteEvent") then
						fn11(v9.OnClientEvent:Connect(function(...)
							fn10({ ... })
						end))
					end
				end

				local function fn13(arg)
					if not arg then
						return
					end

					fn11(arg.ChildRemoved:Connect(function(child)
						if child:IsA("Tool") then
							fn10({ child.Name, child.Parent })
						end
					end))

					fn11(arg.ChildAdded:Connect(function(child)
						if child:IsA("Tool") then
							fn10({ child.Name })
						end
					end))
				end

				fn13(localPlayer:FindFirstChildOfClass("Backpack"))

				fn11(localPlayer.ChildAdded:Connect(function(child)
					if child:IsA("Backpack") then
						fn13(child)
					end
				end))

				task.spawn(function()
					pcall(function()
						local v8 = tbl.Save.Get()
						fn10({ v8.GearInventory, v8.Inventory }, 2)
					end)

					if type(getgc) == "function" then
						pcall(function()
							for _, v8 in ipairs(getgc(false)) do
								if type(v8) == "function" and islclosure(v8) then
									pcall(debug.info, v8, "n")
								end
							end
						end)
					end
				end)
			end
			;(typeof(getgenv) == "function" and getgenv() or _G).ChilliToolKeeper = chilliToolKeeper
			task.defer(chilliToolKeeper)
			fn4(fn12)
		end

		do
			local n3 = 0.35
			local n4 = 5
			local tbl9 = {}
			local flag = true

			tbl3 = {
				Add = function(arg)
					local tbl10 = { Run = arg, Gap = n3, Idle = n4, Repeat = false, Hold = 0 }
					table.insert(tbl9, tbl10)
					return tbl10
				end,
				Wake = function()
					flag = true
				end,
				Backoff = function(arg, arg2)
					if arg then
						arg.Hold = tonumber(arg2) or 6
					end
				end,
			}

			local connection = RunService.Heartbeat:Connect(function(deltaTime)
				local v8 = flag
				flag = false

				for _, v9 in ipairs(tbl9) do
					v9.Gap = v9.Gap + deltaTime
					v9.Idle = v9.Idle + deltaTime

					if v9.Hold > 0 then
						v9.Hold = v9.Hold - deltaTime
					elseif v9.Gap >= n3 and (v8 or v9.Repeat or v9.Idle >= n4) then
						v9.Gap = 0
						v9.Idle = 0
						local ok, result = pcall(v9.Run, v9)
						v9.Repeat = ok and result == true
					end
				end
			end)

			fn4(function()
				connection:Disconnect()
			end)
		end

		v6 = defaultTab:CreateSection({ Name = "Dr Scramble Event", Expanded = false })
		local v8
		v8 = defaultTab:CreateSection({ Name = "Auto Steal", Expanded = true })
		local v9
		v9 = defaultTab:CreateSection({ Name = "Auto Place Egg", Expanded = false })
		local v10
		v10 = defaultTab:CreateSection({ Name = "Auto Treadmill", Expanded = false })
		local v11
		v11 = defaultTab:CreateSection({ Name = "Auto Hatch & Equip", Expanded = false })
		local v12
		v12 = defaultTab:CreateSection({ Name = "Auto Sell", Expanded = false })
		local v13
		v13 = defaultTab:CreateSection({ Name = "Auto Fuse Machine", Expanded = false })
		local v14
		v14 = defaultTab:CreateSection({ Name = "Auto Favorite", Expanded = false })
		v7 = defaultTab:CreateSection({ Name = "Auto Rift & Boss", Expanded = false })
		tbl6 = { Paused = false }

		do
			local n3 = 0.5
			local v15 = nil
			local tbl9 = nil
			local tbl10 = {}
			local flag = false
			local n4 = 0

			local function fn10()
				for i = #tbl10, 1, -1 do
					local v16 = tbl10[i]

					if v16 and v16.Connected then
						v16:Disconnect()
					end

					tbl10[i] = nil
				end
			end

			local function fn11()
				fn10()
				local v16 = v15
				local v17 = tbl9
				v15 = nil
				tbl9 = nil
				if not v16 or not v16.Parent or not v17 then
					return
				end

				pcall(function()
					v16.BreakJointsOnDeath = v17.BreakJointsOnDeath
					v16.RequiresNeck = v17.RequiresNeck
					v16:SetStateEnabled(Enum.HumanoidStateType.Dead, v17.DeadEnabled)
				end)
			end

			local function fn12(arg)
				if not arg or not arg.Parent then
					return false
				end

				return pcall(function()
					arg.BreakJointsOnDeath = false
					arg.RequiresNeck = false
					arg:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
				end) and arg.BreakJointsOnDeath == false and arg.RequiresNeck == false and arg:GetStateEnabled(Enum.HumanoidStateType.Dead) == false
			end

			local function fn13(arg)
				if tbl6.Paused or arg ~= v15 or not arg or not arg.Parent or flag then
					return false
				end
				local maxHealth = arg.MaxHealth
				if maxHealth <= 0 then
					return false
				end

				if maxHealth == math.huge or arg.Health >= maxHealth then
					return true
				end
				flag = true

				local ok = pcall(function()
					arg.Health = maxHealth
				end)

				flag = false
				return ok and arg.Health >= maxHealth
			end

			local function fn14(arg)
				if arg == v15 and arg and arg.Parent then
					return true
				end
				fn11()
				if not arg or not arg:IsA("Humanoid") or not arg.Parent then
					return false
				end
				v15 = arg

				tbl9 = {
					BreakJointsOnDeath = arg.BreakJointsOnDeath,
					RequiresNeck = arg.RequiresNeck,
					DeadEnabled = arg:GetStateEnabled(Enum.HumanoidStateType.Dead),
				}

				if not fn12(arg) then
					fn11()
					return false
				end
				fn13(arg)

				tbl10[#tbl10 + 1] = arg.HealthChanged:Connect(function()
					fn13(arg)
				end)

				tbl10[#tbl10 + 1] = arg:GetPropertyChangedSignal("MaxHealth"):Connect(function()
					fn13(arg)
				end)

				tbl10[#tbl10 + 1] = arg.StateChanged:Connect(function(old, new)
					if new == Enum.HumanoidStateType.Dead and not tbl6.Paused then
						fn12(arg)
						fn13(arg)
					end
				end)

				n4 = os.clock()
				return true
			end

			local function fn15()
				local character = localPlayer.Character
				return character and character:FindFirstChildOfClass("Humanoid") or nil
			end

			local connection = localPlayer.CharacterAdded:Connect(function()
				task.defer(function()
					fn14(fn15())
				end)
			end)

			local connection2 = RunService.Heartbeat:Connect(function()
				local now = os.clock()
				if tbl6.Paused or now - n4 < n3 then
					return
				end
				n4 = now
				local v16 = fn15()
				if v16 ~= v15 then
					fn14(v16)
					return
				end

				if v16 then
					fn12(v16)
					fn13(v16)
				end
			end)

			task.defer(function()
				fn14(fn15())
			end)

			fn4(function()
				if connection then
					connection:Disconnect()
				end

				if connection2 then
					connection2:Disconnect()
				end

				fn11()
			end)
		end

		local tbl9 = { "bat", "katana", "axe", "staff", "club", "hammer", "sword", "blade" }

		tbl4 = {
			Steal = { Active = false, LastFinishedAt = 0, Carrying = false },
			Movement = {
				Owner = nil,
				PlaceWanted = false,
				StealFirst = false,
				MutationWanted = false,
				FracturedWanted = false,
			},
			AntiGuard = {
				Enabled = false,
				Busy = false,
				BusySince = 0,
				HitArms = 0,
				Handle = nil,
				Render = nil,
			},
			IsBatTool = function(arg)
				if typeof(arg) ~= "Instance" or not arg:IsA("Tool") then
					return false
				end

				if arg:GetAttribute("IsBat") == true then
					return true
				end
				local attribute = arg:GetAttribute("GearName")

				if type(attribute) == "string" then
					local gears = tbl.Gears
					local directory = type(gears) == "ta
