
import java.util.Scanner;
import java.util.Random;

public class NumberGuessingGame {

    public static void main(String[] args) {
        System.out.println("Welcome to the Number Guessing Game!");

        Scanner scanner = new Scanner(System.in);
        Random random = new Random();

        int roundsPlayed = 0;
        int roundsWon = 0;
        String playAgain;

        do {
            System.out.println("\nStarting a new round...");
            roundsPlayed++;

            // Generate a random number between 1 and 100
            int randomNumber = random.nextInt(100) + 1;
            int attemptsLeft = 5;

            System.out.println("Guess the number (between 1 and 100). You have 5 attempts.");

            boolean guessedCorrectly = false;
            while (attemptsLeft > 0) {
                System.out.print("Enter your guess (Attempts left: " + attemptsLeft + "): ");

                try {
                    int guess = scanner.nextInt();

                    // Compare the guess with the random number
                    if (guess == randomNumber) {
                        System.out.println("Congratulations! You guessed the correct number!");
                        roundsWon++;
                        guessedCorrectly = true;
                        break;
                    } else if (guess < randomNumber) {
                        System.out.println("Too low. Try again.");
                    } else {
                        System.out.println("Too high. Try again.");
                    }

                    attemptsLeft--;
                } catch (Exception e) {
                    System.out.println("Invalid input! Please enter a valid number.");
                    scanner.next(); // Clear the invalid input
                }
            }

            // Check if the user ran out of attempts
            if (!guessedCorrectly) {
                System.out.println("Out of attempts! The correct number was " + randomNumber + ".");
            }

            // Ask the user if they want to play another round
            System.out.print("Do you want to play another round? (yes/no): ");
            playAgain = scanner.next().trim().toLowerCase();

        } while (playAgain.equals("yes"));

        // Display the user's score
        System.out.println("\nGame over!");
        System.out.println("You played " + roundsPlayed + " round(s) and won " + roundsWon + " round(s).\nThanks for playing!");

        scanner.close();
    }
}

