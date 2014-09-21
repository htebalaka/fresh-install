
FRESH_INSTALL = ~/gits/fresh-install
ALL_PROFILE = $(FRESH_INSTALL)/profile.all
PROFILE = $(FRESH_INSTALL)/profile/profile.$(call if_osx,osx,unix)
VIM = $(FRESH_INSTALL)/vim
VIM_FILES = $(shell find $(VIM)/.vim/plugin -type f) $(shell find $(VIM)/.vim/ftplugin -type f)

HOME_PROFILE = $(call if_osx,~/.bash_profile,~/.profile)

.PHONY: all 

# is used to detect if osx is running. obviously this needs to be improved
define if_osx
$(shell if [ -f ~/.bash_profile ]; then echo "$1"; else echo "$2";fi)
endef

all: $(VIM_FILES) $(PROFILE)

$(PROFILE) $(ALL_PROFILE):
	@echo "Rejiggering profile"
	@if ! grep -Fq "$(PROFILE)" $(HOME_PROFILE); then echo "source $(PROFILE)" >> $(HOME_PROFILE);fi
	@if ! grep -Fq "$(ALL_PROFILE)" $(HOME_PROFILE); then echo "source $(ALL_PROFILE)" >> $(HOME_PROFILE);fi
	@source $(HOME_PROFILE)

$(VIM_FILES):
	@echo "Rejiggering vim"
	@rm ~/.vimrc && cp $(VIM)/.vimrc ~/.vimrc
	@rm -rf ~/.vim/plugin && cp -rf $(VIM)/.vim/plugin ~/.vim/plugin
	@rm -rf ~/.vim/ftplugin && cp -rf $(VIM)/.vim/ftplugin ~/.vim/ftplugin

vim-nuke:
	@echo "Nuking .vimrc"
	@rm -rf ~/.vim && rm ~/.vimrc
	@git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	@cp -r $(VIM) ~/
	@vim +PluginInstall +qall

theano-env: 
	conda create -name theano python=2.7 pydot numpy scipy
	conda activate theano
	conda update conda
	conda install binstar

