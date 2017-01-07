# BingDictionary

这是一个ruby脚本，用来在命令行中直接查询单词含义，免去打开软件或浏览器的麻烦。

Here is a command line dictionary written with ruby that can
translate English to Chinese.

It uses http://cn.bing.com/dict/ to query.
![DEMO ](./dict.png)

## Installation

    $ gem install bing_dictionary

## Usage
A `dict` runable bin file provided.

DEMO：

    $ dict cake
    $ dict 蛋糕

## Support long sentence
Now long sentence is supported

    $ dict 你好吗
    $ dict How old are you

## Support fuzzy query

    $ dict hexxo

    您要找的是不是

    音近词
    head coach总教练
    hexose己醣
    hexode六极管
    ...

## Support Chinese to English

    $ dict 单片机
    单片机

    网络 MCU; Single Chip Microcomputer; Microcontroller

    The monolithic integrated circuit occurs the explanation , did not understand may have a look !
    单片机发生的讲解，不懂得可以看看！
    ...

## Local cache supported
All queried word default cached to ~/.bing_dictionary.db.
So it's much faster when you query the word again.

[Here](https://github.com/first20hours/google-10000-english) have the most common English words.
You can cache them all with following script:

    cat google-10000-english.txt | while read line; do dict $line; done

## More options

    $ dict --help
    Example: dict hello
        -p, --[no-]pronounce             Pronounce the word
        -c, --[no-]cache                 Use cache from ~/.bing_dictionary.db (Default on)
        -j, --jump                       Jump to web page
        -v, --version                    Show the version

## Work with vim
You can make it work tegother with Vim by add follows to $HOME/.vimrc

    nnoremap <leader>d :!dict <cword><CR>
    vnoremap <leader>d y:!dict <c-r>"<CR>

## Thanks
Heavily borrowed from [Command-Line-Youdao-Dictionary](https://github.com/qhwa/Command-Line-Youdao-Dictionary)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lingceng/bing_dictionary. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

