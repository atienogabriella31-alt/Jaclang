"""A Number Guessing Game"""
import random;


obj Game {
    has attempts: int, won: bool = False;

    def play;
}


obj GuessTheNumberGame (Game) {
    has correct_number: int = random.randint(1, 10);

    def init() {
        self.attempts = 0;
    }

    override def play() {
        print("Welcome to Guess The Number!\n");
        print("I'm thinking of a number between 1 and 10. You have 5 attempts.\n");
        while (not self.won and self.attempts < 5) {
            print("Enter your guess: ");
            # read a line from stdin and trim
            inp = input();
            guess = int(inp);
            self.process_guess(guess);
            if (not self.won and self.attempts < 5) {
                print("Attempts used: "+str(self.attempts)+"\n");
            }
        }

        if (self.won) {
            print("Congratulations — you guessed it in "+str(self.attempts)+" attempts!\n");
        } else {
            print("Sorry, you ran out of attempts. The number was "+str(self.correct_number)+".\n");
        }
    }

    def process_guess(guess: int) {
        self.attempts = self.attempts + 1;
        if (guess == self.correct_number) {
            print("That's correct!\n");
            self.won = True;
        } elif (guess < self.correct_number) {
            print("Too low.\n");
        } else {
            print("Too high.\n");
        }
    }
}

# Run the game
 with entry {
    game = GuessTheNumberGame();
    game.play();
}
 