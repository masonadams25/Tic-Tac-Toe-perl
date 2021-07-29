#!/usr/bin/perl -w

use strict;

#takes an array with nine spots and prints out a board
sub print_board {
        my @board = @_;
        print "$board[0] | $board[1] | $board[2]\n";
        print "$board[3] | $board[4] | $board[5]\n";
        print "$board[6] | $board[7] | $board[8]\n";
}

sub inline_check {
        my $a = $_[0];
        my $b = $_[1];
        my $c = $_[2];

        if($a eq $b) {
                if($a eq $c) {
                        if($a eq "X") {
                                print "X has won!!!\n";
                                last;
                        } else {
                                print "O has won!!!\n";
                                last;
                        }
                }
        }
}

sub win_check {
        my @board = @_;
        inline_check($board[0], $board[1], $board[2]);
        inline_check($board[3], $board[4], $board[5]);
        inline_check($board[6], $board[7], $board[8]);

        inline_check($board[0], $board[3], $board[6]);
        inline_check($board[1], $board[4], $board[7]);
        inline_check($board[2], $board[5], $board[8]);

        inline_check($board[0], $board[4], $board[8]);
        inline_check($board[6], $board[4], $board[3]);
}


my @board = (0..8);

print_board (@board);

print "Enter X's move: ";
my $move = <STDIN>;

while($move != "-1") {
        $board[$move] = "X";

        print_board(@board);
        win_check(@board);

        print "Enter O's move: ";
        $move = <STDIN>;
        $board[$move] = "O";

        if($move == "-1") {
                last;
        }

        print_board(@board);
        win_check(@board);

        print "Enter X's move: ";
        $move = <STDIN>;
}
