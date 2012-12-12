#!/usr/bin/perl -w
use v5.16;

my %groups;
my $groupname = "none";
my $output = "";

foreach (<>){
    chomp;
    
    if( /\s*#.*/ ){
        
    }elsif( /\[(.*)\]/){
        my @progs;
        $groupname = $1;
        $groups{$groupname} = \@progs;
    }elsif( /\s*(.*\w{1,}.*)\s*#*.*/ ){
        push @{$groups{$groupname}}, $1;
    }
}

$output .= "all: ";
foreach (keys %groups){
    $output .= "$_ ";
}


while (my ($key, $value) = each %groups){
    $output .= "\n\n";

    $output .= "$key : \n";
    $output .= "	pacman -S ";
    
    foreach (@{$value}){
        $output .= "$_ ";
    }
}

say $output;
