local sizeup = {}

function sizeup.left()
  local win = hs.window.focusedWindow()
  local sf = win:screen():frame()
  win:setFrame({
    x = sf.x,
    y = sf.y,
    w = sf.w / 2,
    h = sf.h,
  })
end

function sizeup.right()
  local win = hs.window.focusedWindow()
  local sf = win:screen():frame()
  win:setFrame({
    x = sf.x + (sf.w / 2),
    y = sf.y,
    w = sf.w / 2,
    h = sf.h,
  })
end

function sizeup.top()
  local win = hs.window.focusedWindow()
  local sf = win:screen():frame()
  win:setFrame({
    x = sf.x,
    y = sf.y,
    w = sf.w,
    h = sf.h / 2,
  })
end

function sizeup.bottom()
  local win = hs.window.focusedWindow()
  local sf = win:screen():frame()
  win:setFrame({
    x = sf.x,
    y = sf.y + (sf.h / 2),
    w = sf.w,
    h = sf.h / 2,
  })
end

function sizeup.top_left()
  local win = hs.window.focusedWindow()
  local sf = win:screen():frame()
  win:setFrame({
    x = sf.x,
    y = sf.y,
    w = sf.w / 2,
    h = sf.h / 2,
  })
end

function sizeup.top_right()
  local win = hs.window.focusedWindow()
  local sf = win:screen():frame()
  win:setFrame({
    x = sf.x + (sf.w / 2),
    y = sf.y,
    w = sf.w / 2,
    h = sf.h / 2,
  })
end

function sizeup.bottom_left()
  local win = hs.window.focusedWindow()
  local sf = win:screen():frame()
  win:setFrame({
    x = sf.x,
    y = sf.y + (sf.h / 2),
    w = sf.w / 2,
    h = sf.h / 2,
  })
end

function sizeup.bottom_right()
  local win = hs.window.focusedWindow()
  local sf = win:screen():frame()
  win:setFrame({
    x = sf.x + (sf.w / 2),
    y = sf.y + (sf.h / 2),
    w = sf.w / 2,
    h = sf.h / 2,
  })
end

function sizeup.maximize()
  local win = hs.window.focusedWindow()
  local sf = win:screen():frame()
  win:setFrame({
    x = sf.x,
    y = sf.y,
    w = sf.w,
    h = sf.h,
  })
end

function sizeup.center()
  local pct = 0.75

  local win = hs.window.focusedWindow()
  local sf = win:screen():frame()
  win:setFrame({
    x = sf.x + ((sf.w / 2) - ((sf.w * pct) / 2)),
    y = sf.y + ((sf.h / 2) - ((sf.h * pct) / 2)),
    w = sf.w * pct,
    h = sf.h * pct,
  })
end

function sizeup.next_screen()
  hs.window.focusedWindow():moveOneScreenEast()

  -- local win = hs.window.focusedWindow()
  -- local old_rect = win:screen():frame()
  -- local new_rect = win:screen():next():frame()

  -- avoid wrapping around to mimic SizeUp's behavior
  -- if win:screen():id() <= win:screen():next():id() then
  --   return
  -- end

  -- local frame = win:frame()
  -- local x_ratio = new_rect.w / old_rect.w
  -- local y_ratio = new_rect.h / old_rect.h

  -- win:setFrame({
  --   x = new_rect.x + (frame.x - old_rect.x),
  --   y = new_rect.y + (frame.y - old_rect.y),
  --   w = frame.w * x_ratio,
  --   h = frame.h * y_ratio,
  -- })
end

function sizeup.prev_screen()
  hs.window.focusedWindow():moveOneScreenWest()

  -- local win = hs.window.focusedWindow()
  -- local old_rect = win:screen():frame()
  -- local new_rect = win:screen():previous():frame()

  -- avoid wrapping around to mimic SizeUp's behavior
  -- if win:screen():id() >= win:screen():previous():id() then
  --   return
  -- end

  -- local frame = win:frame()
  -- local x_ratio = new_rect.w / old_rect.w
  -- local y_ratio = new_rect.h / old_rect.h

  -- win:setFrame({
  --   x = new_rect.x + (frame.x - old_rect.x),
  --   y = new_rect.y + (frame.y - old_rect.y),
  --   w = frame.w * x_ratio,
  --   h = frame.h * y_ratio,
  -- })
end

return sizeup
