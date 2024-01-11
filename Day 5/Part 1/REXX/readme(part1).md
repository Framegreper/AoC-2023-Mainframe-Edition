# Advent of Code 2023 - Day 5 Solution in REXX

The REXX script tackles Day 5 of the Advent of Code 2023. It deals with the transformation of seeds through a series of formulas to find the seed with the lowest final location.

## Script Execution

The script begins with an announcement of the day's challenge:

```rexx
say "Advent of Code 2023 day 5"
```

It continues to read data from an input file, expecting to find seed values followed by transformation formulas:

```rexx
x = bpxwunix('cat /z/z35259/AoC23Input/input5',,file.,se.)
```

## Numeric Precision

Setting the numeric precision is crucial for handling large numbers or preventing rounding issues:

```rexx
NUMERIC DIGITS 11
```

## Parsing Seeds

The first line of the input file is expected to contain seed values which are then stored in an array:

```rexx
parse var file.1 "seeds:" seedlist
...
```

## Parsing Transformation Formulas

The script also parses transformation formulas, storing them in an array after skipping blank lines and headers:

```rexx
do i = 2 to file.0
  ...
```

## Processing Transformations

Each seed undergoes transformations according to the parsed formulas. A custom `x2y` procedure is defined to handle individual transformations:

```rexx
do i = 1 to seeds.0
  ...
```

## Finding the Lowest Seed Location

The script iterates through all seed values to find which one has the lowest ending location after all transformations:

```rexx
if lowest_seed_location = -1 | location < lowest_seed_location then
  ...
```

## Part 1 Output

The final output is the lowest seed location, which is the solution to Part 1 of the challenge:

```rexx
say "Part 1: Lowest Seed Location:" lowest_seed_location
```

## Procedure: `x2y`

The `x2y` procedure calculates the new location of a seed based on its current location and the given transformation rule, which includes destination, start, and range:

```rexx
x2y: procedure
  ...
```

## Usage and Execution

Make sure the input file `/z/z35259/AoC23Input/input5` is in place with the correct content. Run the script using a REXX interpreter. The output will indicate the lowest transformed seed location.
