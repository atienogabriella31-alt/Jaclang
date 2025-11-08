import random;
import from byllm.llm { Model }

# glob llm = Model(model_name="gpt-4o",verbose=False);
 glob llm = Model(model_name="gemini/gemini-2.0-flash", verbose=False);

"""Provide a fun hint if guess is incorrect"""
def guess_color(color1: int, color2: int) -> str by llm();

walker GuessColor {
    has color: int;

    can start with root entry {
        self.color = random.randint(1, 10);
        print("I have selected a color between 1 and 10. Can you guess it?");
        self: turn;
    }
}

node turn {
    has color: int = random.randint(1, 10);
}

# Will run when in CLI mode (not in cloud)
 with entry:__main__ {
    # Temporary test: call guess_color with concrete numbers and print the stub response
    print( guess_color(3, 7) );
    root spawn GuessColor(6);
}