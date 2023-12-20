import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.HashSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
public class T6P1 {
    


    private static final Pattern DIGIT_PATTERN = Pattern.compile("\\d+");

    public static void main(String[] args) throws IOException {
        var input = Path.of("input06.txt");
        var lines = Files.readString(input).split("\r\n");

        // Part 1
        var races = new HashSet<Race>();
        Matcher tempo = DIGIT_PATTERN.matcher(lines[0]),
                distance = DIGIT_PATTERN.matcher(lines[1]);
        while (tempo.find() && distance.find()) {
            races.add(new Race(Long.parseLong(tempo.group()), Long.parseLong(distance.group())));
        }

        var sum1 = races.stream()
                .map(race -> {
                    var waysToWin = 0;
                    for (int i = 0; i < race.time; i++)
                        if (i * (race.time - i) > race.distance)
                            waysToWin++;
                    return waysToWin;
                })
                .reduce(1, (a, b) -> a * b);
        System.out.println("Part 1: " + sum1);

        // Part 2
        var race = new Race(
                Long.parseLong(lines[0].split(":")[1].replaceAll(" +", "")),
                Long.parseLong(lines[1].split(":")[1].replaceAll(" +", ""))
        );

        var sum2 = 0;
        for (long i = 0; i < race.time; i++) {
            if (i * (race.time - i) > race.distance)
                sum2++;
        }
        System.out.println("Part 2: " + sum2);
    }

    record Race(long time, long distance) { }

}
    

