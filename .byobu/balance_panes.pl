#!/usr/bin/perl
use 5.10.1;
use strict;
use warnings;

=pod

=head1 balance_panes.pl [DRLU]

Cycle through the panes in the currently active window
in the direction given, and balance them evenly.

Gotcha: If you have panes like so:

(x denotes the currently active pane)

    .-.-.-.-.
    | |x|a| |
    | | |---|
    | | |b  |
    `-^-^---'

and "balance_panes.pl -R", it depends on wheter you last were in a or b.

If you were in a, it will cycle x->a->second mini-pane->left pane.
Equals to 4 panes, making them all same size.
Resulting in b being twice as fat as the others.

If you were in b, it will cycle x->b->left window.
Equals to 3 panes, making them all the same size.
Resulting in a and the other mini-pane taking only half the size of the other panes.

Note to self. If I ever feeled bored, I could analyze the output of "list-windows" and find some clever way to balance based on that information.

=cut

#~ engelberg:keybindings$ tmux list-windows |grep active
#~ 7: byobu2* (5 panes) [239x70] [layout 66bf,239x70,0,0{119x70,0,0[119x35,0,0,120,119x34,0,36{59x34,0,36,129,59x34,60,36,130}],49x70,120,0,123,69x70,170,0,127}] @42 (active)

#~ 7: byobu2*
#~ (5 panes)
#~ [239x70]
#~ [
#~     layout 66bf,

#~     239x70,0,0
#~     {
#~         119x70,0,0
#~         [
#~             119x35,0,0,120,
#~             119x34,0,36
#~             {
#~                 59x34,0,36,129,
#~                 59x34,60,36,130
#~             }
#~         ],
#~         49x70,120,0,123,
#~         69x70,170,0,127
#~     }
#~ ]

#~ @42 (active)




#~ engelberg:keybindings$ tmux list-panes
#~ 1: [59x34] [history 0/10000, 0 bytes] %129
#~ 2: [59x34] [history 0/10000, 0 bytes] %130
#~ 3: [49x70] [history 16/10000, 8194 bytes] %123 (active)
#~ 4: [69x70] [history 0/10000, 0 bytes] %127

my $direction = $ARGV[0] // die "usage: '$0 [RLUD]'";

my $num_panes = num_panes();

my $new_pane_width = int (window_width() / $num_panes);

balance_panes();

sub active_pane{
    for my $line (split /\n/, `tmux list-panes`){
        return $1 if ($line =~ /^(\d+):.+active/)
    }
}

sub balance_panes{
    my $active_pane = active_pane();
    my $p = $active_pane;
    my $active_pane_found = 0;
    my $num_panes = 1;
    my %dir_map = (
        R => 'x',
        L => 'x',
        U => 'y',
        D => 'y',
    );
    while(){
        `tmux select-pane -$direction -t $p`;
        $p = active_pane();
        `tmux resize-pane -t $p -$dir_map{$direction} $new_pane_width`;
        $active_pane_found++ if $p == $active_pane;
        last if $active_pane_found == 2;
        $num_panes++;
        # be sure to never lock us in..
        last if $num_panes > 20;
    }
}

sub num_panes{
    my $active_pane = active_pane();
    my $p = $active_pane;
    my $num_panes=1;
    while (){
        `tmux select-pane -$direction -t $p`;
        $p = active_pane();
        last if $p == $active_pane;
        $num_panes++;
        # be sure to never lock us in..
        last if $num_panes > 10;
    }
    return $num_panes;
}

sub window_width{
    my $output = `tmux list-windows |grep active`;
    $output =~ /\[(\d+)x(\d+)\]/;
    return $1;
}
