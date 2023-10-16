-- grab external config files (keep in mind, we are using a symlink on init.lua AND a dir symlink on lua/ both in our AppData\Local\nvim dir)
require("plugins")
require("remap")
require("options")

-- theme setup
require('colorbuddy').setup()
n = require('neosolarized').setup({
    comment_italics = true,
    background_set = true
})

n.Group.link('WarningMsg', n.groups.Comment)
