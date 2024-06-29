local module = {}
repeat task.wait() until game:IsLoaded()

local owner = "1ntort"
local repository = "Rolex-Hub"
local branch = "v2"

local function Import(file)
    return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/%s/%s/%s.lua"):format(owner, repository, branch, file)), file .. '.lua'))()
end

local unc = Import("bin/lib/unc")
local web = Import("bin/lib/web")

local requnc = {"setclipboard", "identifyexecutor"}
do
	local RunService = game:GetService("RunService")

	if RunService:IsStudio() == false then
		local err = "\83\99\114\105\112\116\32\115\101\108\102\45\100\101\115\116\114\117\99\116\101\100\58\32\67\97\110\110\111\116\32\98\101\32\114\97\110\32\105\110\32\97\32\110\111\110\45\101\120\112\108\111\105\116\32\101\110\118\105\114\111\109\101\110\116"

		for _, name in pairs(requnc) do
			if not table.find(unc, requnc) then
				print(err)
				script:Destroy()
				return nil
			end
		end

		if RunService:IsServer() then
			print(err)
			script:Destroy()
			return nil
		end
	end
end

