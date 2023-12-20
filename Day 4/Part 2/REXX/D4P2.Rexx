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

copiesof. = 1
total = 0

do i = 1 to file.0
  parse var file.i "Card "card":" winning "|" ours
  card = strip(card) /* is this it? eggnog if true :) */
  copiesof.0 = card
  points = 0
  say time()": On card" card
  do n = 1 to words(ours)
    /* iterate through our numbers */
    nmbr = word(ours,n)
    wewinone= wordpos(nmbr, winning)
    if wewinone > 0 then do
      points = points + 1
    end
  end

  do p = 1 to points
    ccard = card + p
    /* This code was suboptimal....
       There's no need to loop over copiesof.card and add one
       We can just add the copies of the original card to this one..

    do copies = 1 to copiesof.card
      copiesof.ccard = copiesof.ccard + 1
    end

       Speed increase : soooo much :)

    */
    copiesof.ccard = copiesof.ccard + copiesof.card
  end
end

do i = 1 to copiesof.0
  total = total + copiesof.i
end

say "Part Two: "total
