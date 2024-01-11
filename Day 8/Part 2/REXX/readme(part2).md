# Advent of Code 2023 - Day 8 Solution

This REXX script is created to find a solution for Day 8 of the Advent of Code 2023. It involves navigating a network of nodes based on a sequence of directional instructions and determining when all starting points concomitantly reach their respective 'Z' nodes.

## Execution Details

The script prints an introductory message for Day 8:

```rexx
say "Advent of Code 2023 day 8"
```

It proceeds by reading the input file, which contains the sequence of navigation instructions and the description of the nodes.

## File Reading

To retrieve the input data:

```rexx
x = bpxwunix('cat /z/z35259/AoC23Input/input8.txt',,file.,se.)
```

## Initialization and Parsing

The script initializes variables and sets the precision for numeric operations:

```rexx
numeric digits 16
```

It then parses the first line of the file to obtain the sequence of navigational instructions ('L' for left, 'R' for right):

```rexx
...
do i = 1 to length(file.1)
  ...
end
```

## Network Construction

The node network is built from the input, with nodes specified by their relationships to other nodes:

```rexx
...
do i = 2 to file.0
  ...
end
```

## Finding Starting Points and Navigation

The script identifies starting points and begins to navigate the network:

```rexx
...
do while(found=0)
  ...
end
```

## Least Common Multiple (LCM) Calculation

To find the point in time when all starting positions concomitantly hit the 'Z' nodes, the script calculates the least common multiple (LCM) of the cycles using a custom `mylcm` routine:

```rexx
...
l = mylcm(gos.1,gos.2)
...
```
