import java.io.*;
import java.util.*;
import java.nio.file.*;

public class T4P2 {

    static class Scratchcard {
        int[] numbers;
        int[] winningNumbers;
    
        Scratchcard(String cardInfo) {
            String[] parts = cardInfo.split("\\|");
            
            // Entfernen von Text vor den Zahlen und Trimmen der Leerzeichen
            String numbersPart = parts[0].replaceAll("[^\\d ]", "").trim();
            String winningNumbersPart = parts[1].replaceAll("[^\\d ]", "").trim();
    
            numbers = Arrays.stream(numbersPart.split("\\s+")).mapToInt(Integer::parseInt).toArray();
            winningNumbers = Arrays.stream(winningNumbersPart.split("\\s+")).mapToInt(Integer::parseInt).toArray();
        }
    

        int countMatches() {
            Set<Integer> numberSet = new HashSet<>();
            for (int number : numbers) {
                numberSet.add(number);
            }

            int matches = 0;
            for (int winningNumber : winningNumbers) {
                if (numberSet.contains(winningNumber)) {
                    matches++;
                }
            }
            return matches;
        }
    }

    public static void main(String[] args) {
        try {
            List<Scratchcard> cards = readScratchcardsFromFile("input0402.txt");
            int totalCards = processCards(cards);
            System.out.println("Total scratchcards: " + totalCards);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    static List<Scratchcard> readScratchcardsFromFile(String filename) throws IOException {
        List<Scratchcard> scratchcards = new ArrayList<>();
        List<String> lines = Files.readAllLines(Paths.get(filename));

        for (String line : lines) {
            if (!line.trim().isEmpty()) {
                scratchcards.add(new Scratchcard(line));
            }
        }

        return scratchcards;
    }

    static int processCards(List<Scratchcard> scratchcards) {
        int totalCards = scratchcards.size(); // Startwert entspricht der Anzahl der Original-Karten
        int[] cardCopies = new int[scratchcards.size()]; // Speichert die Anzahl der Kopien für jede Karte

        // Initiale Kopienanzahl für jede Karte ist 1 (die Karte selbst)
        Arrays.fill(cardCopies, 1);

        // Gehe durch jede Karte und verarbeite sie
        for (int i = 0; i < scratchcards.size(); i++) {
            Scratchcard card = scratchcards.get(i);
            int matches = card.countMatches();

            // Verarbeite nur, wenn es Übereinstimmungen gibt
            if (matches > 0) {
                // Füge Kopien hinzu für die nächsten 'matches' Karten, basierend auf der Anzahl der Kopien dieser Karte
                for (int j = i + 1; j <= i + matches && j < scratchcards.size(); j++) {
                    cardCopies[j] += cardCopies[i];
                    totalCards += cardCopies[i]; // Inkrementiere die Gesamtzahl der Karten
                }
            }
        }
        return totalCards;
    }
}