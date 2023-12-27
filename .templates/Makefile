############################## Variables ##############################
HERE := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
SHELL=/bin/bash
#######################################################################

############################### Colors ################################
# Call these using the construct @$(call {VAR},"text to display")
MK_RED = echo -e "\e[31m"$(1)"\e[0m"
MK_GREEN = echo -e "\e[32m"$(1)"\e[0m"
MK_YELLOW = echo -e "\e[33m"$(1)"\e[0m"
MK_BLUE = echo -e "\e[34m"$(1)"\e[0m"
MK_MAGENTA = echo -e "\e[35m"$(1)"\e[0m"
MK_CYAN = echo -e "\e[36m"$(1)"\e[0m"
MK_BOLD = echo -e "\e[1m"$(1)"\e[0m"
MK_UNDERLINE = echo -e "\e[4m"$(1)"\e[0m"
MK_RED_BOLD = echo -e "\e[1;31m"$(1)"\e[0m"
MK_GREEN_BOLD = echo -e "\e[1;32m"$(1)"\e[0m"
MK_YELLOW_BOLD = echo -e "\e[1;33m"$(1)"\e[0m"
MK_BLUE_BOLD = echo -e "\e[1;34m"$(1)"\e[0m"
MK_MAGENTA_BOLD = echo -e "\e[1;35m"$(1)"\e[0m"
MK_CYAN_BOLD = echo -e "\e[1;36m"$(1)"\e[0m"
MK_RED_UNDERLINE = echo -e "\e[4;31m"$(1)"\e[0m"
MK_GREEN_UNDERLINE = echo -e "\e[4;32m"$(1)"\e[0m"
MK_YELLOW_UNDERLINE = echo -e "\e[4;33m"$(1)"\e[0m"
MK_BLUE_UNDERLINE = echo -e "\e[4;34m"$(1)"\e[0m"
MK_MAGENTA_UNDERLINE = echo -e "\e[4;35m"$(1)"\e[0m"
MK_CYAN_UNDERLINE = echo -e "\e[4;36m"$(1)"\e[0m"

# Semantic names
MK_ERROR = $(call MK_RED,$1)
MK_ERROR_BOLD = $(call MK_RED_BOLD,$1)
MK_ERROR_UNDERLINE = $(call MK_RED_UNDERLINE,$1)
MK_INFO = $(call MK_BLUE,$1)
MK_INFO_BOLD = $(call MK_BLUE_BOLD,$1)
MK_INFO_UNDERLINE = $(call MK_BLUE_UNDERLINE,$1)
MK_SUCCESS = $(call MK_GREEN,$1)
MK_SUCCESS_BOLD = $(call MK_GREEN_BOLD,$1)
MK_SUCCESS_UNDERLINE = $(call MK_GREEN_UNDERLINE,$1)
######################################################################

.PHONY: help

default: help

##@ Help

help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[0-9a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-40s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

# Create sections using \#\#@ {section name}; see above "Help" comment
# Provide help for a target using comments starting with two hashtags; see above "help" target
# For a great tutorial of Makefile features, see https://makefiletutorial.com/
# https://mwop.net/blog/2023-12-11-advent-makefile.html
