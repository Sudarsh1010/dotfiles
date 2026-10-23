-- ===================================================
--            [ Input/Device Configuration ]
-- ===================================================
-- For all categories, see https://wiki.hypr.land/configuring/core/config-options/

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse   = 1,
        natural_scroll = true,

        touchpad = {
            natural_scroll = false,
        },

        sensitivity  = 0, -- -1.0 to 1.0, 0 means no modification.
        repeat_rate  = 40,
        repeat_delay = 175,
    },
})
