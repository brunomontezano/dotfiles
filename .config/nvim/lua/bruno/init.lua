vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

require("bruno.lazy-bootstrap")

require("bruno.lazy-plugins")

require("bruno.set")

require("bruno.remap")
