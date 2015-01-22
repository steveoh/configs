hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
  hs.alert.show("Config loaded")
end)

local appfinder = require("hs.appfinder")
local app = nil
local _win = nil
local winframe = nil

local screenWatcher = nil
local lastNumberOfScreens = #hs.screen.allScreens()

--monitor setups
local display_mac = 1
local display_left = 2
local display_right = 3

local triple_display = {
    {"Google Chrome", nil, display_mac,  hs.layout.maximized, nil, nil},
    {"Wunderlist",    nil, display_right, hs.layout.right50,   nil, nil},
    {"LimeChat",      nil, display_right, hs.layout.left50,    nil, nil},
    {"Twitter",       nil, display_right, hs.layout.left50,    nil, nil},
    {"Slack",         nil, display_left, hs.layout.right50,   nil, nil},
    {"Messages",      nil, display_mac,  hs.layout.maximized, nil, nil},
    {"Adium",         nil, display_mac, hs.layout.maximized, nil, nil},
    {"ITerm",         nil, display_right, hs.layout.right50,   nil, nil}
}

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "F", function()
  app = appfinder.appFromName("Wunderlist")
  win = app:mainWindow()
  print("x: " .. win:topLeft()["x"])
  print("y: " .. win:topLeft()["y"])
  print("width: " .. win:size()["w"])
  print("height: " .. win:size()["h"])
end)

if lastNumberOfScreens == 3 then
  local app_name = "Google Chrome"
  hs.application.launchOrFocus(app_name)
  app = appfinder.appFromName(app_name)
  _win = app:mainWindow()

  winframe = hs.geometry.rect(135, 23, 1155, 877) --x, y, w, h
  _win:setFrame(winframe)

  app_name = "Slack"
  hs.application.launchOrFocus(app_name)
  app = appfinder.appFromName(app_name)
  _win = app:mainWindow()

  winframe = hs.geometry.rect(-1920, -138, 1024, 1177)
  _win:setFrame(winframe)

  app_name = "Twitter"
  hs.application.launchOrFocus(app_name)
  app = appfinder.appFromName(app_name)
  _win = app:mainWindow()

  winframe = hs.geometry.rect(1440, -138, 394, 1177)
  _win:setFrame(winframe)

  app_name = "LimeChat"
  hs.application.launchOrFocus(app_name)
  app = appfinder.appFromName(app_name)
  _win = app:mainWindow()

  winframe = hs.geometry.rect(2636, 182, 720, 327)
  _win:setFrame(winframe)

  app_name = "iTerm"
  hs.application.launchOrFocus(app_name)
  app = appfinder.appFromName(app_name)
  _win = app:mainWindow()

  winframe = hs.geometry.rect(2717, -138, 640, 315)
  _win:setFrame(winframe)

  app_name = "Wunderlist"
  hs.application.launchOrFocus(app_name)
  app = appfinder.appFromName(app_name)
  _win = app:mainWindow()

  winframe = hs.geometry.rect(2497, 510, 861, 526)
  _win:setFrame(winframe)
end

hs.alert.show("Hammerspoon at your service")

