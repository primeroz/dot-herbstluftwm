#!/usr/bin/env bash
##############################################################################
# @file ellipsis.sh
# @date January, 2016
# @author G. Roggemans <g.roggemans@grog.be>
# @copyright Copyright (c) GROG [https://grog.be] 2016, All Rights Reserved
# @license MIT
##############################################################################

pkg.link() {
    fs.link_file "$PKG_PATH/config" "$HOME/.config/herbstluftwm"
    fs.link_rfiles "$PKG_PATH/bin" "$HOME/bin"
}

##############################################################################

pkg.install(){
    mkdir -p ~/bin
}

##############################################################################

#pkg.pull(){
#
#    # Update dot-i3 repo
#    git.pull
#
#    # Update the config file
#    $PKG_PATH/compile.sh
#}

##############################################################################
