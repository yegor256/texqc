<img src="/logo.svg" width="64px"/>

[![EO principles respected here](https://www.elegantobjects.org/badge.svg)](https://www.elegantobjects.org)
[![Managed by Zerocracy](https://www.0crat.com/badge/C3RFVLU72.svg)](https://www.0crat.com/p/C3RFVLU72)
[![DevOps By Rultor.com](http://www.rultor.com/b/yegor256/texqc)](http://www.rultor.com/p/yegor256/texqc)
[![We recommend RubyMine](https://www.elegantobjects.org/rubymine.svg)](https://www.jetbrains.com/ruby/)

[![Build Status](https://travis-ci.org/yegor256/texqc.svg)](https://travis-ci.org/yegor256/texqc)
[![PDD status](http://www.0pdd.com/svg?name=yegor256/texqc)](http://www.0pdd.com/p?name=yegor256/texqc)
[![Gem Version](https://badge.fury.io/rb/texqc.svg)](http://badge.fury.io/rb/texqc)
[![Maintainability](https://api.codeclimate.com/v1/badges/393fd78703d72cfbe84f/maintainability)](https://codeclimate.com/github/yegor256/texqc/maintainability)

[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/yegor256/takes/texqc/master/LICENSE.txt)
[![Test Coverage](https://img.shields.io/codecov/c/github/yegor256/texqc.svg)](https://codecov.io/github/yegor256/texqc?branch=master)
[![Hits-of-Code](https://hitsofcode.com/github/yegor256/texqc)](https://hitsofcode.com/view/github/yegor256/texqc)

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
