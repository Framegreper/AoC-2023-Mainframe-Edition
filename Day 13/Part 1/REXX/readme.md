# Advent of Code 2023 - Day 13 Solution

A REXX script solution to the "Advent of Code 2023" Day 13 puzzle.

## Overview

This REXX script processes a series of character patterns read from a file, identifies specific patterns that repeat across rows or columns, and calculates a scoring metric based on the identified patterns.

## Step-by-Step Explanation

### Script Initialization

The script starts by printing out a statement that indicates it is Day 13 of Advent of Code 2023.

```rexx
say "Advent of Code 2023 day 13"
```

### Reading the Input File

The script uses the `bpxwunix` function to read an input file into the `file.` stem variable.

```rexx
x = bpxwunix('cat /z/z35259/AoC23Input/input13.txt',,file.,se.)
```

### Example Pattern Definition

An example pattern (`aile.`) is defined explicitly in the code showing the shape of a typical input pattern.

```rexx
aile.1 = '#.##..##.'
...
aile.15 = '#....#..#'
aile.0 = 15
```

### Pattern Processing

The script processes the `file.` stem variable to extract patterns and store them into the `patterns.` stem variable.

```rexx
do i = 1 to file.0 + 1
    ...
end
```

### Pattern Analysis

For each pattern extracted, the script runs two functions, `checkrows` and `checkcols`, to identify any identical rows or columns within the pattern.

```rexx
do i = 1 to patterns.0
  ...
end
```

### Scoring

If any identical rows or columns are found, a scoring metric (`p1`) is updated. Scoring is based on repeating rows contributing 100 times their index, and repeating columns adding directly to the score.

```rexx
if r <> '' then p1 = p1 + (100*r)
if c <> '' then p1 = p1 + c
```

### Output

The final score for part one of the puzzle is output.

```rexx
say "Part One:" p1
```

### Functions

Two functions are defined: `checkrows` and `checkcols`.

#### checkrows Function

The `checkrows` function takes a pattern and checks for identical rows within that pattern. If identical rows are found, it returns the index of the first such row.

```rexx
checkrows: procedure expose patterns.
  ...
return res
```

#### checkcols Function

The `checkcols` function works similarly to `checkrows`, but it first rotates the pattern to turn columns into rows. Then it uses similar logic to `checkrows` to identify repeating patterns across these new rows.

```rexx
checkcols: procedure expose patterns.
  ...
return res
```

## Conclusion

The script is a puzzle-specific solution designed to detect repeating patterns in a given set of character patterns, calculate a score based on the repetition, and output the result.
```
