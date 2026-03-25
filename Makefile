install: waybar river foot nvim zellij

.PHONY: hypr
hypr:
	ln -fns ${PWD}/hypr ${HOME}/.config/hypr

.PHONY: river
river:
	ln -fns ${PWD}/river ${HOME}/.config/river

.PHONY: waybar
waybar:
	ln -fns ${PWD}/waybar ${HOME}/.config/waybar

.PHONY: foot
foot:
	ln -fns ${PWD}/foot ${HOME}/.config/foot

.PHONY: nvim
nvim:
	ln -fns ${PWD}/nvim ${HOME}/.config/nvim

.PHONY: zellij
zellij:
	ln -fns ${PWD}/zellij ${HOME}/.config/zellij
