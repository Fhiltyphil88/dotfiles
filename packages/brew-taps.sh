#!/bin/sh

set -e

if
  (! command -v force_print >/dev/null 2>&1) ||
  ! $(force_print 3 a b >/dev/null 2>&1) ||
  test "$(force_print 3 a b)" != "a  b";
then
  printf "Please run this script through \"install.sh\" instead"
  exit 1
fi

use_brew_tap 'homebrew/cask'
use_brew_tap 'homebrew/cask-fonts'
use_brew_tap 'homebrew/cask-versions'
use_brew_tap 'homebrew/services'

use_brew_tap 'buo/cask-upgrade'
use_brew_tap 'domt4/autoupdate'

# for sc-im
use_brew_tap 'nickolasburr/pfa'
