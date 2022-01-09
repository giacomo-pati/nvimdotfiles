# nvimdotfiles
Neovim configuration system

## Installation of Prereqs on WSL/Ubuntu (system level)
- WSL: Install "Ubuntu 20.04 LTS"
- open shell
- sudo sh -c "echo $USER ALL=\(ALL\) NOPASSWD:ALL >>/etc/sudoers.d/$USER" # to allow using 'sudo' without a password
- sudo su -
- vi /etc/update-manager/release-upgrades # change `Prompt=normal`
- execute the following commands to upgrade to Ubuntu 21.04:
```bash
    apt install update-manager-core
    apt purge snapd -y # it will otherwise prevent do-release-upgrade
    apt update
    apt upgrade -y
    do-release-upgrade # if it fails, skip it, follow instaructions: for Mail config chose "No configuration"
    apt install snapd -y # reinstall to make MS happy 
```
- if you want to stay on 20.04 do the following:
```bash
    apt update
    apt upgrade -y
```
- exit and repoen shell
- execute the following commands to install Neovim universe:
```bash
    add-apt-repository ppa:neovim-ppa/stable
    apt update
    apt install -y neovim python3-dev python3-pip nodejs npm ruby-full cpanminus 
    pip3 install --upgrade pynvim msgpack
    npm install -g npm@latest neovim
    gem install neovim
```
- exit all shells completely!

## Installation of Prereqs on WSL/Ubuntu (user level)
- open shell
- cpanm --local-lib=~/perl5 local::lib && eval $(perl -I ~/perl5/lib/perl5 -Mlocal::lib)
- Make sure the following environment variables get set next time you login by executing:
```bash
    echo export PERL5LIB=/home/giacomo/perl5/lib/perl5 >>~/.profile
    echo export PERL_LOCAL_LIB_ROOT=/home/giacomo/perl5 >>~/.profile
    echo export PERL_MB_OPT=\"--install_base /home/giacomo/perl5\" >>~/.profile
    echo export PERL_MM_OPT=INSTALL_BASE=/home/giacomo/perl5 >>~/.profile
```
- nvim --cmd checkhealth # there shouldn't be any errors except:
    - A warning we do not have a `init.vim` file yet
    - Python2 provider (which we are going to disable later)
    - Perl provider (which we are going to disable later)

## Installation of this Neovim configuration 
- mkdir -p ~/.config
- cp -a [PATH-OF-NEOVIM_LUA_CHECKOUT]/nvim ~/.config/