#!/bin/sh

DOTFILES_BOOTSTRAP=false source ./bootstrap.sh

package="fish"

install_packages_if_necessary "${package}" || die "Installing ${package} failed"

fish_path=$(which fish)

if ! [ "$SHELL" = "$fish" ]; then
	sudo chsh -s "${fish_path}"  $USER
fi

info "Installing fisher..."
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish \
	|| die "Installing fisher failed"

# TODO: use fishfile?
command "${fish_path}" -c 'fisher add \
	mwilliammyers/pack \
	mwilliammyers/handy \
	mwilliammyers/j \
	jethrokuan/fzf \
	rafaelrinaldi/pure \
	patrickf3139/Colored-Man-Pages'
