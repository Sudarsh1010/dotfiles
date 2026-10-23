-- ===================================================
--         [ Environment Variables ]
-- ===================================================
-- See https://wiki.hypr.land/configuring/core/environment-variables/

-- Some default env vars.
hl.env("XCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct") -- change to qt6ct if you have that
hl.env("HYPRCURSOR_SIZE", "24")

-- NVIDIA (single-GPU desktop, RTX 3050): required so Hyprland's GBM/EGL
-- stack allocates dmabufs that PipeWire consumers (OBS) can import without
-- black/flickering frames. Takes effect at Hyprland startup -> re-login.
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")
