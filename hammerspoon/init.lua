local appfinder = require("hs.appfinder")
local apps = {
 -- app name, 3 monitor, 2 monitor, 1 monitor location
  { "Google Chrome", hs.geometry.rect(135, 23, 1083, 873) },
  { "Wunderlist", hs.geometry.rect(2497, 510, 861, 526) },
  { "LimeChat", hs.geometry.rect(2636, 167, 720, 342) },
  { "Twitter", hs.geometry.rect(1440, -138, 394, 1177) },
  { "Slack", hs.geometry.rect(-1920, -138, 1024, 1177) },
  { "iTerm", hs.geometry.rect(2717, -138, 640, 315) }
  -- { "Adium", },
  -- { "Messages" },
}

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
  hs.alert.show("Config loaded")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "O", function()
  for i,v in pairs(apps) do
    hs.application.launchOrFocus(v[1])
  end

  hs.alert.show("Apps loaded")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "3", function()
  for i,v in pairs(apps) do
    local app = appfinder.appFromName(v[1])

    if app then
      local window = app:mainWindow()
      local rectangle = v[2]
      window:setFrame(rectangle)
    end
  end

  hs.alert.show("Apps positioned for 3 monitors")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "F", function()
  local win = hs.window:focusedWindow()
  print(win:title() .. ": hs.geometry.rect(" .. win:topLeft()["x"] .. ", " .. win:topLeft()["y"] .. ", " .. win:size()["w"] .. ", " .. win:size()["h"] .. ")")
end)

hs.alert.show("Hammerspoon at your service")
