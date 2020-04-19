# NeoVim Install

```sh
$ curl https://raw.githubusercontent.com/kotazuck/neovim/master/installer > install
$ bash ./install
```

- neovim のインストール
- dein.vim のインストール

を行う。
`~/.config/nvim`
にこのリポジトリが落ちる。

必要であれば下記を`~/.bashrc`に追加して neovim を標準にする。

```sh
echo "alias vim=\"nvim\""
```

# Packages

- [Shougo/deoplete.nvim（言わずと知れた暗黒美夢王のオートコンプリートのやつ](https://github.com/Shougo/deoplete.nvim)
- [Shougo/neosnippet（コード補完）](https://github.com/Shougo/neosnippet)
- [Shougo/neosnippet-snippets（コード補完のデフォルト）](https://github.com/Shougo/neosnippet-snippets)
- [Shougo/neco-syntax（コード補完用）](https://github.com/Shougo/neco-syntax)
- [othree/html5.vim（html5 の syntax）](https://github.com/othree/html5.vim)
- [hail2u/vim-css3-syntax（css3 の syntax）](https://github.com/hail2u/vim-css3-syntax)
- [tpope/vim-commentary（gc、gcc でコメント・コメントアウト）](https://github.com/tpope/vim-commentary)
- [tpope/vim-surround（ds"で囲ってる""を削除したり）](https://github.com/tpope/vim-surround)
- [scrooloose/nerdtree（ファイルツリー）](https://github.com/scrooloose/nerdtree)
- [plasticboy/vim-markdown（マークダウンを色々助けてくれる）](https://github.com/plasticboy/vim-markdown)
- [mg979/vim-visual-multi（マルチカーソル。多機能すぎるが\<C-n\>だけでも価値あり）](https://github.com/mg979/vim-visual-multi)
- [alvan/vim-closetag（html のタグを自動でクローズ）](https://github.com/alvan/vim-closetag)
- [cohama/lexima.vim（かっこ等の囲い文字の閉じを補完）](https://github.com/cohama/lexima.vim)
- [mattn/emmet-vim（言わずと知れた Emmet）](https://github.com/mattn/emmet-vim)
- [junegunn/vim-easy-align（コードの整列）](https://github.com/junegunn/vim-easy-align)
- [w0rp/ale（非同期で色々処理できる。フォーマットとかする。）](https://github.com/w0rp/ale)
- [phpactor/phpactor（PHP を色々助けてくれる）](https://github.com/phpactor/phpactor)

# Color

[molokai](https://github.com/tomasr/molokai)

# Key Binding

Leader: \<Space\>

| Mode                         | Custom Key   | Behavior              | Description                                                                 |
| :--------------------------- | :----------- | :-------------------- | :-------------------------------------------------------------------------- |
| Normal(nore)                 | \<Leader\>s  | \<Esc\>:w\<CR\>       | ファイル保存                                                                |
| Normal Visual Insert Command | \<Leader\>ex | \<Esc\>               | エスケープ                                                                  |
| Normal(nore)                 | \<Leader\>d  | \<Esc\>:bd\<CR\>      | 編集中のファイルを閉じる（vim は閉じない）                                  |
| Normal(nore)                 | \<Leader\>w  | \<C-w\>w              | 分割画面の移動（次へ）                                                      |
| Normal(nore)                 | \<Leader\>h  | \<C-w\>h              | 分割画面の移動（左へ）                                                      |
| Normal(nore)                 | \<Leader\>j  | \<C-w\>j              | 分割画面の移動（下へ）                                                      |
| Normal(nore)                 | \<Leader\>k  | \<C-w\>k              | 分割画面の移動（上へ）                                                      |
| Normal(nore)                 | \<Leader\>l  | \<C-w\>l              | 分割画面の移動（右へ）                                                      |
| All                          | \<C-e\>l     | \<Esc\>               | ノーマルモードへ                                                            |
| Normal(nore)                 | \<Leader\>a  | :NERDTreeToggle\<CR\> | NERDTree の表示切り替え                                                     |
| Insert                       | jj           | \<Esc\>j              | インサートモードで jj はノーマルモードへ                                    |
| Insert                       | kk           | \<Esc\>j              | インサートモードで kk はノーマルモードへ                                    |
| Normal(nore)                 | \<C-Left\>   | ^                     | Ctrl + Left で行頭（インデントを考慮）へ                                    |
| Insert(nore)                 | \<C-Left\>   | \<Esc\>^i             | インサートモード中 Ctrl + Left で行頭（インデントを考慮）でインサートモード |
| Normal(nore)                 | \<C-Right\>  | \$                    | インサートモード中 Ctrl + Right で行頭でインサートモード                    |
| Insert(nore)                 | \<C-Right\>  | \<Esc\>A              | Ctrl + Left で行頭（インデントを考慮）へ                                    |
| Insert(nore)                 | ,,           | \<C-y\>,              | emmet 起動                                                                  |
| Visual Normal                | ga           | \<Plug\>(EasyAlign)   | 整列（vim-easy-align)                                                       |

他にも少し設定しているがよく使うのは以上。
プラグインのキーバインドは各プラグインを参照

# Require

## Python3, Python2

deoplete は Python に依存している。3 系だけで良いかも。

```sh
# 3系
$ brew install python
$ pip3 install pynvim

# 2系
$ brew install python@2
$ pip install pynvim
```

## Prettier

コード整形に Prettier を使用

Prettier で整形するファイルタイプは以下

- html
- css
- js
- php

```sh
$ npm install -g prettier @prettier/plugin-php
```

## Composer

phpactor の Build に composer が必要

```sh
$ brew install composer
```
