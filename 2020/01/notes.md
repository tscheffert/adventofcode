# Notes

Moving my notes for the days from the README to the day.

## Day 1, First Puzzle

Problem: <https://adventofcode.com/2020/day/1>

```
--- Day 1: Report Repair ---

After saving Christmas five years in a row, you've decided to take a vacation at a nice resort on a tropical island. Surely, Christmas will go on without you.

The tropical island has its own currency and is entirely cash-only. The gold coins used there have a little picture of a starfish; the locals just call them stars. None of the currency exchanges seem to have heard of them, but somehow, you'll need to find fifty of these coins by the time you arrive so you can pay the deposit on your room.

To save your vacation, you need to get all fifty stars by December 25th.

Collect stars by solving puzzles. Two puzzles will be made available on each day in the Advent calendar; the second puzzle is unlocked when you complete the first. Each puzzle grants one star. Good luck!

Before you leave, the Elves in accounting just need you to fix your expense report (your puzzle input); apparently, something isn't quite adding up.

Specifically, they need you to find the two entries that sum to 2020 and then multiply those two numbers together.

For example, suppose your expense report contained the following:

1721
979
366
299
675
1456

In this list, the two entries that sum to 2020 are 1721 and 299. Multiplying them together produces 1721 * 299 = 514579, so the correct answer is 514579.

Of course, your expense report is much larger. Find the two entries that sum to 2020; what do you get if you multiply them together?
```

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

## Day 1, Second Puzzle

Problem: <https://adventofcode.com/2020/day/1#part2>

```
--- Part Two ---

The Elves in accounting are thankful for your help; one of them even offers you a starfish coin they had left over from a past vacation. They offer you a second one if you can find three numbers in your expense report that meet the same criteria.

Using the above example again, the three entries that sum to 2020 are 979, 366, and 675. Multiplying them together produces the answer, 241861950.

In your expense report, what is the product of the three entries that sum to 2020?
```

Okay, makes sense. I'm not perfectly set up but it's not that hard. Good evidence that I should do it "the right way" up front. Or maybe we just add another loop and continue to do it "the wrong way"?

Let's update the existing solution to find three numbers.

Done:

```
$ ruby add_up_expense_report.rb input.txt
Got the expected number of pairs.
317 + 1703 = 2020
Got the expected number of trios.
315 + 624 + 1081 = 2020
315 * 624 * 1081 = 212481360
```

I even cleaned up the output and the solution for the first puzzle. Overall, this is pretty fun. I'll do the second day.
