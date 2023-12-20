/* REXX */
say "Advent of Code 2023 day 3"
x = bpxwunix('cat /z/z35259/AoC23Input/input3.txt',,file.,se.)

partnumsum = 0
/* Works with example input, does not work with real data... */

aile.1='467..114..'
aile.2='...*......'
aile.3='..35..633.'
aile.4='......#...'
aile.5='617*......'
aile.6='.....+.58.'
aile.7='..592.....'
aile.8='......755.'
aile.9='...$.*....'
aile.10='.664.598..'
aile.0 = 10

/* Mess up input file, all symbols will be a # */
do i = 1 to file.0
  do j = 1 to length(file.i)
    c = substr(file.i,j,1)
    if c = '.' then iterate
    if datatype(c) = 'NUM' then iterate
    if c = '*' then iterate
    file.i = translate(file.i,'#',c)
  end
end

gears. = ''
gearlist = ''
p2 = 0

do i = 1 to file.0
  bnum = ''
  do j =1 to length(file.i)
    c = substr(file.i,j,1)
    if datatype(c) = 'NUM'
    then bnum = bnum || c
    if datatype(c) ^= 'NUM' |  j = length(file.i) then do
      conns = ''               /* gotta have symbol first */
      if datatype(bnum) = 'NUM' then do
        /* we have a full number, starts at j - length(bnum) */
        startpos = j - length(bnum)
        /* now see if theres a symbol around it */
        lbound = startpos -1
        if lbound = 0 then lbound = 1
        rbound = length(bnum) + 2
        if rbound > length(file.i) then rbound = length(file.i)
        if i > 1 then do
          /* look previous line */
          chkid = i - 1
          lookstr = substr(file.chkid,lbound,rbound)
          sympos = pos('*',lookstr)
          if sympos > 0 then do
            conns = conns chkid","sympos+lbound
          end
        end
        if i < file.0 then do
          /* look next line */
          chkid = i + 1
          lookstr = substr(file.chkid,lbound,rbound)
          sympos = pos('*',lookstr)
          if sympos > 0 then conns = conns   chkid","sympos+lbound
        end
        /* look same line */
        lookstr = substr(file.i,lbound,rbound)
        sympos = pos('*',lookstr)
        if sympos > 0     then conns = conns   i","sympos +lbound
        say bnum "->" conns
        conns = strip(conns)
        parse var conns l","p
        gears.l.p = gears.l.p bnum
        bnum = ''
        if pos(l","p, gearlist) = 0 then
          gearlist = gearlist l","p
      end
    end
  end
end


say gearlist
do gindex = 1 to words(gearlist)
  gloc = word(gearlist,gindex)
  parse var gloc l","p
  say gloc "-->" gears.l.p
  if words(gears.l.p) = 2 then
    p2 = p2 + (word(gears.l.p,1) * word(gears.l.p,2))
end
say "Part 2:" p2
