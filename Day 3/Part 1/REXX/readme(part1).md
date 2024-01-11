# Advent of Code 2023 - Day 3 Solution in REXX

This REXX program addresses the puzzle for Day 3 of Advent of Code 2023. The challenge involves identifying and summing up special numbers from a list that appear near certain symbols in a grid.

## Program Overview

The script announces the challenge, imports input data, and initializes a sum counter:

```rexx
say "Advent of Code 2023 day 3"
x = bpxwunix('cat /z/z35259/AoC23Input/input3.txt',,file.,se.)
```

## Example Input

The program contains example input data representing a grid with symbols and numbers:

```rexx
aile.1='467..114..'
...
```

## Input Sanitization

The script "sanitizes" the input by converting all non-numeric symbols to `#`, while leaving numeric characters and periods (`.`) untouched:

```rexx
do i = 1 to file.0
  ...
end
```

This conversion prepares the data for further analysis.

## Number Extraction

Part numbers are extracted by parsing through the sanitized input. Numbers are recognized as valid if they are adjacent to the symbol `#` on the same line, above, or below:

```rexx
do i = 1 to file.0
  ...
  if ok = 1 then partnums = partnums " " bnum
  ...
end
```

## Summing Part Numbers

Once all relevant part numbers have been collected, they are summed up to compute the final score for part one of the puzzle:

```rexx
p1 = 0
do i = 1 to words(partnums)
  p1 = p1 + word(partnums,i)
end
say "Part One: " p1
```

## Instructions

- This script requires the file `/z/z35259/AoC23Input/input3.txt` to be present with data in the specified format. Update the file path accordingly if necessary.
- Run this script using a REXX-compatible interpreter.
- The final output will echo the string of special numbers and their sum to the console.
