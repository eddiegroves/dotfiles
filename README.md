# About ConEmu

![ConEmu](https://raw.github.com/eddiegroves/dotfiles/master/screenshots/conemu.png "ConEmu")

By default ConEmu stores it's settings in the registry. You can check this by inspecting 
settings and looking at the **Export** text field.  The program will change to reading settings
from `ConEmu.xml` by placing the file along side `ConEmu.exe`. 

I manually keep my dotfiles copy of ConEmu.xml synced with the version beside the executable
because ConEmu will constantly update a datetime stamp in the file, causing it to change
frequently.

## conemu.start

A start list to setup tabs / splits / shells in a new ConEmu session.
`>` will be the active window, `*` forces admin mode.

    ConEmu.exe /cmd @conemu.start

* [More information on ConEmu settings][1]
* [ConEmu.exe Command line switches][2]
* [Startlist syntax][3]

[1]: http://superuser.com/questions/450144/how-do-i-export-conemu-settings
[2]: https://code.google.com/p/conemu-maximus5/wiki/Command_Line
[3]: https://code.google.com/p/conemu-maximus5/wiki/NewConsole
