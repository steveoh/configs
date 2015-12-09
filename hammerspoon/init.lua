local appfinder = require("hs.appfinder")
local apps = {
 -- app name, 3 monitor, 2 monitor, 1 monitor location
  { "Google Chrome", hs.geometry.rect(135, 23, 1083, 873), hs.geometry.rect(135, 23, 1083, 873), hs.geometry.rect(65.0, 23.0, 981.0, 873.0) },
  { "Wunderlist", hs.geometry.rect(2497, 510, 861, 526), hs.geometry.rect(795, -529, 864, 526) },
  { "LimeChat", hs.geometry.rect(-895.0, 696.0, 895.0, 344.0), hs.geometry.rect(945, -876, 720, 342), hs.geometry.rect(0.0, 552.0, 895.0, 344.0) },
  { "Twitter", hs.geometry.rect(-895.0, -138.0, 394.0, 834.0), hs.geometry.rect(-256, -1177, 394, 1177), hs.geometry.rect(1045.0, 23.0, 394.0, 873.0) },
  { "Slack", hs.geometry.rect(-1919.0, -138.0, 1025.0, 1177.0), hs.geometry.rect(140, -1177, 886, 1176), hs.geometry.rect(0.0, 23.0, 1025.0, 873.0) },
  { "iTerm", hs.geometry.rect(1440.0, -138.0, 635.0, 337.0), hs.geometry.rect(1027, -1177, 640, 298), hs.geometry.rect(809.0, 23.0, 634.0, 337.0) },
  { "Evernote", hs.geometry.rect(1444, 512, 1048, 524), hs.geometry.rect(-253, -528, 1048, 524) }
  -- { "Adium", },
  -- { "Messages" },
}

-- refresh config
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
  hs.alert.show("Config loaded")
end)

-- open all defaut apps
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "O", function()
  for i,v in pairs(apps) do
    hs.application.launchOrFocus(v[1])
  end

  hs.alert.show("Apps loaded")
end)

-- arrage windows for 3 monitors
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "3", function()
  positionWindows(3)
end)

-- arrage windows for 2 monitors
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "2", function()
  positionWindows(2)
end)

-- arrage windows for 1 monitors
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "1", function()
  positionWindows(1)
end)

-- print window coordinates to console
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "F", function()
  local win = hs.window:focusedWindow()
  print(win:title() .. ": hs.geometry.rect(" .. win:topLeft()["x"] .. ", " .. win:topLeft()["y"] .. ", " .. win:size()["w"] .. ", " .. win:size()["h"] .. ")")
  hs.openConsole()
end)

hs.alert.show("Hammerspoon at your service")

function positionWindows(n)
  geometryIndex = 1
  if n == 3 then
    geometryIndex = 2
  elseif n == 2 then
    geometryIndex = 3
  elseif n == 1 then
    geometryIndex = 4
  end

  for i,v in pairs(apps) do
    local app = appfinder.appFromName(v[1])

    if app then
      local window = app:mainWindow()
      local rectangle = v[geometryIndex]
      print(rectangle)
      if rectangle then
        window:setFrame(rectangle)
      end
    end
  end

  hs.alert.show("Apps positioned for " .. n .. " monitors")
end
