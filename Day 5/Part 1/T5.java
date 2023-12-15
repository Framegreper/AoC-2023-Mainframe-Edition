import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

public class T5 {

    public static void main(String[] args) throws IOException {
        var input = Path.of("input05.txt");
        var lines = Files.readAllLines(input);

        var seeds = new ArrayList<>(Arrays.stream(lines.get(0).split(":")[1].strip().split(" "))
                .map(Long::parseLong)
                .toList());

        var queue = new ArrayDeque<>(lines);
        queue.poll(); // we don't need the seeds
        while (!queue.isEmpty()) {
            var line = queue.pop();

            if (!line.isBlank()) continue;
            queue.pop(); // we don't need the name

            var maps = new ArrayList<long[]>();
            while (!queue.isEmpty() && !queue.peek().isBlank()) {
                maps.add(Arrays.stream(queue.pop().split(" "))
                        .mapToLong(Long::parseLong)
                        .toArray()
                );
            }

            // Part 1
            for (int i = 0; i < seeds.size(); i++) {
                var seed = seeds.get(i);
                var mapped = maps.stream()
                        .filter(m -> m[1] <= seed && seed <= m[1] + m[2] - 1)
                        .findFirst()
                        .map(m -> (seed - m[1]) + m[0])
                        .orElse(seed);
                seeds.set(i, mapped);
            }
        }
        System.out.println("Part 1: " + Collections.min(seeds));

    }

}