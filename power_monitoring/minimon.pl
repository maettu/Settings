#!/usr/bin/perl
use 5.10.1;
use strict; use warnings;

while (1){
    my ($sec, $min, $h, $day, $mon, $year) = localtime (time);
    $year +=1900;
    $mon++;
    my $current = `cat /sys/class/power_supply/BAT0/current_now`;
    my $voltage = `cat /sys/class/power_supply/BAT0/voltage_now`;
    my $bat_percentage = `cat /sys/class/power_supply/BAT0/capacity`;
    my $bat_status = `cat /sys/class/power_supply/BAT0/status`;
    chomp ($bat_percentage);

    my $stat = `pkexec tlp stat -s`;
    $stat =~ /Mode.+= (\w+)/m;
    my $tlp_mode = $1;

    my $temp = `pkexec tlp stat -t`; # Too lazy to search in /sys/
    $temp =~ /CPU temp.+=\s+(\d+).+\n.+fan1.+=\s+(\d+).+\n.+fan2.+=\s+(\d+)/m;
    my $cpu_temp = $1;
    my $fan1 = $2;
    my $fan2 = $3;

    $current = $current / 1000000;
    $voltage = $voltage / 1000000;
    my $watt = $current*$voltage; # good enough for me
    printf "%2.2d-%2.2d-%2s %2.2d:%2.2d:%2.2d ",
            $year, $mon, $day, $h, $min, $sec;

    printf "%.1f%% %.3s %6.3fA %6.3fV %6.3fW tlp: %.3s ",
            $bat_percentage, $bat_status, $current,$voltage, $watt, $tlp_mode;

    say "cpu: $cpu_temp° fan1: $fan1 fan2: $fan2";
    sleep 10;
}
