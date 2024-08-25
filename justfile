
@default:
	just --list

@update-fork:
	git remote -v
	# In case of not having the remote.
	# git remote add upstream https://github.com/otheruser/repo.git
	git fetch upstream
	git checkout master
	git merge upstream/master
	# git merge upstream/master
	# or
	# git pull --rebase

	### Otherway alltogether

	# git pull upstream master
	# git push
	# Follow https://stackoverflow.com/questions/7244321/how-do-i-update-or-sync-a-forked-repository-on-github
