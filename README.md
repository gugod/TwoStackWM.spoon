Two Stack WM
============

This Spoon of [Hammerspoon] is a minimum, tiling window manager
simplifies your window management by only allowing windows tiling in 2 areas:

1. Main
2. Side

The Main area is a larger portion at the right-hand side of a screen,
while Side area takes the rest of left-hand side of a screen.

It is as if each of each of the Main and Side areas contains their own stack
of windows, and only the top-most can bee seen. Hence the name.

Windows may be placed in either of Main or Side, or as a conventional
goodie, maximized.

## Synopsis

To use TwoStackWM, load it inside `~/.hammerspoon/init.lua`, then bind
sensible hotkeys to the functions provided like so:


```lua
hs.loadSpoon("TwoStackWM")

local hyper = {"ctrl", "alt", "shift"}

-- hyper-m: Move current focused window to the top of Main area
hs.hotkey.bind(
    hyper,
    "m",
    function ()
        spoon.TwoStackWM:moveFocusedWindowToMainStack()
    end
)

-- hyper-s: Move current focused window to the top of Side area
hs.hotkey.bind(
    hyper,
    "s",
    function ()
        spoon.TwoStackWM.moveFocusedWindowToSideStack()
    end
)

-- hyper-f: Maximize current focused window
hs.hotkey.bind(
    hyper,
    "f",
    function ()
        spoon.TwoStackWM.maximizeFocusedWindow()
    end
)

-- hyper-return: Toogle current focused window between Main/Side.
hs.hotkey.bind(
    hyper,
    "return",
    function ()
        spoon.TwoStackWM:toggleFocusedWindowToMainOrSide()
    end
)

-- hyper-n: If you use multiple monitors, you may want to move windows to different monitors.
hs.hotkey.bind(hyper, "n", function () spoon.TwoStackWM.moveFocusedWindowToNextScreen() end)
```

## Methods provided by this Spoon

- `moveFocusedWindowToMainStack()`
- `moveFocusedWindowToSideStack()`
- `maximizeFocusedWindow()`
- `toggleFocusedWindowToMainOrSide()`
- `toggleFocusedWindowToMaxOrMainOrSide()`
- `moveFocusedWindowToNextScreen()`

(Hopefully the names are self-explainatory.)

[Hammerspoon]: https://www.hammerspoon.org/
