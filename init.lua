local obj = {}
obj.__index = obj

-- Metadata
obj.name = "TwoStackWM"
obj.version = "0.1"
obj.author = "Kang-min Liu <gugod@gugod.org>"
obj.homepage = "https://github.com/gugod/TwoStackWM.spoon"
obj.license = "MIT - https://opensource.org/licenses/MIT"

function obj:init()
   hs.window.animationDuration = 0
   hs.grid.setMargins(hs.geometry.point(4, 4))
   hs.grid.setGrid('21x21')
end

function obj:moveFocusedWindowToMainStack()
  local win = hs.window.focusedWindow()
  local cell = hs.grid.get(win, screen)
  cell.x = 8
  cell.y = 0
  cell.h = 21
  cell.w = 13
  hs.grid.set(win, cell, screen)
end

function obj:moveFocusedWindowToSideStack()
  local win = hs.window.focusedWindow()
  local cell = hs.grid.get(win, screen)
  cell.x = 0
  cell.y = 0
  cell.h = 21
  cell.w = 8
  hs.grid.set(win, cell, screen)
end

function obj:toggleFocusedWindowToMainOrSide()
  local win = hs.window.focusedWindow()
  local cell = hs.grid.get(win, screen)
  if cell.x < 8
  then
    self:moveFocusedWindowToMainStack()
  else
    self:moveFocusedWindowToSideStack()
  end
end

function obj:maximizeFocusedWindow()
  local win = hs.window.focusedWindow()
  local cell = hs.grid.get(win, screen)
  cell.x = 0
  cell.y = 0
  cell.h = 21
  cell.w = 21
  hs.grid.set(win, cell, screen)
end

return obj
