# Notes for Day 02

## First Puzzle

### Problem

<https://adventofcode.com/2020/day/2>

```
--- Day 2: Password Philosophy ---

Your flight departs in a few days from the coastal airport; the easiest way down to the coast from here is via toboggan.

The shopkeeper at the North Pole Toboggan Rental Shop is having a bad day. "Something's wrong with our computers; we can't log in!" You ask if you can take a look.

Their password database seems to be a little corrupted: some of the passwords wouldn't have been allowed by the Official Toboggan Corporate Policy that was in effect when they were chosen.

To try to debug the problem, they have created a list (your puzzle input) of passwords (according to the corrupted database) and the corporate policy when that password was set.

For example, suppose you have the following list:

1-3 a: abcde
1-3 b: cdefg
2-9 c: ccccccccc

Each line gives the password policy and then the password. The password policy indicates the lowest and highest number of times a given letter must appear for the password to be valid. For example, 1-3 a means that the password must contain a at least 1 time and at most 3 times.

In the above example, 2 passwords are valid. The middle password, cdefg, is not; it contains no instances of b, but needs at least 1. The first and third passwords are valid: they contain one a or nine c, both within the limits of their respective policies.

How many passwords are valid according to their policies?
```

### Solution

First question is what are the constraints on the "password policies", and  passwords. Whats the maximum password length? Minimum? Does the input file make sense? Are all the minimums actually less than the maximums?

Assumptions/Constraints:

- Minimum and maximum are always one or two digit integers
- "Given Letter" is always a single lowercase character
- Passwords are always a sequence of lowercase alphabetical characters

Plan is to use a regex to capture the different parts given those rules. Then validate that all the lines in the input match the regex. Then use the capture groups to simulate the Toboggan Corporate policies to get the answer.

Run it like this:

```
$ ruby check_passwords.rb input.txt
Found 1000 password-with-policy lines
```

Used <www.rubular.com> to do the regex creation, cause it's baller.

Ended up with this:

```
\A(?<minimum>\d{1,2})-(?<maximum>\d{1,2})\ (?<given_letter>[a-z]):\ (?<password>[a-z]+?)\z
```
