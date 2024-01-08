/* REXX */
say "Advent of Code 2023 day 19"
x ="bpxwunix 'cat /z/z35259/AoC23Input/input19.txt' ,,file.,se."

/* Initialisierung der Stammvariablen für Workflows und Teile-Ratings */
workflows = .workflows.
parts_ratings = .parts_ratings.
rules = .rules.
total_accepted_rating = 0

/* Eingabedaten im file. Stem verarbeiten */
parseline = 1
do while parseline <= se.
    line = strip(file.parseline)
    if length(line) = 0 then /* Leerzeile trennt Workflows und Teile-Daten */
        leave
    if left(line, 1) = "{" then do /* Teile-Daten */
        parse var line "{" part_data "}"
        rating_data = strip(part_data)
        part_num = part_num + 1
        parts_ratings.part_num.rating_data = rating_data
    end
    else do /* Workflow-Regel */
        parse var line wf_name ' {' rule_data '}'
        rules.wf_name = rule_data
    end
    parseline = parseline + 1
end

/* Verarbeiten der Teile durch die Workflows */
do part_num = 1 to part_num
    ecur_wf = 'in' /* Start-Workflow ist 'in' */
    do forever
        cur_rules = rules.ecur_wf
        do rule_num = 1 to words(cur_rules)
            rule = word(cur_rules, rule_num)
            parse var rule condition ':' destination
            rating_data = parts_ratings.part_num.rating_data
            if condition = '' then do
                if destination = 'A' then do
                    calculate_total_rating(part_num)
                    leave
                end
                if destination = 'R' then leave
            end
            else if eval_rule_condition(rating_data, condition) then do
                if destination = 'A' then do
                    calculate_total_rating(part_num)
                    leave
                end
                if destination = 'R' then leave
                ecur_wf = destination /* Weiter zur nächsten Workflow-Regel */
                leave /* Ende der aktuellen Schleife */
            end
        end
        if ecur_wf = 'in' then leave /* Wenn in der gleichen Workflow bleibt, Te
    end
end

say "Total sum of accepted parts' ratings: " total_accepted_rating
exit

calculate_total_rating: procedure expose total_accepted_rating parts_ratings.
    parse arg part_num
    rating_data = parts_ratings.part_num.rating_data
    parse var rating_data 'x=' x ',m=' m ',a=' a ',s=' s
    total_accepted_rating = total_accepted_rating + x + m + a + s
    return

eval_rule_condition: procedure
    parse arg rating_data, condition
    op = condition[1] /* Erstes Zeichen (Operator) */
    threshold = condition[2:] /* Der Rest (Schwellenwert) */
    parse var rating_data 'x=' x ',m=' m ',a=' a ',s=' s

    select
        when op = 'x' then return x > threshold
        when op = 'm' then return m < threshold
        when op = 'a' then return a > threshold
        when op = 's' then return s < threshold
        otherwise return 0
    end
    return 0
