local sizeup = require 'sizeup'

-- SizeUp emulation
hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "left", sizeup.left)
hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "right", sizeup.right)
hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "up", sizeup.top)
hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "down", sizeup.bottom)
---
hs.hotkey.bind({ "ctrl", "alt", "shift" }, "left", sizeup.top_left)
hs.hotkey.bind({ "ctrl", "alt", "shift" }, "up", sizeup.top_right)
hs.hotkey.bind({ "ctrl", "alt", "shift" }, "down", sizeup.bottom_left)
hs.hotkey.bind({ "ctrl", "alt", "shift" }, "right", sizeup.bottom_right)
---
hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "m", sizeup.maximize)
hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "c", sizeup.center)
---
hs.hotkey.bind({ "ctrl", "alt" }, "left", sizeup.prev_screen)
hs.hotkey.bind({ "ctrl", "alt" }, "right", sizeup.next_screen)


hs.hotkey.bind({ "ctrl", "alt", "shift" }, ",", function()
  downsize_window(hs.window.focusedWindow(), 0.05)
end)

hs.hotkey.bind({ "ctrl", "alt", "shift" }, ".", function()
  upsize_window(hs.window.focusedWindow(), 0.05)
end)

function upsize_window(win, pct)
  local frame = win:frame()
  local scr_frame = win:screen():frame()

  local x_scale = (frame.w * pct)
  local y_scale = (frame.h * pct)
  local x = frame.x - x_scale
  local y = frame.y - y_scale
  local w = frame.w + x_scale * 2
  local h = frame.h + y_scale * 2

  if x < scr_frame.x or x > (scr_frame.x + scr_frame.w) then
    x = scr_frame.x
  end
  if y < scr_frame.y or y > (scr_frame.y + scr_frame.h) then
    y = scr_frame.y
  end
  if (x + w) > scr_frame.w then
    w = (scr_frame.x + scr_frame.w) - x
  end
  if (y + h) > scr_frame.h then
    h = (scr_frame.y + scr_frame.h) - y
  end

  win:setFrame({ x = x, y = y, w = w, h = h })
end

function downsize_window(win, pct)
  local frame = win:frame()
  local scr_frame = win:screen():frame()

  local x_scale = (frame.w * pct)
  local y_scale = (frame.h * pct)
  local x = frame.x + x_scale
  local y = frame.y + y_scale
  local w = frame.w - x_scale * 2
  local h = frame.h - y_scale * 2

  if x < scr_frame.x or x > (scr_frame.x + scr_frame.w) then
    x = scr_frame.x
  end
  if y < scr_frame.y or y > (scr_frame.y + scr_frame.h) then
    y = scr_frame.y
  end
  if (x + w) > scr_frame.w then
    w = (scr_frame.x + scr_frame.w) - x
  end
  if (y + h) > scr_frame.h then
    h = (scr_frame.y + scr_frame.h) - y
  end

  win:setFrame({ x = x, y = y, w = w, h = h })
end
