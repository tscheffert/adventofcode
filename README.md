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

Goal: Find the product of the two entries in the input that sum to 2020.

First time I ran it gave me a bunch of output like this:
```
...
1988 + 1248 = 19881248
1988 + 1746 = 19881746
1988 + 1987 = 19881987
1988 + 1963 = 19881963
1988 + 20 = 198820
1988 + 1575 = 19881575
1988 + 1827 = 19881827
...
```

I forgot to convert to Integers, fuck.

Second time, after integer conversion, it worked:

```
$ ruby add_up_expense_report.rb input.txt
The first number is '317'
The second number is '1703'
Their product is '539851'.
```

But I exit early, I wonder if there is more than one valid combination.

There is only one valid pair, but I sum every number with every other number, so we get a match on both sides:
```
$ ruby add_up_expense_report.rb input.txt
Got more than the expected number of pairs.
Here are all the candidates:
317 + 1703 = 2020
317 * 1703 = 539851
-----------
1703 + 317 = 2020
1703 * 317 = 539851
-----------
```
