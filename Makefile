install: waybar hypr river

.PHONY: hypr
hypr:
	ln -s ${PWD}/hypr ${HOME}/.config/hypr

.PHONY: river
river:
	ln -s ${PWD}/river/init ${HOME}/.config/river/init
	ln -s ${PWD}/river/background.png ${HOME}/.config/river/background.png

.PHONY: waybar
waybar:
	ln -s ${PWD}/waybar ${HOME}/.config/waybar

.PHONY: foot
foot:
	ln -s ${PWD}/foot ${HOME}/.config/foot
