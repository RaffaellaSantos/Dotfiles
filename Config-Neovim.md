⚠️ Observação importante:
Esse setup considera que o Terminal (Zsh + Starship + NVM) já foi configurado anteriormente, pois o plugin de Markdown precisa do Node (via NVM) instalado.

---
# Configuração NeoVim (lazy.nvim + Plugins)

---

## Instalação do Lzy.nvim

```bash
mkdir -p ~/.local/share/nvim/lazy
git clone https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy/lazy.nvim
```

## Cria repositório de configuração do NVIm
```bash
mkdir -p ~/.config/nvim
```

## Acessa o arquivo de configuração do lazy
```bash
nvim ~/.config/nvim/init.lua
```

## Configuração init.lua
```lua
-- ==============================
-- Init.lua completo para Neovim
-- ==============================

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

-- Atalho para abrir/fechar nvim-tree (Ctrl+b)
vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

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

-- Atalho para Markdown Preview (\mp)
vim.keymap.set('n', '<leader>mp', ':MarkdownPreview<CR>', { noremap = true, silent = true })

-- Salvamento automático ao sair do modo de inserção ou trocar de buffer
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  pattern = "*",
  command = "silent! write"
})

vim.opt.clipboard = "unnamedplus"

-- =========================
-- Copiar e Colar com Ctrl+C / Ctrl+V
-- =========================

-- Ctrl+C copia no modo visual
vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true })

-- Ctrl+V cola no modo normal
vim.keymap.set('n', '<C-v>', '"+p', { noremap = true, silent = true })

-- Ctrl+V cola no modo de inserção
vim.keymap.set('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })
```


# Primeira execução

1. Abra o Neovim com ```nvim```
2. O Lazy instalará os plugins automaticamente
3. Teste os comandos configurados.