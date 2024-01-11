# Advent of Code 2023 Day 2 Solution in REXX

This `README.md` provides an explanation for the REXX script designed to solve the Day 2 puzzle of Advent of Code 2023. The goal of the puzzle is to process game data and calculate a sum of products based on the attributes of items mentioned in the game.

## Script Outline

The script reads input data, presumably describing games and the associated items, from a text file. It then parses and processes this data to determine the sum of the products of the largest amounts of three different colored items mentioned per game.

```rexx
say "Advent of Code 2023 day 2"
x = bpxwunix('cat /z/z35259/AoC23Input/input2.txt',,file.,se.)
```

## Input Data

Input data is expected to be in the format of lines specifying game numbers followed by a combination of colored items and their quantities. Commas and semicolons are used to separate the items within the same game:

```rexx
/*
Example of formatted input data:
file.1 = 'Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green'
*/
```

## Calculation Logic

For each game provided in the input data, the script finds the largest number of red, blue, and green items and calculates the product of those numbers. It sums these products across all games to obtain a final count:

```rexx
do i = 1 to file.0
  ...
  pow3 = lg * lr * lb
  sumpow = sumpow + pow3
end
```

## Final Output

The script concludes by outputting the calculated sum for "Part two" of the puzzle:

```rexx
say "Part two: " sumpow
```

## Running Instructions

1. Confirm that the input file `/z/z35259/AoC23Input/input2.txt` exists and contains correctly formatted data, or adjust the file path as necessary.
2. Run the script using a REXX interpreter that has access to the input file.
3. Observe the total sum output at the end of the script's execution.
