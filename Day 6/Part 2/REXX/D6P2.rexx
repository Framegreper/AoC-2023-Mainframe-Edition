/* REXX */
say "Advent of Code 2023 day 6"
x = bpxwunix('cat /z/z35259/AoC23Input/input6.txt',,file.,se.)
NUMERIC DIGITS 31

aile.1 = "Time:      7  15   30"
aile.2 = "Distance:  9  40  200"


times. = ''
dists. = ''
times.0 = 1
dists.0 = 1

do i = 2 to words(file.1)
  times.1 = times.1|| word(file.1,i)
  dists.1 = dists.1|| word(file.2,i)
end

say times.1
say dists.1 "<- distance to beat so add one :)"
dists.1 = dists.1 + 1

say "formula to solve"
say "(" || times.1 "- x) * x > "dists.1
say times.1 || "x - xp2 >" dists.1
say "-xp2 +" times.1 ||"x  - " dists.1 "> 0"

D = (times.1 * times.1) - (4*-1*-dists.1)

say "D=>" D
root = sqrt(D)
say "sqrD="root

root1  =((-1 * times.1) + root)/ -2
root2  =((-1 * times.1) - root)/ -2

parse var root1 r1"."rrest1
parse var root2 r2"."rrest2


say rrest1 rrest2
if rrest1 <> '' then r1 = r1 + 1

say "root1 ="r1 root1 win1
say "root2 ="r2 root2 win2
say "tobeat="dists.1


say "answer=" abs(r1-r2) + 1

exit

sqrt: procedure
  parse arg val
  xnew = val
  eps = 0.5 * 10**(1+fuzz()-digits())
  do until abs(xold-xnew) < (eps*xnew)
    xold = xnew
    xnew = 0.5 * (xold+val/xold)
  end

  return xnew
