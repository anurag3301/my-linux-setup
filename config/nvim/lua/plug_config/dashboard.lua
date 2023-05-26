-- Dashboard config
local plugins_count = vim.fn.len(
    vim.fn.globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1)
)

local dashboard_height = 27
-- db.header_pad  = math.floor((vim.api.nvim_list_uis()[1]['height'] - dashboard_height) / 4)

-- require('dashboard-nvim').setup{
--     theme = 'doom',
--     config = {
--         header = {
--                 '                                                              ',
--                 '    ⢀⣀⣤⣤⣤⠤⢤⣤⣤⣤⣤⣄⣀⡀           ⢀⣠⣤⣄⡀            ⣀⣀⣀⣤⣤⣤⣤⣤⣤⣤⣤⣀⡀   ',
--                 ' ⢀⣤⠚⠩⠁⡄ ⠠⣤⠒⠒⣂ ⢈⣨⣭⣿⠛⠶⣦⣤⣄⡀   ⢠⣾⡟⠉⠉⠝⠿⠇    ⢀⣠⡤⠔⠒⣻⠟⠋⠩⠉⢁⣀⡀  ⣶  ⠙⡛⠷  ',
--                 ' ⠸⢟⡠⠒⢊⡤  ⠋⣠ ⠈⣉⣉⣉⣉⣀⣛⣿⡒⠭⡿⢿⣷⣤⣤⣀⣽⣇⣴⠆⣴⡃⢀⣠⣤⠴⣚⣫⡥ ⠒⠛⠁⣀⣉⣉⣙⢏⡉  ⢀⣼⣤⣜⠳⡦⠂  ',
--                 '   ⠐⠚⠫⣤⠖⢣⣤⡕ ⠉⣩⣤⠔ ⠂⣋⣭⣥⣤⠴⠛⣛⠈⢩⣿⠿⠛⢉  ⡐⠞⠫⢍⠙⣓⠢⠴⣥⣍⣙⠛⢓⡢⢤⣬⠉⠅ ⣤⡜⢛⠻⠛⠉⠁   ',
--                 '      ⠘⢔⢎⣡⡔⠂⣠⡿⠁⠒⢛⡻⢛⣩⠅  ⠉  ⠚⣯⣄⢠⣿⢀⣾⠇ ⠓ ⠁⠂⠈⠍⠐⠈⡉⣿⠛⣛⠛⠉⣤⣰⣿⣿⡟⠛⠁      ',
--                 '        ⠙⠛⠐⠚⠋ ⠒⣲⡿⠇⣋        ⢺⡏⠈⣀ ⠉⠈        ⠙⢿⠟⢰⣖⡢ ⠂⠒⠚⠉         ',
--                 '             ⣴⠛⠅⢀⣾⠟⢃       ⢹⠃⠠⠁⠈⠩         ⢠⣿ ⣀⢹⣿⡷             ',
--                 '             ⢿⣤⢚⣫⠅         ⢸⠇ ⢚ ⢀         ⣸⡇ ⠉⣿⣿⠇             ',
--                 '             ⠈⠛⢻⣥⡚⠔⣠⢣⣄⡀    ⢸⡇ ⢘ ⠈ ⠠⠈    ⣀⣰⡿⣧⣄⠾⠋⠁              ',
--                 '                ⠈⠑⠁        ⠘⣿⡀⣈⣀    ⠈  ⠈⠙⠁                    ',
--                 '                            ⠘⣷⠁                               ',
--                 '                             ⠙⣤                               ',
--                 '                              ⠛⠂                              ',
--                 '                                                              '
--         },
--         center = {
--             {icon = '  ',
--             icon_hi = 'Title',
--             desc = 'New File                       ',
--             desc_hi = 'String',
--             key = 'n',
--             keymap = 'LDR n',
--             key_hi = 'Number',
--             action ='enew'},
        
--             {icon = '漣 ',
--             icon_hi = 'Title',
--             desc = 'Neovim config',
--             desc_hi = 'String',
--             key = 'nc',
--             keymap = 'LDR nc',
--             key_hi = 'Number',
--             action = 'lua config_nvim()'},

--             {icon = '  ',
--             icon_hi = 'Title',
--             desc = 'Competitive',
--             desc_hi = 'String',
--             key = 'c',
--             keymap = 'LDR c',
--             key_hi = 'Number',
--             action ='CphReceive'},

--             {icon = '  ',
--             icon_hi = 'Title',
--             desc = 'Find Files',
--             desc_hi = 'String',
--             key = 'f',
--             keymap = 'LDR f',
--             key_hi = 'Number',
--             action ='Telescope find_files'},

--             {icon = '  ',
--             icon_hi = 'Title',
--             desc = 'Find History',
--             desc_hi = 'String',
--             key = 'o',
--             keymap = 'LDR o',
--             key_hi = 'Number',
--             action ='Telescope oldfiles'},
--         },
--     }
-- }


vim.cmd([[highlight DashboardHeader guifg=#ffffff]])

