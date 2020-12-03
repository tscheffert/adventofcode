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

Following the plan, everything worked:

```
$ ruby check_passwords.rb input.txt
Found 1000 password-with-policy lines
Every line matched
'569' passwords are valid
```

## Second Puzzle

### Problem

```

--- Part Two ---

While it appears you validated the passwords correctly, they don't seem to be what the Official Toboggan Corporate Authentication System is expecting.

The shopkeeper suddenly realizes that he just accidentally explained the password policy rules from his old job at the sled rental place down the street! The Official Toboggan Corporate Policy actually works a little differently.

Each policy actually describes two positions in the password, where 1 means the first character, 2 means the second character, and so on. (Be careful; Toboggan Corporate Policies have no concept of "index zero"!) Exactly one of these positions must contain the given letter. Other occurrences of the letter are irrelevant for the purposes of policy enforcement.

Given the same example list from above:

    1-3 a: abcde is valid: position 1 contains a and position 3 does not.
    1-3 b: cdefg is invalid: neither position 1 nor position 3 contains b.
    2-9 c: ccccccccc is invalid: both position 2 and position 9 contain c.

How many passwords are valid according to the new interpretation of the policies?
```

### Solution

This doesn't seem too hard. Same regex almost, just different rule validation.

If someone in the Discord I'm in hadn't mentioned "no concept of index zero" I probably would have missed it. But they did, so I didn't. Doesn't add too much complexity.

I thought I did it, but I misread it. Turns out you want exactly one of the first or second indices to match, not both. My answer was too low. Super easy fix at least, change the `&&` to `^` for XOR semantics instead of AND.


