# Advent of Code 2023 - Day 3 Solution in REXX

This REXX script is written to tackle the Day 3 puzzle of the Advent of Code 2023. The goal is to find and sum up related groups of numbers within a grid that are connected by a certain symbol.

## Running the Script

The script begins with:

```rexx
say "Advent of Code 2023 day 3"
x = bpxwunix('cat /z/z35259/AoC23Input/input3.txt',,file.,se.)
```

Which announces the day of the challenge and reads the contents of the input file into a REXX stem variable.

## Assumptions

It works with an example grid layout provided in the comments, but it might not work with the actual puzzle input. Each line is believed to represent a row in the grid:

```rexx
aile.1='467..114..'
...
```

## Sanitization Process

The script processes the input by changing all specific non-numeric symbols to `#` except for `*`, to aid in finding numbers connected to certain symbols:

```rexx
do i = 1 to file.0
  ...
end
```

## Extraction and Summation Logic

The script attempts to extract gear parts and their connections, based on the existence of `*` symbols around the numbers:

```rexx
do i = 1 to file.0
  ...
end
```

It then tries to sum up the products of the paired numbers where the corresponding gears are connected:

```rexx
do gindex = 1 to words(gearlist)
  ...
end
say "Part 2:" p2
```

## Output

The script echoes the gear locations and their related numbers, as well as the sum of the products of all pairs connected by a `*`.

## Running Instructions

To run this solution:

- Place the input file at `/z/z35259/AoC23Input/input3.txt` or adjust the script to the file's location.
- Execute the REXX script using a REXX interpreter compatible with your environment.
- Watch the terminal for the echoed output that should contain the data about gear connections and the sum for "Part 2" of the puzzle.

Given the script's example output does not work with real data, further debugging or re-implementation may be necessary for actual puzzle input.
