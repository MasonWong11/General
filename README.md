# General
Install:
- Powershell 7
- WSL ubuntu
- Neovim (Make a symbolic link in ~/.local/bin which points to the actual location of neovim. For example nvim -> ./squashfs-root/usr/bin/nvim)
- Vscode
- Azure CLI and Azure PowerShell
- Docker Desktop


The dendency graph of the files in this directory is shown below:
```mermaid
graph TD;

    authenticate(Authenticate.ps1)
    check_context(Check-Context.ps1)
    get_older_pat(Get-OlderPAT.ps1)
    manage_pat(Manage-PAT.ps1)
    manage_variable(Manage-Variable.ps1)
    pipeline(pipeline.yaml)

    style authenticate fill:blue,color:white
    style check_context fill:green,color:white
    style manage_pat fill:#FFC600,color:black
    style manage_variable fill:#FF4866,color:black
    style pipeline fill:orange,color:black
    style get_older_pat fill:purple,color:white

    check_context-->manage_pat
    check_context-->manage_variable
    check_context-->get_older_pat

    manage_pat-->pipeline
    manage_variable-->pipeline
    authenticate-->pipeline
    get_older_pat-->pipeline
```
