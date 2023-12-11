import java.io.File;
import java.io.FileNotFoundException;
import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;

public class T4P1 {
    public static void main(String[] args) {
        String filePath = "input04.txt";
        try {
            File inputFile = new File(filePath);
            Scanner scanner = new Scanner(inputFile);
            int totalPoints = 0;

            while (scanner.hasNextLine()) {
                String line = scanner.nextLine().trim();
                // Ignorieren von leeren Zeilen und Zeilen, die nicht wie erwartet formatiert sind
                if (!line.isEmpty() && line.contains(" | ")) {
                    totalPoints += calculatePointsOfCard(line);
                }
            }

            scanner.close();
            System.out.println("Total points: " + totalPoints);
        } catch (FileNotFoundException e) {
            System.out.println("File not found: " + filePath);
            e.printStackTrace();
        }
    }

    private static int calculatePointsOfCard(String card) {
        String[] parts = card.split(" \\| ");
        String[] winningNumbersStr = parts[0].trim().split("\\s+");
        String[] yourNumbersStr = parts[1].trim().split("\\s+");
        
        Set<String> winningNumbers = new HashSet<>();
        for (String number : winningNumbersStr) {
            winningNumbers.add(number);
        }

        int points = 0;
        for (String number : yourNumbersStr) {
            if (winningNumbers.contains(number)) {
                if (points == 0) {
                    points = 1;
                } else {
                    points *= 2;
                }
            }
        }
        
        return points;
    }
}