# Advent of Code 2023 - Day 24 Solution

This REXX script solves the Day 24 puzzle for the Advent of Code 2023 competition. The script computes interactions between moving points based on their positions and velocities.

## Initial Announcement

The script begins by announcing the Advent of Code day it is solving:

```rexx
say "Advent of Code 2023 day 24"
```

## Reading Input Data

Initial example input data is provided in the `file.` stem variable. The script also uses a BPXWUNIX command to read additional input from an external file.

```rexx
file.1 = '19, 13, 30 @ -2,  1, -2'
file.2 = '18, 19, 22 @ -1, -1, -2'
...
x = bpxwunix('cat /z/z35259/AoC23Input/input24.txt',,file.,se.)
```

## Numeric Precision

The script sets the numeric precision to 15 digits.

```rexx
NUMERIC DIGITS 15
```

## Processing Points and Velocities

The script parses each input line to extract points' positions and velocities, and sets up an array `h.` to store related information.

```rexx
do i = 1 to file.0
  ...
end
```

## Computing Intersections (Part 1)

The script defines a search range (`low` and `high`) and computes intersections of movement lines within this range.

```rexx
part1 = 0
low = 200000000000000
high = 400000000000000
...
```

Each point pair's movement is evaluated by the `matchxy` procedure to check for intersections inside the target area.

```rexx
do a = 1 to file.0
  ...
end
```

The first part's result is outputted:

```rexx
say "part 1:" part1
```

## Procedures

### matchxy Procedure

`matchxy` checks if two points, when moved along their velocity vectors, will intersect within a given range and returns 1 if true.

```rexx
matchxy: procedure expose h.
  ...
```

### matchx Procedure

`matchx` calculates the relative movement along the x-axis for two points.

```rexx
matchx: procedure expose h.
  ...
```

### lapse Procedure

`lapse` computes the new position of a point after a certain time `t` has elapsed, based on its initial position `s`, operation `op`, and velocity `v`.

```rexx
lapse: procedure expose h.
  ...
```
