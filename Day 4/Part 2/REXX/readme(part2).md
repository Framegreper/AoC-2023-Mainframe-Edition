# Advent of Code 2023 - Day 4 Solution in REXX

This REXX program solves Day 4 of the Advent of Code 2023 by analyzing bingo cards and calculating their scores based on matching numbers with a list of winning numbers.

## Script Execution

The script starts by announcing the challenge and reading data from an input file:

```rexx
say "Advent of Code 2023 day 4"
x = bpxwunix('cat /z/z35259/AoC23Input/input4.txt',,file.,se.)
```

## Assumed Data Format

The script expects data in the following format, representing bingo cards and a series of winning numbers:

```rexx
file.1 = 'Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53'
...
```

## Score Calculation

Each card's score is calculated based on the number of matches it has with the winning numbers:

```rexx
do i = 1 to file.0
  ...
  do n = 1 to words(ours)
    nmbr = word(ours,n)
    wewinone = wordpos(nmbr, winning)
    ...
  end
  ...
end
```

The score accumulates based on how many times a number appears on both the card and in the winning set.

## Card Duplication Logic

The script improves the card duplication logic, enhancing the runtime speed:

```rexx
do p = 1 to points
  ccard = card + p
  copiesof.ccard = copiesof.ccard + copiesof.card
end
```

## Final Output

After processing all cards, the program outputs the total score accrued from all matching numbers across all cards:

```rexx
say "Part Two: "total
```

## Running the Script

Make sure the input data is placed in the file `/z/z35259/AoC23Input/input4.txt`, and that the data follows the specified format. Execute the script using a REXX interpreter to compute the score. The calculated total score will be presented in the terminal as part of the program's output for "Part Two."

```

The `README.md` articulates the script's objectives, methodology, and provides necessary context for the problem at hand. It describes the steps taken within the script to accomplish the task and notes the performance improvements made. Markdown formatting is used to structure the document, offering readers a clean and coherent guide to understanding the script's workings.
