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
        " Tab for navigating through completion menu (forward)
        inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

        " Shift+Tab for navigating through completion menu (backward)
        inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

        " Enter for confirming the completion
        inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

        " Ensuring completion popup behavior works smoothly
        set completeopt=menuone,noinsert,noselect
      ]]
    end
  }
}
