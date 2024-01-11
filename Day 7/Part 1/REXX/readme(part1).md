# Advent of Code 2023 - Day 7 Solution

The provided REXX script is for solving Day 7 of the Advent of Code 2023. It involves evaluating poker hands to determine hand types and calculate scores based on the hand rankings and bid values.

## Script Overview

The script begins by announcing the Advent of Code day:

```rexx
say "Advent of Code 2023 day 7"
```

It reads the input from a text file containing the hands and their associated bids using the `bpxwunix` command to invoke Unix system utilities.

```rexx
x = bpxwunix('cat /z/z35259/AoC23Input/input7.txt',,file.,se.)
```

## Numeric Precision

The script sets the numeric precision to 31 digits to handle large numbers:

```rexx
NUMERIC DIGITS 31
```

## Input Parsing and Preprocessing

An example data structure (`aile.`) containing poker hands and bids is included. The script extracts and translates these hands into a standardized format by replacing face cards with placeholder letters to maintain sorting priority.

## Hand Type Analysis

The `handtype` procedure evaluates each hand to determine its poker ranking, taking into consideration the presence of jokers (`O`) and their effects on the hand.

```rexx
/* res values */
...
/* hands stem has index for the nth hand */
...
hands.newhand.type = handtype(hand)
...
```

## Sorting and Scoring

Once the hand types are established, the script uses the Unix sort utility to sort the hands based on their types and, subsequently, based on the card values.

```rexx
/* now we have it ready to 'sort' */
sortcmd = 'echo "' || sortstring || '" | sort'
...
```

Finally, the script iteratively calculates the Part two score (`p2`) as the final output, factoring in the bid values and the sorted position of each hand.

```rexx
...
do i = 1 to sorted.0
  ...
  p2 = p2 + (bid * i)
...
end
say "Part two:" p2
```
