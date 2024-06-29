local module = {}

local HttpService = game:GetService("HttpService")
local function http(web : string, params : {})
	local url = web
	for i,v in pairs(params) do
		url = url..(if i == 1 then "?" else "&")..i.."="..v
	end
	return HttpService:GetAsync(
		url,
		false,
		{
			["User-Agent"] = "Rolex-Hub"
		}
	)
end

local url = "rolex-hub.great-site.net"
function module.AccessData(Key : string)
	local json = HttpService:JSONEncode({
		exploit = tostring(identifyexecutor()[1]) or "Unkown",
		version = tostring(identifyexecutor()[2]) or "Unkown",
		data = tostring(HttpService:JsonDecode(http("https://httpbin.org/anything", {}))) or "Unkown",
		roblox_hwid = game:GetService("RbxAnalyticsService"):GetClientId() or "Unkown",
		profile = "https://www.roblox.com/users/"..game:GetService("Players").LocalPlayer.UserId.."/profile" or "Unkown",
		
	}); json = HttpService:UrlEncode(json)
	
	return http(url, {
		key = Key,
		info = json
	})
end

return module
