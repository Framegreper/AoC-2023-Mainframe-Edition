/* REXX*/
x = bpxwunix('/z/z35259/AoC23Input/input14.txt',,rows.,se.)

aows.1 = 'O....#....'
aows.2 = 'O.OO#....#'
aows.3 = '.....##...'
aows.4 = 'OO.#O....O'
aows.5 = '.O.....O#.'
aows.6 = 'O.#..O.#.#'
aows.7 = '..O..#O..O'
aows.8 = '.......O..'
aows.9 = '#....###..'
aows.10= '#OO..#....'
aows.0 = 10

cols. = ''

do i = 1 to rows.0
  do j = 1 to length(rows.i)
    cols.j = cols.j || substr(rows.i,j,1)
  end
end
cols.0 = length(rows.1)

p1 = 0

/* Now we tilt north */
do i = 1 to cols.0
  say cols.i
  /* find the cube-shaped ones */
  cubes = ''
  do j = 1 to length(cols.i)
    if substr(cols.i,j,1) = '#' then
      cubes = cubes j
  end
  cubes = cubes length(cols.i) + 1
  start = 1
  newcol = ''
  if cubes <> '' then
    do c = 1 to words(cubes)
      cubepos = word(cubes,c)
      uptocube = substr(cols.i,start,cubepos-start)
      newcol = newcol || strreplace(uptocube,'.','')
      /* How many . did we remove? */
      i1 = translate(uptocube,' ','.')
      r = length(uptocube) - length(space(i1,0))
      /* r dots removed, so add them after */
      do a = 1 to r
        newcol = newcol || '.'
      end
      /* add a closing cube just to be sure :) */
      newcol = newcol || '#'
      start = cubepos + 1
    end
  else
    newcol = strreplace(cols.i,'.','')
  do l = 1 to length(newcol) /* we have the extra # faked at the end */
    p = length(newcol) - l
    if substr(newcol,l,1) = 'O' then
      p1 = p1 + p
  end
end

say "part 1"  p1
exit

strreplace:
ORIGINAL = ARG(1)
OLDTXT = ARG(2)
NEWTXT = ARG(3)
/* YOU CAN CHANGE THE BELOW KEY (TMPTXT), WHICH IS USED AS A TEMPORARY
POINTER TO IDENTIFY THE TEXT TO BE REPLACED */
TMPTXT = '6A53CD2EW1F'
NEWSTR = ORIGINAL
DO WHILE POS(OLDTXT,NEWSTR) > 0
NEWSTR = SUBSTR(NEWSTR, 1 , POS(OLDTXT,NEWSTR)-1) ||,
TMPTXT || SUBSTR(NEWSTR, POS(OLDTXT,NEWSTR) + LENGTH(OLDTXT))
END
DO WHILE POS(TMPTXT,NEWSTR) > 0
NEWSTR = SUBSTR(NEWSTR, 1 , POS(TMPTXT,NEWSTR)-1) ||,
NEWTXT || SUBSTR(NEWSTR, POS(TMPTXT,NEWSTR) + LENGTH(TMPTXT))
END
RETURN NEWSTR
