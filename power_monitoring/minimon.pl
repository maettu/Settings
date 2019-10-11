#!/usr/bin/perl

=head1 minimon.pl - monitor some power usage related values

Monitor some values with regard to energy consumption / heat / fan.
Where possible without root, use tlp for data collection.
Since tlp should run pretty much everywhere, that is considered favourable.

tlp-stat -b runs fine without root on my laptop, but I guess there will be good
reasons it requires root. Therefore, get battery information directly from /sys/class.

The script prints the values every 10 seconds.

It does not take any parameters.

=cut

use 5.10.1;
use strict; use warnings;

my $current_now = try_files(
    '/sys/class/power_supply/BAT0/current_now',
    '/sys/class/power_supply/BAT0/power_now',
);


while (1){
    my ($sec, $min, $h, $day, $mon, $year) = localtime (time);
    $year +=1900;
    $mon++;
    my $current = `cat $current_now`;
    my $voltage = `cat /sys/class/power_supply/BAT0/voltage_now`;
    my $bat_percentage = `cat /sys/class/power_supply/BAT0/capacity`;
    my $bat_status = `cat /sys/class/power_supply/BAT0/status`;
    chomp ($bat_percentage);

    my $stat = `tlp-stat -s`; # works without root
    $stat =~ /Mode.+= (\w+)/m;
    my $tlp_mode = $1;

    my $temp = `tlp-stat -t`; # Too lazy to search in /sys/
    $temp =~ /CPU temp.+=\s+(\d+)/;
    my $cpu_temp = $1;
    $temp =~ /.+\n.+fan1.+=\s+(\d+).+\n.+fan2.+=\s+(\d+)/m;
    my $fan1 = $2 // 'not available';
    my $fan2 = $3 // 'not available';

    say "cpu_temp: $cpu_temp";

    # todo figure ourt current measuring unit
    $current = $current / 10000000;
    $voltage = $voltage / 1000000;
    my $watt = $current*$voltage; # good enough for me
    printf "%2.2d-%2.2d-%2.2d %2.2d:%2.2d:%2.2d  ",
            $year, $mon, $day, $h, $min, $sec;

    printf "%.1f%% %.3s  %5.2fA %5.2fV  %6.3fW  tlp: %.3s  ",
            $bat_percentage, $bat_status, $current,$voltage, $watt, $tlp_mode;

    say "⚀ $cpu_temp° ❋ $fan1 ❋ $fan2";
    sleep 10;
}

sub try_files {
    for my $file (@_) {
        return $file if -f $file
    }
}
