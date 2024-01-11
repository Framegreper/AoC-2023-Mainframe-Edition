/* REXX */
/* Input and attributes*/

/* Invokes a Unix System Services command to read the content of a file into an array 'file.' and stores the return code in 'x'. */
x = bpxwunix('cat /z/z35259/AoC23Input/input2.txt',,file.,se.)

/* loadout of bag */
/* The variables red, green, and blue are initialized with integer values, possibly representing the number of corresponding items in a bag. */
red = 12
green = 13
blue = 14

/* Initializes the variables 'possibilities' and 'sumpow' to empty and 0, respectively. */
possibilities =
sumpow = 0

/*Main loop */
do line over input
 /* Changes underscores to spaces in each line of input, prints that line, and extracts the game number into the 'game' variable and the remaining part into 'rest'. */
  line = translate(line,'_', ' ')
  say line
  parse var line "Game_"game":" rest


/* all game data is in 'rest' */
/* Initializes local variables for keeping track of the largest number of green, red, and blue items. */
  lg = 0
  lr = 0
  lb = 0

/* Replaces spaces with semicolons in the 'rest' string for further processing. */
  rest = translate(rest,' ',';')

 /* Loops through each 'word' in 'rest', treating each set of items as a separate word (presumably due to the translation to semicolons). */
  do set = 1 to words(rest)

/* Translates the current set of items, replacing spaces with commas, and counts the number of items in the set. */
    cubedata = translate(word(rest,set),' ',',')
    cubes = words(cubedata)

/* Loops through each item in the current set, parsing out the number and color of cubes. */
    do cube = 1 to cubes
      cd =word(cubedata,cube)
      parse var cd  "_"amount"_"color

/* Compares the amount of each color to the current maximum and updates the maximum if larger. */
      if color = 'red' & amount > lr  then lr = amount
      if color = 'green' & amount > lg then lg = amount
      if color = 'blue' & amount > lb then lb = amount
    end
  end
/* Calculates the product of the maximum amounts of red, green, and blue items, and adds it to 'sumpow'. */
  pow3 = lg * lr * lb
  sumpow = sumpow + pow3
/* Ends the main loop. */
end


/* solution of Task
* Prints the solution for part 1 of the task, though 'possibilities' is not being updated in the loop, so the output might not be meaningfully interpreted. */
part_1:
say 'Sum of IDs for possible games:' possibilities
/* Prints the calculated sum of powers (products of the max amounts of red, green, and blue items) as the solution for part 2 of the task. */
part_2:
say sumpow
