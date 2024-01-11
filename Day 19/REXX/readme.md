

## Script Overview

The purpose of this script is to:

1. Read input data which includes workflows and parts ratings.
2. Apply rules to each part to determine whether it's accepted.
3. Compute the total rating for all accepted parts.

## Input Data

The script begins by declaring and initializing compound variables (stems) to store workflows, parts ratings, and rules.

```rexx
workflows = .workflows.
parts_ratings = .parts_ratings.
rules = .rules.
```

The total accepted rating is also initialized to zero.

```rexx
total_accepted_rating = 0
```

## Reading the Input File

The script uses a command to read all lines of the input file `/z/z35259/AoC23Input/input19.txt` into the `file.` stem variable.

```rexx
x = "bpxwunix 'cat /z/z35259/AoC23Input/input19.txt' ,,file.,se."
```

## Processing the Input File

The script begins to parse the input data, splitting it into parts data and workflow rules.

```rexx
do while parseline <= se.
    ...
end
```

Empty lines in the input indicate a separation between workflows and parts data. Curly braces `{}` are used to denote parts information and workflow rules.

## Parts and Workflows

Parts are given ratings data and processed through a set of workflows. The script checks the rating data against each rule in the workflows.

```rexx
do part_num = 1 to part_num
    ...
end
```

## Parts Acceptance or Rejection

Each part can either be accepted and contribute its rating to the total or be rejected based on the outcome of `eval_rule_condition` which evaluates each part against the current rule.

```rexx
if condition = '' then do
    ...
end
```

The script also includes two helper procedures for calculations.

## Total Rating Calculation

`calculate_total_rating` is a procedure that calculates the rating value of an accepted part and adds it to the total sum.

```rexx
calculate_total_rating: procedure expose total_accepted_rating parts_ratings.
    ...
```

## Evaluating Rule Conditions

`eval_rule_condition` checks if a part's rating data satisfies a certain condition which is compared against a threshold.

```rexx
eval_rule_condition: procedure
    ...
```

## Final Output

Finally, the script reports the total sum of all accepted parts' ratings and exits.

```rexx
say "Total sum of accepted parts' ratings: " total_accepted_rating
exit
```
