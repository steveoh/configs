hs.application.enableSpotlightForNameSearches(true)
local appfinder = require("hs.appfinder")
local apps = {
 -- app name, 3 monitor, 2 monitor, 1 monitor location
  { "Google Chrome", hs.geometry.rect(163.0, 23.0, 1263.0, 1023.0), hs.geometry.rect(135.0, 23.0, 1083.0, 1023.0), hs.geometry.rect(96.0, 23.0, 1381.0, 1022.0) },
  { "Wunderlist", hs.geometry.rect(-1411.0, -562.0, 864.0, 562.0), hs.geometry.rect(1253.0, -527.0, 864.0, 526.0), hs.geometry.rect(992.0, -562.0, 864.0, 562.0) },
  { "TweetDeck", hs.geometry.rect(-803.0, -1129.0, 414.0, 1129.0), hs.geometry.rect(-443.0, -1417.0, 414.0, 1417.0), hs.geometry.rect(0.0, 23.0, 414.0, 1021.0) },
  { "Slack", hs.geometry.rect(-2420.0, -1129.0, 1008.0, 1129.0), hs.geometry.rect(-28.0, -1417.0, 865.0, 1417.0), hs.geometry.rect(-188.0, -1129.0, 991.0, 1129.0) },
  { "iTerm2", hs.geometry.rect(-1411.0, -1129.0, 810.0, 350.0), hs.geometry.rect(987.0, -1417.0, 1130.0, 293.0), hs.geometry.rect(1094.0, -1129.0, 762.0, 331.0) },
  { "Microsoft OneNote", hs.geometry.rect(1257.0, -814.0, 860.0, 525.0), hs.geometry.rect(838.0, -782.0, 1052.0, 782.0), hs.geometry.rect(805.0, -634.0, 814.0, 634.0) },
  { "Parallels Desktop", hs.geometry.rect(-1411.0, -778.0, 810.0, 162.0), hs.geometry.rect(1306.0, -690.0, 810.0, 162.0), hs.geometry.rect(1046.0, -797.0, 810.0, 162.0) },
  { "Adium", hs.geometry.rect(-2457.0, -1129.0, 133.0, 315.0), hs.geometry.rect(837.0, -1417.0, 153.0, 622.0), hs.geometry.rect(803.0, -1129.0, 153.0, 804.0) },
  { "Messages", hs.geometry.rect(1457.0, -1123.0, 660.0, 595.0), hs.geometry.rect(1457.0, -1123.0, 660.0, 595.0), hs.geometry.rect(0.0, 23.0, 660.0, 595.0) }
}

-- refresh config
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
  hs.alert.show("Config loaded")
end)

-- record current position of windows
hs.hotkey.bind({'cmd', 'alt', 'ctrl'}, 'T', function ()
    positions = {}
    for key,app in pairs(hs.application.runningApplications()) do
      win = app:mainWindow()
        if (win ~= nil and win:id() ~= nil and app:title() ~= 'Finder') then
            print(app:title() .. ": hs.geometry.rect(" .. win:topLeft()["x"] .. ", " .. win:topLeft()["y"] .. ", " .. win:size()["w"] .. ", " .. win:size()["h"] .. ")")
        end
    end
    -- hs.settings.set(workPositions, positions)
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
