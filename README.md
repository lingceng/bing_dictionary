# BingDictionary

这是一个ruby脚本，用来在命令行中直接查询单词含义，免去打开软件或浏览器的麻烦。

Here is a command line dictionary written with ruby that can
translate English to Chinese.

It uses http://cn.bing.com/dict/ to query.
![DEMO ](./dict.png)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bing_dictionary'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bing_dictionary

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

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lingceng/bing_dictionary. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

