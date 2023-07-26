# StayAwake
This script keeps your computer from sleeping and keeps you active on apps like Microsoft Teams. It does so by pressing the F13 key every 6 seconds for a certain time. The F13 key doesn't exist physically but virtually, so most of the programs on your computer shouldn't react to it.

This script does not require any installation or admin rights. Also, it just runs on Windows machines.

To use it, simply download "stayawake.ps1". Then right click and select "Run with PowerShell".

![screenshot](https://github.com/TBen2000/StayAwake/assets/59891192/a219788e-01ab-42c6-824e-0bfd8cb4f40a)


_Alternatively_, the following command can be executed in Windows PowerShell. This loads the script directly from GitHub and executes it without storing it long-term on the computer.
```
. { iwr -useb https://raw.githubusercontent.com/TBen2000/StayAwake/main/stayawake.ps1 } | iex; install
```

&nbsp;
> **Warning**\
> Especially in a work environment, it makes sense for a computer to lock itself after a certain time. This script bypasses this security feature. Be aware that people with physical access could harm your company or your private network.
