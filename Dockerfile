FROM ubuntu:18.04

ADD ./neovim/installer /work/neovim/installer

ENV DEBIAN_FRONTEND=noninteractive
ENV PYENV_ROOT=/root/.pyenv/bin
ENV PATH=$PATH:$PYENV_ROOT

RUN mkdir /root/.config && \
    apt update -y && \
    apt-get update -y && \
    apt-get clean -y && \
    rm -rf /var/cache/apt/archives/* && \
    apt install git maven \
    gcc make \
    pkg-config autoconf automake \
    python3-docutils \
    libseccomp-dev \
    libjansson-dev \
    libyaml-dev \
    libxml2-dev \
    build-essential libbz2-dev libdb-dev \
    libreadline-dev libffi-dev libgdbm-dev liblzma-dev \
    libncursesw5-dev libsqlite3-dev libssl-dev \
    zlib1g-dev uuid-dev tk-dev -y && \
    rm -rf /var/cache/apt/archives/* && \
    apt-get install -y tzdata cargo gdb clang \
    python3 python3-pip npm php lua5.3 liblua5.3 && \
    pip3 install powerline-status && \
    pip3 install --user pynvim && \
    npm install -g jshint  && \
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv && \
    apt install make sudo -y && \
    sudo ~/.pyenv/plugins/python-build/install.sh && \
    apt install apt-utils lsb-release ruby-dev nodejs npm -y && \
    apt-get clean -y && \
    apt clean -y && \
    #pyenv install 3.7.2 && \
    #pyenv rehash && \
    #pyenv global 3.7.2 && \
#yes | ./neovim/install_thirdparty.sh && \
    apt-get install software-properties-common -y && \
    apt install software-properties-common -y && \
    add-apt-repository ppa:neovim-ppa/stable && \
    add-apt-repository ppa:hnakamur/universal-ctags && \
    apt update -y && \
    apt install universal-ctags && \
    apt-get update -y && \
    apt-get install curl neovim -y && \
    apt-get clean -y && \
    rm -rf /var/cache/apt/archives/* && \
    gem install neovim && \
    gem install solargraph && \
    gem install bundler -v 1.17.3 && \
    gem install bundler -v 1.17.2 && \
    gem install bundler -v 2.0.2 && \
    npm install -g neovim && \
    pip3 install neovim && \
    cd /work && \
    chmod 755 ./neovim/installer && \
    chown root ./neovim/installer && \
    yes | ./neovim/installer

ADD ./neovim/init.vim /root/.config/nvim/init.vim
ADD ./neovim/dein.toml /root/.config/nvim/dein.toml

RUN apt update -y && apt install silversearcher-ag -y
RUN npm install n -g && n stable && apt purge -y nodejs npm

RUN nvim --headless +'call dein#install()' +qall

RUN nvim --headless +UpdateRemotePlugin +qall

RUN nvim --headless +'CocInstall -sync coc-tsserver coc-lists coc-phpls' +qall && \
    nvim --headless +'CocInstall -sync coc-sh' +qall && \
    nvim --headless +'CocInstall -sync coc-status' +qall && \
    nvim --headless +'CocInstall -sync coc-html' +qall && \
    nvim --headless +'CocInstall -sync coc-go' +qall && \
    nvim --headless +'CocInstall -sync coc-elixir' +qall && \
    nvim --headless +'CocInstall -sync coc-vimlsp' +qall && \
    nvim --headless +'CocInstall -sync coc-stylelint' +qall && \
    nvim --headless +'CocInstall -sync coc-json coc-eslint coc-python' +qall && \
    nvim --headless +'CocInstall -sync coc-java coc-jest coc-solargraph coc-yaml' +qall && \
    nvim --headless +'CocInstall -sync coc-highlight coc-snippets coc-docker' +qall && \
    nvim --headless +'CocInstall -sync coc-diagnostic coc-css' +qall


