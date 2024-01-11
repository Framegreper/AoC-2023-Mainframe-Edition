# Advent of Code 2023 - Day 8 Solution

This REXX script tackles Day 8 of the Advent of Code 2023, which involves navigating through a network of nodes and determining the number of steps needed to reach a particular destination.

## Introduction

Upon execution, the script announces which day's challenge it is addressing:

```rexx
say "Advent of Code 2023 day 8"
```

The code reads a network description from a file and uses an example data structure that defines a network of nodes and their relationships.

## File Reading

The input file, which includes the navigation instructions and network structure, is read into the `file.` stem variable:

```rexx
x = bpxwunix('cat /z/z35259/AoC23Input/input8.txt',,file.,se.)
```

## Navigation Route Parsing

The navigation route is parsed from the first line of the file and stored in the `route.` stem variable:

```rexx
...
do i = 1 to length(file.1)
  ...
end
```

## Building the Node Network

The script constructs the network of nodes by parsing lines that represent node connections:

```rexx
...
do i = 2 to file.0
  ...
end
```

## Finding the Route

The main loop simulates taking steps within the network, following 'L' (left) or 'R' (right) directions until the destination ('ZZZ') is reached:

```rexx
found = 0
...
do while(found=0)
  ...
end
```
