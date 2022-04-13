-- include presence and its config
require('presence'):setup({
    enable_line_number = false,
    main_image = 'file',
    neovim_image_text = 'Its Neovim buddy!!!',
    debounce_timeout = 10,
})
