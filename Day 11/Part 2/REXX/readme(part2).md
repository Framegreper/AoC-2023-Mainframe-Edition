# Advent of Code 2023 - Day 11 Solution

This REXX script is designed to address the challenge presented on Day 11 of the Advent of Code 2023. The program reads a map of the sky from a file and outputs the number of galaxy pairs as well as the accumulated taxicab distance between each pair.

## Execution and Initial Setup

The script opens with a greeting and a command to read the input data from a file:

```rexx
say "Advent of Code 2023 day 11"
x = bpxwunix('cat /z/z35259/AoC23Input/input11.txt',,file.,se.)
```

An initial grid, representing parts of the sky, is set up with placeholders for galaxy locations using the '#' character, denoted within the `aile.` stem variable.

## Identifying Galaxy Locations

The script expands the grid and records galaxy positions, accounting for any grid expansion that occurs without galaxies.

```rexx
expand_i = 0
width = length(file.1)

do i = 1 to file.0
  ...
end
```

## Displaying Galaxy Positions

Once all galaxy locations are identified, they are displayed with their relative indices.

```rexx
do i = 1 to galaxies.0
  say i "at" galaxies.i
end
```

## Pair-wise Galaxy Permutations

The script creates permutations for all possible pairs of galaxies but prevents pairs of the same galaxy or duplicate pairings.

```rexx
pairs. = 0
do i = 1 to galaxies.0
  ...
end
```

## Calculating Total Distance

The `dist` function calculates the distance between two galaxy positions using the Manhattan (taxicab) distance formula. The total distance for all galaxy pairs is accumulated to compute the part 1 result.

```rexx
p1 = 0
say pairs.0 "pairs of galaxies"
do i = 1 to pairs.0
  p1 = p1 + dist(a, b)
end

say "part1" p1
```

## Helper Procedures

Three custom procedures are defined in the script to assist with different tasks:

- `checkcol`: Checks for galaxy presence in a column.
- `checkrow`: Checks for galaxy presence in a row.
- `dist`: Calculates the Manhattan distance between two galaxy locations.
