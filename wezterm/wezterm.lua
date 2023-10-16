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


return config
