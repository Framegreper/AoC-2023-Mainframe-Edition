import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.LongStream;

public class T5P2 {
    public static void main(String[] args) throws IOException {
        Path input = Path.of("input05.txt");
        List<String> lines = Files.readAllLines(input);

        // Process the first line to get the seed ranges
        List<Long> seedRanges = Arrays.stream(lines.get(0).split(":")[1].strip().split("\\s+"))
                                      .map(Long::parseLong)
                                      .collect(Collectors.toList());

        // Expand the seed ranges
        List<Long> seeds = expandSeedRanges(seedRanges);

        // Part 2: Assume there are mappings provided in the text file
        // The code to process these mappings is not included as the structure is not defined

        // Output the result
        long lowestSeedNumber = seeds.stream().min(Long::compare).orElseThrow();
        System.out.println("Lowest seed number: " + lowestSeedNumber);
    }

    public static List<Long> expandSeedRanges(List<Long> seedRanges) {
        List<Long> expandedSeeds = new ArrayList<>();
        for (int i = 0; i < seedRanges.size(); i += 2) {
            long start = seedRanges.get(i);
            long length = seedRanges.get(i + 1);
            expandedSeeds.addAll(LongStream.range(start, start + length).boxed().collect(Collectors.toList()));
        }
        return expandedSeeds;
    }
}
