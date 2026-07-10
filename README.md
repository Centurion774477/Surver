# Surver

I realized that there are plenty of web frameworks and plenty of mobile/desktop app frameworks, but no such thing exists for CLIs.
Nothing exists that takes the light-weight of CLIs, streamlines the boring parts like input validation, confirming (y/n), etc; and mixes in a couple of nice-to-have features.
This is why I started designing Surver.

The name is a portmanteau of Big Sur, California; and a restaurant Server.
Surver exists to make attractive CLIs quickly and easily, without wrangling multiple libraries and their own conventions.

When designing the first edition of Surver, my mind was mostly on the part I dislike most about CLIs: the boilerplate for getting user input--
and checking it against something as simple as 'y/n'.

Even in Perl, the implementation of that would look like this:
```
chomp(my $input = lc(<STDIN>));
if ($input eq 'y') {
doIfTrue();
} else {
doOtherwise();
}
```
But with Surver, it looks like this:
```
if (poke("yes or no?") == 1) {
respondToYes();
} else {
respondToAnything();
}
```
Granted its actually a two line deficit --but this style is on the brink of magic, and I'm saving the magic for the next release.

Allow me to explain what poke actually does, along with all the other (similar) functions:
you argue a string to print, and poke will show that string to the user, get their input, and return 1 for yes and 0 for no. That being said, this can be used in if statements:
```
say 'you said yes!' if poke("Will you say yes?");
```

If you need to ask your user an important yes or no question, where a 'no' will result in halting the execution, use 'brutal':
```
brutal();
```
Brutal will grab the input, and if it isn't 'y', then it will kill the program with a "brutal" message (the message assumes an error)
It's worth remembering that you need to show the user a string before using brutal --technically you don't have to, but it would be weird.

If you want to halt execution on a no statement, but your case isn't an error --such as asking the user if they want to exit the program-- use brute:
```
brute();
```
It's the same thing as brutal(); --but with a friendly error message. It would be weird to use this for errors, and it would be weird to use brutal(); for graceful shutdowns.


