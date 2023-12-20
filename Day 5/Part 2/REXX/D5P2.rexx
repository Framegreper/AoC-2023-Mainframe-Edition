/* REXX */
say "Advent of Code 2023 day 5"

x ="bpxwunix 'cat /z/z35259/AoC23Input/input5.txt' ,,file.,se."
NUMERIC DIGITS 15

/* first get our seeds */
seeds. = ''
lsl = 999999999999999999999999999999


parse var file.1 "seeds:" seedranges

/* then parse the transformations */
formulas. = ''
formulas.0 = 0
fidx = 0

do i = 2 to file.0
    if file.i = '' then do
        /* blank line */
        fidx = fidx + 1
        formulas.0 = formulas.0 + 1
        i = i + 1 /* skip over the 'x-to-y map:' line */
    end
    else do
        /* formula information */
        formulas.fidx = translate(file.i,',',' ')
    end
end

/* what do the formulas do? +x or -x */
faction. = ''
range. = ''
do f = 1 to formulas.0
    if formulas.f = '' then iterate
    do fr = 1 to words(formulas.f)
        fdata = word(formulas.f,fr)
        parse var fdata dval","sval","rval
        delta = dval - sval
        faction.f.fr = delta
        range.f.fr.min = sval
        range.f.fr.max = sval + rval
        say "Formula" f "rule" fr "does" delta sval "-" sval + rval
    end
    faction.f.0 = words(formulas.f)
    say faction.f.0 "rules for formula" f
end

do r = 1 to words(seedranges) by 2
    s1 = word(seedranges,r)
    srange1 = word(seedranges,r+1)
    minmax.1 = s1
    minmax.2 = s1 + srange1 - 1
    minmax.0 = 2
    do i = minmax.1 to minmax.2
        if i // 100  = 0 then do
            say TIME() i - minmax.1 "processed"
            say "lowest" lsl
        end
        location = i
        do f = 1 to formulas.0
            if formulas.f = '' then iterate
            do r = 1 to faction.f.0
                if location >  range.f.r.max then iterate
                if location <  range.f.r.min then iterate
                location = location + faction.f.r
                leave
            end
        end
        if location < lsl then do
            lsl = location
            say TIME() "New Low ->" lsl
        end
    end
end

say "Part 2: Lowest Seed Location:" lsl
exit
