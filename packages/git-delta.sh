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

require 'curl'

use_brow formula 'git-delta'
use_dpkg 'git-delta' 'https://github.com/dandavison/delta/releases/download/0.4.4/git-delta_0.4.4_armhf.deb'
