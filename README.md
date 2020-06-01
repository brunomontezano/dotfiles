# Dotfiles

![Screenshot2020-05-2413:08:52](https://user-images.githubusercontent.com/65104127/82980825-e8c27880-9fd9-11ea-94dc-837b4e2ff46d.png)

Dotfiles are configuration files that are used to customize your Linux installation. It's called this way because there's is a period in the start of the filename (meaning it is a hidden file or directory), that looks like a dot. This repo contains some of my config files. This way I can use it as my backup if I format my machines or install it on new computers. Also, it can be helpful for some if you want to copy or take some ideas for your own customizations.

## Why do I have this repository?

- I can use it as my backup if I need;
- I use it as a learning tool (on git and configuration files in general);
- Maybe I can help some people that are looking for inspiration.

## Usage

You can download my dotfiles cloning this repository to your local machine and then copying the files you want to use as you wish.
In this example I'm going to demonstrate how you would use my .bashrc file as your bash configuration file:

$ git clone https://github.com/brunomontezano/dotfiles
$ cd dotfiles
$ cp .bashrc ~/.bashrc

If you do this, probably the next time you open your bash session, you're going to notice some changes, because of the new .bashrc file.
