/* REXX */
say "Advent of Code 2023 day 9"

filename = "/z/z35259/AoC23Input/input9.txt"
line. = ''
lineNum = 0

/* Read the file into the line. stem variable */
'EXECIO * DISKR' filename '(FINIS STEM line. F' lineNum
do i = 1 to lineNum
    invoer.i = line.i
end
invoer.0 = lineNum

numeric digits 31

antwoord = 0
do i = 1 to invoer.0
   reeks.0 = 1
   k = 1
   reeks.k = invoer.i
   do forever
      vorige = reeks.k
      k = k + 1
      reeks.k = verschil(vorige)
      getal = bottom(reeks.k)
      if getal <> -1 then do
         do z = k - 1 to 1 by -1
            nieuw_getal = word(reeks.z,words(reeks.z)) + getal
            reeks.z = reeks.z||' '||nieuw_getal
            getal = nieuw_getal
         end
         antwoord = antwoord + getal
         leave
      end
   end
end
say antwoord
exit

bottom: procedure
arg invoer
do while invoer <> ""
   parse var invoer eerste tweede invoer
   if tweede = "" then return eerste
   if eerste <> tweede then return -1
end
return eerste

verschil: procedure
arg invoer
k = 0
do while invoer <> ""
   k = k + 1
   parse var invoer getal.k invoer
end
getal.0 = k
uitvoer = ""
do i = 1 to getal.0 - 1
   k = i + 1
   uitvoer = uitvoer||getal.k - getal.i||' '
end
return uitvoer
