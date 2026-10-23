----------------
---- MONITORS ----
----------------

hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080@60.05",
    position = "0x0",
    scale    = 1,
})

----------------
---- PROGRAMS ----
----------------

local terminal    = "kitty"
local fileManager = "kitty -e ranger"
local browser     = "chromium"
local menu        = "pgrep wofi > /dev/null 2>&1 && killall wofi || wofi --show drun"

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprsunset")
    hl.exec_cmd("waybar")
end)

----------------
---- INPUT ----
----------------

hl.config({
    input = {
        kb_layout  = "us,ru",
        kb_options = "grp:win_space_toggle",

        touchpad = {
            natural_scroll = true,
        },
    },

    cursor = {
        no_hardware_cursors = true,
    },
})

----------------
---- DESIGN ----
----------------

hl.config({
    animations = {
        enabled = false,
    },

    general = {
        gaps_in  = 5,
        gaps_out = 10,

        border_size = 1,

        resize_on_border = true,

        layout = "dwindle",
    },

    decoration = {
        rounding = 0,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,
    },

    dwindle = {
        force_split    = 2,
        preserve_split = true,
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
    },
})

----------------
---- KEYBINDS ----
----------------

local mainMod = "SUPER"

-- Programs
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E",      hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + W",      hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + D",      hl.dsp.exec_cmd(menu))

-- Windows
hl.bind(mainMod .. " + Q",             hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F",             hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + mouse:272",     hl.dsp.window.drag(), { mouse = true })

-- Screen lock
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

-- Workspaces
for i = 1, 6 do
    hl.bind(mainMod .. " + " .. i,           hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. i,   hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.swap({ direction = "down" }))

-- Misc
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot --mode region --output-folder ~/pictures/screenshots"))
