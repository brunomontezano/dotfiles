# dwmblocks
Modular status bar for dwm written in c.

# How to modify it?
The statusbar is made from text output from scripts found in my [.local/bin](https://gitlab.com/dwt1/dotfiles/-/tree/master/.local/bin).  Blocks are added and removed by editing the blocks.h header file.

# In order to make it work for you...
You will need my dwmblocks build and my scripts in [.local/bin](https://gitlab.com/dwt1/dotfiles/-/tree/master/.local/bin).  Make sure that .local/bin is in your $PATH otherwise you can't call those scripts by name which is what I'm doing in blocks.h.  Instead, you'd have to write out the full path to each script in the blocks.h.

To add .local/bin to $PATH, just add this line to your .bashrc file:

	PATH="$HOME/.local/bin${PATH:+:${PATH}}"
