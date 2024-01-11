# Advent of Code 2023 - Day 6 Solution

This REXX script is designed to solve Day 6 of the Advent of Code 2023. The challenge involves analyzing race data to determine the number of winning strategies.

## Script Execution

The script starts by introducing the challenge for the day:

```rexx
say "Advent of Code 2023 day 6"
```

It reads the input data from a file, which includes time and distance information for competitors in a race.

```rexx
x = bpxwunix('cat /z/z35259/AoC23Input/input6.txt',,file.,se.)
```

## Data Parsing

The input is assumed to be in two lines where the first line represents the times and the second line the distances.

```rexx
/*
file.1 = "Time:      7  15   30"
file.2 = "Distance:  9  40  200"
*/
```

The script then parses the input to extract time and distance values, storing them in corresponding `times.` and `dists.` arrays, and simultaneously identifies the longest distance and its index.

```rexx
times. = ''
dists. = ''
...
```

## Winning Strategy Analysis

The script calculates the number of winning strategies by looping over each time value and assessing different possible distances the competitors could cover.

```rexx
p1 = 1

do i = 1 to times.0
  ...
  p1 = p1 * winningoptions
end
```

## Part One Conclusion

After iterating through the time-distance pairs, it multiplies all the winnable options to determine the solution for Part One of the challenge.

```rexx
say "part one:" p1
```

The script concludes by outputting the result.

## Code Structure

The script is structured with clear variable initializations aiming to determine the possible number of ways to win the race given the constraints in the received dataset. 
