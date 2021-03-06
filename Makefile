# configuration
MAKEFLAGS      = --no-builtin-rules --silent --warn-undefined-variables
SHELL         := sh

.DEFAULT_GOAL := help
.ONESHELL     :
.SHELLFLAGS   := -eu -c

# configuration
color_off    = $(shell tput sgr0)
color_bright = $(shell tput bold)

# convenience function to alert user to missing target
define missing_target
	$(error Missing target. Specify with `target=<provider>`)
endef

.SILENT .PHONY: clear
clear:
	clear

.SILENT .PHONY: help
help: # Displays this help text
	$(info )
	$(info $(color_bright)Building Infrastructure you can (mostly) trust$(color_off))
	grep \
		--context=0 \
		--devices=skip \
		--extended-regexp \
		--no-filename \
			"(^[a-z-]+):{1} ?(?:[a-z-])* #" $(MAKEFILE_LIST) | \
	awk 'BEGIN {FS = ":.*?# "}; {printf "\033[1m%s\033[0m;%s\n", $$1, $$2}' | \
	column \
		-c2 \
		-s ";" \
		-t
	$(info )

.SILENT .PHONY: docs
docs: # Generate documentation with `terraform-docs`
		terraform-docs \
			--config ".terraform-docs.yml" \
			.

.SILENT .PHONY: pre-commit
pre-commit: # Runs pre-commit checks with `pre-commit`
		pre-commit \
			run \
				--all-files

.SILENT .PHONY: rover
rover: # Visualize Terraform Data Sources and Resources with `rover` (via Docker)
		open "http://localhost:9000" \
		&& \
		docker \
			run \
				-it \
				--rm \
				-p "9000:9000" \
				-v "$(CURDIR):/src" \
				"im2nguyen/rover"

# unsupported shorthand for Rover for `module-example`
.SILENT .PHONY: rover-module
rover-module:
		open "http://localhost:9000" \
		&& \
		docker \
			run \
				-it \
				--rm \
				-p "9000:9000" \
				-v "$(CURDIR)/module-example:/src" \
				"im2nguyen/rover"

.SILENT .PHONY: tflint
tflint: # Validate code with `tflint`
		tflint \
			--config ".tflint.hcl"
