#!/bin/bash

vimrc="~/.vimrc"

# Load output colors for sexiness
green_color="\033[1;32m"
green_color_title="\033[0;32m"
red_color="\033[1;31m"
red_color_title="\033[0;31m"
blue_color="\033[1;34m"
normal_color="\e[1;0m"

function title_page() {
	echo -e"${blue_color}"
	sleep 0.15 && echo -e "  _____ _                   __  __        __      ___"
	sleep 0.15 && echo -e "  |  __ \(_\)               |  \/  |       \ \    / \(_\)"
	sleep 0.15 && echo -e "  | |__) | _ __ ___  _ __   | \  / |_   _   \ \  / / _ _ __ ___"
	sleep 0.15 && echo -e "  |  ___/ | '_ ` _ \| '_ \  | |\/| | | | |   \ \/ / | | '_ ` _ \\"
	sleep 0.15 && echo -e "  | |   | | | | | | | |_) | | |  | | |_| |    \  /  | | | | | | |"
	sleep 0.15 && echo -e "  |_|   |_|_| |_| |_| .__/  |_|  |_|\__, |     \/   |_|_| |_| |_|"
	sleep 0.15 && echo -e "                    | |              __/ |"
	sleep 0.15 && echo -e "                    |_|             |___/${normal_color}"

function flying_saucer() {
	case ${1} in
			1)
				echo "                                                             "
				echo "                         .   *       _.---._  *              "
				echo "                                   .'       '.       .       "
				echo "                               _.-~===========~-._          *"
				echo "                           *  (___________________)     .    "
				echo "                       .     .      \_______/    *           "
			;;
			2)
				echo "                        *         .  _.---._          .      "
				echo "                              *    .'       '.  .            "
				echo "                               _.-~===========~-._ *         "
				echo "                           .  (___________________)       *  "
				echo "                            *       \_______/        .       "
				echo "                                                             "
			;;
			3)
				echo "                                   *                .        "
				echo "                             *       _.---._              *  "
				echo "                          .        .'       '.       *       "
				echo "                       .       _.-~===========~-._     *     "
				echo "                              (___________________)         ."
				echo "                       *            \_______/ .              "
			;;
			4)
				echo "                        *         .  _.---._          .      "
				echo "                              *    .'       '.  .            "
				echo "                               _.-~===========~-._ *         "
				echo "                           .  (___________________)       *  "
				echo "                            *       \_______/        .       "
				echo "                                                             "
			;;
		esac
	sleep 0.4
}

function print_animated_saucer() {
	echo -e "\033[s"

		for i in $(seq 1 8); do
			if [ "${i}" -le 4 ]; then
				saucer_frame=${i}
			else
				saucer_frame=$((i-4))
			fi
			echo -e "\033[u"
			flying_saucer ${saucer_frame}
	done
}

function display_options() {
    options=("Fresh Install", "Update", "Reset And Rerun")
    option="Please select an option..."
    select value in options
    do
        case $value in
            "Fresh Install")
                fresh_install
                ;;
            "Update")
                update
                ;;
            "Reset And Rerun")
                reset
                ;;
        esac
    done
}

function cleanup_vimrc() {
    echo "Wiping existing vim configs"
    echo '' > $vimrc
}

function install_plugins() {
    echo -e "Grabbing NeoComplete (A recompile of vim may be needed)"

    echo "Airline Baby"
    git clone https://github.com/vim-airline/vim-airline.git ~/.vim/bundle/vim-airline
    echo "Installing pathogen"
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

    echo "Installing NERDTree"
    git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

    echo "Grab gruvbox plugin"
    git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox
}

function load_configs() {
    echo "execute pathogen#infect()" >> $vimrc
    echo "Adding key modifiers"
    echo "map<C-h> <C-w>h" >> $vimrc
    echo "map<C-j> <C-w>j" >> $vimrc
    echo "map<C-k> <C-w>k" >> $vimrc
    echo "map<C-l> <C-w>l" >> $vimrc
    echo "Setting terminal colors"
    echo set t_Co=256 >> $vimrc
    echo set encoding=utf-8 >> $vimrc
}

if [! -f $vimrc ]; then
    echo "Vimrc not found... creating"
    touch ~/.vimrc
    echo "Done, copying module code..."
fi
load_configs
install_plugins
