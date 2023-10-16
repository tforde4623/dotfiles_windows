local wezterm = require "wezterm"
local gitbash = {"C:\\Program Files\\Git\\bin\\bash.exe", "-i", "-l"}

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
config.keys = {
    {
        key = 'm',
        mods =  'CTRL',
        action = wezterm.action.DisableDefaultAssignment
    },
    {
        key = 't',
        mods = 'CTRL',
        action = wezterm.action.ShowTabNavigator
    },
    {
	key = 'V',
	mods = 'CTRL',
	action = wezterm.action.PasteFrom 'Clipboard'
    }
}

-- nvim zenmode
wezterm.on('user-var-changed', function(window, pane, name, value)
    local overrides = window:get_config_overrides() or {}
    if name == "ZEN_MODE" then
        local incremental = value:find("+")
        local number_value = tonumber(value)
        if incremental ~= nil then
            while (number_value > 0) do
                window:perform_action(wezterm.action.IncreaseFontSize, pane)
                number_value = number_value - 1
            end
            overrides.enable_tab_bar = false
        elseif number_value < 0 then
            window:perform_action(wezterm.action.ResetFontSize, pane)
            overrides.font_size = nil
            overrides.enable_tab_bar = true
        else
            overrides.font_size = number_value
            overrides.enable_tab_bar = false
        end
    end
    window:set_config_overrides(overrides)
end)

return config
