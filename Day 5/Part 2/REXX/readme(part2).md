# Advent of Code 2023 - Day 5 Solution in REXX

This REXX script is designed to solve Day 5 of the Advent of Code 2023. The challenge focuses on applying a series of transformation rules to calculate the lowest possible result from a range of seed numbers.

## Script Execution

The script opens with a statement about the challenge:

```rexx
say "Advent of Code 2023 day 5"
```

It goes on to simulate reading data from an input file, though the current implementation is a placeholder string:

```rexx
x = "bpxwunix 'cat /z/z35259/AoC23Input/input5.txt' ,,file.,se."
```

## Numeric Precision

The numeric precision setting ensures that the script can handle large numbers consistently:

```rexx
NUMERIC DIGITS 15
```

## Parsing Seeds and Transformations

The script extracts seed ranges from the first line of the input and then gathers transformation formulas from subsequent lines:

```rexx
parse var file.1 "seeds:" seedranges
...
```

## Analyzing Formulas

Each formula is analyzed to identify the change it imparts on the input values (+x or -x) within certain ranges:

```rexx
...
faction.f.fr = delta
range.f.fr.min = sval
...
```

## Processing the Seeds

The script then processes each seed number (within the specified ranges) through the transformation rules to find the lowest final result:

```rexx
do r = 1 to words(seedranges) by 2
    ...
```

## Output Result

After processing all possible seed values with the given transformations, the script outputs the lowest result that was identified:

```rexx
say "Part 2: Lowest Seed Location:" lsl
```

## Execution Note

The current script contains a simulated file read operation which would need to be updated to actually read from a file. Adjust the code to obtain the input from your system's file data.
