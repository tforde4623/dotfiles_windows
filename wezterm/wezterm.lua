local wezterm = require "wezterm"
local gitbash = {"C:\\Program Files\\Git\\bin\\bash.exe", "-i", "-l"}

local act = wezterm.action

-- nvim zenmode
wezterm.on('user-var-changed', function(window, pane, name, value)
    wezterm.log_info("test")
    local overrides = window:get_config_overrides() or {}
    if name == "ZEN_MODE" then
        local incremental = value:find("+")
        local number_value = tonumber(value)
        if incremental ~= nil then
            while (number_value > 0) do
                window:perform_action(act.IncreaseFontSize, pane)
                number_value = number_value - 1
            end
            overrides.enable_tab_bar = false
        elseif number_value < 0 then
            window:perform_action(act.ResetFontSize, pane)
            overrides.font_size = nil
            overrides.enable_tab_bar = false
        else
            overrides.font_size = number_value
            overrides.enable_tab_bar = false
        end
    end
    window:set_config_overrides(overrides)
end)

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder
end

-- custom configuration

config.automatically_reload_config = true
config.default_prog = gitbash
config.use_fancy_tab_bar = false

-- colors
config.colors = {
    background = '#002b36',

    tab_bar = {
        background = '#004255',

        active_tab = {
            bg_color = '#002b36',
            fg_color = '#93a1a1'
        },

        inactive_tab = {
            bg_color = '#004255',
            fg_color = '#93a1a1'
        },

        new_tab = {
            bg_color = '#004255',
            fg_color = '#93a1a1'
        },

        new_tab_hover = {
            bg_color = '#004255',
            fg_color = '#93a1a1'
        }
    }
}

-- setup git bash to be ran at start
config.launch_menu = {
    {
        label = "Git Bash",
        args = gitbash
    }

    -- should we add cmd.exe here too? ehh
}

-- key bindings
config.leader = { key = 'a', mods = 'CTRL' }

config.keys = {
    {
        key = 'm',
        mods =  'CTRL',
        action = act.DisableDefaultAssignment
    },
    {
        key = 't',
        mods = 'CTRL',
        action = act.SpawnTab 'CurrentPaneDomain'
    },
    {
        -- fix copy and paste
        key = 'v',
        mods = 'CTRL',
        action = act.PasteFrom 'Clipboard'
    },
    {
        key = 'D',
        mods = 'CTRL',
        action = act.CloseCurrentTab { confirm = false }
    },

    -- create panes
    {
        key = '\\',
        mods = 'LEADER',
        action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }
    },
    {
        key = '-',
        mods = 'LEADER',
        action = act.SplitVertical { domain = 'CurrentPaneDomain' }
    },

    -- navigate panes (TODO: add in the active context thing)
    {
        key = 'k',
        mods = 'LEADER',
        action = act.ActivatePaneDirection 'Up'
    },
    {
        key = 'j',
        mods = 'LEADER',
        action = act.ActivatePaneDirection 'Down'
    },
    {
        key = 'h',
        mods = 'LEADER',
        action = act.ActivatePaneDirection 'Left'
    },
    {
        key = 'l',
        mods = 'LEADER',
        action = act.ActivatePaneDirection 'Right'
    },

    -- zoom pane
    {
        key = 'z',
        mods = 'LEADER',
        action = act.TogglePaneZoomState
    },

    -- close pane
    {
        key = 'x',
        mods = 'LEADER',
        action = act.CloseCurrentPane { confirm = false }
    },
}

-- custom tab navigation key bindings
for i = 1, 8 do
    -- CTRL + tab number (tabs are 0 index, but we want to start with 1 on the kb)
    table.insert(config.keys, {
        key = tostring(i),
        mods = 'LEADER',
        action = act.ActivateTab(i - 1)
    })
end

return config
