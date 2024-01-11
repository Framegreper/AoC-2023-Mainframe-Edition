# Advent of Code 2023 - Day 4 Solution in REXX

This REXX program is developed to solve the puzzle for Day 4 of the Advent of Code 2023. The task is to calculate a total score based on matching numbers between a list of winning numbers and each card's numbers.

## Script Execution

The script announces the challenge day and initializes the process by reading the input file:

```rexx
say "Advent of Code 2023 day 4"
x = bpxwunix('cat /z/z35259/AoC23Input/input4.txt',,file.,se.)
```

## Assumed Data Format

Here's the format for the file that the script assumes, with example data hardcoded:

```rexx
file.1 = 'Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53'
...
```

Each line contains a card followed by matched and owned numbers, separated by a pipe (`|`).

## Score Calculation

The script evaluates each card and calculates the score by identifying matched numbers and applying the scoring rules:

```rexx
total = 0

do i = 1 to file.0
  ...
  score = 2 ** (goodones -1)
  ...
end

say "Part One: "total
```

The scoring system awards one point for the first match and then doubles the points for each additional good number on the card.

## Output

Upon conclusion, the script outputs the total points from all cards:

```rexx
say "Part One: "total
```

## Documentation Notes

This `README.md` is provided to describe how the REXX script should be used to solve Day 4 of Advent of Code 2023. Save this file alongside the script to serve as a reference for the logic and structure of the solution.

## Usage Instructions

Ensure that the input file, `/z/z35259/AoC23Input/input4.txt`, exists and contains data in the specified format. Run this script using a REXX-compatible interpreter. The final output is displayed in the console and indicates the total score calculated as per the puzzle's rules.

```

The README offers explanations of each section of the script, making it easier for users to understand how the solution operates and what each part of the code is designed to do. The Markdown formatting provides a clear and structured document that is both readable and informative, enhancing the documentation of the code.
