# Advent of Code 2023 - Day 14 Solution

This is a REXX script solution for Day 14 of the Advent of Code 2023. The script processes an input file representing a two-dimensional array of characters where certain patterns represent "cubes."

## Input File Reading

The script begins by reading the contents of the input file, with each row of text being stored into a separate element of the `rows.` stem variable.

```rexx
x = bpxwunix('/z/z35259/AoC23Input/input14.txt',,rows.,se.)
```

## Example Data

The script includes predefined example data stored in the `aows.` stem variable. This data may represent part of the expected input or test data for validating the logic.

```rexx
aows.1 = 'O....#....'
...
aows.10= '#OO..#....'
aows.0 = 10
```

## Processing Rows into Columns

The script transforms the input rows into columns, storing the result in the `cols.` stem variable. This is achieved by iterating through each character position of each row and concatenating vertically aligned characters.

```rexx
do i = 1 to rows.0
    ...
end
```

## Analysis

The script then processes each column to find "cube-shaped" (`#`) characters and calculates a score (`p1`) based on their positions.

```rexx
do i = 1 to cols.0
    ...
end
```

During this analysis stage, the script also rearranges the column characters so that any (`.`) characters occur after "O" characters but before "#" characters.

## Scoring

The score calculates the position of the "O" character from the bottom (ignoring the additional "#" that's added for technical reasons), which represents the height of the cubes stacked in that column.

```rexx
if substr(newcol,l,1) = 'O' then
    p1 = p1 + p
```

## Output

The final score for part one of the puzzle is output.

```rexx
say "part 1"  p1
```

## Auxiliary Function: strreplace

An auxiliary function named `strreplace` is used within the script. It replaces all occurrences of a substring (`OLDTXT`) with another (`NEWTXT`) in a given string (`ORIGINAL`).

```rexx
strreplace:
    ...
