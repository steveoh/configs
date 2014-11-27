-- Load Extensions
local application = require "mjolnir.application"
local window = require "mjolnir.window"
local hotkey = require "mjolnir.hotkey"
local keycodes = require "mjolnir.keycodes"
local fnutils = require "mjolnir.fnutils"
local alert = require "mjolnir.alert"
local screen = require "mjolnir.screen"
-- User packages
local grid = require "mjolnir.bg.grid"
local appfinder = require "mjolnir.cmsj.appfinder"


function init()
  alert.show("Mjolnir, at your service.")
end

-- Set grid size.
grid.GRIDWIDTH  = 10
grid.GRIDHEIGHT = 8
grid.MARGINX = 0
grid.MARGINY = 0

local width = grid.GRIDWIDTH
local height = grid.GRIDHEIGHT

local oneScreen = {
    { name = "Google Chrome", location = { x = 1.5, y = 0, w = 7, h = 8 } },
    { name = "Wunderlist", location = { x = (width/2)-1, y = (height/2)-.75, w = (width/2)+1, h = height/2 } },
    { name = "LimeChat", location = { x = (width/2)+1, y = 0, w = 4, h = 3 } },
    { name = "Slack", location = { x = 0, y = 0, w = width/2, h = height/2 } }
}

fnutils.each(oneScreen, function(app)
    local found = application.launchorfocus(app.name)
    if found then
        local win = window.focusedwindow()
        grid.set(win, app.location, win:screen())
    end
end)

init()
