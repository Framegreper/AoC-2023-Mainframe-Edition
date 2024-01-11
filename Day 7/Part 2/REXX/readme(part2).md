
# Advent of Code 2023 - Day 7 Solution

This REXX script offers a solution for Day 7 of the Advent of Code 2023. The challenge simulates a poker game where hands are evaluated and scored according to traditional poker hand rankings.

## Overview

Upon launch, the script states the current challenge day:

```rexx
say "Advent of Code 2023 day 7"
```

The input data containing the poker hands and their associated bids are read from a file:

```rexx
x = bpxwunix('cat /z/z35259/AoC23Input/input7.txt',,file.,se.)
```

## Numeric Precision

The script sets a high numeric precision to accommodate the calculations:

```rexx
NUMERIC DIGITS 31
```

## Initial Setup

The script sets up predefined hand rankings and sample data for testing:

```rexx
/* res values */
val.1 = 'Five of a Kind'
...
```

## Processing Hands

Each hand is evaluated and categorized based on the traditional poker hand rankings. The script also accounts for Joker cards and their effects on hand ranks:

```rexx
/* determine hand types */
hands.newhand.type = handtype(hand)
```

## Sorting Hands

The script sorts the hands first by type and then by the value of the cards to prepare for scoring:

```rexx
/* now we have it ready to 'sort' */
sortcmd = 'echo "' || sortstring || '" | sort'
x = bpxwunix(sortcmd,,sorted.,err.)
```

## Calculating Scores

Once sorted, scores are calculated based on the hands' rankings and their bids.

```rexx
/* calculate Part two score */
do i = 1 to sorted.0
  ...
  p2 = p2 + (bid * i)
end
say "Part two:" p2
```

## Subroutines

The `handtype` procedure exposes hand rankings and uses several branches to handle different hand types, including those with Jokers. It adjusts the rankings based on the presence and number of Jokers:

```rexx
handtype: procedure expose val.
  ...
```

## Ending the Script

The script concludes by displaying the calculated score for Part two.
