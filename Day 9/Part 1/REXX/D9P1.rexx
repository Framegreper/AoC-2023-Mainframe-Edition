/* REXX */
say "Advent of Code 2023 day 9"

filename = "/z/z35259/AoC23Input/input9.txt"
line. = ''
lineNum = 0

/* Read the file into the line. stem variable */
'EXECIO * DISKR' filename '(FINIS STEM line. F' lineNum
do i = 1 to lineNum
    input.i = line.i
end
input.0 = lineNum

numeric digits 31

answer = 0
do i = 1 to input.0
   series.0 = 1
   k = 1
   series.k = input.i
   do forever
      previous = series.k
      k = k + 1
      series.k = difference(previous)
      number = lowest(series.k)
      if number <> -1 then do
         do z = k - 1 to 1 by -1
            new_number = word(series.z,words(series.z)) + number
            series.z = series.z||' '||new_number
            number = new_number
         end
         answer = answer + number
         leave
      end
   end
end
say answer
exit

lowest: procedure
arg input
do while input <> ""
   parse var input first second input
   if second = "" then return first
   if first <> second then return -1
end
return first

difference: procedure
arg input
k = 0
do while input <> ""
   k = k + 1
   parse var input number.k input
end
number.0 = k
output = ""
do i = 1 to number.0 - 1
   k = i + 1
   output = output||number.k - number.i||' '
end
return output
