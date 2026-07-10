#!/usr/bin/perl

package Surver;
use strict; use warnings;
use Term::ANSIColor;
use Exporter 'import';
use feature 'say';

our @EXPORT_OK = qw(poke pilfer steal brutal brute shriek party shout voice scram interrogate magic);

# argue the string to ask the user
sub poke {
    my $toPrint = shift; $toPrint .= 'Y/N' unless lc($toPrint) =~ /y\/n/i; # if $toPrint has the y/n
    say $toPrint;
    chomp(my $input = lc(<STDIN>));
    if ($input eq 'y') {
        return 1;
    }
    return 0; # poke returns 0 unless the input is 'y'
}

# argue any amount of accepted words
# returns false unless the input is in arguments
# it would be weird to call pilfer showing the user a message first
sub pilfer {
    my $pilferError = ""
    my @arguments = @_;
    chomp(my $input = <STDIN>);
    grep {$_ eq $input} @arguments or die $pilferError;
    return $input;
}

# just like pilfer, but the last argument is used if the input doesn't match the other options
sub steal {
    my @arguments = @_;
    my $lastResort = @arguments[-1];
    chomp(my $input = <STDIN>);
    $input = $lastResort unless grep {lc($_) eq lc($input)} @arguments;
    return $input;
}

# since its so vague, heres the difference between pilfer and steal:
# pilfer will check the input for every argument, and will fail the program if the input isnt recognized
# steal will just assign the input to the default value (last argument) unless its one of the recognized values.


# no arguments
sub brutal {
    my $brutalMessage = "Fail: when given a Y/N block user chose N.\n";
    say 'Approve: Y/N';
    chomp(my $input = lc(<STDIN>));
    $input eq 'y' or die $brutalMessage;
}

sub brute {
    my $lessBrutalMessage = "Understood. Ending program. Enjoy your day\n";
    say 'Approve: Y/N';
    chomp(my $input = lc(<STDIN>));
    $input eq 'y' or die $lessBrutalMessage;
}



# CUSTOM PRINTS:
sub shriek {
    my $string = '! ' . shift;
    say colored($string, "bold red");
}

sub party {
    my $string = '✓ ' . shift;
    say colored($string, "bold green");
}

sub shout {
    my $string = shift;
    say $string;
}

# voice adds three newlines before and after the statement
sub voice {
    my $string = shift;
    say "\n\n\n " . $string . " \n\n\n";
}

sub scram {
    my $string = '✕ ' . shift;
    say colored(uc($string), "bold red");
    exit 1;
}


# argue the possible choices
sub interrogate {
    my $possibleChoices = @_;
    my $iterations = 0;
    do {
        $iterations++;
        chomp(my $input = <STDIN>);
        last if grep {$_ eq $input} @{$possibleChoices};
        say "Fail: the given input is not recognized.";
        say "attempt 10: You have exhausted half of the attempts (10/20)" if $iterations == 10;
        die 'Failed to give a valid input' if $iterations == 20;
    } while (1);
}

sub magic {
    for (1..100) {
        say "YOU DIDN'T SAY THE MAGIC WORD!";
    }
}

1;