/* REXX */
say "Advent of Code 2023 day 3"
x = bpxwunix('cat /z/z35259/AoC23Input/input3.txt',,file.,se.)

partnumsum = 0
/* Example input */

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
    file.i = translate(file.i,'#',c)
  end
end

partnums = ""

do i = 1 to file.0
  bnum = ''
  do j =1 to length(file.i)
    c = substr(file.i,j,1)
    if datatype(c) = 'NUM'
    then bnum = bnum || c
    if datatype(c) ^= 'NUM' |  j = length(file.i) then do
      ok = 0                            /* gotta have symbol first */
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
          sympos = pos('#',lookstr)
          if sympos > 0 then ok = 1
        end
        if i < file.0 then do
          /* look next line */
          chkid = i + 1
          lookstr = substr(file.chkid,lbound,rbound)
          sympos = pos('#',lookstr)
          if sympos > 0 then ok = 1
        end
        /* look same line */
        lookstr = substr(file.i,lbound,rbound)
        if  bnum = 169 then
        say "Sameline check" lookstr
        sympos = pos('#',lookstr)
        if sympos > 0     then ok = 1
        if ok = 1 then partnums = partnums" "bnum
        bnum = ''
      end
    end
  end
end

say "partnums="partnums
p1 = 0
do i = 1 to words(partnums)
  p1 = p1 + word(partnums,i)
end
say "Part One: "p1
