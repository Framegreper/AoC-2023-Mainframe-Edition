/* REXX */
say "Advent of Code 2023 day 15"
x = bpxwunix('cat /z/z35259/AoC23Input/input15.txt',,file.,se.)

NUMERIC DIGITS 31

x = bpxwunix(cmd,,file.,se.)

box. = ''

say "lets do" file.0 "things"

p2 = 0
do i = 1 to file.0
  boxnr = 0
  /* Determine the box nr... */
  label = ''
  do j = 1 to length(file.i)
    char = substr(file.i,j,1)
    if char = '-' | char = '=' then do
      /* this does not add to HASH determine box */
      leave
    end
    label = label || char
    ascii_code = e2a(char)
    boxnr = boxnr + ascii_code
    boxnr = boxnr * 17
    boxnr = boxnr // 256
  end
  if char = '-' then do
    boxpos = box.boxnr.label.position
    newlabels = ''
    do bb = 1 to words(box.boxnr.labels)
      if word(box.boxnr.labels,bb) = 0 then iterate
      if word(box.boxnr.labels,bb) <> label then
        newlabels = newlabels word(box.boxnr.labels,bb)
    end
    box.boxnr.labels = newlabels
  end
  if char = '=' then do
    /* is it in the box? ifso replace */
    fp = pos('=',file.i)
    focal_length = substr(file.i,fp+1)
    if wordpos(label,box.boxnr.labels) > 0 then do
      box.boxnr.label = focal_length
    end
    else do
      box.boxnr.label = focal_length
      box.boxnr.labels = box.boxnr.labels label
    end
  end
end

say "REPORT"
p2 = 0
do i = 0 to 255
  if box.i.labels = 0 | box.i.labels = '' then iterate
  say "Box" i box.i.labels
  do j = 1 to words(box.i.labels)
    bval = 1 + i
    label = word(box.i.labels,j)
    if label <> 0 then do
      focal_length = box.i.label
      bval = bval * j * focal_length
      say " -" label  focal_length bval
      p2 = p2 + bval
    end
  end
end

say "Part 2:" p2

exit

e2a: procedure
  /* need to do this:
  https://en.wikipedia.org/wiki/ASCII#Printable_characters
  used: https://www.ibm.com/docs/en/iis/11.3?topic=tables-ebcdic-ascii
  */
  parse arg char
if char = "!" then return 33
if char = '"' then return 34
if char = "#" then return 35
if char = "$" then return 36
if char = "%" then return 37
if char = "&" then return 38
if char = "'" then return 39
if char = "(" then return 40
if char = ")" then return 41
if char = "*" then return 42
if char = "+" then return 43
if char = "," then return 44
if char = "-" then return 45
if char = "." then return 46
if char = "/" then return 47
if char = "0" then return 48
if char = "1" then return 49
if char = "2" then return 50
if char = "3" then return 51
if char = "4" then return 52
if char = "5" then return 53
if char = "6" then return 54
if char = "7" then return 55
if char = "8" then return 56
if char = "9" then return 57
if char = ":" then return 58
if char = ";" then return 59
if char = "<" then return 60
if char = "=" then return 61
if char = ">" then return 62
if char = "?" then return 63
if char = "@" then return 64
if char = "A" then return 65
if char = "B" then return 66
if char = "C" then return 67
if char = "D" then return 68
if char = "E" then return 69
if char = "F" then return 70
if char = "G" then return 71
if char = "H" then return 72
if char = "I" then return 73
if char = "J" then return 74
if char = "K" then return 75
if char = "L" then return 76
if char = "M" then return 77
if char = "N" then return 78
if char = "O" then return 79
if char = "P" then return 80
if char = "Q" then return 81
if char = "R" then return 82
if char = "S" then return 83
if char = "T" then return 84
if char = "U" then return 85
if char = "V" then return 86
if char = "W" then return 87
if char = "X" then return 88
if char = "Y" then return 89
if char = "Z" then return 90
if char = "[" then return 91
if char = "\" then return 92
if char = "]" then return 93
if char = "^" then return 94
if char = "_" then return 95
if char = "`" then return 96
if char = "a" then return 97
if char = "b" then return 98
if char = "c" then return 99
if char = "d" then return 100
if char = "e" then return 101
if char = "f" then return 102
if char = "g" then return 103
if char = "h" then return 104
if char = "i" then return 105
if char = "j" then return 106
if char = "k" then return 107
if char = "l" then return 108
if char = "m" then return 109
if char = "n" then return 110
if char = "o" then return 111
if char = "p" then return 112
if char = "q" then return 113
if char = "r" then return 114
if char = "s" then return 115
if char = "t" then return 116
if char = "u" then return 117
if char = "v" then return 118
if char = "w" then return 119
if char = "x" then return 120
if char = "y" then return 121
if char = "z" then return 122
if char = "{" then return 123
if char = "Â¬" then return 124
if char = "}" then return 125
if char = "|" then return 126
