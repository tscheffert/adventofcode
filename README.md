# Advent of Code

This is my repo for [Advent of Code](https://adventofcode.com/). An advent calendar for coding challenges.

I'll keep notes on each of the days I do.

## Setup

I used Ruby 2.7.1 as the language, installed on macOS with `rbenv`.

```
$ rbenv local
2.7.1

$ ruby -v
ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-darwin19]
```

Install dependencies like this:

```
gem install bundler -v 2.1.4
bundle install
```

## 2020

### Day 1

Problem: <https://adventofcode.com/2020/day/1>

Initially, this doesn't seem that hard, let's try it. I'm not sure whether to use Ruby, which I'm most familiar with, or something more avante garde like Rust. I guess we'll start with Ruby and see if I feel the drive to mix it up later.

Run it like this:

```
bundle install
cd 2020/01
ruby add_up_expense_report.rb input.txt
```
