/* REXX */
say "Advent of Code 2023 day 2"
x = bpxwunix('cat /z/z35259/AoC23Input/input2.txt',,file.,se.)

/*
file.1 = 'Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green'
file.0 = 1
*/
sumpow = 0

do i = 1 to file.0
  file.i = translate(file.i,'_', ' ')
  parse var file.i "Game_"game":" rest
  /* all game data is in 'rest' */
  lg = 0
  lr = 0
  lb = 0
  rest = translate(rest,' ',';')
  do set = 1 to words(rest)
    /* Another set-> _1_red,_2_green,_6_blue */
    cubedata = translate(word(rest,set),' ',',')
    cubes = words(cubedata)
    do cube = 1 to cubes
      cd =word(cubedata,cube)
      parse var cd  "_"amount"_"color
      if color = 'red' & amount > lr  then lr = amount
      if color = 'green' & amount > lg then lg = amount
      if color = 'blue' & amount > lb then lb = amount
    end
  end
  pow3 = lg * lr * lb
  sumpow = sumpow + pow3
end

say "Part two: "sumpow
