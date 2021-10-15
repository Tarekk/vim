# vim

I don't know where else to put this, use it when you want to remove newly added files to
.gitignore

git rm --cached `git ls-files -i -c --exclude-from=.gitignore`
