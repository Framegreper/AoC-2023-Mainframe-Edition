# Advent of Code 2023 - Day 11 Solution

This REXX script addresses Day 11's puzzle for the 2023 Advent of Code competition, focusing on calculating the distance between galaxy locations on a grid.

## Overview of Script Functionality

The script starts by announcing it's working on day 11 of the challenge and reads input data from an external file.

```rexx
say "Advent of Code 2023 day 11"
x = bpxwunix('cat /z/z35259/AoC23Input/input11.txt',,file.,se.)

An initial grid map is populated with predefined galaxy markers '#' in a stem variable aile..
Galaxy Location Storage

The script initializes an empty stem variable galaxies. to store galaxy locations.

galaxies. = '' /* we store galaxy locations here */
galaxies.0 = 0

Grid Expansion and Galaxy Identification

Using the input data, the script expands the grid as necessary and identifies the location of galaxies within it.

do i = 1 to file.0
  ...
end

For each row and column, the script checks if there are additional rows or columns to be added without galaxies, thus considering potential expansion (expand_i, expand_j).
Galaxy Pairing

The script generates all possible pairs of galaxies:

pairs. = 0
do i = 1 to galaxies.0
  ...
end

This process excludes duplicates and ensures combinations are not repeated.
Distance Calculation

With the pairs established, the script calculates the total sum of distances between all galaxy pairs using the dist procedure.

p1 = 0
do i = 1 to pairs.0
  ...
end

The dist procedure computes the taxicab (Manhattan) distance between two given points on the grid.
Part 1 Result

The script outputs the accumulated distance as the solution for part 1 of the challenge:

say "part1" p1

Auxiliary Procedures

The script contains additional procedures utilized during its execution:

    checkcol - Checks for the presence of galaxy markers in a specified column.
    checkrow - Checks for the presence of galaxy markers in a specified row.
    dist - Computes the Manhattan distance between two galaxy locations. 
