# Create executable that starts clion installed at WSL

## Prerequisites
- Enable/Install WSL 
- Install Clion at the WSL
- Install XcXrv from [here](https://sourceforge.net/projects/vcxsrv/)



## Convert ps1 to admin exe

```
Invoke-ps2exe .\start_clion.ps1 clion_wsl.exe -requireAdmin -noConsole -noVisualStyles -noError -noOutput -iconFile 'clion.ico' 
```