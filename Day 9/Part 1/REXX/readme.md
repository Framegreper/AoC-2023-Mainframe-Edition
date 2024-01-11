# Advent of Code 2023 - Day 9 Solution

This REXX script is designed to solve the puzzle presented on Day 9 of the Advent of Code 2023. The challenge involves reading a sequence of numbers, performing calculations on subsequences, and determining a final "answer" based on those calculations.

## Script Functionality

Upon execution, the script announces the Advent of Code day it is solving:

```rexx
say "Advent of Code 2023 day 9"
```

The script reads a sequence of numbers from a text file and stores each line into a stem variable `line.`. The `invoer.` stem variable is then populated with these values.

## File Reading

The file specified by `filename` is read into `line.`, which holds the contents of each line:

```rexx
filename = "/z/z35259/AoC23Input/input9.txt"
'EXECIO * DISKR' filename '(FINIS STEM line. F' lineNum
```

## Number Sequence Processing

The script processes each number in the sequence, generating subsequences (`reeks.`) and calculating the difference between each pair of numbers using the `verschil` procedure.

```rexx
do i = 1 to invoer.0
   ...
end
```

It then derives a "bottom" number from each subsequence using the `bottom` procedure.

## Answer Calculation

For each sequence, the script determines whether there is a definitive "bottom" number, continually combining and recalculating numbers until a single value can be deduced. This value is added to the running total `antwoord`.

```rexx
antwoord = 0
...
say antwoord
```

## Helper Procedures

Two custom procedures are included:

- `bottom`: Identifies the bottom or last number in a subsequence if all preceding elements are the same.
- `verschil`: Calculates the difference between adjacent numbers in a sequence.
