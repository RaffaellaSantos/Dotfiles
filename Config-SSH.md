## Verificar se já existe uma chave SSH

```
ls -al ~/.ssh
```

## Gerar uma nova chav SSH

```
ssh-keygen -t ed25519 -C "seu_email@exemplo.com"
```

## Iniciar o ssh-agent

```
eval "$(ssh-agent -s)"
```

## Adicionar a chave ao ssh-agente

```
ssh-add ~/.ssh/id_ed25519
```

## Copiar a chave pública

```
cat ~/.ssh/id_ed25519.pub
```

## Adicione a chave ao GitHub

- Vá em Settings → SSH and GPG Keys
- New SSH Key
- Cole a chave e salve
- Teste a conexão

```
ssh -T git@github.com
```
