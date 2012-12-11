#!/usr/bin/perl -w
use v5.16;
require "../.header/perl.pl";

sub existRepoCK{
    my $file = shift @_;
    
    if(-r $file){
        open (my $fh, " < ", $file);
        foreach(<$fh>){
            return 1 if /\[repo-ck\]/ ;
        }
        close $fh;
    }else{
        die "keine berechtigung zum lesen von $file";
    }
    
    return 0;
}

sub existPacmanKey{
    my $pacman_key = shift @_;
    
    my $output = `pacman-key --list-sigs $pacman_key`;
    
    foreach ($output){
        return 1 if /sig\s*$pacman_key\s*.*graysky.*/;
    }
    
    return 0;
}

## variables
my $i = 1;
my $conf = "/etc/pacman.conf";
my $pacman_key = "6176ED4B";
my @kernels = qw(
                linux-ck 
                linux-ck-atom 
                linux-ck-corex 
                linux-ck-kx 
                linux-ck-p4 
                linux-ck-pentm);


if(existRepoCK($conf)){
    say "[repo-ck] ist in $conf eingetragen";
}elsif(-w $conf){
    open(my $fh, " >> ", $conf);
    print $fh "[repo-ck]\n";
    print $fh "SigLevel = PackageRequired\n";
    print $fh "Server = http://repo-ck.com/\$arch\n";
    close $fh;
    say "[repo-ck] wurde in $conf geschrieben";
}else{
    die "no permission to write $conf";
}

unless(existPacmanKey($pacman_key)){
    if( isRoot() ){
        system("pacman-key -r 6176ED4B");
        system("pacman-key --lsign-key 6176ED4B");
    }elsif(progIsInstall("sudo")){
        system("sudo pacman-key -r 6176ED4B --noconfirm");
        system("sudo pacman-key --lsign-key 6176ED4B --noconfirm");
    }else{
        die "root was needed : pacman-key -r 6176ED4B";
    }
    
    say "pacman-key $pacman_key von graysky in der trustdb";
}

if( isRoot() ){
    system("pacman -Syy");
}elsif(progIsInstall("sudo")){
    system("sudo pacman -Syy");
}else{
    die "root was needed : pacman -Syy";
}


say "bitte wählen sie den passenden ck-kernel";
foreach (@kernels){
    say "$i : $_";
    $i = $i + 1;
}

do{
    print "Voreinstellung (1) : ";
}while(chomp( $i = <STDIN>) and $i =~ /{[^1-6],}/);
$i = 1 unless $i;
$i = $i - 1;

unless(progIsInstall("$kernels[$i]") and progIsInstall("$kernels[$i]-headers")){
    if( isRoot() ){
        system("pacman -S $kernels[$i] $kernels[$i]-headers");
    }elsif(progIsInstall("sudo")){
        system("sudo pacman -S $kernels[$i] $kernels[$i]-headers");
    }else{
        die "root was needed : pacman -S irgendwas";
    }
    
    say "$kernels[$i] und $kernels[$i]-headers sind installiert";
}
