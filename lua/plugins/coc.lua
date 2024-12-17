return {
  {
    "neoclide/coc.nvim",
    branch = "release",
    lazy = false,
    name = "coc.nvim",
    priority = 1000,
    config = function()
      vim.cmd [[
        " Global extensions for coc.nvim (install html and css)
        let g:coc_global_extensions = ['coc-html', 'coc-css']
        " Arrow keys for navigation
        inoremap <silent><expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
        inoremap <silent><expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"

        " Enter does nothing when popup menu is visible
        inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
      ]]
    end
  }
}
