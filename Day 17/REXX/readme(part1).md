# Advent of Code 2023 - Day 17 Solution

This REXX script offers a solution to the Day 17 challenge of the Advent of Code 2023. The script is structured to compute an optimal path through a grid-based city map based on certain rules and constraints.

## Script Execution

The script starts by reading input data from an external file and sets up a default map as a fallback.

```rexx
x = bpxwunix('cat /z/z35259/AoC23Input/input17.txt',,file.,se.)
```

The map is represented by numeric values in the `file.` stem variable.

## Map Parsing

The grid's configuration is processed into the `grid.` stem variable, which holds the parsed city block map.

```rexx
do i = 1 to file.0
  ...
end
```

Each entry in the map is a numeric value that appears to represent the cost to traverse a particular point on the grid.

## Pathfinding

The script sets out to find an optimal path from a "start" coordinate at (1,1) to a "finish" coordinate represented by (`maxx, maxy`).

```rexx
start = "1,1"
finish = maxx || "," || maxy
```

During pathfinding, a cost metric is used to judge the validity of a path.

```rexx
lowest = 99999999999999
cost.  = -1

p = seek(start, finish, '1,0')
```

The `seek` procedure is the crux of the pathfinding process, where the goal is to find a path to the finish point while adhering to movement constraints and cost evaluations.

## Output

The result of the pathfinding, the optimal path, is saved in variable `p` and the total cost of the path is then calculated and displayed.

```rexx
say "Part 1:" p
```

## Procedures

The script uses a set of REXX procedures to handle specific operations within the pathfinding process.

### queuepopleft Procedure

This procedure manages the queue data structure, essential for breadth-first search strategy used in pathfinding.

```rexx
queuepopleft: procedure ...
```

### moves Procedure

Calculates potential moves from the current position based on direction and map boundaries.

```rexx
moves: procedure ...
```

### turn_left and turn_right Procedures

These helper procedures determine new direction after making a left or right turn.

```rexx
turn_left: procedure ...
turn_right: procedure ...
```

### pathval Procedure

Calculates the value of a path based on the sum of the cost to traverse all points in the path.

```rexx
pathval: procedure ...
```
