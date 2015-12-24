# Bing Command Dictionry

这是一个ruby脚本，用来在命令行中直接查询单词含义，免去打开软件或浏览器的麻烦。

Here is a command line dictionary written with ruby that can
translate English to Chinese.

It uses http://cn.bing.com/dict/ to query.

![DEMO ](./dict.png)

## Usage
Download the dict file and make it runable.
Current version need nokogiri installed:

    gem install nokogiri

DEMO：

    ./dict cake
    ./dict 蛋糕

You'd better add configuration to $HOME/.bashrc or $HOME/.profile to make alias

    alias d="/path/to/dict"

You can make it work tegother with Vim by add follows to $HOME/.vimrc

    nnoremap <leader>d :!dict <cword><CR>
    vnoremap <leader>d y:!dict <c-r>"<CR>

## Support long sentence
Now long sentence is supported

    ./dict 你好吗
    ./dict How old are you

## Support fuzzy query

    ./dict hexxo

    您要找的是不是

    音近词
    head coach总教练
    hexose己醣
    hexode六极管
    ...

## For Mac user
You can open your local dictionary.app with `open dict://someword`. It may be faster.
Add following to your vimrc to make it work in vim:

    nnoremap <leader>dd :!open dic://<cword><CR>

## Thanks
Heavily borrowed from [Command-Line-Youdao-Dictionary](https://github.com/qhwa/Command-Line-Youdao-Dictionary)
