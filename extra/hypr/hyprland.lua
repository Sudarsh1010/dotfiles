-- ===================================================
--         [ Hyprland Lua Config (>= 0.56) ]
-- ===================================================
-- Migrated from hyprland.conf. Hyprland 0.56+ only loads hyprland.lua.
-- Split into modules under ./modules, required below.
-- See https://wiki.hypr.land/configuring/

---------------------
---- MY PROGRAMS ----
---------------------

-- Globals (not `local`) so the modules required below can see them.
terminal    = "foot"
fileManager = "dolphin"
menu        = "rofi -show drun"
browser     = "brave-beta"

-----------------
---- MODULES ----
-----------------

require("modules.env")
require("modules.general")
require("modules.monitors")
require("modules.input")
require("modules.binds")

-------------------
---- AUTOSTART ----
-------------------

-- Runs once at Hyprland startup (old `exec-once` semantics)
-- NOTE: waybar is intentionally NOT here -- it is managed by systemd
-- (programs.waybar.systemd.enable, see modules/wayland/bar.nix).
hl.on("hyprland.start", function()
    hl.exec_cmd(terminal)
    -- NOTE: hl.exec_cmd spawns raw (no shell), so `~` is NOT expanded -- use absolute path.
    -- Must run here, not at top level: top-level code runs during config parse,
    -- before the Wayland socket/outputs are ready, so swaybg exits immediately.
    hl.exec_cmd("swaybg -i /home/sudarsh/.config/hypr/hiromi-higuruma.jpg -m fill")
end)

-- See https://wiki.hypr.land/configuring/layouts/master-layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})
