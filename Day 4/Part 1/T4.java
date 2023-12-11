import java.util.HashSet;
import java.util.Set;
public class T4 {

    public static void main(String[] args) {
        // Input of scratch cards. Replace these values with the actual input.
        String[] scratchcards = {
            "41 48 83 86 17 | 83 86  6 31 17  9 48 53",
            "13 32 20 16 61 | 61 30 68 82 17 32 24 19",
            " 1 21 53 59 44 | 69 82 63 72 16 21 14  1",
            "41 92 73 84 69 | 59 84 76 51 58  5 54 83",
            "87 83 26 28 32 | 88 30 70 12 93 22 82 36",
            "31 18 13 56 72 | 74 77 10 23 35 67 36 11"
        };

        int totalPoints = calculateTotalPoints(scratchcards);
        System.out.println("Total points for the scratchcards: " + totalPoints);
    }

    private static int calculateTotalPoints(String[] scratchcards) {
        int totalPoints = 0;
        for (String card : scratchcards) {
            totalPoints += calculateCardPoints(card);
        }
        return totalPoints;
    }

    private static int calculateCardPoints(String card) {
        String[] parts = card.split(" \\| ");
        String[] winningNumbers = parts[0].trim().split("\\s+");
        String[] yourNumbers = parts[1].trim().split("\\s+");
        
        // Convert the winning numbers to a HashSet for fast lookup.
        Set<String> winningNumbersSet = new HashSet<>();
        for (String number : winningNumbers) {
            winningNumbersSet.add(number);
        }

        int points = 0;
        int currentPoints = 1;
        for (String number : yourNumbers) {
            if (winningNumbersSet.contains(number)) {
                points += currentPoints;
                currentPoints *= 2;  // Double the value for each consecutive match.
            }
        }
        return points;
    }
}

