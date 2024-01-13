.SILENT:
install:
	cp ./delete-git-branches.sh ${HOME}/.delete-git-branches.sh
	echo "alias delete-git-branches=${HOME}/.delete-git-branches.sh" >> ${HOME}/.bash_profile
	echo "delete-git-branches installed successfully. You may have to start a new terminal session or resource .bash_profile for the command to be available."
