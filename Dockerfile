FROM ubuntu:18.04

ADD ./neovim/installer /work/neovim/installer

ENV DEBIAN_FRONTEND=noninteractive
ENV PYENV_ROOT=/root/.pyenv/bin
ENV PATH=$PATH:$PYENV_ROOT

RUN mkdir /root/.config && \
    apt update -y && \
    apt-get update -y && \
#apt-get clean -y && \
    rm -rf /var/cache/apt/archives/* && \
    apt install curl git maven \
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
    apt install apt-utils lsb-release nodejs npm -y
#apt-get clean -y && \
#    apt clean -y
    #pyenv install 3.7.2 && \
    #pyenv rehash && \
    #pyenv global 3.7.2 && \
#yes | ./neovim/install_thirdparty.sh && \

# Install rbenv
RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv && \
      echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc && \
      echo 'eval "$(rbenv init -)"' >> ~/.bashrc

ENV PATH /root/.rbenv/shims:/root/.rbenv/bin:$PATH

# Install ruby-build & ruby
RUN git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build && \
    ~/.rbenv/bin/rbenv install 2.6.3 && \
    ~/.rbenv/bin/rbenv global 2.6.3

# Initiarize ruby encording
ENV RUBYOPT -EUTF-8

# Install bundler
RUN ~/.rbenv/bin/rbenv exec gem install bundler -v 1.16.3 && \
    apt-get update -y && \
    apt-get install software-properties-common -y && \
    apt install software-properties-common -y && \
    add-apt-repository ppa:neovim-ppa/stable -y && \
    add-apt-repository ppa:hnakamur/universal-ctags -y && \
    apt update -y && \
    apt install universal-ctags -y && \
    apt-get update -y && \
    apt-get install neovim -y && \
#apt-get clean -y && \
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
ADD ./neovim/coc-settings.json /root/.config/nvim/coc-settings.json
RUN mkdir -p /root/.config/TabNine
ADD ./neovim/tabnine_config.json /root/.config/TabNine/tabnine_config.json

RUN apt update -y && apt install silversearcher-ag -y
RUN npm install n -g && n stable && apt purge -y nodejs npm
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
    apt update -y && apt install -y yarn && yarn global add typescript && yarn global add esbuild

RUN nvim --headless +'call coc#util#install()' +qall && \
    nvim --headless +'call dein#install()' +qall && \
    nvim --headless +'call coc#util#install()' +qall && \
    cd ~/.config/nvim/dein/repos/github.com/neoclide/coc.nvim/ && yarn install && \
    nvim --headless +'call coc#util#install()' +qall

RUN nvim --headless +UpdateRemotePlugin +qall

RUN nvim --headless +'call coc#util#install()' +qall
#    nvim --headless +'CocInstall -sync coc-tsserver coc-lists coc-phpls' +qall
#     nvim --headless +'CocInstall -sync coc-sh' +qall && \
#     nvim --headless +'CocInstall -sync coc-status' +qall && \
#     nvim --headless +'CocInstall -sync coc-html' +qall && \
#     nvim --headless +'CocInstall -sync coc-go' +qall && \
#     nvim --headless +'CocInstall -sync coc-elixir' +qall && \
#     nvim --headless +'CocInstall -sync coc-vimlsp' +qall && \
#     nvim --headless +'CocInstall -sync coc-stylelint' +qall && \
#     nvim --headless +'CocInstall -sync coc-json coc-eslint coc-python' +qall && \
#     nvim --headless +'CocInstall -sync coc-java coc-jest coc-solargraph coc-yaml' +qall && \
#     nvim --headless +'CocInstall -sync coc-highlight coc-snippets coc-docker' +qall && \
#     nvim --headless +'CocInstall -sync coc-diagnostic coc-css' +qall

RUN apt-get install locales
RUN locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LC_CTYPE ja_JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP.utf8
