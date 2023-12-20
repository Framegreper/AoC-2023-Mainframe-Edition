/* REXX */
say "Advent of Code 2023 day 8"
x = bpxwunix('cat /z/z35259/AoC23Input/input8.txt',,file.,se.)

/* example data */
aile.1 = 'LLR'
aile.2 = 'AAA = (BBB, BBB)'
aile.3 = 'BBB = (AAA, ZZZ)'
aile.4 = 'ZZZ = (ZZZ, ZZZ)'
aile.0 = 4


nodes. = ''
route. = ''

/* Parse the LRLRLRLR into our route stem */
do i = 1 to length(file.1)
  route.i = substr(file.1,i,1)
  route.0 = i
end

/* Create the network of nodes */
do i = 2 to file.0
  parse var file.i start "= ("l", "r")"
  start = strip(start)
  nodes.start.LEFT = strip(l)
  nodes.start.RIGHT = strip(r)
  say nodes.start.left","nodes.start.right
end

found = 0
i = 1
start = 'AAA'
finish = 'ZZZ'
do while(found=0)
  wstep = i
  do while(wstep > route.0)
    wstep = wstep - route.0
  end
  if route.wstep = 'L'
  then move = 'LEFT'
  else move = 'RIGHT'
  if nodes.start.move = finish then do
    say i "steps"
    found = 1
  end
  else do
    start = nodes.start.move
    i = i + 1
  end
end



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
