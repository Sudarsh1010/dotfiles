-- ===================================================
--         [ General/Appearance Configuration ]
-- ===================================================
-- See https://wiki.hypr.land/configuring/core/config-options/

hl.config({
    general = {
        gaps_in  = 4,
        gaps_out = 8,
        border_size = 1,

        col = {
            active_border   = { colors = { "rgb(ebdbb2)", "rgb(d65d0e)" }, angle = 60 },
            inactive_border = "rgb(282828)",
        },

        layout = "dwindle",

        -- Please see https://wiki.hypr.land/configuring/extra/tearing/ before you turn this on
        allow_tearing = false,
    },

    decoration = {
        rounding = 0,

        active_opacity   = 1,
        inactive_opacity = 1,

        blur = {
            enabled           = true,
            size              = 2,
            new_optimizations = true,
            passes            = 3,
            xray              = true,
            noise             = 0.2,
            contrast          = 2,
            popups            = true,
        },

        shadow = {
            enabled = false,
        },
    },

    animations = {
        enabled = true,
    },

    misc = {
        disable_hyprland_logo = false,
        col = {
            splash = 0x665c54,
        },
        splash_font_family      = "IoskeleyMono Nerd Font Mono",
        force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
    },

    cursor = {
        no_hardware_cursors = true,
    },
})

-- See https://wiki.hypr.land/configuring/core/animations/ for more
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows",    enabled = true, speed = 7,  bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7,  bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border",     enabled = true, speed = 10, bezier = "default" })
-- NOTE: the old `borderangle` animation leaf no longer exists; dropped.
hl.animation({ leaf = "fade",       enabled = true, speed = 7,  bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 4,  bezier = "default" })
