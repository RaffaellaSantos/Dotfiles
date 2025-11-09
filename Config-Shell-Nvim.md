# Comandos de prompt

Acessa o arquivo de configuração do lazy
```zsh
nvim ~/.config/nvim/init.lua
```

Acessa as config do bash/zsh
```
nvim ~/.bashrc
nvim ~/.zshrc
```

Acessa o arquivo de configuração do starship
```
nvim ~/.config/starship.toml
```

# Configurações de terminal e do Nvim

Configuração do Terminal Tilix (zsh)
```
# Inicializa Starship
eval "$(starship init zsh)"

# Comando digitado colorido
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Alias úteis
alias ll='ls -lah'
alias cls='clear'

# Histórico
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt appendhistory
setopt sharehistory

# Caminho de comandos
export PATH="$HOME/bin:$PATH"
```

Configuração do arquivo .toml do Starship
```
# Adiciona uma linha em branco entre a saída do comando e o prompt
add_newline = true

# Layout do prompt: diretório em cima, prompt embaixo
format = """
$directory$git_branch$cmd_duration
$character
"""

# Diretório atual
[directory]
style = "bold cyan"
format = "[$path]($style) "
truncation_length = 3
truncate_to_repo = false

# Branch Git
[git_branch]
symbol = "🌿 "
style = "bold purple"
format = "on [$symbol$branch]($style) "

# Duração do comando anterior
[cmd_duration]
format = "took [$duration](bold yellow) "

# Símbolo do prompt
[character]
success_symbol = "[➜](bold green)"
error_symbol = "[✗](bold red)"
vicmd_symbol = "[🟡](bold yellow)"
```

Configuração init.lua
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

```
