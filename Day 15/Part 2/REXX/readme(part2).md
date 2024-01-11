# Advent of Code 2023 - Day 15 Solution

This REXX script addresses Day 15's puzzle for the Advent of Code 2023 competition by handling a set of instructions to manipulate and report on a collection of boxes.

## Script Overview

The script begins with an announcement that it is tackling Day 15 of the Advent of Code and proceeds to read the input data using a UNIX command to get the challenge's details.

```rexx
say "Advent of Code 2023 day 15"
x = bpxwunix('cat /z/z35259/AoC23Input/input15.txt',,file.,se.)
```

## Numeric Precision

The script sets a high degree of numeric precision to handle large numbers.

```rexx
NUMERIC DIGITS 31
```

## Input Processing

The script announces the number of operations it will perform and initializes a accumulator.

```rexx
say "lets do" file.0 "things"
```

A loop processes each line of the input data to determine an action. Labels are concatenated to form keys, and characters are processed through the `e2a` function.

```rexx
do i = 1 to file.0
  ...
end
```

Two actions ('-' and '=') signify removing labels from a box or setting a box's label to a given value, respectively. 

## Part 2 Calculation

The script conducts a final loop to report on the boxes and calculates the value for Part 2 of the challenge.

```rexx
say "REPORT"
p2 = 0
do i = 0 to 255
  ...
end
```

This stage involves multiplying the box number and positional information for each label to determine its contribution to the Part 2 score (`p2`).

## Output

The script outputs the calculated value for Part 2:

```rexx
say "Part 2:" p2
```

## EBCDIC to ASCII Conversion Procedure

The `e2a` (EBCDIC to ASCII) procedure translates each character from EBCDIC to the ASCII value, relying on a conversion table.

```rexx
e2a: procedure
  parse arg char
  ...
```
