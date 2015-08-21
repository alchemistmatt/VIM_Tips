gVIM Installer
http://www.vim.org/download.php

Latest 64-bit version (auto-compiled)
https://tuxproject.de/projects/vim/

MRU Plugin
http://www.vim.org/scripts/script.php?script_id=521

txt.vim
http://www.vim.org/scripts/script.php?script_id=1532

mediawiki.vim
https://github.com/chikamichi/mediawiki.vim/blob/master/syntax/mediawiki.vim
(click on Raw)

VIM-Airline Plugin
http://vimawesome.com/plugin/vim-airline-sad-beautiful-tragic
git clone https://github.com/bling/vim-airline

== Installation ==

1. Run the GUI installer
2. Extract the latest 64-bit files and use Beyond Compare to
   update the files at "C:\Progrm Files (x86)\"

3. Place the _vimrc file at c:\users\d3l243\

Create a hard link to the file at an admin prompt using:

cd C:\Program Files (x86)\Vim
mklink /h _vimrc c:\users\d3l243\_vimrc

We must do this because gvim first looks for a _vimrc file at ~
and we have to place the file there so that VisVim (for Visual Studio)
can read it.

4. Place customized plugins and syntax files at c:\users\d3l243\vimfiles

5. Edit the registry to make it so that files double clicked in explorer open in a new tab
   Go to key HKEY_CLASSES_ROOT\Applications\gvim.exe\shell\edit\command 
   and set the Value Data to

C:\Program Files (x86)\Vim\vim74\gvim.exe --remote-tab-silent "%1"

== Color Schemes ==

http://vimcolors.com/?utf8=%E2%9C%93&bg=light&colors=gui&order=newest

git clone https://github.com/flazz/vim-colorschemes.git ~/.vim

