--[[

Gui Converted By gui2lua (https://www.roblox.com/library/1343400903/Gui-to-Lua-Converter-Revamped)

Rayfield Library (https://github.com/shlexware/Rayfield) by Sirius (https://discord.gg/sirius) -- Coming Next Update

Loading Gui by me

Discord Coming Soon

]]--

-- Instances:

local RolexHub = Instance.new("ScreenGui")
local Loading = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextButton = Instance.new("TextButton")

--Properties:

local function RandomString(length, start, lend)
	local Chars = "abcdefghijklmnopqrstuvwxyz".."ABCDEFGHIJKLMNOPQRSTUVWXYZ".."1234567890".." ".."_"
	local Final = tostring(start) or ""
	for i = 1, length do
		local CharRandom = math.random(1, #Chars)
		local Char = string.sub(Chars, CharRandom, CharRandom)
		Final = Final..Char
	end
	return Final..tostring(lend)
end

RolexHub.Name = RandomString(10, "Roblox", "-Rolex")
RolexHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Loading.Name = "Loading"
Loading.Parent = RolexHub
Loading.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
Loading.Position = UDim2.new(0.5, -62, 0.5, -62)
Loading.Size = UDim2.new(0, 125, 0, 125)

UICorner.Parent = Loading

TextButton.Parent = Loading
TextButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TextButton.Position = UDim2.new(0.75999999, -88, 0.667999983, -76)
TextButton.Size = UDim2.new(0, 110, 0, 110)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Rolex Hub"
TextButton.TextColor3 = Color3.fromRGB(255, 215, 0)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true

-- Scripts:

local function MainScript()
	local script = Instance.new('LocalScript', TextButton)

	local function Write(text, time)
		local Length = string.len(text)
		local Ammount = 0
		repeat
			Ammount = Ammount + 1
			local Text = string.sub(text, 1, Ammount)
			script.Parent.Text = Text
			
			wait(time or 0.25)
		until Ammount == Length
		wait(1)
	end
	
	local TweenLoading1 = coroutine.create(function()
		script.Parent.Parent:TweenSizeAndPosition(
			UDim2.new(0, 0, 0, 0),
			UDim2.new(0.5, 0, 0.5, 0),
			Enum.EasingDirection.InOut,
			Enum.EasingStyle.Quad
		)
	end)
	
	local TweenButton1 = coroutine.create(function()
		script.Parent:TweenSizeAndPosition(
			UDim2.new(0, 0, 0, 0),
			UDim2.new(0.5, 0, 0.5, 0),
			Enum.EasingDirection.InOut,
			Enum.EasingStyle.Quad
		)
	end)
	
	local function Init()
		local IsDev = getgenv().IsDev ~= nil -- If exists, then returns true.
		Write("This script is in-development. Bye bye!", 0.1)
		coroutine.resume(TweenLoading1)
		coroutine.resume(TweenButton1)
		if IsDev then
			loadfile("RolexHub/Main.txt")
		end
		script.Parent.Parent.Parent:Destroy()
	end
	
	local TimesClicked = 1
	local IsBeingClicked = false
	
	local TweenLoading = coroutine.create(function()
		script.Parent.Parent:TweenSizeAndPosition(
			UDim2.new(0, 200, 0, 175),
			UDim2.new(0.5, -100, 0.5, -100),
			Enum.EasingDirection.InOut,
			Enum.EasingStyle.Quad
		)
	end)
	
	local TweenButton = coroutine.create(function()
		script.Parent:TweenSizeAndPosition(
			UDim2.new(0, 177, 0, 153),
			UDim2.new(0.5, -88, 0.5, -76),
			Enum.EasingDirection.InOut,
			Enum.EasingStyle.Quad
		)
	end)
	
	script.Parent.MouseButton1Click:Connect(function()
		if TimesClicked == 1 and not IsBeingClicked then
			TimesClicked = TimesClicked + 1
			IsBeingClicked = true
			coroutine.resume(TweenLoading)
			coroutine.resume(TweenButton)
			Write("Loading...", 0.25)
			Write("Done!", 0.1)
			IsBeingClicked = false
			Write("(Click)", 0.15)
		elseif TimesClicked == 2 and not IsBeingClicked then
			Write("Lets get you iced out!", 0.1)
			wait(0.5)
			Write("Rayfield made by Sirius.", 0.075)
			wait(0.5)
			Init()
		end
	end)
end
coroutine.wrap(MainScript)()

if syn and not is_sirhurt_closure then
	syn.protect(RolexHub)
	RolexHub.Parent = game:GetService("CoreGui")
elseif get_hidden_gui then
	RolexHub.Parent = get_hidden_gui()
elseif gethui then
	RolexHub.Parent = gethui()
elseif fluxus and fluxus.protect_gui then
	fluxus.protect_gui(RolexHub)
	RolexHub.Parent = game:GetService("CoreGui")
else
	RolexHub.Parent = game:GetService("CoreGui"):FindFirstChild('RobloxGui')
end
