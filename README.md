<img src="/logo.svg" width="64px"/>

[![Gem Version](https://badge.fury.io/rb/texqc.svg)](http://badge.fury.io/rb/texqc)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/yegor256/takes/texqc/master/LICENSE.txt)

This tool helps you make sure your LaTeX document compiles without issues.

First, you install it:

```bash
$ gem install texqc
```

Then, you just run it after the LaTeX document is compiled:

```bash
$ latexmk -pdf article
$ texqc article
```

If any warnings were reported by LaTeX, you will get a short list of them
and the exit code will be non-zero (very convenient for your CI/CD scripts).

To make configuration easier, you can create `.texqc` file next to your
`.tex` file and place all your command line configuration options over there,
each one on its own line. You can also have a global configuration file
at `~/.texqc`, which will be read first.

## How to contribute

Read [these guidelines](https://www.yegor256.com/2014/04/15/github-guidelines.html).
Make sure your build is green before you contribute
your pull request. You will need to have [Ruby](https://www.ruby-lang.org/en/) 2.3+ and
[Bundler](https://bundler.io/) installed. Then:

```
$ bundle update
$ bundle exec rake
```

If it's clean and you don't see any error messages, submit your pull request.
