Two Stack WM
============

This is a Spoon for [Hammerspoon] is a minimum, tiling window manager
simplifies your window management by only allowing windowss in ore of
these 3 states:

1. Maximized
2. Main
3. Side

The "Maximized" state uses all screen area.

The "Main" state is a larger portion at the right-hand side of a screen, 
while "Side" state takes the rest of left-hand side of a screen.

It is as if each of "Main" and "Side" areas contains their own stack
of windows, and only the top-most can bee seen. Hence the name.


To use it, bind sensible hotkeys to the functions provided by this spoon like this:

```lua
hs.loadSpoon("TwoStackWM")

local hyper = {"ctrl", "alt", "shift"}

-- hyper-m: Move current focused window to the top of Main area
hs.hotkey.bind(hyper, "m", function () spoon.TwoStackWM:moveFocusedWindowToMainStack() end)

-- hyper-s: Move current focused window to the top of Side area
hs.hotkey.bind(hyper, "s", function () spoon.TwoStackWM.moveFocusedWindowToSideStack() end)

-- hyper-return: Toogle current focused window between Main/Side.
hs.hotkey.bind(hyper, "return", function () spoon.TwoStackWM:toggleFocusedWindowToMainOrSide() end)

-- hyper-f: Maximize current focused window
hs.hotkey.bind(hyper, "f", function () spoon.TwoStackWM.maximizeFocusedWindow() end)

-- hyper-n: If you use multiple monitors, you may want to move windows to different monitors.
hs.hotkey.bind(hyper, "n", function () spoon.TwoStackWM.moveFocusedWindowToNextScreen() end)
```

[Hammerspoon]: https://www.hammerspoon.org/
