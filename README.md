# Dotfiles

![Screenshot2022-01-2819:17:42](https://user-images.githubusercontent.com/65104127/151650740-42496d00-5df9-4bd7-93bf-65553c58e5ef.png)

## Dotfiles are configuration files that are used to customize your Linux installation.

It's called this way because there's a period in the start of the filename
(meaning it is a hidden file or directory), that looks like a dot. This repo
contains some of my config files. This way I can use it as my backup if I
format my machines or install it on new computers. Also, it can be helpful for
some if you want to copy or take some ideas for your own customizations.

## Why do I have this repository?

- I can use it as my backup if I need;
- I use it as a learning tool (on git and configuration files in general);
- Maybe I can help some people that are looking for inspiration.

## Usage

You can download my dotfiles cloning this repository to your local machine and
then copying the files you want to use as you wish.

In this example I'm going to demonstrate how you would use my `.bashrc` file as
your bash configuration file:

  ```
  $ git clone https://github.com/brunomontezano/dotfiles
  $ cd dotfiles
  $ cp .bashrc ~/.bashrc
  ```
  
If you do this, probably the next time you open your bash session, you're going
to notice some changes, because of the new `.bashrc` file.

Note that you should read everything inside those config files before putting
on your system. Sometimes there are something pointing to another file, script
or program and you should aknowledge that. But I'm sure you're pretty smart and
gonna work it out easily! Have a nice day!

## What software have I been using?

- WM: Qtile
- Terminal emulator: Alacritty
- Web browser: Firefox
- Music player: Cmus
- AUR helper: yay
- Video player: mpv
- Image viewer: sxiv
- Document viewer: zathura
- Text editor: Neovim
- File manager: ranger
- Reference manager: Zotero
- Programming-related: R, Python and shell scripting

## Support

Feel free to leave an issue on the [Issue tab](https://github.com/brunomontezano/dotfiles/issues) and I'll try to respond as soon as possible.
