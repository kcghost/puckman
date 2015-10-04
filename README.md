puckman
=======
A wrapper utility for pacman, the package manager for Arch.
Its aim is to provide a simpler interface for the most used functionality.

Install
-------
It's optional, but I highly recommend you install the `bash-completion` package:
```
pacman -Sy bash-completion
```
The package enables tab completion support for the options of many popular utilities.
This project adds a completion script to the the list so you can tab to see the commands, then tab to see eligible packages, etc.

Then just run:
```
make install
```

Uninstall with:
```
make uninstall
```

Usage
-----
`puckman update` is the equivalent of `pacman -Sy` and updates the package database. It also grabs the AUR package list, be sure to do this explicitly if you want to see AUR packages for the `install` completion.

`puckman install <package>` (for official packages) is the equivalent of `pacman -Sy <package>`  and installs a package (also updates the official package database). If an AUR package is specified, it will automatically download it, build it, and install it. No distinction is made between official and AUR packages. I'm rebellious like that.

`puckman remove <package>` is the equivalent of `pacman -Rsc <package>` and completely removes a package and all the packages that would be orpaned by it.

`puckman clean` removes orphan packages. Does `pacman -Rsc` for any package listed by `pacman -Qdt`.

`puckman upgrade` is the equivalent of `pacman -Syu` and performs upgrades for every installed package on the system.

`puckman list` lists the explicitly installed packages on the system. It lists packages listed by `pacman -Qei` without those in `base` or `base-devel`.

If you have the `bash-completion` package installed, you may type `puckman <TAB><TAB>` to list the commands, and `puckman install <TAB><TAB>` or `puckman remove <TAB><TAB>` will list the eligible packages to install or remove (includes both official and AUR packages). You may also begin to type a package name and tab to complete it or get a list of the eleigible packages starting with what you already typed.

Upcoming
--------
I plan on improving some AUR related functionality, perhaps distinguising it from official packages a little more.

License
-------
[The Unlicense](http://unlicense.org/). This project is truly free, and public domain. It's a stupid little script, I really don't care what you do with it.