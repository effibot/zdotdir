# handle git setup
gh auth login -p ssh -w
gh auth setup-git
# fish -c "ssh-add ~/.ssh/id_ed25519"

printf "Host github.com\n
	Hostname ssh.github.com\n
	Port 443\n
	User git\n
	ForwardAgent yes" >> .ssh/config
