#!/usr/bin/bash

function install_packages()
{
	packages=("micro" "bat" "yakuake" "atuin" "exa")

	for pkg in ${packages[@]};
	do
		/bin/sudo /bin/apt -qq install $pkg -y > /dev/null 2>&1   	
	done

    /bin/curl -sS https://starship.rs/install.sh | sh
}

function aliases()
{
    /bin/cat .aliases >> $HOME/.zshrc
	source zshrc
}

function config_files()
{
	/bin/cat .yakuake_config > $HOME/.config/autostart/Yakuake.desktop
	/bin/cat .starship_config > $HOME/.config/starship.toml
}

#Main starts here
install_packages
aliases
config_file
/bin/echo "Done!"