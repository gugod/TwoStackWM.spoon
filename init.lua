local obj = {}
obj.__index = obj

-- Metadata
obj.name = "TwoStackWM"
obj.version = "0.1"
obj.author = "Kang-min Liu <gugod@gugod.org>"
obj.homepage = "https://github.com/gugod/TwoStackWM.spoon"
obj.license = "MIT - https://opensource.org/licenses/MIT"

obj.config = {}
obj.config.mainWidth = 13
obj.config.sideWidth = 8

function obj:init()
   hs.window.animationDuration = 0
   hs.grid.setMargins(hs.geometry.point(4, 4))
   hs.grid.setGrid((self.config.mainWidth + self.config.sideWidth) .. "x1")
end

function obj:moveFocusedWindowToMainStack()
   local win = hs.window.focusedWindow()
   local cell = hs.grid.get(win)
   cell.x = self.config.sideWidth
   cell.y = 0
   cell.h = 1
   cell.w = self.config.mainWidth
   hs.grid.set(win, cell)
end

function obj:moveFocusedWindowToSideStack()
   local win = hs.window.focusedWindow()
   local cell = hs.grid.get(win)
   cell.x = 0
   cell.y = 0
   cell.h = 1
   cell.w = self.config.sideWidth
   hs.grid.set(win, cell)
end

function obj:toggleFocusedWindowToMainOrSide()
   local win = hs.window.focusedWindow()
   local cell = hs.grid.get(win)
   if cell.x < 8
   then
      self:moveFocusedWindowToMainStack()
   else
      self:moveFocusedWindowToSideStack()
   end
end

function obj:toggleFocusedWindowToMaxOrMainOrSide()
   -- side -> main -> max -> side ...
   local win = hs.window.focusedWindow()
   local cell = hs.grid.get(win)

   if cell.w == self.config.sideWidth then
      -- side -> main
      self:moveFocusedWindowToMainStack()

   elseif cell.w == self.config.mainWidth then
      -- main -> max
      self:maximizeFocusedWindow()
   else
      -- max -> side
      self:moveFocusedWindowToSideStack()
   end
end

function obj:maximizeFocusedWindow()
   local win = hs.window.focusedWindow()
   local cell = hs.grid.get(win)
   cell.x = 0
   cell.y = 0
   cell.h = 1
   cell.w = self.config.mainWidth + self.config.sideWidth
   hs.grid.set(win, cell)
end

function obj:moveFocusedWindowToNextScreen()
   local win = hs.window.focusedWindow()
   local screen = win:screen()
   win:move(win:frame():toUnitRect(screen:frame()), screen:next(), true, 0)
end

return obj
