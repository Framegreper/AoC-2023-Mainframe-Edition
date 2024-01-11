# Advent of Code 2023 - Day 6 Solution in REXX

This REXX script provides a solution for Day 6 of Advent of Code 2023. The challenge involves solving a mathematical problem related to time, distance, and racing strategies.

## Script Overview

The script begins by announcing the challenge day:

```rexx
say "Advent of Code 2023 day 6"
```

It then reads data from a specified file path. Ensure the input data is located in the path mentioned:

```rexx
x = bpxwunix('cat /z/z35259/AoC23Input/input6.txt',,file.,se.)
```

## Numeric Precision

The numeric precision is set high to maintain accuracy of calculations:

```rexx
NUMERIC DIGITS 31
```

## Data Parsing

For demonstration purposes, the script contains hardcoded sample data representing times and distances:

```rexx
aile.1 = "Time:      7  15   30"
aile.2 = "Distance:  9  40  200"
```

## Calculations

The code concatenates all the time and distance values into single string variables, which are then manipulated to solve the given formula. The solution involves finding the number of ways to win the race, which translates to solutions of a quadratic equation:

```rexx
times.1 = times.1|| word(file.1,i)
dists.1 = dists.1|| word(file.2,i)
...
```

## Quadratic Equation Solution

The code forms and solves a quadratic equation by calculating the discriminant (`D`) and its square root (`root`). It then finds two potential roots (`root1` and `root2`) which represent the number of valid solutions:

```rexx
D = (times.1 * times.1) - (4*-1*-dists.1)
root = sqrt(D)
...
```

## Conclusion

Finally, it outputs the absolute difference between the two roots plus one as the answer to how many distinct ways the race can be won:

```rexx
say "answer=" abs(r1-r2) + 1
```

## Subroutine

A `sqrt` function is defined to calculate the square root without invoking external functions:

```rexx
sqrt: procedure
  ...
```

## Execution Instructions

Run the script in a REXX interpreter, ensuring that the input file `/z/z35259/AoC23Input/input6.txt` is present with the expected content format. Adjust the hardcoded sample data as needed for different inputs.
