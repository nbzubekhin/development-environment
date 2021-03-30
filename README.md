# Development environment: Tmux + VIM + VIM's Plugins

Building vim + tmux in Linux into an effective C/C++/(and other languages) programming IDE.

# Keymap on VIM

### Hot keys for `clang-format`
* `<Ctrl> + <f>`: Execute `clang-format` with current file; also we can use it with selected part

### Hot keys for `cmake-format`
* `<Ctrl> + <m>`: Execute `cmake-format` with current file; also we can use it with selected part

### Hot keys for `TIG`
* `<ESC> + <T>`: Open `tig` with current file
* `<ESC> + <t>`: Open `tig` with Project root path
* `<ESC> + <g>`: Open `tig` `grep`
* `<ESC> + <r>`: Resume from last `grep`
* `<ESC> + <g>`: Open `tig` `grep` with the selected word
* `<ESC> + <cg>`: Open `tig` `grep` with the word under the cursor
* `<ESC> + <b>`: Open `tig` blame with current file

# Installation

### Via curl
```
bash <(curl --silent https://raw.githubusercontent.com/nbzubekhin/development-environment/master/autoinstall.sh)

```

### Via wget

```
bash <(wget -O - https://raw.githubusercontent.com/nbzubekhin/development-environment/master/autoinstall.sh)
```
