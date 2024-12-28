install: waybar hypr river

.PHONY: hypr
hypr:
	ln -s ${PWD}/hypr ${HOME}/.config/hypr

.PHONY: river
river:
	ln -s ${PWD}/river ${HOME}/.config/river

.PHONY: waybar
waybar:
	ln -s ${PWD}/waybar ${HOME}/.config/waybar
