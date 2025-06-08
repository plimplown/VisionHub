local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
if getgenv().scriptAlreadyExecuted then
return
else
getgenv().scriptAlreadyExecuted = true
end
local player = Players.LocalPlayer
local pcScriptUrl = ""
local mobileScriptUrl = ""
local function fetchAndRun(url)
local success, response = pcall(function()
  return game:HttpGet(url)
end)
if success then
  local loadSuccess, err = pcall(function()
  loadstring(response)()
  end)
end
end
if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
fetchAndRun(mobileScriptUrl)
else
fetchAndRun(pcScriptUrl)
end