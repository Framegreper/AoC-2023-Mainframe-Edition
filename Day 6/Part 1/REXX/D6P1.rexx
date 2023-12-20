/* REXX */
say "Advent of Code 2023 day 6"
x = bpxwunix('cat /z/z35259/AoC23Input/input6.txt',,file.,se.)
/*
file.1 = "Time:      7  15   30"
file.2 = "Distance:  9  40  200"
*/
times. = ''
dists. = ''
windist = 0
winidx = 0

idx = 1
do i = 2 to words(file.1)
  times.idx = word(file.1,i)
  dists.idx = word(file.2,i)
  if dists.idx > windist then do
    windist = dists.idx
    winidx = idx
  end
  idx = idx + 1
end
times.0 = idx - 1
dists.0 = idx - 1

p1 = 1

do i = 1 to times.0
  say times.i "->" dists.i
  /* how can we win this race */
  winningoptions = 0
  do j = 1 to times.i
    distance = (times.i - j) * j
    if distance > dists.i then winningoptions = winningoptions + 1
  end
  say "Numer of ways to win this race:" winningoptions
  p1 = p1 * winningoptions
end


say "part one:" p1

exit
