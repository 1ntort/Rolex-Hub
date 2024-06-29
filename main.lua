local owner = "1ntort"
local repository = "Rolex-Hub"
local branch = "v2"

local function Import(file)
    return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/%s/%s/%s.lua"):format(owner, repository, branch, file)), file .. '.lua'))()
end

local main = webImport("bin/lib/main")
