## Acessa o arquivo de configuração do starship
```
nvim ~/.config/starship.toml
```

## Configuração do arquivo .toml do Starship
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

[python]
symbol  = "🐍 "
style = "bold green"
format = "via [$symbol$virtualenv]($style) "
detect_files = [".venv"]
detect_extensions = []
detect_folders = []
```