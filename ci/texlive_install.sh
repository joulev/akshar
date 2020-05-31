#!/usr/bin/env sh

# Modified from https://github.com/latex3/latex3/blob/master/support/texlive.sh

# This script is used for testing using Travis
# It is intended to work on their VM set up: Ubuntu 12.04 LTS
# A minimal current TL is installed adding only the packages that are
# required

# See if there is a cached version of TL available
export PATH=/tmp/texlive/bin/x86_64-linux:$PATH
if ! command -v texlua > /dev/null; then
  # Obtain TeX Live
  wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
  tar -xzf install-tl-unx.tar.gz
  cd install-tl-20*

  # Install a minimal system
  ./install-tl --profile=../ci/texlive.profile

  cd ..
fi

# Update tlmgr itself
tlmgr update --self

# The test framework itself
tlmgr install l3build

# Build the documentation using XeLaTeX
tlmgr install xetex

# Then get the rest of required LaTeX
tlmgr install amsmath graphics tools

# Assuming a 'basic' font set up, metafont is required to avoid
# warnings with some packages and errors with others
tlmgr install metafont mfware texlive-scripts

# Contrib packages for testing
tlmgr install \
  l3kernel \
  l3packages \
  fontspec \
  newtxmath \
  newtx \
  newunicodechar \
  pgf \
  tcolorbox \
  sectsty \
  fontawesome5 \
  alphalph \
  infwarerr \
  intcalc \
  amssymb \
  amsfonts \
  booktabs \
  color \
  colortbl \
  hologo \
  ltxcmds \
  kvsetkeys \
  kvdefinekeys \
  pdftexcmds \
  iftex \
  kvoptions \
  enumitem \
  psnfss \
  csquotes \
  etoolbox \
  fancyvrb \
  underscore \
  lmodern \
  oberdiek \
  atveryend \
  hyperref \
  pdfescape \
  hycolor \
  letltxmacro \
  auxhook \
  etexcmds \
  url \
  bitset \
  bigintcalc \
  atbegshi \
  stringenc \
  rerunfilecheck \
  uniquecounter \
  xkeyval \
  kastrup \
  xcolor \
  refcount \
  gettitlestring

# Keep no backups (not required, simply makes cache bigger)
tlmgr option -- autobackup 0

# Update the TL install but add nothing new
tlmgr update --self --all --no-auto-install