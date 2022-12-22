plugins: vundle
	@echo "Cloning plug-ins..."
	@vim +BundleInstall +qall
	@echo "Done."

vundle: bundle/vundle
bundle/vundle:
	@echo "Cloning Vundle..."
	@git clone https://github.com/VundleVim/Vundle.vim.git ./bundle/Vundle.vim > /dev/null
	@echo "Done."
