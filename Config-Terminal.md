# Setup Completo do Terminal (Zsh + Starship + FastFetch)

---

# Instalações necessárias

---

## Instalar Zsh

```bash
sudo apt install zsh -y
```

Definir como shell padrão:

```bash
chsh -s $(which zsh)
```

⚠️ Faça logout/login depois.

---

## Instalar Neovim

```bash
sudo apt install neovim -y
```

Para ver configurações feita no Neovim clique [aqui](Config-Neovim.md)
---

---

## Instalar Starship

Instalação oficial via script:

```bash
curl -sS https://starship.rs/install.sh | sh
```

Ou via apt (pode estar desatualizado):

```bash
sudo apt install starship
```

Verificar instalação:

```bash
starship --version
```

---

## Instalar zsh-syntax-highlighting

```bash
sudo apt install zsh-syntax-highlighting
```

---

## Instalar NVM (Node Version Manager)

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```

Recarregue:

```bash
source ~/.zshrc
```

Instalar última versão do Node:

```bash
nvm install --lts
```

---

# Configuração do Starship

Criar diretório de configuração se não existir:

```bash
mkdir -p ~/.config
```

Editar config:

```bash
nvim ~/.config/starship.toml
```

## Configuração do arquivo .toml do Starship
```bash
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

[python]
symbol  = "🐍 "
style = "bold green"
format = "via [$symbol$virtualenv]($style) "
detect_files = [".venv"]
detect_extensions = []
detect_folders = []
```

---

# Configuração completa do ~/.zshrc

Sugestão com pequenos ajustes:

```bash
# Inicializa Starship
eval "$(starship init zsh)"

# Comando digitado colorido
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Alias úteis
alias cls='clear'

# Histórico
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt appendhistory
setopt sharehistory

# Caminho de comandos
export PATH="$HOME/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

```

Salvar e aplicar:

```bash
source ~/.zshrc
```

---

# Configuração do FastFetch

## Instalar

```bash
sudo apt install fastfetch
```

---

## Criar config personalizada

Gerar config padrão:

```bash
fastfetch --gen-config
```

Editar:

```bash
nvim ~/.config/fastfetch/config.jsonc
```

Exemplo de config customizada:

```jsonc
{
    "logo":{
        "source": "/home/user/Imagens/WPP/bokuto_logo.txt",
        "color": {
            "1": "0"
        },
        "padding": {
            "right": 2
        }
    },
    "display": {
        "separator": " : "
    },
    "modules": [
        "os",
        "kernel",
        "uptime",
        "packages",
        "shell",
        "terminal",
        "cpu",
        "gpu",
        "memory",
        "disk",
        "battery"
    ]
}
```

---

# Extras Opcionais

## Instalar exa (substituto moderno do ls)

```bash
sudo apt install exa
```

Alias (Adicione ao ~/.zshrc):

```bash
alias ls='exa --icons'
alias ll='exa -lah --icons'
```

---

## Instalar bat (cat melhorado)

```bash
sudo apt install bat
```

Alias (Adicione ao ~/.zshrc):

```bash
alias cat='batcat'
```

---

# Ordem ideal de instalação

1. Atualizar sistema
2. Instalar Zsh
3. Definir Zsh como padrão
4. Instalar Starship
5. Instalar plugins do Zsh
6. Instalar FastFetch
