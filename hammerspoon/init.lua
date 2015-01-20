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

if lastNumberOfScreens == 3 then
  app = appfinder.appFromName("Google Chrome")
  _win = app:mainWindow()

                            --x, y, w, h
  winframe = hs.geometry.rect(135, 23, 1155, 877)
  _win:setFrame(winframe)

  app = appfinder.appFromName("Slack")
  _win = app:mainWindow()

  winframe = hs.geometry.rect(-1920, -138, 1024, 1177)
  _win:setFrame(winframe)

  app = appfinder.appFromName("Twitter")
  _win = app:mainWindow()

  winframe = hs.geometry.rect(-1440, -138, 394, 1177)
  _win:setFrame(winframe)

  app = appfinder.appFromName("LimeChat")
  _win = app:mainWindow()

  winframe = hs.geometry.rect(2636, 182, 720, 327)
  _win:setFrame(winframe)

  app = appfinder.appFromName("iTerm")
  _win = app:mainWindow()

  winframe = hs.geometry.rect(2717, -138, 640, 315)
  _win:setFrame(winframe)
end

hs.alert.show("Hammerspoon at your service")

