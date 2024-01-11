# Advent of Code 2023 - Day 15 Solution

This REXX script is designed to solve Day 15 of the Advent of Code 2023 competition. It converts a series of characters from EBCDIC to ASCII and processes them to compute a cumulative value based on the ASCII codes.

## Script Execution

The script starts by announcing the day of the Advent of Code it is addressing and reading the input data from an external file.

```rexx
say "Advent of Code 2023 day 15"
x = bpxwunix('cat /z/z35259/AoC23Input/input15.txt',,file.,se.)
```

## Character Processing

The main loop iterates over each line of the input file, converting each character to its ASCII equivalent and performing calculations stipulated by the puzzle.

```rexx
do i = 1 to file.0
  ...
end
```

For each character in the line, the following operations are conducted:
1. Character conversion from EBCDIC to ASCII using the `e2a` procedure.
2. Addition of the ASCII code to the current sum.
3. Multiplication of the current sum by 17.
4. Modulo operation on the current sum to keep it within a byte range (0-255).

## Part 1 Result

After processing all lines, the script outputs the total sum of the modified ASCII values as the solution for part 1 of the challenge.

```rexx
say "Part 1:" p1
```

## EBCDIC to ASCII Conversion Procedure

The `e2a` (EBCDIC to ASCII) procedure matches the input character against known EBCDIC characters and returns the corresponding ASCII code from the conversion table provided.

```rexx
e2a: procedure
  parse arg char
  ...
```

The conversion table is directly based on the ASCII printable characters, using references from IBM's documentation.
