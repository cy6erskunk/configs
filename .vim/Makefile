plugins: vundle
	@echo "Cloning plug-ins..."
	@vim +BundleInstall +qall
	@echo "Done."

vundle: bundle/vundle
bundle/vundle:
	@echo "Cloning Vundle..."
	@git clone git://github.com/gmarik/vundle.git bundle/vundle > /dev/null
	@echo "Done."
