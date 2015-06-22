#!/usr/bin/env zsh

## XDG settings ##################################
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share
export XDG_BIN_HOME=~/.local/bin
export XDG_CONFIG_HOME=~/.config

## ZSH settings ####################################
export ZSHRC=${HOME}/.zshrc
export ANTIBODY_HOME="${XDG_CONFIG_HOME}/antibody"
export ZSH_COMPDUMP="${XDG_DATA_HOME:-${HOME}}/.zcompdump-${HOST/.*/}"

## EXPORTS ############################################
export _FASD_DATA="${XDG_DATA_HOME}/fasd"

export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc.py"
export ECLIMSTARTUP="${XDG_CONFIG_HOME}/eclim/eclimrc"
export CURL_HOME="${XDG_CONFIG_HOME}/curl"
export GOPATH=${XDG_BIN_HOME}

# TODO: find away around needing this check...
if [[ "$OSTYPE" =~ ^(linux)+ ]]; then
    default_path=/usr/local/cuda/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/opt/ganglia/bin:/opt/ganglia/sbin:/opt/ibutils/bin:/usr/java/latest/bin:/opt/rocks/bin:/opt/rocks/sbin:/opt/dell/srvadmin/bin
    export PATH="/bluehome3/wmyers7/.fslbuild/bin:/bluehome3/wmyers7/.fslbuild/sbin:/fslhome/wmyers7/.linuxbrew/opt/go/libexec/bin:/fslhome/wmyers7/.local/bin:${default_path}"
    export MANPATH="${XDG_DATA_HOME}/man:/bluehome3/wmyers7/.fslbuild/share/man:/bluehome3/wmyers7/.fslbuild/share/man:/bluehome3/wmyers7/.linuxbrew/share/man"
    export INFOPATH="${XDG_DATA_HOME}/info:/bluehome3/wmyers7/.fslbuild/share/info/bluehome3/wmyers7/.linuxbrew/share/info"

    ## OS specific settings ############################
    export HOMEBREW_CELLAR="/apps"
    export HOMEBREW_CACHE="/apps/src"
    export HOMEBREW_LOGS="${XDG_DATA_HOME}/Homebrew"
    export HOMEBREW_TAP_USE_SSH=true
    export HOMEBREW_BREW_FILE=~/.linuxbrew/bin/linuxbrew
    export HOMEBREW_DEVELOPER=true
    export HOMEBREW_TEMP=/dev/shm

    export PYENV_ROOT=/bluehome3/wmyers7/.linuxbrew/var/pyenv

    lbrew() {
        ~/.linuxbrew/bin/linuxbrew ${@}
    }

    # Perl setup
    perl_module_root="/apps/perlmodules"
    #export PERLBREW_ROOT=${perl_module_root}/perl5
    ##source ${PERLBREW_ROOT}/etc/bashrc
    export PERL_CPANM_HOME=${perl_module_root}/cpanm
    #export PERL5LIB="${PERLBREW_ROOT}/lib/perl5:${PERLBREW_ROOT}/lib/perl5/x86_64-linux-thread-multi/Linux"
    #export PERL_MB_OPT="--install_base = ${PERLBREW_ROOT}"
    #export PERL_MM_OPT="INSTALL_BASE=${PERLBREW_ROOT}"
    #export PERLBREW_HOME=${PERLBREW_ROOT}/.perlbrew
    #export PERL_LOCAL_LIB_ROOT=${PERLBREW_ROOT}

    export ANTIBODY_BUNDLE_FILE=${ZSH}/antibody/bundles.linux

    #source ~/.linuxbrew/etc/grc.bashrc #FIXME: this is hardcoded
    source /usr/share/Modules/init/zsh
    source ~/.modules
elif [[ "$OSTYPE" =~ ^(darwin)+ ]]; then
    echo "TODO"
    export ANTIBODY_BUNDLE_FILE=${ZSH}/antibody/bundles.osx
fi
