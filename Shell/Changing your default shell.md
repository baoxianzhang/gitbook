# Changing your default shell

https://wiki.archlinux.org/index.php/Command-line_shell#Changing_your_default_shell

Changing your default shell

After installing one the above shells, you can execute that shell inside of your current shell, by just running its executable. If you want to be served that shell when you login however, you will need to change your default shell.

To list all installed shells, run:

$ chsh -l

And to set one as default for your user (make sure you use the full path, as given by chsh -l):

$ chsh -s *full-path-to-shell* 

If you now log out and log in again, you will be greeted by the other shell.

Zsh guide

http://zsh.sourceforge.net/Guide/zshguide.html