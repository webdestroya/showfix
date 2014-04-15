# Showfix


[![Gem Version](http://img.shields.io/gem/v/showfix.svg)][gem]
[![Build Status](https://travis-ci.org/webdestroya/showfix.svg)][travis]
[![Dependency Status](https://gemnasium.com/webdestroya/showfix.svg)][gemnasium]
[![Code Climate](http://img.shields.io/codeclimate/github/webdestroya/showfix.svg)][codeclimate]
[![Coverage Status](http://img.shields.io/coveralls/webdestroya/showfix.svg)][coveralls]

[gem]: https://rubygems.org/gems/showfix
[travis]: https://travis-ci.org/webdestroya/showfix
[gemnasium]: https://gemnasium.com/webdestroya/showfix
[codeclimate]: https://codeclimate.com/github/webdestroya/showfix
[coveralls]: https://coveralls.io/r/webdestroya/showfix

## Description

This gem allows you to easily rename TV episode files. Useful for mass-renaming mismatched show titles.


## Installation

```sh
$ gem install showfix
```

## Usage

The most common usage is to fix all files within the current directory. You can optionally add `--pretend` to the command if you would like to see what it will rename, without actually touching your files.

```sh
$ cd SomeTvShow
$ showfix rename
```

For detailed help, just run `showfix help` for a list of commands.

## Roadmap

* Support for multi-episode files (S01E20-E21)
* Ability to manually enter season/episode numbers for show files that are not numbered at all

## Contributing

See the [contribution guide](https://github.com/webdestroya/showfix/blob/master/CONTRIBUTING.md).

## Thanks

Special thanks to [Philipp Böhm](https://github.com/pboehm) for making [serienrenamer](https://github.com/pboehm/serienrenamer)

## License

[MIT](http://opensource.org/licenses/MIT)