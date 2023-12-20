/* REXX */
say "Advent of Code 2023 day 7"
x = bpxwunix('cat /z/z35259/AoC23Input/input7.txt',,file.,se.)

NUMERIC DIGITS 31

aile.1 = '32T3K 765'
aile.2 = 'T55J5 684'
aile.3 = 'KK677 28'
aile.4 = 'KTJJT 220'
aile.5 = 'QQQJA 483'
aile.0 = 5

/* res values */
val.1 = 'Five of a Kind'
val.2 = 'Four of a Kind'
val.3 = 'Full House'
val.4 = 'Three of a Kind'
val.5 = 'Two pair'
val.6 = 'One pair'
val.7 = 'High Card'




/* hands stem has index for the nth hand
   but also a .type

   hands.1 = '32T3K'
   hands.1.type = 'fiveofakind' (1)
   hands.1.bid  = 765

*/
hands. = ''
hands.0 = 0

/* because hands with same type are scored based on first
   card, we sort the cards first...
   but we want A > K > Q > J > T so we change them to
   A -> A
   K -> B
   Q -> C
   J -> D
   T -> E
*/


do i = 1 to file.0
  parse var file.i hand" "bid
  hands.hand = bid /* for easier lookup */
  hand = translate(hand,'BCDEFGHIKLMNO','AKQT98765432J')
  newhand = hands.0 + 1
  hands.newhand = hand
  hands.newhand.bid = bid
  hands.newhand.type = handtype(hand)
  hands.0 = newhand
end

/* now we have it ready to 'sort' */
sortstring = ''
do i = 1 to hands.0
  sortstring = sortstring || '\n' || hands.i.type || ":"hands.i
end

sortcmd = 'echo "' || sortstring || '" | sort'
x = bpxwunix(sortcmd,,sorted.,err.)

say sorted.0 "cards out of sort"
/* now we take the cardbits, and sort them again */
sortstring = ''
do i = 2 to sorted.0
  say sorted.i
  parse var sorted.i type":"card
  sortstring = sortstring || '\n' || sorted.i
end
sortcmd = 'echo "' || sortstring || '" | sort -r'
x = bpxwunix(sortcmd,,sorted.,err.)

p2 = 0

do i = 1 to sorted.0
  if sorted.i = '' then iterate /* pesky newlines */
  cdat = translate(sorted.i,'AKQT98765432J','BCDEFGHIKLMNO')
  parse var cdat idx":"card
  card = strip(card)
  bid = hands.card
  p2 = p2 + (bid * i)
  say cdat bid p2
end

say "Part two:" p2

exit

handtype: procedure expose val.
  parse arg h

  labels. = 0
  labellist = ''

  do i = 1 to length(h)
    label = substr(h,i,1)
    labels.label = labels.label + 1
    if wordpos(label, labellist) = 0 then
      labellist = labellist label
  end
  state = ''
  /* Determine type */
  /* skip all the J for determination  */
  res = 0
  J = labels.O
  if J > 3 then say "**** >3 jokers "
  if J > 3 then say "**** >3 jokers "
  if J > 3 then say "**** >3 jokers "
  do q = 1 to words(labellist)
    l = word(labellist,q)
    if l <> 'O' /* our translated J */
    then do
      if labels.l = 5 then res = 1
      if labels.l = 4 then res = 2
      if labels.l = 3 &   state = 'pair' then res = 3
      if labels.l = 3 &   state = '' then state = 'toak'
      if labels.l = 2 &   state = 'pair' then res = 5
      if labels.l = 2 &   state = 'toak' then res = 3
      if labels.l = 2 &   state = '' then state = 'pair'
      /*
      if res > 0 then leave
      */
    end
  end

  if state = 'toak' & res = 0 then res = 4
  if state = 'pair' & res = 0 then res = 6
  if res = 0 then res = 7

  hh =translate(h,'AKQT98765432J','BCDEFGHIKLMNO')
  if pos('O',h) = 0 then do
    /* No jokers, just do what we did */
    say "No magix    on" hh "was a" val.res "with" J "jokers"
    return res
  end
  else do
    say "Joker magix on" hh "was a" val.res "with" J "jokers"
    if res = 2 & J = 1 then do
      /* four of a kind plus Joker */
      res = 1     /* becomes five of a kind */
    end
    if res = 4 & J = 1 then do
      /* three of a kind plus joker */
      res = 2     /* becomes four of a kind */
    end
    if res = 4 & J = 2 then do
      /* three of a kind plus 2 jokers */
      res = 1     /* becomes five of a kind */
    end
    if res = 5 & J = 1 then do
      /* two pair plus joker */
      res = 3     /* becomes full house */
    end
    if res = 6 & J = 1 then do
      /* one pair plus joker */
      res = 4     /* becomes thre of a kind */
    end
    if res = 6 & J = 2 then do
      /* one pair plus 2 jokers */
      res = 2     /* becomes four of a kind */
    end
    if res = 6 & J = 3 then do
      /* one pair plus 3 jokers */
      res = 1     /* becomes three of a five of a kind */
    end
    if res = 7 & J = 1 then do
      /* high card plus joker */
      res = 6     /* becomes one pair */
    end
    if res = 7 & J = 2 then do
      /* high card plus 2 jokers */
      res = 4     /* becomes three of a kind */
    end
    if res = 7 & J = 3 then do
      /* high card plus 3 jokers */
      res = 2     /* becomes four of a kind */
    end
    if res = 7 & J = 4 then do
      /* high card plus 4 jokers */
      res = 1     /* becomes five of a kind */
    end
    if res = 7 & J = 5 then do
      /* high card plus 5 jokers */
      res = 1     /* becomes five of a kind */
    end
  end
  say "becomes a" val.res
  return res
