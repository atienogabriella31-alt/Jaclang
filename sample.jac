 """A Number Guessing Game"""

import random;

walker Shopping{
    has shoping_list: int;

    can start with `root entry;
    can process_guess with turn entry;
}

node turn {
    has shoping_list: int = random.randint(1, 10);
}

# Will run when in CLI mode (not in cloud)
 with entry:__main__ {
    root spawn shoping_list(3);
    root spawn shoping_list(4);
    root spawn shoping_list(5);
    root spawn shoping_list(6);
}
