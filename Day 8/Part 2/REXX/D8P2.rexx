/* REXX */
say "Advent of Code 2023 day 8"
x = bpxwunix('cat /z/z35259/AoC23Input/input8.txt',,file.,se.)

numeric digits 16

/* run in batch or EC6's ol */

/* example data */
aile.1 = 'LR'
aile.2 = '                '
aile.3 = '11A = (11B, XXX)'
aile.4 = '11B = (XXX, 11Z)'
aile.5 = '11Z = (11B, XXX)'
aile.6 = '22A = (22B, XXX)'
aile.7 = '22B = (22C, 22C)'
aile.8 = '22C = (22Z, 22Z)'
aile.9 = '22Z = (22B, 22B)'
aile.10= 'XXX = (XXX, XXX)'
aile.0 = 10


nodes. = ''
route. = ''
starters = ''

/* Parse the LRLRLRLR into our route stem */
do i = 1 to length(file.1)
  route.i = substr(file.1,i,1)
  route.0 = i
end

/* Create the network of nodes */
do i = 2 to file.0
  parse var file.i start "= ("l", "r")"
  start = strip(start)
  if substr(start,3,1) = 'A' then
    starters = starters start
  nodes.start.LEFT = strip(l)
  nodes.start.RIGHT = strip(r)
end

/* find our starting points */
say starters

found = 0
i = 1
gos. = 0

do while(found=0)
    startpositions = words(starters)
    if i // 50000= 0 then do
      say TIME() "check"  startpositions "positions" "i=" i
    end
    newstart = ''
    wstep = i // route.0
    if route.wstep = 'L'
    then move = 'LEFT'
    else move = 'RIGHT'

    allz = 0
    do s = 1 to startpositions
      start = strip(word(starters,s))
      newstart = newstart nodes.start.move
      if substr(nodes.start.move,3,1) = 'Z' then do
        gos.s = i
        gos.0 = gos.0 + 1
      end
    end


    if gos.0 = startpositions then
      found = 1
    else do
      i = i + 1
      starters = newstart
    end
end



/* now we have the cycles in which all the positions hit
   the Z at the end. Time to find i for when they all hit
   this is most effective highest, lowest... so sort the gos. */

gosstr = ''
do i = 1 to gos.0
  gosstr = gosstr gos.i'\n'
end

scmd = 'echo "'gosstr'" | sort   '
x = bpxwunix(scmd,,so.,se.)
sstr = ''
do i = 2 to so.0
  p = i - 1
  say i '->'so.i'<'
  gos.p = strip(so.i)
end

l = mylcm(gos.1,gos.2)
say gos.1 gos.2 "->" l
do i = gos.0 to 3 by -1
  say l gos.i '->'
  l = mylcm(l,gos.i)
  say l
end

say "P2=" l



exit


dfs: procedure expose nodes. route.
  /* Did not need it, as it runs into CONTROL STACK FULL and
     we van just loop as we done above, keeping code though :)
  */
  parse arg start,finish,step

  /* need clock math here */
  wstep = step
  do while(wstep > route.0)
    wstep = wstep - route.0
  end

  if route.wstep = 'L'
  then move = 'LEFT'
  else move = 'RIGHT'

  if nodes.start.move = finish then do
    /* thinking of last years monkeys: is this HEAD recursion? :) */
    return step
  end
  else do
    start = nodes.start.move
    step = step + 1
    return dfs(start,finish,step)
  end

mylcm: procedure
  parse arg a,b

  lowest = min(a,b)
  highest = max(a,b)

  /* always increase by this amount */
  l = lowest
  h = highest
  done = 0

  do forever
    if lowest < highest then do
      lowest = lowest + l
    end

    if highest = lowest then do
      return lowest
    end

    if lowest > highest then do
      say TIME() "swap" highest "and" lowest
      oldhi = highest
      oldhiplus = h
      h = l
      highest = lowest
      lowest = oldhi
      l = oldhiplus
    end
  end


lcm: procedure
  parse arg a,b
  return a*b / gcf(a,b)

gcf: procedure
  parse arg a,b
  say "gcf->" a b
  factorA. = 0
  factorB. = 0
  iter = factorA.0
  do i = 1 to a
    if i * i > a then leave
    if a // 1 = 0 then do
      iter = iter + 1
      factorA.iter = i
      if a/i <> i then do
        iter = iter + 1
        factorA.iter = a/i
      end
    end
  end
  factorA.0 = iter

  iter = factorB.0
  do i = 1 to b
    if i * i > b then leave
    if b // 1 = 0 then do
      iter = iter + 1
      factorB.iter = i
      if b/i <> i then do
        iter = iter + 1
        factorB.iter = b/i
      end
    end
  end
  factorB.0 = iter

  ans = 0
  do i = 1 to factorA.0
    do j = 1 to factorB.0
      if factorA.i = factorB.j then do
        ans = factorA.i
    end
  end
  say "returning "ans
  return ans

gcf2: procedure
  parse arg numbers
  n = words(numbers)
  x = abs(word(numbers,1))
  do i = 2 to n
    y = abs(word(numbers,i))
    if y <> 0 then do
      do until z = 0
        z  = x // y
        x = y
      end
    end
  end
  return x
