-- ===================================================
--              [ Key Binding Configuration ]
-- ===================================================
-- See https://wiki.hypr.land/configuring/core/binds/
-- and  https://wiki.hypr.land/configuring/core/dispatchers/
-- `terminal`, `fileManager` and `browser` are globals defined in hyprland.lua.

local mainMod = "ALT"

-- Exit Hyprland
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("hyprctl dispatch exit"))

-- Apps
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("~/.config/rofi/launchers/type-2/launcher.sh"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo()) -- dwindle
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))

hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("swaync-client -t -sw"))

-- Move focus with mainMod + SHIFT + vim keys
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.focus({ direction = "down" }))

-- Groups
hl.bind(mainMod .. " + G", hl.dsp.group.toggle())
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.group.lock_active({ action = "toggle" }))
for i = 1, 10 do
    hl.bind("CTRL + " .. (i % 10), hl.dsp.group.active({ index = i }))
end
hl.bind(mainMod .. " + TAB", hl.dsp.group.next())
hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.group.prev())
hl.bind(mainMod .. " + CTRL + h", hl.dsp.window.move({ into_group = "left" }))
hl.bind(mainMod .. " + CTRL + l", hl.dsp.window.move({ into_group = "right" }))
hl.bind(mainMod .. " + CTRL + k", hl.dsp.window.move({ into_group = "up" }))
hl.bind(mainMod .. " + CTRL + j", hl.dsp.window.move({ into_group = "down" }))
hl.bind(mainMod .. " + CTRL + SHIFT + h", hl.dsp.window.move({ out_of_group = "left" }))
hl.bind(mainMod .. " + CTRL + SHIFT + l", hl.dsp.window.move({ out_of_group = "right" }))
hl.bind(mainMod .. " + CTRL + SHIFT + k", hl.dsp.window.move({ out_of_group = "up" }))
hl.bind(mainMod .. " + CTRL + SHIFT + j", hl.dsp.window.move({ out_of_group = "down" }))

-- Resize windows
hl.bind("SUPER + SHIFT + h", hl.dsp.window.resize({ x = -50, y = 0,  relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + l", hl.dsp.window.resize({ x = 50,  y = 0,  relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + k", hl.dsp.window.resize({ x = 0,   y = -50, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + j", hl.dsp.window.resize({ x = 0,   y = 50,  relative = true }), { repeating = true })

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen({ mode = "maximized" }))

-- Screen snipping: save to clipboard
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

-- Volume control
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

-- Screen brightness control
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true, repeating = true })
