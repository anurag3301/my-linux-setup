-- Plugin Github: https://github.com/rmagatti/goto-preview

require('goto-preview').setup {
    width = 120;
    height = 15;
    border = {"↖", "─" ,"┐", "│", "┘", "─", "└", "│"};
    default_mappings = false;
    debug = false;
    opacity = nil;
    resizing_mappings = false;
    post_open_hook = nil;
    post_close_hook = nil;
    references = {
        telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
    };
    focus_on_open = true;
    dismiss_on_move = false;
    force_close = true,
    bufhidden = "wipe",
    stack_floating_preview_windows = true,
    preview_window_title = { enable = true, position = "left" },
}
