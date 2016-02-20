---------- IMPORTS -------------------------------------------------------------
local application = require "mjolnir.application"
local hotkey = require "mjolnir.hotkey"
local window = require "mjolnir.window"
local fnutils = require "mjolnir.fnutils"
local tiling = require "mjolnir.tiling"
local hints = require "mjolnir.th.hints"
local grid = require "mjolnir.bg.grid"

---------- HELPERS -------------------------------------------------------------
function shallowCopy(original)
    local copy = {}
    for key, value in pairs(original) do
        copy[key] = value
    end
    return copy
end

local event = require "mjolnir._asm.eventtap.event"

function postKey(mods, key, isdown)
  event.post(
    event.newkeyevent(mods, key, isdown)
  )
end
function mouseClick(point, button, type)
  event.post(
    event.newmouseevent(event.types[button.."mouse"..type], point, button)
  )
end


function chars(s)
  local t = {}
  s:gsub(".", function(c) table.insert(t, c) end)
  return t
end

---------- CONFIG --------------------------------------------------------------
local hyper = {"cmd", "alt", "ctrl", "shift"}
grid.MARGINX = 0
grid.MARGINY = 0
grid.GRIDWIDTH = 5
grid.GRIDHEIGHT = 3
local grid_keys = chars("qwertasdfgzxcvb")

local app_focus = {
  y      = "Emacs",
  u      = "iTerm",
  ["\\"] = "Dash",
  ["o"]  = "Google Chrome",
  ["p"]  = "Spotify",
}

---------- RELOAD --------------------------------------------------------------
hotkey.bind(hyper, "0", mjolnir.reload)

---------- SPACES --------------------------------------------------------------
local mouse = require "mjolnir._asm.sys.mouse"
local spaces = require("mjolnir._asm.hydra.undocumented").spaces
function dragToSpace(n)
  local saved = mouse.get()
  local focused = window.focusedwindow()
  local newpos = focused:topleft()
  newpos.x = newpos.x + math.floor(focused:size().w / 2)
  newpos.y = newpos.y + 5
  mouseClick(newpos, "left", "down")
  spaces.movetospace(spaces.currentspace() + n)
  mouseClick(newpos, "left", "up")
  os.execute("sleep 0.01")
  mouse.set(saved)
end

hotkey.bind(hyper, "]", function() spaces.movetospace(spaces.currentspace()+1) end)
hotkey.bind(hyper, "[", function() spaces.movetospace(spaces.currentspace()-1) end)
hotkey.bind(hyper, "=", function() dragToSpace(1) end)
hotkey.bind(hyper, "-", function() dragToSpace(-1) end)

---------- HINTS ---------------------------------------------------------------
local hinting = false
function toggleHints()
  if hinting then
    hints.closeAll()
  else
    hints.windowHints()
  end
  hinting = not hinting
end

hotkey.bind(hyper, "h", hints.windowHints)
-- hotkey.bind(hyper, "h", toggleHints)

local appfinder = require "mjolnir.cmsj.appfinder"

hotkey.bind(hyper, "n", function() hints.appHints(window.focusedwindow():application()) end)

---------- FOCUS ARROWS/APPS ---------------------------------------------------

for key, name in pairs(app_focus) do
  print("Binding " .. key .. " to "..name)
  hotkey.bind(hyper, key, function() application.launchorfocus(name) end)
end
-- hotkey.bind(hyper, "y", function() application.launchorfocus("Emacs") end)
-- hotkey.bind(hyper, "u", function() application.launchorfocus("iTerm") end)
-- hotkey.bind(hyper, "\\", function() application.launchorfocus("Dash") end)
-- hotkey.bind(hyper, "o", function() application.launchorfocus("Google Chrome") end)

hotkey.bind(hyper, "left", function() window.focusedwindow():focuswindow_west() end)
hotkey.bind(hyper, "right", function() window.focusedwindow():focuswindow_east() end)
hotkey.bind(hyper, "up", function() window.focusedwindow():focuswindow_north() end)
hotkey.bind(hyper, "down", function() window.focusedwindow():focuswindow_south() end)


---------- TILING --------------------------------------------------------------
hotkey.bind(hyper, "l", tiling.cyclelayout)
hotkey.bind(hyper, "j", function() tiling.cycle(1) end)
hotkey.bind(hyper, "k", function() tiling.cycle(-1) end)
hotkey.bind(hyper, "return", tiling.promote)

tiling.set("layouts", {
             "fullscreen", "main-vertical"
})

---------- GRID ----------------------------------------------------------------
function make_grid_lookup(keys, w)
  local lookup = {}
  for index, key in pairs(keys) do
    index = index - 1
    lookup[key] = {x = index % w, y = math.floor(index / w)}
  end
  return lookup
end


function grid.set_current(x, y, w, h)
    local current_window = window.focusedwindow()
    grid.set(
      current_window,
      {x=x, y=y, w=w, h=h},
      current_window:screen()
    )
end


local grid_state = {}
local grid_lookup = make_grid_lookup(grid_keys, grid.GRIDWIDTH)

for i, key in ipairs(grid_keys) do
  grid_state[key] = false
  
  local pressed = function()
    grid_state[key] = true
    local min = shallowCopy(grid_lookup[key])
    local max = shallowCopy(grid_lookup[key])
    for okey, state in pairs(grid_state) do
      if state then
        local pos = grid_lookup[okey]
        -- if pos.x <= min.x and pos.y <= min.y then min = pos end
        -- if pos.x >= max.x and pos.y >= max.y then max = pos end
        min.x = math.min(min.x, pos.x); min.y = math.min(min.y, pos.y)
        max.x = math.max(max.x, pos.x); max.y = math.max(max.y, pos.y)
      end
    end
    grid.set_current(min.x, min.y, max.x - min.x + 1, max.y - min.y + 1)
  end
  
  local released = function()
    grid_state[key] = false
  end
  
  hotkey.bind(hyper, key, pressed, released)
end
