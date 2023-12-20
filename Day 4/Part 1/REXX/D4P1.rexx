/* REXX */
say "Advent of Code 2023 day 4"
x = bpxwunix('cat /z/z35259/AoC23Input/input4.txt',,file.,se.)

/* Example data to parse

file.1 = 'Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53'
file.2 = 'Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19'
file.3 = 'Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1'
file.4 = 'Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83'
file.5 = 'Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36'
file.6 = 'Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11'
file.0 = 6

*/



total = 0

do i = 1 to file.0
  parse var file.i "Card "card":" winning "|" ours
  points = ""
  do n = 1 to words(ours)
    /* iterate through our numbers */
    nmbr = word(ours,n)
    wewinone= wordpos(nmbr, winning)
    if wewinone > 0 then do
      points = points nmbr
    end
  end
  goodones = words(points)
  if goodones >= 1 then do
    /* we get one point for the first then double the points
       for every other good one
    */
    score = 2 ** (goodones -1)
    say "We scored:" score
    total = total + score
  end
end

say "Part One: "total
