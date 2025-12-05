## Acessa o arquivo de configuração do lazy
```zsh
nvim ~/.config/nvim/init.lua
```

## Configuração init.lua
```
-- Inicializa Lazy.nvim
vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

require("lazy").setup({
    -- Markdown Preview
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        ft = "markdown",
        config = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
    },

    -- Gerenciador de arquivos
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup {
                view = { width = 30, side = "left" },
                update_focused_file = { enable = true },
                renderer = { icons = { show = { git = true, folder = true, file = true } } },
            }
        end,
    },

    -- Ícones para nvim-tree
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },
})

-- Atalho para abrir/fechar nvim-tree
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Outras configurações úteis
vim.o.number = true           -- mostra números das linhas
vim.o.relativenumber = true   -- números relativos
vim.o.clipboard = "unnamedplus" -- integração com sistema
vim.o.expandtab = true        -- converte tabs em espaços
vim.o.shiftwidth = 4          -- largura de indent
vim.o.tabstop = 4
vim.o.termguicolors = true    -- cores verdadeiras
vim.o.cursorline = true       -- destaca linha atual
vim.o.scrolloff = 8           -- linhas visíveis acima/baixo do cursor
vim.o.updatetime = 300        -- para LSP e CursorHold

-- Atalho para Markdown Preview
vim.keymap.set('n', '<leader>mp', ':MarkdownPreview<CR>', { noremap = true, silent = true })

-- Salvamento automático ao sair do modo de inserção ou trocar de buffer
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  pattern = "*",
  command = "silent! write"
})

vim.opt.clipboard = "unnamedplus"

```