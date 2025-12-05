## Acessa as config do zsh
```
nvim ~/.zshrc
```

## Configuração do Terminal Tilix (zsh)
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
export JMETER_HOME=/opt/jmeter
export PATH=$PATH:$JMETER_HOME/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

```

Salva as mudanças
```
source ~/.zshrc
```