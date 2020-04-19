# Vim Memo

# Key Binding

## 諸注意

通常のキーは[ h ]のように記述する。
大文字のキーは実際には[ Shift-h ]と入力するが表記では[ H ]と記述する。
controlキーとの同時押しは[ C-h ]のように記述する。

## カスタム

init.vimに記述しているキーバイド

### Normal

[ Enter ] 下に行を追加

### Insert

[ jj ]  Insert時のみNormalに移行し[ j ]
[ kk ]  Insert時のみNormalに移行し[ k ]

### Command

[ :inite ]  init.vimを画面分割で開く
[ :inits ]  init.vimを読み込む

## カーソル移動

[ h ]   左
[ j ]   下
[ k ]   上
[ l ]   右
[ gg ]  ファイル先頭へ
[ G ]   ファイル末尾へ
[ 0 ]   行頭へ
[ ^ ]   インデントを加味した行頭へ
[ $ ]   行末へ
[ :10 ] 10行目へ
[ w ]   次の単語の頭へ
[ W ]   次の空白後の単語の頭へ
[ e ]   次の単語の終わりへ
[ E ]   次の空白後の単語の終わりへ
[ b ]   前の単語の終わりへ
[ B ]   前の空白後の単語の頭へ
[ % ]   対応するカッコへ移動

## 検索

[ \* ]  カーソル位置の単語を下方向へ検索
[ \# ]  カーソル位置の単語を上方向へ検索
[ /pattern ] patternを下方向へ検索
[ ?pattern ] patternを上方向へ検索
[ n ] 直前の検索を下方向へ繰り返す
[ N ] 直前の検索を上方向へ繰り返す

## その他基本

[ . ] 直前の動作を繰り返す
[ u ] undo
[ C-r ] redo

## Mode

Vimには大きく3つのモードがある.
基本はNormalでそこからInsertやVisualに移行する。

[ Esc ] Normal
[ i ]   カーソル下の文字の前からInsert
[ a ]   カーソル下の文字の後からInsert
[ I ]   カーソル行の行末でInsert
[ A ]   カーソル行の行頭でInsert
[ o ]   カーソル行の次の行に1行足してInsert
[ O ]   カーソル下の前の行に1行足してInsert
[ v ]   Visual
[ V ]   Line Visual

## Change

Normalモードで使用できる。
基本的に[ c Any ]のように最初に[ c ]がくる。
カーソルのある位置の特定の文字列を削除してInsertへ移行する。
特定の文字列はcの後のコマンド次第で決定される。

[ c w ] カーソル下の単語をカーソル位置から削除しInsert
[ c W ] 同上
[ c $ ] カーソル下から行末までを削除しInsert
[ c 0 ] カーソル下から行頭までを削除しInsert

### ci系

ciはchange innerのことを指している。
これは例えば""で囲われた文字を変更したい時に使用する。

[ c i " ]はカーソルが""内にある時に""内の文字を全て削除してInsertへ移行する。

ex.
例えば"この部分"です
> 「この部分」のどれかにカーソルを合わせ [ c i " ] > [ 変えました ]
例えば"変えました"です

以下のような種類がある

[ c i " ] ""内を削除しInsert
[ c i ' ] ''内を削除しInsert
[ c i ( ] ()内を削除しInsert
[ c i ) ] 同上
[ c i [ ] [ ]内を削除しInsert
[ c i ] ] 同上
[ c i w ] カーソル下の単語を削除しInsert

### ca系

caはchange allのこと。
ciでは""の中だけを削除してInsertに入ったが、caでは""も削除してInsertへ移行する。

ex.
例えば"この部分"です。
> 「この部分」のどれかにカーソルを合わせ [ c a " ] > [ 変えました ]
例えば変えましたです。

ci系とほぼ同じような感じ

# .vimrc(init.vim)の書き方

## Key Binding

### 再割り当ての有無

割り当てには2種類ある。
例えば
1. 「AをBに割り当てる」
1. 「CをAに割り当てる」
というキーバインドを設定したとする。
この時[ C ]を押すとどのような挙動を起こすだろう？
再割り当て有りならば[ C ] > [ A ] > [ B ]と解釈されて最終的に[ B ]の処理を行う。
再割り当て無しならば[ C ] > [ A ]で止まるので[ A ] の処理を行う。

基本的には再割り当て無しで設定するのが望ましい。
再割り当て有りとしたい場面はプラグインの機能を割り当てる場合だ。

プラグイン内で

map <Plug>(say_hello) :<C-u>call SayHello()<CR>

となっているものに対して「say_hello」は長いから[ e ]にマップしたい」時には再割り当てが有りになっていないと
[ e ] > <Plug>(say_hello)
で止まってしまい目的のプラグインの関数まで届かずに終わってしまうのだ。

### 使用方法

|Mode|再割り当て無し|再割り当て有り|
|:-|:-|:-|
|Normal|nnoremap|nmap|
|Visual|vnoremap|vmap|
|Insert|inoremap|imap|
|Command|cnoremap|cmap|
|Normal + Visual|noremap|map|
|Insert + Command|noremap!|map!|

ex.
nnoremap key change
はNormalモードにおいてkeyをchangeに再割り当て無しで割り当てている。

