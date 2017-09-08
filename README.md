Plugin manager: [vim-plug](https://github.com/junegunn/vim-plug)

Install vim-gtk: `sudo apt install vim-gtk`

Clone repository and run `./install.sh`

youcompleteme
- `sudo apt-get install build-essential cmake`
- `sudo apt-get install python-dev python3-dev`
- `cd ~/.vim/plugged/youcompleteme && sudo ./install.sh`

To check which plugins are making vim slow:

```
:profile start profile.log
:profile func *
:profile file *
" At this point do slow actions
:profile pause
:noautocmd qall!
```
